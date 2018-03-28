<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/jaimebonilla/pen/awOpRZ?limit=all&page=11&q=comercial" />

<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'><link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Lato:400,700,300'>
<style class="cp-pen-styles">@import url('https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i');
body {
  font-family: 'Open Sans', sans-serif;
  font-size: 13px;
  color: #818a91 !important;
  background-color: #e4e5e6;
}
.display-flex {
  display: inline-flex;
  flex-wrap: wrap;
}
.display-inline-grid {
  display: inline-grid;
}
.webkit-box {
  display: -webkit-box;
}
.border-left {
  border-left: 1px solid #000;
}
h3 {
  color: #2a2c36 !important;
  margin: 0rem;
}
.text-bold {
  font-weight: 600;
  color: #2a2c36;
}
.padding-left-1 {
  padding-left: 1rem;
}
.padding-right-1 {
  padding-right: 1rem;
}
.padding-top-1 {
  padding-top: 1rem;
}
.padding-bottom-1 {
  padding-bottom: 1rem;
}
.padding-1 {
  padding: 1rem;
}
.padding-2 {
  padding: 2rem;
}
.padding-top-2 {
  padding-top: 2rem;
}
.padding-bottom-2 {
  padding-bottom: 2rem;
}
.no-paddings {
  padding: 0rem !important;
}
.margin-top-2 {
  margin-top: 2rem;
}
.margin-bottom-0 {
  margin-bottom: 0rem;
}
.p-l-0 {
  padding-left: 0rem;
}
.box-shadow {
  box-shadow: 4px 4px 10px #ddd;
}
.background-white {
  background: #FFF;
}
.main-card .white-card {
  background-color: #fff;
  border: 1px solid #d1d4d7;
}
.main-card .status .status-id {
  padding: 2rem 0.6rem;
}
.main-card .status .status-text {
  padding-left: 2rem;
}
.main-card .status .status-text h4 {
  font-weight: 800;
  color: #FFFFFF;
}
.main-card .status p {
  font-weight: 700;
  color: #FFF;
}
.main-card .status h2 {
  font-weight: 700;
  margin: 0rem;
  line-height: 2.7rem;
}
.status.en-proceso {
  background: #4dbd74;
}
.status.en-proceso .status-text {
  background: #41ac66;
}
.status.en-proceso h2 {
  color: #3e975d;
}
.status.prealertado {
  background: #ff9100;
}
.status.prealertado .status-text {
  background: #ff6d00;
}
.status.prealertado h2 {
  color: #e65100;
}
@media (min-width: 768px) {
  body {
    font-size: 35px;
  }
}
@media (min-width: 992px) {
  body {
    font-size: 14px;
  }
}
</style>
</head>
<body>
	
<div class="container">
    <div class="row padding-top-1">
        <div class="col-sm-12 col-md-6 col-lg-12 main-card no-paddings display-flex">
            <div class="col-sm-12 col-md-2 col-lg-2 background-green status en-proceso">
                <div class="row status-text">
                    
                </div>
                <div class="status-id">
                    <p><strong>${ ani.aniName }</strong></p>
                    <h2>${ ani.doamount }</h2>
                </div>
            </div>
            <div class="col-sm-12 col-md-9 white-card box-shadow display-flex">
                <div class="col-sm-12 col-md-3 padding-top-2 padding-bottom-2 display-inline-grid">
                    
                    <div><p class="text-bold margin-bottom-0">기부동물 생년월일</p>
                    <p class="margin-bottom-0">${ ani.aniBirth }</p></div>
                    
                    <div><p class="text-bold margin-bottom-0">기부동물 성별</p>
                    <p class="margin-bottom-0">${ ani.aniGender }</p></div>
                </div>
                
                <div class="col-sm-12 col-md-3 padding-top-2 padding-bottom-2 display-inline-grid" style="background: #fafafa;">
                    
                    <div><p class="text-bold margin-bottom-0">기부동물 종</p>
                    <p class="margin-bottom-0">${ ani.speciesName }</p></div>
                    
                    <div><p class="text-bold margin-bottom-0">기부동물 품종</p>
                    <p class="margin-bottom-0">${ ani.aniBreed }</p></div>
                    
                </div>
                <div class="col-sm-12 col-md-3 padding-top-2 padding-bottom-2 display-inline-grid" style="background: #fafafa;">
                    <div><p class="text-bold margin-bottom-0">동물보호소주소</p>
                    <p class="margin-bottom-0">${ ani.aniSite }</p></div>
                    
                    <div><p class="text-bold margin-bottom-0">동물 정보</p>
                    <p class="margin-bottom-0">${ ani.aniInfo }</p></div>
                </div>
                <div class="col-sm-12 col-md-3 padding-top-2 padding-bottom-2 display-inline-grid">
                    <div class="col-md-12 no-paddings">
                        <div class="col-md-6 no-paddings">
                        <p class="text-bold margin-bottom-0">좋아요 횟수</p>
                        <p class="margin-bottom-0">${ ani.aniHit }</p>
                    </div>
                        <div class="col-md-6 no-paddings">
                        <p class="text-bold margin-bottom-0">관심 횟수</p>
                        <p class="margin-bottom-0">${ ani.attention }</p>
                    </div>
                    </div>
                    <div><p class="text-bold margin-bottom-0">중성화 여부</p>
                    <p class="margin-bottom-0">${ ani.neuter }</p></div>
                    
                </div>
            </div>
        </div>
       
    </div>
</div>
</body>
</html>