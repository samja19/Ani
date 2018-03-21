<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>입양페이지21</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
</style>
</head>
<body>
<!--  적용하고싶은 소스 https://bootsnipp.com/snippets/x8DNm -->
<div class="container">
	<div class="row">
		<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="panel panel-default">
        		<div class="panel-heading">
			    	<h3 class="panel-title"> 입양신청 </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form">
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
			    						<input type="text" name="address_main" id="address_main" class="validate" required >
			    						<label for="address_main">주소</label>
			    			</div>
			    			<div class="row">
			    				 
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                			<input type="text" name="address_detail" id="address_detail" class="form-control input-sm" placeholder="상세주소">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                			<input type="text" name="postnum" id="postnum" class="form-control input-sm" placeholder="우편번호">
			    					</div>
			    				</div>
			    			</div>
							
			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
			    			</div>
			    			<div class="row">
			    				<div class="col-xs-4 col-xs-offset-4 col-sm-4 col-sm-offset-4 col-md-4 col-md-offset-4 ">
			    					<input type="submit" value="신청하기" class="btn btn-info btn-block">
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