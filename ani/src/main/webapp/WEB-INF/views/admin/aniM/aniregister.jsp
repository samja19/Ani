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
<!-- <link rel="stylesheet" href="/ani/resources/css/home.css"> -->
<!------ Include the above in your HEAD tag ---------->
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
					<legend>Panel Body</legend>
				</div>
				
				 <form:form id="regform" modelAttribute="member"
	        class="form-horizontal" role="form" method="post" action="register.action">
	            
<%-- 	            <div class="form-group" id="divId">
	                <label for="inputId" class="col-lg-2 control-label" >아이디</label>
	                <div class="col-lg-10">
                        <form:input class="form-control onlyAlphabetAndNumber" id="id" path="id"  
                        data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30"/>
                        <form:errors id="id_error" path="id" cssClass="error" />
	                </div>
	            </div> --%>
	                         
	            <div class="form-group" id="divNickname">
	                <label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="nickname" path="nickname"
                        data-rule-required="true" placeholder="닉네임" maxlength="15"/>
	                </div>
	            </div>
	            
	            <div class="form-group" id="divPassword">
	                <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
	                <div class="col-lg-10">
                        <form:password class="form-control" id="password2" path="password"
                        data-rule-required="true" placeholder="패스워드" maxlength="30"/> 
	                </div>
	            </div>
	            <div class="form-group" id="divPasswordCheck">
	                <label for="inputPasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
	                <div class="col-lg-10">
                        <input type="password" class="form-control" id="passwordCheck"   
                        data-rule-required="true" placeholder="패스워드 확인" maxlength="30">
	                </div>
	            </div>
	            <div class="form-group" id="divName">
	                <label for="inputName" class="col-lg-2 control-label">이름</label>
	                <div class="col-lg-10">
                        <form:input class="form-control onlyHangul" id="name" path="name"
                        data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15"/>
	                </div>
	            </div>
	            
	            <div class="form-group">
	                <label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
	                <div class="col-lg-10">
	                    <form:select class="form-control" id="gender" path="gender">
	                        <form:option value="1">여성</form:option>
	                        <form:option value="0">남성</form:option>
	                        <form:option value="0">기타</form:option>
	                    </form:select>
	                </div>
	            </div>
	             
	            <div class="form-group" id="divEmail">
	                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	                <div class="col-lg-10">
                        <form:input type="text" class="form-control" id="email" path="email"
                        data-rule-required="true" placeholder="이메일" maxlength="40"/>
                        <form:errors path="email" cssClass="error" />
	                </div>
	            </div>
	            <div class="form-group" id="divPhoneNumber">
	                <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
	                <div class="col-lg-10">
                        <form:input type="tel" class="form-control onlyNumber" id="phoneNumber" path="phone"
                        data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11"/>
	                </div>
	            </div>
	            <div class="form-group" id="divPhoneNumber">
	                <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
	                <div class="col-lg-10">
                        <form:input type="date" class="form-control" id="birth" path="birth"
                        data-rule-required="true" min="1900-01-01" max="9999-12-31" placeholder="-날짜입력하세요." />
	                </div>
	            </div>
	            
				<div class="form-group" id="divAddress">
	                <label for="inputAddress" class="col-lg-2 control-label"> 주소  </label>
	                <div class="col-lg-10">
                        <form:input class="form-control col-lg-5" id="address" path="address"
                        data-rule-required="true"  maxlength="40"/>
	                </div>
	            </div>
				<div class="form-group" id="divAddress">
	                <label for="inputAddress" class="col-lg-2 control-label"> 1인가구 여부  </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton   id="solo" path="solo" value="1" checked="checked" />
	                          	  1인가구
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton   id="solo" path="solo" value="0" />
	                          	  1인가구 X
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            <div class="form-group">
	                <label for="memberInfo" class="col-lg-2 control-label">관심사</label>
	                <div class="col-lg-10" id="hobbyDiv">
	                    <form:textarea class="form-control" id="hobby" path="hobby"
	                    maxlength ="100" rows="8" style="resize:none"></form:textarea> 
	                </div>
	            </div>	            
				
	            <!-- <div class="form-group">
	                <label for="inputEmailReceiveYn" class="col-lg-2 control-label">이메일 수신여부</label>
	                <div class="col-lg-10">
	                    <label class="radio-inline">
	                        <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="Y" checked> 동의합니다.
	                    </label>
	                    <label class="radio-inline">
	                        <input type="radio" id="emailReceiveYn" name="emailReceiveYn" value="N"> 동의하지 않습니다.
	                    </label>
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="inputPhoneNumber" class="col-lg-2 control-label">SMS 수신여부</label>
	                <div class="col-lg-10">
	                    <label class="radio-inline">
	                        <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="Y" checked> 동의합니다.
	                    </label>
	                    <label class="radio-inline">
	                        <input type="radio" id="smsReceiveYn" name="smsReceiveYn" value="N"> 동의하지 않습니다.
	                    </label>
	                </div>
	            </div> -->
	            
	            <div class="form-group">
	                <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
	                <div class="col-lg-10" id="provision">
	                    <textarea class="form-control" rows="8" style="resize:none" readonly>
