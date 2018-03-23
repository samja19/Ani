<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset=utf-8" />
	<title>Welcome To DUNA!</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="/ani/resources/css/header.css">
	<link rel="stylesheet" href="/ani/resources/css/home.css">
	<link rel="stylesheet" href="/ani/resources/bootstrap/bootstrap-submenu.min.css">
	<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
	
	<script>
		$(document).ready(function(){
			$('[data-submenu]').submenupicker();
		});
		
		
	</script>	
</head>

<body>
	
	<!-- header -->
	<jsp:include page="../views/include/header.jsp" >
		<jsp:param name="bgcolor" value="white" />
	</jsp:include>	
	<!-- Carousel
================================================== -->
	<div id="myCarousel" class="carousel slide">

		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img src="/ani/resources/image/space.jpg">
				<div class="carousel-caption">
					<h1>홈페이지</h1>
				</div>
			</div>
			<div class="item">
				<img src="/ani/resources/image/hands.jpg">
				<div class="carousel-caption">
					<h1>공동구매</h1>
					<p>1인 가구를 위한 안성맞춤 제품! 두나가 직접 진행합니다!</p>
					<p><a class="btn btn-lg btn-primary" href="/ani/communalpurchase/cpintro.action">바로가기</a></p>
				</div>
			</div>
			<div class="item">
				<img src="/ani/resources/image/friends.jpg">
				<div class="carousel-caption">
					<h1>소모임</h1>
					<p>직접 소모임을 만들고 참여도 해보세요 :) 만나면 더욱 즐거워요~ </p>
					<p><a class="btn btn-lg btn-primary" href="/ani/smallgroup/smallgrouplist.action">바로가기</a></p>
				</div>
			</div>
			<div class="item">
				<img src="/ani/resources/image/infoboard.jpg">
				<div class="carousel-caption">	
					<h1>정보게시판</h1>
					<p>생활,운동,독서 등 다양한 정보를 공유해보세요.</p>
					<p><a class="btn btn-lg btn-primary" href="/ani/infoboard/infoboardlist.jsp">바로가기</a></p>
				</div>
			</div>
			<div class="item">
				<img src="/ani/resources/image/freeboard.jpg">
				<div class="carousel-caption">
					<h1>자유게시판</h1>
					<p>심심한 사람  모두모두 모여라!</p>
					<p><a class="btn btn-lg btn-primary" href="/ani/freeboard/freeboardlist.action">바로가기</a></p>
				</div>
			</div>
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
		
	</div>
	<!-- /.carousel -->


	<!-- Page Content -->
	<div class="container">
		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					두나 DUNA <small>소중한 생명! 여려분의 반려동물 사랑으로 지켜주세요</small>
				</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div class="row">
			<div class="col-md-7">
<!-- 				<a href="#"> <img class="img-responsive"
					src="https://static1.squarespace.com/static/55344d97e4b09e3f061a1da2/58812347ff7c50bd374db464/58812347c534a5d607aee32d/1484858236516/Honda+Accord+Hybrid-2.jpg?format=1500w"
					alt="">
				</a> -->
				<a href="#"> <img class="img-responsive"
					src="/ani/resources/image/sofa.png"
					alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>두나의 탄생</h3>
				<h4>행복한 동물을 위한</h4>
				<p> "사지마세요! 입양하세요" </p>
				
				<p>동물학대를 방지하고 생명존중의 문화를 꽃피웁니다</p>
				<p>성숙한 반려동물 문화의 확산과 동물의 생명과 안전을 보호하고 복지를 증진하여 사람과 동물이 더불어 사는 생명존중의 사회를 구현하기 위해 노력합니다.</p>

			</div>
		</div>
		<!-- /.row -->
		<hr>
		<br> <br> <br>

		<div class="col-md-4">
			<h3>사회적기업이 운영합니다.</h3>
			<p></p>
		</div>
		<div class="col-md-4">
			<h3>위치</h3>
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d941.0659527291044!2d127.03145549299921!3d37.499522233607216!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca157b653c449%3A0xe703f6dd4d97fa87!2z7JWE7J207Yuw7JyM!5e0!3m2!1sko!2skr!4v1513580152358" frameborder="0" style="border:0" allowfullscreen></iframe>
		</div>
		<div class="col-md-4">
			<h3>개발자</h3>
			<ul>
				<li>KIM KYU YOUNG</li>
				<li>KIM SUNG HOON</li>
				<li>BAEK SUNG YOON</li>
				<li>LEE SO HYUN</li>
				<li>JANG SEOK</li>
			</ul>
			<p>[ 문의 및 건의사항은 이메일로 연락바랍니다. ]</p>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="../views/include/footer.jsp" />
	
</body>
</html>