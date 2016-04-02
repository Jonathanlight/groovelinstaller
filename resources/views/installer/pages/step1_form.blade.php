@extends('installer.base.installer_base_step1')
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
<div class="container-fluid" style='margin-top:150px'>
	<div class="col-sm-4 col-sm-offset-4 main">
		<form  action='install/step1' method="post">
		 <div class="form-group">
		    <label for="projectname"  class='required'>Project Name</label>
		    <input type="text" class="form-control" id="projectname" name="projectname" placeholder="Project Name">
		  </div>
		  <div class="form-group">
		    <label for="pathinstall" class='required'>Path Installation (Web Root Path)</label>
		    <input type="text" class="form-control" id="pathinstall" name="pathinstall"  placeholder="Path Installation">
		  </div>
		  <button class="btn btn-info"  style='width:100px;height:50px' type='submit'>Next</button>
		</form>
	</div>
</div>
@stop