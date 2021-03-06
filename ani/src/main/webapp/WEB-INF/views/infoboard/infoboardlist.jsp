<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>애니 : 정보게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/ani/resources/styles/css/header.css">
<link rel="stylesheet" href="/ani/resources/styles/css/table.css">
<link rel="stylesheet"
	href="/ani/resources/bootstrap/bootstrap-submenu.min.css">
<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
<script src="/ani/resources/bootstrap/jquery.twbsPagination.js"></script>
<script>
		$(document).ready(function(){
			$('[data-submenu]').submenupicker();
			
            $('#pagination-demo').twbsPagination({
	    		totalPages: 35,
	    		visiblePages: 7,
	   			onPageClick: function (event, page) {
	        	$('#page-content').text('Page ' + page);
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
		<!-- 좌우측의 공간 확보 -->
		<h3>정보게시판</h3>
		<hr> 

		<table class="table table-striped">
			<thead>
				<tr>
					<th class="col-xs-1" style='text-align: center'>번호</th>
					<th class="col-xs-1" style='text-align: left'>카테고리</th>
					<th class="col-xs-2" style='text-align: left'>작성자</th>
					<th class="col-xs-4" style='text-align: left'>제목</th>
					<th class="col-xs-1" style='text-align: center'>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty infoboardlist}">
						<c:forEach var="infoboard" items="${ infoboardlist }">
							<tr> 
								<c:if test="${ infoboard.ib_delete eq 1 }">
										<td style='text-align: center'><span style="color:lightgray">[ 삭제된 글입니다. ]</span></td>
										<td style='text-align: left'><span style="color:lightgray">[ 삭제된 글입니다. ]</span></td>
										<td style='text-align: left'><span style="color:lightgray">[ 삭제된 글입니다. ]</span></td>
										<td style='text-align: left'><span style="color:lightgray">[ 삭제된 글입니다. ]</span></td>
										<td style='text-align: center'><span style="color:lightgray">[ 삭제된 글입니다. ]</span> </td>
								</c:if> 
								<c:if test="${ infoboard.ib_delete eq 0 }">
								<td style='text-align: center'>${infoboard.ib_num}</td>
								<td style='text-align: left'>  ${infoboard.cat_in}</td>
								<td style='text-align: left'>  ${infoboard.id}</td>
								<td style='text-align: left'><a
									href="infoboarddetail.action?ib_num=${ infoboard.ib_num }">
										${ infoboard.ib_title } </a></td>
								<td style='text-align: center'>
								<fmt:formatDate value="${infoboard.ib_date}"  
									pattern="yyyy-MM-dd" /></td>
								</c:if> 
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4" style='text-align: center'>조회된 글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>

		<hr />
		<div class="text-right">
			<a href="/ani/infoboard/infoboardwrite.action"
				class="btn btn-default">글쓰기</a>
		</div>
		<div class="text-center">
			<ul id="pagination-demo" class="pagination"></ul>
		</div>
		
		
	<!-- 
		<form class="form-inline text-center">
			<div class="col-xs-8 col-xs-offset-2">
				<select class="form-control" name="" id="category">

					<option value="210">정보</option>
					<option value="220">잡담</option>
					<option value="230">모임</option>
					<option value="240">기타</option>
				</select> <select class="form-control" name="" id="concept">
					<option value="">제목+내용</option>
					<option value="">제목만</option>
					<option value="">글작성자</option>
					<option value="">댓글내용</option>
					<option value="">댓글작성자</option>
				</select> <input type="text" class="form-control" name="x" placeholder="Search term...">
				<button class="btn btn-info" type="submit">  검색  </button>
			</div>
		</form>-->

	</div>
	<!-- container -->
	            
	<!--// 본문 들어가는 부분 -->

	<!-- footer -->
	<jsp:include page="../include/footer.jsp" />


</body>
</html>