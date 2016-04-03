@extends('installer.base.installer_base_step7')
@section('content')
@if(! empty($errors)) 
	@if (count($errors) > 0)
	    <div class="alert alert-danger">
	        <ul>
	            @foreach ($errors->all() as $error)
	                <li>{{ $error }}</li>
	            @endforeach
	        </ul>
	    </div>
	@endif
@endif
<div class="container-fluid" style='margin-top:50px'>
	<div class="row">
		<div class="alert alert-success" role="alert" id='msg_success' style='display:block'>install is finished! you must go inside your app and launch command
		php artisan generate:key to generate a specific key that will become your identity code
		</div>
	</div>
	<div class="col-sm-4 col-sm-offset-4 main">
		<div class="alert alert-info" role="alert">Now you can change your virtual host to redirect in your groovel install</div>
	</div>
</div>
<script>
$("#submitForm").click(function (event) {
	$('#msg_success').attr('style','display:none');
	$('#msg_error').attr('style','display:none');
	$('#msg_wait').attr('style','display:block');
	var form=$('#formdb').serialize();
	$.post('/install/step7', form, function (data, textStatus) {
			if(data['status']=='success'){
				$('#msg_wait').attr('style','display:none');
				$('#msg_success').attr('style','display:block');
				window.location.href="/install/step7";
			}else{
				$('#msg_wait').attr('style','display:none');
				$('#msg_error').attr('style','display:block');
			}
	})
	return false;
	
})
</script>
@stop
