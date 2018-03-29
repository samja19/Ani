<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니 : 정보게시판 글수정</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="/ani/resources/styles/css/header.css">
		<link rel="stylesheet" href="/ani/resources/bootstrap/bootstrap-submenu.min.css">
			<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
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
    			
    	<br><br><br><br>
    	
    	<!-- 본문 들어가는 부분 -->
        <div class="container"><!-- 좌우측의 공간 확보 -->
			<h3>정보게시판 글수정</h3>
		    <hr>
		   	<br>
		    
			<form role="form" method="post" action="infoboardupdate.action" >
      			<div class="form-group">				
       				<label for="InputTitle">제목</label>
       				<div>
       				<input type="text" name='ibTitle' class="form-control" data-rule-required="true" placeholder="제목을 입력해주세요." id="title" value="${ infoboard.ib_title }">
      				</div>
      			</div>
      			<div class="form-group">
       				<label for="InputContent">내용</label>
		       		<textarea class="form-control" name="ibContent" rows="15" placeholder="내용을 입력해주세요." id="content">${ infoboard.ib_content }</textarea>
      			</div>
      			<div class="text-center"><button type="submit" class="btn btn-primary" id="update">글수정</button>
				</div>
				<input type="hidden" name="infoNum" value="${ infoboard.ib_num }" >
      		</form>			
		</div><!-- container -->
			            
        <!--// 본문 들어가는 부분 -->
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>