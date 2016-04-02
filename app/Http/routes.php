<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/


Route::get('/', function (){
   // return $app->version();
      return view('installer.pages.step1_form');
});



Route::post('install/step1','InstallController@validateForm');

//Route::get('install/step2','InstallController@validateForm');
Route::get('install/step2', function ()  {
	// return $app->version();
	return view('installer.pages.step2_form',["projectname"=>Cache::get("projectname")]);
});

Route::get('install/step3','InstallController@validateForm');

Route::get('install/logs/reader','InstallController@validateForm');

Route::get('install/step4', function (){
   // return $app->version();
      return view('installer.pages.step4_form');
});

Route::post('install/step5','InstallController@validateForm');
	
Route::get('install/step6', function (){
	// return $app->version();
	return view('installer.pages.step6_form');
});

Route::post('install/step7','InstallController@validateForm');

Route::get('install/step8','InstallController@validateForm');
 