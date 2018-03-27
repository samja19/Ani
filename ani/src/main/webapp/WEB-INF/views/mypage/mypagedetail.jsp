<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<link rel="stylesheet" href="/duna/resources/styles/css/comment.css">
		<link rel="stylesheet" href="/duna/resources/bootstrap/bootstrap-submenu.min.css">
		<script src="/duna/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
			<script>
			$(document).ready(function(){
				$('[data-submenu]').submenupicker();
				
				/////////글삭제
				$('#delete').click(function(){
					var yes = confirm('삭제하시겠습니까?');
					if (yes) {
						location.href = 'deletemypage.action?mypageNo=' + ${ mypage.mypageNo } 
					}
				});
			});  
		</script>
	</head>
    <body>
    
    	<!-- header -->
    	<jsp:include page="../include/header.jsp" />

    			
    	
    	<!-- 본문 들어가는 부분 -->
        <div class="container">
        
        	<!-- 게시판 상세보기 -->
			<h3>나만의 일기장</h3>
		    <hr>
		   	
			<table class="table table-view">
				<thead>
					<tr>
						<th class="subject"><h4><b>제목 :</b> ${ mypage.mypageTitle }</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="infocell">
							<b>등록일  </b><fmt:formatDate value="${ mypage.mypageDate }" pattern="YYYY-MM-dd" /> 
						</td>
					</tr>
					<tr>
						<td class="contents" style="height:100px; word-break:break-all;">
<c:set var="newLine" value="
" />                  
		                ${ fn:replace(mypage.mypageContent, newLine, "<br>") }
						</td>
					</tr>
					<!-- 이전글 & 다음글  -->
<%-- 					<c:choose>
						<c:when test="${fn:length(list) == 2 and tb_write.idx == list[0].idx }"> <!-- 내가클릭한 게시물이 list[0]번째 글이면 최신글이다.  -->
						<tr>
							<td><span class="prev">이전</span>이전글이 없습니다.</td> <!-- 최신글보다 더 최신글이 없다는 의미이다. -->
						</tr>
						<tr>
							<td><span class="next">다음</span><a href="/View?idx=${list[1].idx}">${list[1].title}</a></td> 
						</tr>
						</c:when>
						
						<c:when test="${fn:length(list) == 2 and tb_write.idx < list[0].idx }"> <!-- 내가 클릭한 게시물이 list[0]번째 글(최신글)보다 이전에 만들어 졌으면 -->
						<tr>									 
							<td><span class="prev">이전</span><a href="/View?idx=${list[0].idx}">${list[0].title}</a></td> <!-- list[0]번쨰 글이 나온다. -->
						</tr>																			<!-- 내가 클릭한 글은 무조건 list[1]번째 글이다. -->a
						<tr>
							<td><span class="next">다음</span>다음글이 없습니다.</td>
						</tr>
						</c:when>
						<c:when test="${fn:length(list) == 3 and tb_write.idx < list[0].idx}"> <!-- 내가 클릭한 게시물이 [l  -->
						<tr>
							<td><span class="prev">이전</span><a href="/View?idx=${list[0].idx}">${list[0].title}</a></td>
						</tr>
						<tr>
							<td><span class="next">다음</span><a href="/View?idx=${list[2].idx}">${list[2].title}</a></td>
						</tr>
						</c:when>
					</c:choose> --%>
				</tbody>
			</table>
			<hr>
			<!-- 작성자의 권한으로만 동작하는 기능 -->
			<div class="huge-top">
				
					<button class="btn btn-basic" onclick="location.href='mypageupdate.action?mypageNo=${ mypage.mypageNo }'">수정</button>
				
				
					<button class="btn btn-basic" id="delete">삭제</button>
					
					<button class="btn btn-primary pull-right" onclick="location.href='mypagelist.action'">목록</button>
			</div>
			
			<!-- 댓글  -->

		</div><!-- // 본문 = container -->	   
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
    </body>
</html>