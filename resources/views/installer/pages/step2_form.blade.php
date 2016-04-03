@extends('installer.base.installer_base_step2')
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
<div class="container-fluid" style='margin-top:20px'>
 <h4>Project Name:  {{$projectname}}</h4>
   
	<div class="col-sm-10 col-sm-offset-1 main">
		<div class="row">
			
			<div class="alert alert-info" role="alert" id='msg_wait' style='display:none'>Please wait while installing............about 15 minutes</div>
			<div class="alert alert-danger" role="alert" id='msg_error' style='display:none'>installation failed............</div>
			<div class="alert alert-success" role="alert" id='msg_success' style='display:none'>installation success click next button.</div>
			<button type="button" class="btn btn-info"  style='display:none' id='button_next' onclick="window.location.href='/install/step4'">Next</button>
		</div>
		
		   
	    <div class="row" style='margin-top:30px'>
	        <h4>Console</h4>
            <code>
                <pre id='log'></pre>
            </code>
         </div>

	</div>
</div>
<script>
$(document).ready(function() {
	function startInstall() {
		$('#msg_wait').attr("style","display:block");
		 $.ajax({
		        url: '/install/step3',
		        dataType: 'html',
		        type:'GET',
		        success : function(code_html, statut){ 
			        //console.log(statut);
		        
		        },
		        error : function(resultat, statut, erreur){
		        	console.log(resultat);
		        	console.log(statut);
		        	console.log(erreur);
			    	$('#msg_wait').attr("style","display:none");
		        	$('#msg_error').attr("style","display:block");
		        }
		  })
    }
	
	function getLog() {
		 $.ajax({
		        url: '/install/logs/reader',
		        dataType: 'json',
		        type:'GET',
		        success : function(code_html, statut){ 
			        //console.log(code_html);
		        	for(var i=0; i<code_html['data'].length;i++){
		        		$("#log").append(code_html['data'][i]);
		        	}
		            if(code_html['status']=='finished'){
		   			$('#msg_success').attr("style","display:block");
						$('#button_next').attr("style","display:block;width:100px;height:50px");
						$('#msg_wait').attr("style","display:none");
						return;
				    }

		        },
		        error : function(resultat, statut, erreur){
		        	$('#msg_wait').attr("style","display:none");
		        	$('#msg_error').attr("style","display:block");
		        	console.log(resultat);
		        	console.log(statut);
		        	console.log(erreur);

		        }
		  })
	}

	var interval = setInterval(function()
			{   
				$.ajax({
			        url: '/install/logs/reader',
			        dataType: 'json',
			        type:'GET',
			        success : function(code_html, statut){ 
				        //console.log(code_html);
			        	for(var i=0; i<code_html['data'].length;i++){
			        		$("#log").append(code_html['data'][i]);
			        	}
			            if(code_html['status']=='finished'){
			           	$('#msg_success').attr("style","display:block");
							$('#button_next').attr("style","display:block;width:100px;height:50px");
							$('#msg_wait').attr("style","display:none");
							clearInterval(interval);
					    }
		
			        },
			        error : function(resultat, statut, erreur){
			        	//$('#msg_wait').attr("style","display:none");
			        	//$('#msg_error').attr("style","display:block");
			        	console.log(resultat);
			        	console.log(statut);
			        	console.log(erreur);
		
			        }
			  })
			},10000);



	
	startInstall(); 
	getLog();
});



</script>
<style type="text/css">
pre {
  width: 80%;
  max-height: 400px;
  color: #FFFFFF;
  padding: 10px;
  background: #000000;
  border: 1px solid #ccc;
  border-radius: 5px;
  word-wrap: normal;
  white-space: pre-wrap;
  overflow: auto;
}
</style>

@stop
