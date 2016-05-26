@extends('installer.base.installer_base_step4')
@section('content')
<div class="alert alert-danger" style='display:none' id='error'></div>
<div class="container-fluid" style='margin-top:50px'>
<h3 class='col-md-offset-2'>mysql settings</h3>
	<div class="row">
		<div class="alert alert-info" role="alert" id='msg_wait' style='display:none'>Please wait while install database ............</div>
		<div class="alert alert-danger" role="alert" id='msg_error' style='display:none'>database connection failed check logs and your mysql connection.</div>
		<div class="alert alert-success" role="alert" id='msg_success' style='display:none'>installation success</div>
	</div>
	<div class="col-sm-4 col-sm-offset-4 main">
		<form  action='/install/step5' method="post" id='formdb'>
		 <div class="form-group">
		    <label for="host"  class='required'>host</label>
		    <input type="text" class="form-control" id="projectname" name="host" placeholder="host">
		  </div>
		  <div class="form-group">
		    <label for="port"  class='required'>port</label>
		    <input type="text" class="form-control" id="port" name="port" placeholder="port">
		  </div>
		  <div class="form-group">
		    <label for="databasename" class='required'>databasename</label>
		    <input type="text" class="form-control" id="databasename" name="databasename"  placeholder="databasename">
		  </div>
		  <div class="form-group">
		    <label for="username" class='required'>username</label>
		    <input type="text" class="form-control" id="username" name="username"  placeholder="username">
		  </div>
		  <div class="form-group">
		    <label for="password">password</label>
		    <input type="password" class="form-control" id="password" name="password"  placeholder="password">
		  </div>
		  <button class="btn btn-info"  style='width:100px;height:50px' type='submit' id="submitForm">Submit</button>
		</form>
	</div>
</div>
<script>
$("#submitForm").click(function (event) {
	$('#msg_success').attr('style','display:none');
	$('#msg_error').attr('style','display:none');
	$('#msg_wait').attr('style','display:block');
	var form=$('#formdb').serialize();
	$.post('/install/step5', form, function (data, textStatus) {
		$('#error').attr('style','display:none');
		$('#error').empty();
			if(data['status']=='success'){
				$('#msg_wait').attr('style','display:none');
				$('#msg_success').attr('style','display:block');
				$('#error').attr('style','display:none');
				$('#error').empty();
				window.location.href="/install/step6";
			}else if(data['statusval']=='failed'){
				$('#error').empty();
				$('#error').append(data['errors']);
				$('#error').attr('style','display:block');
				$('#msg_wait').attr('style','display:none');
			}else{
				$('#error').attr('style','display:none');
				$('#error').empty();
				$('#msg_wait').attr('style','display:none');
				$('#msg_error').attr('style','display:block');
			}
	})
	return false;
	
})
</script>
@stop
