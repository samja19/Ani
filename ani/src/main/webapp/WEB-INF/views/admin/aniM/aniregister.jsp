<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8">
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<title>admin-aniregister</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>


<body>

	<nav class="navbar navbar-inverse navbar-static-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> ADMIN </a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="http://www.sciax2.it/forum/utenti/-kik_226760/"
						target="_blank">Return back</a></li>
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
	<div class="container-fluid">
		<div class="col col-md-3">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse1"> Files</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse2"> 동물관리<i
								class="fa fa-angle-down pull-right"></i></a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
						<ul class="list-group">
							<li class="list-group-item"><span class="badge">12</span><a
								href="/ani/aniM/aniregister.action"> 신규 등록</a></li>
							<li class="list-group-item"><span class="badge">5</span>
								Deleted</li>
						</ul>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion"
								href="#collapse3"> Settings</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<ul class="list-group">
							<li class="list-group-item"><span class="badge">1</span>
								Users Reported</li>
							<li class="list-group-item"><span class="badge">5</span>
								User Waiting Activation</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="col col-md-9">
			<div class="panel">
				<div class="panel-body">
					<legend>신규 동물 등록</legend>
				</div>
				
				<form:form id="regform" modelAttribute="ani"
	       			 class="form-horizontal" role="form" method="post" action="register.action" enctype="multipart/form-data">
	       			 
	            <div class="form-group" id="divSpecies">
	                <label for="inputSpecies" class="col-lg-2 control-label"> 동물 분류 </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="1" />
	                          	  개
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="2" />
	                          	 고양이
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="3" />
	                          	 설치류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="4" />
	                          	 조류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="5" />
	                          	 파충류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="0"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
	            <div class="form-group" id="divBreeds">
	                <label for="inputBreeds" class="col-lg-2 control-label">품종</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="aniBreed" path="aniBreed"
                        data-rule-required="true" placeholder="품종을 입력하세요" maxlength="30"/>
	                </div>
	            </div>

	  			<div class="form-group">
	    			<label for="File" class="col-lg-2 control-label">동물 사진</label>
	    			<div class="col-lg-10">
	    				<input type="file" id="File" name="aniAttach">
	    			</div>
	  			</div>
	  			
	            <div class="form-group" id="divName">
	                <label for="inputName" class="col-lg-2 control-label">이름</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="aniName" path="aniName"
                        data-rule-required="true" placeholder="이름을 입력하세요" maxlength="30"/>
	                </div>
	            </div>
	            
	            <div class="form-group" id="divBirth">
	                <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
	                <div class="col-lg-10">
                        <form:input type="date" class="form-control" id="aniBirth" path="aniBirth"
                        data-rule-required="true" min="1980-01-01" max="9999-12-31" placeholder="-날짜를 입력하세요" />
	                </div>
	            </div>
	            
	            <div class="form-group" id="divGender">
	                <label for="inputGender" class="col-lg-2 control-label"> 성별 </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="1"/>
	                          	  암컷
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="2" />
	                          	 수컷
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="0"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
	            <div class="form-group" id="divNeuter">
	                <label for="inputNeuter" class="col-lg-2 control-label"> 중성화 여부</label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="1"/>
	                          	  O
	                        </label>
	                        &nbsp;&nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="2" />
	                          	 X
	                        </label>
	                        &nbsp;&nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="0"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
				<div class="form-group" id="divSite">
	                <label for="inputSite" class="col-lg-2 control-label"> 발견 장소  </label>
	                <div class="col-lg-10">
                        <form:input class="form-control col-lg-5" id="aniSite" path="aniSite"
                        data-rule-required="true"  maxlength="40"/>
	                </div>
	            </div>

	            <div class="form-group" id="divAniInfo">
	                <label for="aniInfo" class="col-lg-2 control-label">상세정보</label>
	                <div class="col-lg-10" id="aniInfoDiv">
	                    <form:textarea class="form-control" id="aniInfo" path="aniInfo"
	                    maxlength ="1000" rows="20" style="resize:none"></form:textarea> 
	                </div>
	            </div>	            
				
         
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" class="btn btn-default">등록</button>
	                </div>
	            </div>
	        </form:form>
	        
	        
	        <!-- 모달창 -->
	        <div class="modal fade" id="defaultModal">
	            <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                        <h4 class="modal-title">알림</h4>
	                    </div>
	                    <div class="modal-body">
	                        <p class="modal-contents"></p>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                    </div>
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	        </div><!-- /.modal -->
	        <!--// 모달창 -->
	        
        </div><!-- 본문 --> 
        
        <script>
         
        	$(document).ready(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                $('#id').focus(); 
                
                
                
                //------- validation 검사
                
                
                $( "#regform" ).submit(function( event ) {
                	var divBreeds = $('#divBreeds');
                    var divName = $('#divName');
                    var divBirth = $('#divBirth');
                    var divSite = $('#divSite');
                    var divAniInfo = $('#divAniInfo');
                    
                    //품종
                    if($('#aniBreed').val()==""){
                        modalContents.text("품종을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divBreeds.removeClass("has-success");
                        divBreeds.addClass("has-error");
                        $('#aniBreed').focus();
                        return false;
                    }else{
                    	divBreeds.removeClass("has-error");
                    	divBreeds.addClass("has-success");
                    }
                    
                    
                    //이름
                    if($('#aniName').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#aniName').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                    
                    
                    //생년월일
                    if($('#aniBirth').val()==""){
                        modalContents.text("생년월일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divBirth.removeClass("has-success");
                        divBirth.addClass("has-error");
                        $('#aniBirth').focus();
                        return false;
                    }else{
                    	divBirth.removeClass("has-error");
                    	divBirth.addClass("has-success");
                    }
                    
                
                    
                    // 주소
                    if($('#aniSite').val()==""){
                        modalContents.text("발견장소를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divSite.removeClass("has-success");
                        divSite.addClass("has-error");
                        $('#aniSite').focus();
                        return false;
                    }else{
                        divSite.removeClass("has-error");
                        divSite.addClass("has-success");
                    }
                    
                 // 상세정보
                    if($('#aniInfo').val()==""){
                        modalContents.text("상세정보를 입력하여 주시기 바랍니다..");
                        modal.modal('show');
                         
                        divAniInfo.removeClass("has-success");
                        divAniInfo.addClass("has-error");
                        $('#aniInfo').focus();
                        return false;
                    }else{
                    	divAniInfo.removeClass("has-error");
                    	divAniInfo.addClass("has-success");
                    }
                    
                   
                     
                });
                
                
                
            });
             
        </script>
			</div>

		</div>

</body>
</html>