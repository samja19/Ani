<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ծ�������</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="/ani/resources/js/jquery-validation/jquery.validate.min.js"></script>
<script src="/ani/resources/js/jquery-validation/additional-methods.min.js"></script>
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

label[for=cause]{
	margin-top: 15px;
}

</style>
<script>
$(function(){ 
	 
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
			    	<h3 class="panel-title"> �Ծ��û1 </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form" id="adoptionform">
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
			    						<input type="text" name="phone" id="phone" class="form-control input-sm" required >
			    						<label for="phone">����ó</label>
			    			</div>
			    			<div class="input-field">
			    						<input type="text" name="address_main" id="address_main" class="form-control input-sm validate"   >
			    						<label for="address_main">�ּ�</label>
			    			</div>
			    			<div class="row"> 
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="input-field">
			                			<input type="text" name="address_detail" id="address_detail" class="form-control input-sm validate"  >
			                			<label for="address_detail">���ּ�</label>
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="input-field">
			                			<input type="text" name="postnum" id="postnum" class="form-control input-sm validate"    >
			                			<label for="postnum">�����ȣ</label>
			    					</div>
			    				</div>
			    			</div>
							
			    			<div class="input-field">
			    				<input type="text" name="email" id="email" class="form-control input-sm validate"   >
			    				<label for="email">�̸���</label>
			    			</div>
			    			<div class="input-field"><BR>
			    				<textarea rows="6" cols="10" name="cause" id="cause" style="resize: none;"></textarea>
			    				<label for="cause">��û����</label>
			    			</div><BR>
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
 <script src='http://code.jquery.com/jquery-2.1.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js'></script>
<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js'></script>
</html>