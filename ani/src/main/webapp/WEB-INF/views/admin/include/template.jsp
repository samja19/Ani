<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/ani/admin/admin.action"> ADMIN </a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
						<li><a href="/ani/home.action"
						target="_blank">HOME</a></li>
					<li class="dropdown "><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">
							Settings <span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li class="dropdown-header">SETTINGS</li>
							<li class=""><a href="#">Link</a></li>
							<li class=""><a href="#">Other Link</a></li>
							<li class=""><a href="#">Other Link</a></li>
							<li class="divider"></li>
							<li><a href="#">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- <div class="container-fluid"> -->
		<div class="col col-md-3">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1"> 동물관리<i
								class="fa fa-angle-down pull-right"></i></a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<ul class="list-group">
							<li class="list-group-item"><a
								href="/ani/aniM/aniregister.action"> 신규 등록</a></li>
							<li class="list-group-item"><span class="badge">5</span>
								<a href="/ani/aniM/anilist.action"> 목록</a></li>
						</ul>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse2"> 회원관리 </a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse in">
						<ul class="list-group">
							<li class="list-group-item"><a href="/ani/admin/memberlist.action">
								회원 목록 </a></li>
						
						</ul>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse3"> 설정</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<ul class="list-group">
							<li class="list-group-item"><span class="badge">253</span>
								New</li>
							<li class="list-group-item"><span class="badge">17</span>
								Deleted</li>
							<li class="list-group-item"><span class="badge">3</span>
								Reported</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
