<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ---------->
<style> 
 
#ad_detail a{
	padding-top: 0px;
    padding-right: 0px;
    padding-bottom: 0px;
    padding-left: 0px;
}

.preview-pic img{
	width:100px;
	height:100px;
}

.preview-thumbnail img{
	width:50px;
	height:50px;
}

</style>
<script>
$(function(){ 
  
	$('#adoptionbtn').click(function(){
		location.href="main.action?anino="+$('#anino').val();
	});
	$('#donationbtn').click(function(){
		location.href="../donation/main.action?anino="+$('#anino').val();
	});
	
});
</script>
</head>
<body> 
<div id="ad_detail">
		<div class="card">
		 
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content ">
						  <div class="tab-pane active" id="pic-1"><img src="http://placekitten.com/200/126" /></div>
						  <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/200/126" /></div> 
						  <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/200/126" /></div> 
						  <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/200/126" /></div> 
						  <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/200/126" /></div> 
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						</ul>
						
					</div>
					<div class="details col-md-6">
						<h3 class="product-title"><span id="maniname"></span></h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div> 
						</div>
						<p class="product-description">
						종 : <span id="mspecies"></span> <BR>
						품종 : <span id="mbreed"></span> <BR>
						성별 : <span id="mgender"></span> <BR>
						지역 : <span id="msite"></span> <BR>
						생일 : <span id="mbirth"></span> <BR>
						중성화여부 : <span id="mneuter"></span> <BR>
						특이사항 : <span id="maniinfo"></span> <BR> 
						
						
						</p>
						<h4 class="price">후원총액: <span><span id="mdamount"></span></h4>
						<div class="action">
							<button id="adoptionbtn" class="btn-success" type="button">입양신청</button>
							<button id="donationbtn" class="btn-primary" type="button">후원하기</button>
						</div>
						<input type="hidden" id="anino" name="anino" >
					</div>
				</div> 
		</div> 
</div>
 
 
</html>