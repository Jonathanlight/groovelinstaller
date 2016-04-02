<?php

namespace App\Http\Controllers;

use Log;
use Illuminate\Http\Request;
use Composer\Composer\Console\Application;
use Composer\Composer\Command\UpdateCommand;
use Symfony\Component\Console\Input\ArrayInput;
use App\Http\Controllers\Controller;
use Cache;
use DB;
use Artisan;


class InstallController extends Controller
{
    private static $LARAVEL_VERSION="5.1.0";
    private static $logs_line=0;
    private static $status_install="started";
    private static $sqlfile="groovel.sql";
    
	public function validateForm(Request $request){
		if($request->is('install/step1')){
			self::$logs_line=0;
			self::$status_install="started";
			$validator=$this->validate($request, [
					'projectname' => 'required',
					'pathinstall' => 'required'
			]);
			Cache::forever("projectname",$request->get('projectname'));
			Cache::forever("pathinstall",$request->get('pathinstall'));
			Cache::forever("status_install","started");
			Cache::forever("logs_line",0);
			\Session::keep("projectname",Cache::get("projectname"));
			
			Cache::forget("hostdb");
			Cache::forget("portdb");
			Cache::forget("userdb");
			Cache::forget("passworddb");
			
			return redirect('install/step2');
		}
		if($request->is('install/step3')){
			Log::info('start project');
			Cache::forever("status_install","finished");
			$this->createProject(Cache::get('projectname'),Cache::get('pathinstall'));
		}
		if($request->is('install/logs/reader')){
			$res=$this->logReader();
			return $res;
		}
		if($request->is('install/step5')){
			Log::info('mysql settings');
			$validator=$this->validate($request, [
					'host' => 'required',
					'port' => 'required',
					'databasename' => 'required',
					'username' => 'required'
			]);
			
			Cache::forever("hostdb",$request->get('host'));
			Cache::forever("portdb",$request->get('port'));
			Cache::forever("userdb",$request->get('username'));
			Cache::forever("passworddb",$request->get('password'));
			Cache::forever("databasename",$request->get('databasename'));
		
			
			if($this->testConnection($request->get('host'),$request->get('port'),$request->get('username'),$request->get('password'))){
				Log::info("success connect to mysql");
			    //create database if not exist
				Log::info("create database start");
				$this->createDatabase($request->get('host'),$request->get('port'),$request->get('username'),$request->get('password'),$request->get('databasename'));
				$this->loadSqlFile($request->get('host'),$request->get('port'),$request->get('username'),$request->get('password'),$request->get('databasename'));
					
				
				//export config
				$this->configureDatabaseSettings($request->get('host'),$request->get('port'),$request->get('databasename'),$request->get('username'),$request->get('password'));
				$this->updateProjectDatabaseConfig(Cache::get("projectname"));
				
				return response()->json(['status' =>"success"]);
			}else{
				return response()->json(['status' =>"failed"]);
			}
			
		}
		
		if($request->is('install/step7')){//create account
			Log::info("create user");
			$validator=$this->validate($request, [
					'username' => 'required',
					'pseudo' => 'required',
					'email' => 'required',
					'password' => 'required'
			]);
			$this->createAccount($request->get('username'), $request->get('pseudo'), $request->get('email'), $request->get('password'));
			return response()->json(['status' =>"success"]);
		}
		
		if($request->is('install/step8')){//finalize install make a publish and copy to the destination directory web apps
			$this->publish(Cache::get("projectname"));
			$this->copyProjectToWebApp(Cache::get("pathinstall"),Cache::get("projectname"));
			return view('installer.pages.step7_form');
		}
		
	}
	
	
	private function publish($projectName){
		$present_dir = explode('\\', getcwd());
		$tmp_dir=null;
		if(count($present_dir)==0){//unix
			$present_dir = explode('/', getcwd());
			$tmp_dir=$present_dir[0].'/tmp';
		}else{//win
			$tmp_dir=$present_dir[0].'/tmp';
		}
		
		Log::info($tmp_dir.'/'.$projectName);
		chdir($tmp_dir.'/'.$projectName);
		ini_set ('max_execution_time', 0);
		Log::info("call publish");
		exec("php artisan vendor:publish",$resultLines);
		Foreach($resultLines as $resultLine){
	         Log::info($resultLine);
	     }
	}
	
	private function copy_directory( $source, $destination ) {
		if ( is_dir( $source ) ) {
			@mkdir( $destination );
			$directory = dir( $source );
			while ( FALSE !== ( $readdirectory = $directory->read() ) ) {
				if ( $readdirectory == '.' || $readdirectory == '..' ) {
					continue;
				}
				$PathDir = $source . '/' . $readdirectory;
				if ( is_dir( $PathDir ) ) {
					$this->copy_directory( $PathDir, $destination . '/' . $readdirectory );
					continue;
				}
				copy( $PathDir, $destination . '/' . $readdirectory );
			}
	
			$directory->close();
		}else {
			copy( $source, $destination );
		}
	}
	
