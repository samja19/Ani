<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>애니 : 정보게시판</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		
		<link rel="stylesheet" href="/ani/resources/styles/css/header.css">
		<link rel="stylesheet" href="/ani/resources/styles/css/comment.css">
		<link rel="stylesheet" href="/ani/resources/bootstrap/bootstrap-submenu.min.css">
		<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
		<script>
			$(document).ready(function(){
				$('[data-submenu]').submenupicker();
				
				$('#delete').click(function(){
					var yes = confirm('삭제하시겠습니까?');
					
					if (yes) {
						location.href = 'deleteinfoboard.action?ib_num=' + ${ infoboard.ib_num } 
						
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
			<h3>정보 게시판</h3>
		    <hr>
		   	<br>

			<table class="table table-view">
				<thead>
					<tr>
						<th class="subject"><h4>${ infoboard.ib_title }</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="infocell"><b>작성자  </b>
						${ infoboard.id }&nbsp;&nbsp;<b>등록일  </b>
						<fmt:formatDate value="${ infoboard.ib_date }" pattern="YYYY-MM-dd" />
						<b>조회수  </b>${ infoboard.ib_hits } 
						<tr>
			                <td >첨부파일
			                <a href="download.action?attachno=${ infoboard.attachments[0].ibf_num }">
			                	${ infoboard.attachments[0].ibf_username }
			                	</a>
			                <%-- <c:forEach var="attachment" items="${ infoboard.attachments }">
			                	<a href="download.action?attachno=${ attachment.ibf_num }">
			                	${ attachment.ibf_username }
			                	</a>
			                </c:forEach>	 --%>                		                
			                </td>
		            </tr>
						</td>
					</tr>
					<tr>
						<td class="contents" style="height:100px">
						<c:set var="newLine" value="" />                  
		                ${ fn:replace(infoboard.ib_content, newLine, "<br>") }
						</td>
					</tr>
					<!-- 이전글 & 다음글  -->

				</tbody>
			</table>
			
			
				<button class="btn btn-normal" onclick="location.href='infoboardupdate.action?ib_num=${ infoboard.ib_num }'">수정</button>
			<button class="btn btn-normal btn-black" id="delete">삭제</button>
			<!-- 작성자의 권한으로만 동작하는 기능 -->
			<%-- <div class="huge-top">
				<c:if test="${not empty loginuser and infoboard.memberno eq loginuser.memberno}">
					<button class="btn btn-normal" onclick="location.href='infoboardupdate.action?ib_num=${ infoboard.ib_num }'">수정</button>
				</c:if>	
				<c:if test="${not empty loginuser and infoboard.memberno eq loginuser.memberno or  loginuser.memberno eq 'admin'}">
					<button class="btn btn-normal btn-black" id="delete">삭제</button>
				</c:if>
					<a class="btn btn-normal btn-blue pull-right" href="infoboardlist.action">목록</a>
			</div>
			 --%>
		</div><!-- container -->
			            
        <!--// 본문 들어가는 부분 -->
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>