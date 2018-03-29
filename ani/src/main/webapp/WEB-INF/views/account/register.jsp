<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니 : 회원가입</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="/ani/resources/styles/css/header.css">
		<link rel="stylesheet" href="/ani/resources/styles/css/table.css">
		<style type="text/css">
			.error { color: red; font-size: 11pt; font-style: bold }
		</style>
		<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
		<script>
			$(document).ready(function(){
				$('[data-submenu]').submenupicker();
			});
			
			
		</script>
		
	</head>
    <body>
    
    	<!-- header -->
    	<jsp:include page="../include/header.jsp" />
    			
    	<br><br><br><br>
    	
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

        <!-- 본문 -->
        <div class="container"><!-- 좌우측의 공간 확보 -->
			<h3>회원가입</h3>
		    <hr>
		   	<br>
                 
	        <form:form id="regform" modelAttribute="member"
	        class="form-horizontal" role="form" method="post" action="register.action">
	            
	            
	            
	            
	            
	            
	            <div class="form-group" id="divId">
	                <label for="inputId" class="col-lg-2 control-label" >아이디</label>
	                <div class="col-lg-10">
                        <form:input class="form-control onlyAlphabetAndNumber" id="id" path="id"  
                        data-rule-required="true" placeholder="30자이내의 알파벳, 언더스코어(_), 숫자만 입력 가능합니다." maxlength="30"/>
                        <form:errors id="id_error" path="id" cssClass="error" />
	                </div>
	            </div>
	                         
	            <div class="form-group" id="divNickname">
	                <label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="nickname" path="nickname"
                        data-rule-required="true" placeholder="닉네임" maxlength="15"/>
	                </div>
	            </div>
	            
	            <div class="form-group" id="divpassword">
	                <label for="inputpassword" class="col-lg-2 control-label">패스워드</label>
	                <div class="col-lg-10">
                        <form:password class="form-control" id="password2" path="password"
                        data-rule-required="true" placeholder="패스워드" maxlength="30"/> 
	                </div>
	            </div>
	            <div class="form-group" id="divpasswordCheck">
	                <label for="inputpasswordCheck" class="col-lg-2 control-label">패스워드 확인</label>
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
	            <div class="form-group" id="divEmail">
                	<label for="inputEmail" class="col-lg-2 control-label">이메일</label>
               		<div class="col-lg-10">
                       <form:input type="text" class="form-control" id="email" path="email"
                       data-rule-required="true" placeholder="이메일" maxlength="40"/>
                       <form:errors path="email" cssClass="error" />
                	</div>
            	</div>
	            <div class="form-group" id="divSpecies">
	                <label for="inputSpecies" class="col-lg-2 control-label">동물 분류 </label>
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
                        <form:input class="form-control" id="breeds" path="breeds"
                        data-rule-required="true" placeholder="품종을 입력하세요" maxlength="30"/>
	                </div>
	            </div> 
	         	<div class="form-group" id="speciesname">
	                <label for="inputspeciesname" class="col-lg-2 control-label">동물 이름</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="speciesname" path="speciesname"
                        data-rule-required="true" placeholder="이름을 입력하세요" maxlength="30"/>
	                </div>
	            </div> 
	        
	           
	                    	   		      					
        		   	         <div class="form-group">
	             	   <label for="provision" class="col-lg-2 control-label">회원가입약관</label>
              <div class="col-lg-10" id="provision">
	                    <textarea class="form-control" rows="8" style="resize:none">
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
	                    <textarea class="form-control" rows="8" style="resize:none">
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
                        	url : '/ani/account/valiid.action',
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
                        	url : '/ani/account/valinick.action',
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
                     
                    var divpassword = $('#divpassword');
                     
                    if($('#password2').val()==""){
                        divpassword.removeClass("has-success");
                        divpassword.addClass("has-error");
                    }else{
                        divpassword.removeClass("has-error");
                        divpassword.addClass("has-success");
                    }
                });
                 
                $('#passwordCheck').keyup(function(event){
                     
                    var passwordCheck = $('#passwordCheck').val();
                    var password = $('#password2').val();
                    var divpasswordCheck = $('#divpasswordCheck');
                     
                    if((passwordCheck=="") || (password!=passwordCheck)){
                        divpasswordCheck.removeClass("has-success");
                        divpasswordCheck.addClass("has-error");
                    }else{
                        divpasswordCheck.removeClass("has-error");
                        divpasswordCheck.addClass("has-success");
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
                    var divpassword = $('#divpassword');
                    var divpasswordCheck = $('#divpasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    
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
                         
                        divpassword.removeClass("has-success");
                        divpassword.addClass("has-error");
                        $('#password2').focus();
                        return false;
                    }else{
                        divpassword.removeClass("has-error");
                        divpassword.addClass("has-success");
                    }
                     
                    //패스워드 확인
                    if($('#passwordCheck').val()==""){
                        modalContents.text("패스워드 확인을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divpasswordCheck.removeClass("has-success");
                        divpasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divpasswordCheck.removeClass("has-error");
                        divpasswordCheck.addClass("has-success");
                    }
                     
                    //패스워드 비교
                    if($('#password2').val()!=$('#passwordCheck').val() || $('#passwordCheck').val()==""){
                        modalContents.text("패스워드가 일치하지 않습니다.");
                        modal.modal('show');
                         
                        divpasswordCheck.removeClass("has-success");
                        divpasswordCheck.addClass("has-error");
                        $('#passwordCheck').focus();
                        return false;
                    }else{
                        divpasswordCheck.removeClass("has-error");
                        divpasswordCheck.addClass("has-success");
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
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>