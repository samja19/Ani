<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>두나 : 정보수정2 </title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="/duna/resources/styles/css/header.css">
		<link rel="stylesheet" href="/duna/resources/styles/css/table.css">
		<script src="/duna/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
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
			<h3>회원 정보 수정</h3>
		    <hr>
		   	<br>
                 
	        <form id="regform"
	        class="form-horizontal" role="form" method="post" action="update.action">
	             
	                         
	            <div class="form-group" id="divNickname">
	                <label for="inputNickname" class="col-lg-2 control-label">닉네임</label>
	                <div class="col-lg-10">
                        <input type="text" class="form-control" id="nickname" name="nickname"
                        data-rule-required="true" placeholder="닉네임" maxlength="15" value="${userinfo.nickname}">
	                </div>
	            </div>
	            
	            <div class="form-group" id="divPassword">
	                <label for="inputPassword" class="col-lg-2 control-label">패스워드</label>
	                <div class="col-lg-10">
                        <input type="password" class="form-control" id="password2" name="password" 
                        data-rule-required="true" placeholder="패스워드" maxlength="30"> 
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
                        <input type="text" class="form-control onlyHangul" id="name" name="name" value="${userinfo.name}"
                        data-rule-required="true" placeholder="한글만 입력 가능합니다." maxlength="15">
	                </div>
	            </div>
	            
	            <div class="form-group">
	                <label for="inputPhoneNumber" class="col-lg-2 control-label">성별 </label>
	                <div class="col-lg-10">
	                    <select class="form-control" id="gender" name="gender" >
	                    	 
	                        <option value="1" ${userinfo.gender == '1' ? 'selected' : '' }>여성</option> 
	                        <option value="0" ${userinfo.gender == '0' ? 'selected' : '' }>남성</option>
	                        <option value="2" ${userinfo.gender == '2' ? 'selected' : '' }>기타</option>
	                    </select> 
	                </div>
	            </div>
	             
	            <div class="form-group" id="divEmail">
	                <label for="inputEmail" class="col-lg-2 control-label">이메일</label>
	                <div class="col-lg-10">
                        <input type="email" class="form-control" id="email" name="email" value="${userinfo.email}"
                        data-rule-required="true" placeholder="이메일" maxlength="40">
	                </div>
	            </div>
	            <div class="form-group" id="divPhoneNumber">
	                <label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰 번호</label>
	                <div class="col-lg-10">
                        <input type="tel" class="form-control onlyNumber" id="phoneNumber" name="phone" value="${userinfo.phone}"
                        data-rule-required="true" placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
	                </div>
	            </div>
	            <div class="form-group" id="divPhoneNumber">
	                <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
	                <div class="col-lg-10">
                        <input type="date" class="form-control" id="birth" name="birth" value="${userinfo.birth }"
                        data-rule-required="true" min="1900-01-01" max="9999-12-31" placeholder="-날짜입력하세요." >
	                </div>
	            </div>
	 			<div class="form-group" id="divAddress">
	                <label for="inputAddress" class="col-lg-2 control-label"> 주소  </label>
	                <div class="col-lg-10">
                        <input type="text" class="form-control col-lg-5" id="address" name="address" value="${userinfo.address}"
                        data-rule-required="true"  maxlength="40">
	                </div>
	            </div>
				<div class="form-group" id="divAddress">
	                <label for="inputAddress" class="col-lg-2 control-label"> 1인가구 여부  </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <input type="radio" id="solo" name="solo" value="1" checked>
	                          	  1인가구
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <input type="radio" id="solo" name="solo" value="0" >
	                          	  1인가구 X
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            <div class="form-group">
	                <label for="memberInfo" class="col-lg-2 control-label">관심사</label>
	                <div class="col-lg-10" id="hobbyDiv">
	                    <textarea class="form-control" id="hobby" name="hobby"  
	                    maxlength ="100" rows="8" style="resize:none">${userinfo.hobby}</textarea> 
	                </div>
	            </div>	            
				   
	            
	                       
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" class="btn btn-default">정보수정</button>
	                </div>
	            </div>
	        </form>
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
                
            
                
                $('#nickname').keyup(function(event){
                    
                    var divNickname = $('#divNickname');
                     
                    if($.trim($('#nickname').val())==""){
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
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
                      
                    var divPassword = $('#divPassword');
                    var divPasswordCheck = $('#divPasswordCheck');
                    var divName = $('#divName');
                    var divNickname = $('#divNickname');
                    var divEmail = $('#divEmail');
                    var divPhoneNumber = $('#divPhoneNumber');
                    var provision = $('#provision');
                    var memberInfo = $('#memberInfo');
                      
                 
                     
                    //닉네임
                    if($('#nickname').val()==""){
                        modalContents.text("별명을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divNickname.removeClass("has-success");
                        divNickname.addClass("has-error");
                        $('#nickname').focus();
                        return false;
                    }else{
                        divNickname.removeClass("has-error");
                        divNickname.addClass("has-success");
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
                        modalContents.text("관심사를 입력하여 주시기 바랍니다.");
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
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>