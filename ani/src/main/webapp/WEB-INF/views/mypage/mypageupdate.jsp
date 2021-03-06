<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>나만의 일기장</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="/duna/resources/styles/css/header.css">
		<link rel="stylesheet" href="/duna/resources/bootstrap/bootstrap-submenu.min.css">
		<script src="/duna/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
		<script>
			$(document).ready(function(){
				$('[data-submenu]').submenupicker();
				
				$('form').submit(function(){
					if ($('#title').val().trim() == "") {
						alert('제목을 입력해주세요.');
						$('#title').focus();
						return false;
					} else if ($('#content').val().trim() == "") {
						alert('내용을 입력해주세요.');
						$('#content').focus();
						return false;
					} else {
						$('form').submit();
					}
				});	
			});
		</script>
	</head>
    <body>
    
    	<!-- header -->
    	<jsp:include page="../include/header.jsp" />

    			

    	
    	<!-- 본문 들어가는 부분 -->
        <div class="container"><!-- 좌우측의 공간 확보 -->
			<h3>나만의 일기장 글수정</h3>
		    
			<form role="form" method="post" action="mypageupdate.action" >
      			<div class="form-group">				
       				<label for="InputTitle">제목</label>
       				<div>
       				<input type="text" name='mypageTitle' class="form-control" data-rule-required="true" placeholder="제목을 입력해주세요." id="mypageTitle" value="${ mypage.mypageTitle }">
      				</div>
      			</div>
      			<div class="form-group">
       				<label for="InputContent">내용</label>
		       		<textarea class="form-control" name="mypageContent" rows="15" placeholder="내용을 입력해주세요." id="mypageContent">${ mypage.mypageContent }</textarea>
      			</div>
      			<div class="text-center"><button type="submit" class="btn btn-primary" id="update">글수정</button>
				</div>
				<input type="hidden" name="mypageNo" value="${ mypage.mypageNo }" >
      		</form>			
		</div><!-- container -->
			            
        <!--// 본문 들어가는 부분 -->
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>