	private function copyProjectToWebApp($pathinstall,$projectname){
		$present_dir = explode('\\', getcwd());
		$tmp_dir=null;
		if(count($present_dir)==0){//unix
			$present_dir = explode('/', getcwd());
			$tmp_dir=$present_dir[0].'/tmp';
		}else{//win
			$tmp_dir=$present_dir[0].'/tmp';
		}
		$this->copy_directory($tmp_dir.'/'.$projectname,$pathinstall);
		/*if (!copy( $tmp_dir.'/'.$projectname, $pathinstall)) {
			Log::error("project copy failed");
		}*/
	}
	
	private function createAccount($username,$pseudo,$email,$password){
		try {
			Log::info("create account");
			$cnx =new \PDO("mysql:host=".Cache::get("hostdb").";port=".Cache::get("portdb").";dbname=".Cache::get("databasename"),Cache::get("userdb"), Cache::get("passworddb"));
			$sql='INSERT INTO USERS(pseudo,username,email,password,activate) values('.'\''.$pseudo.'\''.','.'\''.$username.'\''.','.'\''.$email.'\''.','.'\''. \Hash::make($password).'\''.','.'1'.')';
	    	$res=$cnx->exec($sql);
		    $sql='select * from USERS WHERE PSEUDO ='.'\''.$pseudo.'\'';
			$resultats=$cnx->query($sql);
			$resultats->setFetchMode(\PDO::FETCH_OBJ);
			$userid=null;
			while( $resultat = $resultats->fetch() )
			{    
			        Log::info ('Utilisateur : '.$resultat->id);
			        $userid=$resultat->id;
			}
			$resultats->closeCursor();
			
			$sql='select count(*) from USER_ROLES WHERE userid ='.'\''.$userid.'\'';
			$resultats=$cnx->query($sql)->fetchColumn();
			if($resultats==0){
			//add admin role
				$sql='INSERT INTO USER_ROLES(userid,roleid) values('.'\''.$userid.'\''.','.'1'.')';
				$res=$cnx->exec($sql);
			}
		}catch (\PDOException $dbex) {
			Log::error("Erreur de connexion : " . $dbex->getMessage() );
		}
	}
	
	
	private function loadSqlFile($host,$port,$username,$password,$databasename){
		
		try {
			Log::info("load sql");
			$cnx =new \PDO("mysql:host=".$host.";port=".$port.";dbname=".$databasename,$username, $password);
			$sql = file_get_contents(base_path().'/configinstall/dbgroovelcms/' .self::$sqlfile);
			$res=$cnx->exec($sql);
			Log::info($res);
		}
		catch (PDOException $dbex) {
			Log::error("Erreur de connexion : " . $dbex->getMessage() );
		}
			
	}
	
	
	
