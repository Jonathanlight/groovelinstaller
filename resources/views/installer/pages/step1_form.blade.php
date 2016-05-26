@extends('installer.base.installer_base_step1')
@section('content')
    <div class="alert alert-danger" style='display:none' id='error'>
	       
	 </div>

<div class="container-fluid" style='margin-top:150px'>
	<div class='row'>
		<div class="col-sm-4 col-sm-offset-4 main">
		  <div class="alert alert-info" style='display:block' id='info'>
			      Groovelcms : Required PHP version 5.9 or higher
			 </div>
		</div>
	 </div>
	<div class="col-sm-4 col-sm-offset-4 main">
		<form  action='install/step1' method="post" id='formdb'>
		 <div class="form-group">
		    <label for="projectname"  class='required'>Project Name</label>
		    <input type="text" class="form-control" id="projectname" name="projectname" placeholder="Project Name">
		  </div>
		  <div class="form-group">
		    <label for="pathinstall" class='required'>Path Installation (Web Root Path)</label>
		    <input type="text" class="form-control" id="pathinstall" name="pathinstall"  placeholder="Path Installation">
		  </div>
		  <button class="btn btn-info"  style='width:100px;height:50px' type='submit' id='submitForm'>Next</button>
		</form>
	</div>
</div>
<script>
$("#submitForm").click(function (event) {
	var form=$('#formdb').serialize();
	$.post('/install/step1', form, function (data, textStatus) {
			if(data['status']=='success'){
				$('#error').attr('style','display:none');
				$('#error').empty();
				window.location.href="/install/step2";
			}else{
				$('#error').empty();
				$('#error').append(data['errors']);
				$('#error').attr('style','display:block');
			}
	})
	return false;
	
})
</script>
@stop