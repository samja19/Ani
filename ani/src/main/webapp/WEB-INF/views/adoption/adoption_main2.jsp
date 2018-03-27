<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입양페이지2</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 
<!------ Include the above in your HEAD tag ---------->
<style>
#ad_main{
    background-color: #55252;
}
.centered-form{
    margin-top: 60px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}

#ad_main label[class=error]{
	margin-left: 30px;
}

#reason{
	width: 100%;
} 
 

</style>
<script>
$(function(){ 
 
	$('#adoptionform').validate({
	    rules:{
	    	phone:{
	            required : true
	       },
	       address:{
	    	   required : true
	       },
	       address_detail:{
	    	   required : true
	       },
	       postnum:{
	    	   required : true,
	    	   minlength : 5
	       },
	       reason:{
	    	   required : true
	       }
	    },
		messages:{
			phone:"연락처는 필수 입력사항입니다.",
			address:"주소는 필수 입력사항입니다.",
			address_detail:"주소는 필수 입력사항입니다",
			postnum:"우편번호는 필수 입력사항입니다.",
			reason:"사유는 필수 입력사항입니다."
		}
	});
	
	
	
    function postfunction() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#postcode').val(data.zonecode); //5자리 새우편번호 사용
                $('#address').val(fullAddr);
                //벨리데이션 필요
                
                // 커서를 상세주소 필드로 이동한다.
                $('#address_detail').focus();
            }
        }).open();
    }
	
	$('#address').click(postfunction);
	 
	
	
});
</script>
</head>
<body>
<!--  적용하고싶은 소스 https://bootsnipp.com/snippets/x8DNm -->
<div id="ad_main">
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
	<div class="input-field">
				<input type="text" name="phone" id="phone" class="form-control input-sm" placeholder="연락처" required >
				
				 
	</div>
	<div class="input-field">
				<input type="text" name="address" id="address" class="form-control input-sm" placeholder="주소" required  >

	</div>
	<div class="row"> 
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="input-field">
          			<input type="text" name="addressDetail" id="address_detail" class="form-control input-sm validate" placeholder="상세주소"  >
          	 
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="input-field">
          			<input type="text" name="postcode" id="postcode" class="form-control input-sm validate"  placeholder="우편번호"  >
          			 
			</div>
		</div>
	</div>

	<div class="input-field">
		<input type="text" name="email" id="email" class="form-control input-sm validate" placeholder="이메일"   >
	</div>
	
	<div class="input-field"><BR>
		 
			<textarea rows="6"  name="reason" id="reason" style="resize: none;" placeholder="신청사유"></textarea>
		 
	</div><BR>
	<input type="hidden" id="anino" name="anino"> 
	
	<div class="row">
		<div class="col-xs-6 col-xs-offset-3 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 ">
			<input type="submit" value="신청하기" class="btn btn-info btn-block">
		</div>
	</div>
	
</form>
</div>


 
</html>