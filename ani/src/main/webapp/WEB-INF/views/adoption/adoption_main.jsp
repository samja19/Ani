<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ծ�������1</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src='http://code.jquery.com/jquery-2.1.4.min.js'></script>
<script src="/ani/resources/js/jquery-3.1.1.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="/ani/resources/js/jquery-validation/jquery.validate.js"></script>
<script src="/ani/resources/js/jquery-validation/additional-methods.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js'></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/css/materialize.min.css'>
<!------ Include the above in your HEAD tag ---------->
<style>
body{
    background-color: #55252;
}
.centered-form{
    margin-top: 60px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

label[class=error]{
	margin-left: 30px;
}

 
 

</style>
<script>
$(function(){ 
 
	$('#adoptionform').validate({
	    rules:{
	    	phone:{
	            required : true
	       },
	       address_main:{
	    	   required : true
	       }
	    },
		messages:{
			phone:"����ó�� �ʼ� �Է»����Դϴ�.",
			address_main:"�ּҴ� �ʼ� �Է»����Դϴ�."
		}
	});
	
	$('#adoptionform').submit(function(event){
		alert("aaa");
		
	});
	
	
});
</script>
</head>
<body>
<!--  �����ϰ���� �ҽ� https://bootsnipp.com/snippets/x8DNm -->
<div class="container">
	<div class="row">
		<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="panel panel-default">
        		<div class="panel-heading">
			    	<h3 class="panel-title"> �Ծ��û</h3>
			 			</div>
			 			<div class="panel-body">
			    		<form  id="adoptionform" action="main.action" method="POST">
			    			<!-- <div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                <input type="text" name="first_name" id="first_name" class="form-control input-sm" placeholder="First Name">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="text" name="last_name" id="last_name" class="form-control input-sm" placeholder="Last Name">
			    					</div>
			    				</div>
			    			</div> -->
			    			<div class="input-field">
			    						<input type="text" name="phone" id="phone" class="form-control input-sm" placeholder="����ó" required >
			    						
			    						 
			    			</div>
			    			<div class="input-field">
			    						<input type="text" name="address_main" id="address_main" class="form-control input-sm" placeholder="�ּ�" required  >
 
			    			</div>
			    			<div class="row"> 
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="input-field">
			                			<input type="text" name="address_detail" id="address_detail" class="form-control input-sm validate" placeholder="���ּ�"  >
			                	 
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="input-field">
			                			<input type="text" name="postnum" id="postnum" class="form-control input-sm validate"  placeholder="�����ȣ"  >
			                			 
			    					</div>
			    				</div>
			    			</div>
							
			    			<div class="input-field">
			    				<input type="text" name="email" id="email" class="form-control input-sm validate" placeholder="�̸���"   >
			    				 
			    			</div>
			    			<div class="input-field"><BR>
			    				<textarea rows="6" cols="10" name="cause" id="cause" style="resize: none;" placeholder="��û����"></textarea>
			    			</div><BR>
			    			<input type="hidden" id="aninum" name="aninum" value="1">
			    			<div class="row">
			    				<div class="col-xs-6 col-xs-offset-3 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 ">
			    					<input type="submit" value="��û�ϱ�" class="btn btn-info btn-block">
			    				</div>
			    			</div>
			    			
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
	</div>
</div>
</body>
 
</html>