<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니 : 정보게시판 글쓰기</title>
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
			});
		</script>
	</head>
    <body>
    
    	<!-- header -->
    	<jsp:include page="../include/header.jsp" />
    			
    	<br><br><br><br>
    	
    	<!-- 본문 들어가는 부분 -->
        <div class="container"><!-- 좌우측의 공간 확보 -->
			<h3>정보게시판 글쓰기</h3>
		    <hr>
		   	<br>
		    
			<form role="form" method="post" enctype="Multipart/form-data">
      			<div class="form-group">
      				<label for="InputTitle">카테고리</label>
      				<select class="form-control" name="in_cat_num" id="category">
          				
          				<option value="210">정보</option>
         		 		<option value="220">잡담</option>
         		 		<option value="230">모임</option>
         		 		<option value="240">기타</option>
       				</select>
       			</div>
      			<div class="form-group">				
       				<label for="InputTitle">제목</label>
       				<div>
       				<input type="text" name='ib_title' class="form-control" placeholder="Enter Title">
      				</div>
      			</div>
      			<div class="form-group">
	    			<label for="File">파일첨부</label>
	    			<input type="file" id="File" name="attach">
	  			</div>
      			<div class="form-group">
       				<label for="InputContent">내용</label>
		       		<textarea class="form-control" name="ib_content" rows="15" placeholder="Enter ..."></textarea>
      			</div>
      			<div class="text-center"> <button type="submit" class="btn btn-primary">등록</button>
				</div>	
      		</form>			
		</div><!-- container -->
			            
        <!--// 본문 들어가는 부분 -->
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>