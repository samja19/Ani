<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후원하기</title>
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


#ani_img{
	width : 100%;
	height : 100%;
}
#ani_img_div{
	height : 200px;
}

</style>
<script>
$(function(){ 
 
	$('#adoptionform').validate({
	    rules:{
	    	doamount:{
	            required : true
	       }
	    },
		messages:{
			doamount:"후원금액은 필수 입력사항입니다.", 
		}
	});
	
	
	
  
	 
	
	
});
</script>
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
			    	<h3 class="panel-title"> 후원하기</h3>
			 			</div>
			 			<div class="panel-body">
			 			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6" id="ani_img_div">
			    					<img id="ani_img">
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6" id="ani_img_div">
			    					이름 :  ${aniinfo.aniName}<BR><BR>
			    					종	 : ${aniinfo.speciesName}<BR><BR>
			    					품종 : ${aniinfo.aniBreed}<BR><BR>
			    					생일 : ${aniinfo.aniBirth}<BR><BR>
			    					지역 : ${aniinfo.aniSite}<BR><BR>
			    					
			    				</div>
			    		</div>
			 			
			 				
			 				
			 				
			 			</div>
			 			<BR><BR><BR>
			 			
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
			    			<div class="row">
			    				<div class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2">
			    						<input type="text" name="doamount" id="doamount" class="form-control input-sm" placeholder="후원금액" required  >
			    				</div> 
			    			</div>

							<input type="hidden" id="memberno" name="memberno" value="0"> 
			    			<input type="hidden" id="anino" name="anino" value="${anino}"> 
			    			
			    			<div class="row">
			    				<div class="col-xs-6 col-xs-offset-3 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 ">
			    					<input type="submit" value="후원하기" class="btn btn-info btn-block">
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