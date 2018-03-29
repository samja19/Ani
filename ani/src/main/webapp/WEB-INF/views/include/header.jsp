<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="/ani/resources/js/login.js?ver=3"></script>
 

	<!-- <div id="head" style='background-color:orange'>   -->
	<header>
		<a href="/ani/home.action"><center>
		<img id="logo" src="/ani/resources/image/dona_logo2.png">
		</center></a>
	</header>
	
	<nav class="navbar navbar-inverse navbar-static-top ">
		<!-- -->
		<div class="container_header">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/ani/home.action">홈페이지</a>
			</div>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-left">
					<li class=""><a href="/ani/adoption/list.action">보호동물보기</a></li>
					<li class=""><a href="/ani/infoboard/infoboardlist.action">정보게시판</a></li>
					
					<!--  관리자메뉴 -->
					   <%-- <c:if test='${ not empty loginuser and not loginuser.usertype }'> --%>
					   <!-- <li class=""><a href="/ani/admin/admin.action">관리자 페이지</a></li> -->
                    	<!-- <li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#" data-submenu>관리자메뉴<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/ani/admin/memberlist.action">회원관리</a></li>
							<li><a href="/ani/communalpurchase/cpadminlist.action">공구관리</a></li>
						</ul>
						</li> -->
                         <%-- </c:if>  --%>                                                   
                    
				</ul>

				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ empty loginuser }">
						<li>
							<a href="/ani/account/register.action">
							<span class="glyphicon glyphicon-user"></span>
							회원가입
							</a>
						</li>
						<li class="dropdown">
							
							<a href="#" class="dropdown-toggle"data-toggle="dropdown" role="button"> 
							<span class="glyphicon glyphicon-log-in"></span> 
							로그인<span class="caret"></span>
							</a>
							<div class="dropdown-menu" id="formLogin">
								<div class="row">
									<div class="container-fluid">
										 	
											<div class="form-group">
											 
												<label>아이디</label> <input class="form-control"
													name="loginid" id="loginid" type="text">
											</div>
											<div class="form-group">
												<label>비밀번호</label> <input class="form-control"
													name="loginpassword" id="loginpassword" type="password">
											</div>
											<a href="#" class="forgot-password"> 아이디/비밀번호를 잊으셨나요?</a> 
											<br><br>
											<button type="button" id="btnLogin"
												class="btn btn-success btn-sm">로그인</button>
										 	
									</div>
								</div>
							</div>
						</li>
					</c:if>
					<c:if test="${ not empty loginuser }">
 			        	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
 			        	${ loginuser.id }님 의 계정
                             <b class="caret"></b></a>
                             <ul class="dropdown-menu">
                                 <li>
                                     <div class="navbar-content">
                                	 <div id="userInfoDiv" >
                                     <div class="navbar-content" >
                                         <div class="row">
                                             <div class="col-md-5">
                                                 <img src="http://placehold.it/120x120"
                                                     alt="Alternate Text" class="img-responsive" />
                                                 <p class="text-center small">
                                                     <a href="#">Change Photo</a></p>
                                             </div>
                                             <div class="col-md-7">
                                                 <span>${ loginuser.id }</span>
                                                 <p class="text-muted small">
                                                     ${loginuser.email }</p>
                                                 <div class="divider">
                                                 </div>
                                                 <a href="#" class="btn btn-primary btn-sm active">View Profile</a>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="navbar-footer">
                                         <div class="navbar-footer-content">
                                             <div class="row">
                                                 <div class="col-md-6">
                                                     <a href="/ani/account/update.action" class="btn btn-default btn-sm">Change Passowrd</a>
                                                 </div>
                                                 <div class="col-md-6">
                                                     <a href="/ani/account/logout.action" class="btn btn-default btn-sm pull-right">Sign Out</a>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </li>
                             </ul>
                         </li>
             		</c:if> 
             		<li class=""><a href="/ani/infoboard/infoboardlist.action">마이페이지</a></li>
             		<li class=""><a href="/ani/admin/admin.action">관리자 페이지</a></li>
				</ul>
			</div>
			<!--/.navbar-collapse -->
		</div>
	</nav>
</div>