	private function createDatabase($host,$port,$username,$password,$db){
		try {
			$dbh = new \PDO("mysql:host=".$host.";port=".$port,$username, $password);
			$dbh->exec("CREATE DATABASE IF NOT EXISTS `$db`;
					DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
					GRANT ALL ON `$db`.* TO '. $username.'@'.$host;
					FLUSH PRIVILEGES;")
					or die(print_r($dbh->errorInfo(), true));
			Log::info("create database success!");
		} catch (PDOException $e) {
			Log::error($e->getMessage());
			die("DB ERROR: ". $e->getMessage());
		}
	}
	
	private function testDatabaseExist($host,$port,$username,$password,$databasename){
	try {
			$dbh = new \PDO("mysql:host=".$host.";port=".$port."dbname=".$databasename,$username, $password);
			//$result = $dbh->query("SELECT version()");
			$stmt=$dbh->query("SELECT COUNT(*) FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME =".$databasename);
			
			$res= (bool)$stmt->fetchColumn();
			Log::info("connect to db ".$res);
			return $res;
		} catch(\Exception $e){
			Log::error($e->getMessage());
			return false;
		}
	}
	
	private function testConnection($host,$port,$username,$password){
		try {
			$dbh = new \PDO("mysql:host=".$host.";port=".$port,$username, $password);
			return true;
		} catch(\Exception $e){
			Log::error($e->getMessage());
			return false;
		}
	}
	
	
	private function configureDatabaseSettings($host,$port,$databasename,$username,$password){
		$file = base_path().'/configinstall/' .'database-template.php';
		$newfile = base_path().'/configinstall/' .'database.php';
		
		if (!copy($file, $newfile)) {
			Log::error( "copy $file failed...");
		}
		
		$file_contents = file_get_contents($newfile);
		$file_contents = str_replace("@host@",$host,$file_contents);
		file_put_contents( $newfile,$file_contents);
		
		$file_contents = str_replace("@port@",$port,$file_contents);
		file_put_contents( $newfile,$file_contents);
		
		$file_contents = str_replace("@databasename@",$databasename,$file_contents);
		file_put_contents( $newfile,$file_contents);
		
		$file_contents = str_replace("@username@",$username,$file_contents);
		file_put_contents( $newfile,$file_contents);
		
		$file_contents = str_replace("@password@",$password,$file_contents);
		file_put_contents( $newfile,$file_contents);
		
		if (!copy($newfile,base_path().'/config/database.php')) {
			Log::error( "copy $file failed...to installer");
		}
	}
	
	
	private function updateProjectDatabaseConfig($projectName){
		$present_dir = explode('\\', getcwd());
		$tmp_dir=null;
		if(count($present_dir)==0){//unix
			$present_dir = explode('/', getcwd());
			$tmp_dir=$present_dir[0].'/tmp';
		}else{//win
			$tmp_dir=$present_dir[0].'/tmp';
		}
		if (!copy( base_path().'/config/database.php', $tmp_dir.'/'.$projectName.'/config/'.'database.php')) {
			Log::error("file copy failed  to update database.php");
		}
	}
	
	
	private function logReader(){
		$handle = fopen(storage_path().'/logs/packages.log', "a+");
		$res=array();
		if ($handle) {
			$i=0;
			while (($line = fgets($handle)) !== false) {
				$i++;
				if($i>Cache::get("logs_line")){
					array_push($res,$line);
				}
			}
		
			fclose($handle);
			self::$logs_line++;
			Cache::forever("logs_line",self::$logs_line);
			
		} else {
			Log::error("error opening logs installer");
		}
		return response()->json(['status' => Cache::get("status_install"),'data'=>$res]);
	}
	
	
	
	private function createDirectory($path){
		if (!mkdir($path, 0777, true)) {
			Log::error('failed to create directory');
		}
		return $path;
	}
	
	private function createProject($projectName,$path){
		ini_set ('max_execution_time', 0);
		ini_set('memory_limit', '-1');
		$input = new ArrayInput(array('command' => 'create-project'));
		$present_dir = explode('\\', getcwd());
		$tmp_dir=null;
		if(count($present_dir)==0){//unix
			$present_dir = explode('/', getcwd());
			$tmp_dir=$present_dir[0].'/tmp';
		}else{//win
			$tmp_dir=$present_dir[0].'/tmp';
			}
		if(!is_dir($tmp_dir)){
			if (!mkdir($tmp_dir, 0777, true)) {
				Log::error('failed to create directory');
			}
		}else{
			//nothing already exist
		}
		Log::info("start project ");
		chdir($tmp_dir);
		putenv('COMPOSER_HOME=' . base_path().'/configinstall/');
		$input = new \Symfony\Component\Console\Input\StringInput($input .' laravel/laravel '. $projectName .' '. self::$LARAVEL_VERSION .' -vvv ' );
		$output = new \Symfony\Component\Console\Output\StreamOutput(fopen(storage_path().'/logs/packages.log','r+'));
		$app = new \Composer\Console\Application();
		$app->setAutoExit(false);
		
		//install and download laravel
		Log::info("install and download laravel");
		$app->run($input,$output);
		
		//copy the composer.json of groovel into new laravel install
		Log::info("copy the composer.json of groovel into new laravel install");
		$this->installGroovel($tmp_dir,$projectName);
		
		//download groovel package
		Log::info("download groovel package");
		$this->updateInstallGroovel($tmp_dir,$projectName,$output);
		
		//change settings
		Log::info("change settings");
		$this->modifyLaravelSettings($tmp_dir, $projectName);
		self::$status_install='finished';
		Cache::forever("status_install","finished");
	}
	
	private function installGroovel($tmpdir,$projectName){
		if (!copy( base_path().'/configinstall/'.'composer.json', $tmpdir.'/'.$projectName.'/'.'composer.json')) {
			Log::error("file copy failed  to update config json composer to download groovel");
		}
	}
	
	private function updateInstallGroovel($tmp_dir,$projectName,$output){
		chdir($tmp_dir.'/'.$projectName);
		$input = new ArrayInput(array('command' => 'update'));
		$input = new \Symfony\Component\Console\Input\StringInput($input .' -vvv ' );
		$app = new \Composer\Console\Application();
		$app->setAutoExit(false);
		$app->run($input,$output);
	}
	
	private function modifyLaravelSettings($tmpdir,$projectName){
		if (!copy( base_path().'/configinstall/'.'app.php', $tmpdir.'/'.$projectName.'/config/'.'app.php')) {
			Log::error("file copy failed  to update app.php");
		}
		
		if (!copy( base_path().'/configinstall/'.'auth.php', $tmpdir.'/'.$projectName.'/config/'.'auth.php')) {
			Log::error("file copy failed  to update auth.php");
		}
	}
	
	
	
}
