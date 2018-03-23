<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
   
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
		<link rel="stylesheet" href="/duna/resources/styles/css/table.css">
		<link rel="stylesheet" href="/duna/resources/bootstrap/bootstrap-submenu.min.css">
		<script src="/duna/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
		<script src="/duna/resources/bootstrap/jquery.twbsPagination.js"></script>
		<script>
		$(document).ready(function(){
			$('[data-submenu]').submenupicker();
			
			$('#write').click(function() {
				<c:choose>
					<c:when test="${ empty loginuser}">
						alert( "로그인 후 글쓰기가 가능합니다." );
					</c:when>
					<c:otherwise>
						location.href = '/ani/mypage/mypagewrite.action'
					</c:otherwise>
				</c:choose>		
			});
/*             $('#pagination-demo').twbsPagination({
	    		totalPages: ${countFB},
	    		visiblePages: 5,
	   			onPageClick: function (event, page) {
	        	$('#page-content').text('Page ' + page);
	    		}
			}); */
		});
        </script>
	</head>
    <body topmargin="0">
    
    	<!-- header -->
    	<jsp:include page="../include/header.jsp" />
    			
    	<br><br><br><br>
    	
    	<!-- 본문 들어가는 부분 -->
        <div class="container"><!-- 좌우측의 공간 확보 -->
			<h3>나만의 일기장</h3>
		    <hr>
		   	<br>
		    
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="col-xs-1" style='text-align: center'></th>
						<th class="col-xs-5" style='text-align: center'>제목</th>
						<th class="col-xs-2" style='text-align: center'>작성자</th>
						<th class="col-xs-2" style='text-align: center'>날짜</th>
						<th class="col-xs-1" style='text-align: center'>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty mypagelist}">
						<c:forEach var="mypage" items="${ mypagelist }">
						<tr>
							<td style='text-align: center'>${ mypage.mypageNo }</td>
							<td style='text-align: left'>
		 						<c:choose>
									<c:when test="${ mypage.mypageDel eq 1 }">
										<span style="color:lightgray">[ 삭제된 글입니다. ]</span>
									</c:when>
									<c:otherwise>
										<a href="mypagedetail.action?mypageNo=${ mypage.mypageNo }"> 
										${ mypage.mypageTitle }
	 									</a>
									</c:otherwise>
								</c:choose> 
							</td>				
							<td style='text-align: center'>${ mypage.mypageDate }</td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr >
							<td colspan="5" style='text-align: center'>조회된 자료가 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>	
			</table>
 			
 			<hr/>
 			<div class="text-right"><a href="#" class="btn btn-default" id="write">글쓰기</a></div>
 			
 			<!-- 페이징 -->	
			 <div class="text-center">
				<!-- <ul id="pagination-demo" class="pagination"></ul> -->
				<%-- <ul class="pagination">
                	${ paging }
             	</ul> --%>
         	</div> -
			
			<form class="form-inline text-center" id="form_search" method="get" action="serach.action">
				<div class="col-xs-8 col-xs-offset-2">
				<select class="form-control" id="sch_type" name="sch_type">
					<option value="fbtc">제목+내용</option>
					<option value="fbTitle" selected="selected">제목</option>
					<option value="fbContent">내용</option>
					<option value="id">글작성자</option>
				</select> 
				<input class="form-control" type="text" id="sch_value" name="sch_value" />
				<button class="btn btn-info" type="button" onclick="search();">검색</button>
			</div>
			</form>
			
			<script>
				function search() {
					var sch_value = jQuery('#form_search #sch_value').val();
					if (sch_value == '') {
						alert('검색어를 입력하세요.');
					} else {
						jQuery('#form_search').submit();
					}
				}
			</script>
			
		</div><!-- container -->			            
        <!--// 본문 들어가는 부분 -->
             
        <!-- footer -->
		<jsp:include page="../include/footer.jsp" />
        
        
    </body>
</html>