약관동의
                    </textarea>
	                    <div class="radio">
	                        <label>
	                            <input type="radio" id="provisionYn" name="provisionYn" value="Y" autofocus="autofocus" checked>
	                           	 동의합니다.
	                        </label>
	                    </div>
	                    <div class="radio">
	                        <label>
	                            <input type="radio" id="provisionYn" name="provisionYn" value="N">
	                           	 동의하지 않습니다.
	                        </label>
	                    </div>
	                </div>
	            </div>
	            <div class="form-group">
	                <label for="memberInfo" class="col-lg-2 control-label">개인정보취급방침</label>
	                <div class="col-lg-10" id="memberInfo">
	                    <textarea class="form-control" rows="8" style="resize:none" readonly>
개인정보의 항목 및 수집방법
                    </textarea>
	                    <div class="radio">
	                        <label>
	                            <input type="radio" id="memberInfoYn" name="memberInfoYn" value="Y" checked>
	                          	  동의합니다.
	                        </label>
	                    </div>
	                    <div class="radio">
	                        <label>
	                            <input type="radio" id="memberInfoYn" name="memberInfoYn" value="N">
	                            	동의하지 않습니다.
	                        </label>
	                    </div>
	                </div>
	            </div>	            
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" class="btn btn-default">회원가입</button>
	                </div>
	            </div>
	        </form:form>
        </div><!-- 본문 --> 
        
        <script>
         
        	$(document).ready(function(){
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                $('#id').focus(); 
                
                  $('.onlyAlphabetAndNumber').keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val($(this).val().replace(/[^_a-z0-9]/gi,'')); //_(underscore), 영어, 숫자만 가능
                    }
                }); 
                 
                $(".onlyHangul").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[a-z0-9]/gi,''));
                    }
                });
             
                $(".onlyNumber").keyup(function(event){
                    if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^0-9]/gi,''));
                    }
                });
               
                
                 
                //------- 검사하여 상태를 class에 적용
                
                $('#birth').keyup(function(event){
                     
                });
                
                $('#id').keyup(function(event){
                     
                    var divId = $('#divId');
                    
                    
                    if($('#id').val()==""){
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                    }else{
                    	$.ajax({
                        	url : '/duna/account/valiid.action',
                        	data : {id :$('#id').val()},
                        	method : 'POST',
                        	success : function(data, status, xhr){
								if(data == '0'){
	                                divId.removeClass("has-error");
	                                divId.addClass("has-success");
								}
								else{
									divId.removeClass("has-success");
			                        divId.addClass("has-error");
			                        modalContents.text("중복된 아이디 입니다.");
			                        modal.modal('show');
								}
                        	},
                        	error : function(){alert("에러발생");}
                        });  
                    }
                });
                
                $('#nickname').keyup(function(event){
                    
                    var divNickname = $('#divNickname');
                     
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                    	$.ajax({
                        	url : '/duna/account/valinick.action',
                        	data : {nickname :$('#nickname').val()},
                        	method : 'POST',
                        	success : function(data, status, xhr){
								if(data == '0'){
									divNickname.removeClass("has-error");
	                                divNickname.addClass("has-success");
								}
								else{
									divNickname.removeClass("has-success");
									divNickname.addClass("has-error");
			                        modalContents.text("중복된 닉네임 입니다.");
			                        modal.modal('show');
								}
                        	},
                        	error : function(){alert("에러발생");}
                        });  
                        
                    }
                });
                 
                $('#password2').keyup(function(event){
                     
                    var divPassword = $('#divPassword');
                     
                    if($('#password2').val()==""){
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                });
                 
                $('#passwordCheck').keyup(function(event){
                     
                    var passwordCheck = $('#passwordCheck').val();
                    var password = $('#password2').val();
                    var divPasswordCheck = $('#divPasswordCheck');
                     
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                });
                 
                $('#name').keyup(function(event){
                     
                    var divName = $('#divName');
                     
                    if($.trim($('#name').val())==""){
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                });
                 
                $('#email').keyup(function(event){
                     
                    var divEmail = $('#divEmail');
                     
                    if($.trim($('#email').val())==""){
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                });
                 
                $('#phoneNumber').keyup(function(event){
                     
                    var divPhoneNumber = $('#divPhoneNumber');
                     
                    if($.trim($('#phoneNumber').val())==""){
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                });
                 
                 
                
                
                
                //------- validation 검사
                
                
                
                $( "#regform" ).submit(function( event ) {
                    var divId = $('#divId');
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                    var provision = $('#provision');
                    var memberInfo = $('#memberInfo');
                      
                    //아이디 검사
                    if($('#id').val()=="" || divId.hasClass('has-error')){
                    	if($('#id').val()==""){
                    		modalContents.text("아이디를 입력하여 주시기 바랍니다.");
                    	}
                    	else{
                    		modalContents.text("아이디는 중복되지 않아야 합니다.");
                    	}
                    	modal.modal('show');
                        divId.removeClass("has-success");
                        divId.addClass("has-error");
                        $('#id').focus();
                        return false;
                    }else{
                    	divId.removeClass("has-error");
                        divId.addClass("has-success");
                    	
                    }
                     
                    //닉네임
                    if($('#nickname').val()=="" || divNickname.hasClass('has-error')){
                    	if($('#nickname').val()==""){
                    		modalContents.text("닉네임을 입력하여 주시기 바랍니다.");
                    	}
                    	else{
                    		modalContents.text("닉네임은 중복되지 않아야 합니다.");
                    	}
                        modal.modal('show');
                         
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                        $('#nickname').focus();
                        return false;
                    }else{
                    	divId.removeClass("has-error");
                        divId.addClass("has-success");
                    	
                    }
                    
                   
                    //패스워드 검사
                    if($('#password2').val()==""){
                        modalContents.text("패스워드를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPassword.removeClass("has-success");
                        divPassword.addClass("has-error");
                        $('#password2').focus();
                        return false;
                    }else{
                        divPassword.removeClass("has-error");
                        divPassword.addClass("has-success");
                    }
                     
                    //패스워드 확인
                    if($('#passwordCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                     
                    //패스워드 비교
                    if($('#password2').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                         
                        divPasswordCheck.removeClass("has-success");
                        divPasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divPasswordCheck.removeClass("has-error");
                        divPasswordCheck.addClass("has-success");
                    }
                     
                    //이름
                    if($('#name').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#name').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                     
                    //이메일
                    if($('#email').val()==""){
                        modalContents.text("이메일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divEmail.removeClass("has-success");
                        divEmail.addClass("has-error");
                        $('#email').focus();
                        return false;
                    }else{
                        divEmail.removeClass("has-error");
                        divEmail.addClass("has-success");
                    }
                     
                    //휴대폰 번호
                    if($('#phoneNumber').val()==""){
                        modalContents.text("휴대폰 번호를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#phoneNumber').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                    //생년월일
                    if($('#birth').val()==""){
                        modalContents.text("생년월일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#birth').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                    // 주소
                    if($('#address').val()==""){
                        modalContents.text("주소를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#address').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                 // 관심사
                    if($('#hobby').val()==""){
                        modalContents.text("관심사를 입력하여 주시기 바랍니다..");
                        modal.modal('show');
                         
                        divPhoneNumber.removeClass("has-success");
                        divPhoneNumber.addClass("has-error");
                        $('#hobby').focus();
                        return false;
                    }else{
                        divPhoneNumber.removeClass("has-error");
                        divPhoneNumber.addClass("has-success");
                    }
                    
                    
                    //회원가입약관
                    if($('#provisionYn:checked').val()=="N"){
                        modalContents.text("회원가입약관에 동의하여 주시기 바랍니다."); //모달 메시지 입력
                        modal.modal('show'); //모달 띄우기
                         
                        provision.removeClass("has-success");
                        provision.addClass("has-error");
                        $('#provisionYn').focus();
                        return false;
                    }else{
                        provision.removeClass("has-error");
                        provision.addClass("has-success");
                    }
                     
                    //개인정보취급방침
                    if($('#memberInfoYn:checked').val()=="N"){
                        modalContents.text("개인정보취급방침에 동의하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        memberInfo.removeClass("has-success");
                        memberInfo.addClass("has-error");
                        $('#memberInfoYn').focus();
                        return false;
                    }else{
                        memberInfo.removeClass("has-error");
                        memberInfo.addClass("has-success");
                    }
                     
                });
                
                
                
            });
             
        </script>
			</div>

		</div>

</body>
</html>