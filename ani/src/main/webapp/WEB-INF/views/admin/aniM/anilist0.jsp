<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>admin-aniregister</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="/ani/resources/css/anitable.css">

	<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
	<script src="/ani/resources/bootstrap/jquery.twbsPagination.js"></script>

<script>



	$(function() {
		/* BOOTSNIPP FULLSCREEN FIX */
		if (window.location == window.parent.location) {
			$('#back-to-bootsnipp').removeClass('hide');
			$('.alert').addClass('hide');
		}

		$('#fullscreen').on('click', function(event) {
			event.preventDefault();
			window.parent.location = "http://bootsnipp.com/iframe/Q60Oj";
		});
		
		$('a[id^=anidelete]').click(function(event){
			var aniNo = $(this).attr('data-anino');
			var yes = confirm(aniNo + '번을 삭제하시겠습니까?');
			if (yes) {
				location.href = 'anidelete.action?aniNo=' + aniNo; 
			}
		});
		
		$('.btn-mais-info').on('click', function(event) {
			$('.open_info').toggleClass("hide");
		})
		
		
 		$('tbody > tr > .anitr').on('click',function(event){
			var aniNo = $(this).attr('data-anino');
			$.ajax({
				url : 'aniDetail.action',
				data : { aniNo : aniNo },
				method : "POST", 
				success : aniDetail,
				error :	(xhr,status,error) => {
					alert("오류발생 : "+error);
				}
			});
			
			event.preventDefault();
			$('#aniDetail').modal('show');
			
			function aniDetail(data, status, xhr){
				//alert(data);
				$('#modal_no').text(data.aniNo)
				$('#modal_name').text(data.aniName)
				$('#modal_species').text(data.speciesName)
				$('#modal_breed').text(data.aniBreed)
				$('#modal_regdate').text(data.aniRegdate)
				$('#modal_birth').text(data.aniBirth)
				$('#modal_gender').text(data.aniGender)
				$('#modal_neuter').text(data.neuter)
				$('#modal_site').text(data.aniSite)
				$('#modal_info').text(data.aniInfo)
				$('#modal_img').attr("src", "/ani/resources/animg/"+data.attachments[0].aniSaveName)
			};
		}); 
	});
	

	$(document).ready(function(){
		    $.fn.page = function (PageSize) {
		        $(this).addClass("page-table")
		        var tableId = $(this).attr("id");
		        
		        //if id is not defined for table. Do Nothing.
		        if (typeof tableId == 'undefined') {
		            return this;
		        };

		        //Check for controls for this table and remove
		        $('.pagination[for="' + tableId + '"]').remove();

		        //Check for valid variable for pageSize if not set to default of 10
		        if (typeof PageSize == 'number') {
		            PageSize = parseInt(PageSize);
		        } else if (typeof PageSize == 'string') {
		            if ($.isNumeric(PageSize) == true) {
		                PageSize = parseInt(PageSize);
		            } else {
		                PageSize = 10;
		            }
		        } else {
		            PageSize = 10;
		        }

		        //Add pagination <ul> to hold controls
		        $(this).after('<ul class="pagination" for="' + tableId + '"></ul>');

		        //Add a pager control for each page
		        var currpage = 1;
		        var item = 1;
		        $(this).find('tr:has(td)').each(function () {

		            $(this).attr('data-page', currpage);

		            if ((item % PageSize) == 0) {
		                currpage = currpage + 1;
		                $('.pagination[for="' + tableId + '"]').append('<li><a href="#" data-page="' + currpage + '" for="' + tableId + '">' + currpage + '</a></li>')
		            } else if (item == 1) {
		                $('.pagination[for="' + tableId + '"]').append('<li><a href="#" class="active" data-page="' + currpage + '" for="' + tableId + '">' + currpage + '</a></li>')
		            }
		            item = item + 1;
		        });

		        //load 1st page
		        pageNumber(1, tableId);
		        $(this).next('.pagination[for="' + tableId + '"]').find('a').on('click', function (e) {
		            e.preventDefault();
		            pageNumber($(this).attr('data-page'), this);
		        });
		        return this;
		    }

		    // Private function page change
		    function pageNumber(iPage, element) {
		        if (typeof element == 'string') {
		            var target = element;
		        } else {
		            var target = $(element).attr("for");
		        }


		        if (typeof target == 'undefined') {
		            $('.page-table tr:has(td)').hide();
		            $('.page-table tr[data-page="' + iPage + '"]').show();
		        } else {
		            $('#' + target + ' tr:has(td)').hide();
		            $('#' + target + ' tr[data-page="' + iPage + '"]').show();
		        }
		    };
		    
		    $('#anilistTable').page(10);
		    $('select[for="anilistTable"]').on('change', function () {
		        $('#anilistTable').page($(this).val());
		    });
	});
	
	
</script>
</head>


<body>

	<jsp:include page="../include/template.jsp" />
	<div class="col col-md-9">
		<div class="panel">
			<div class="panel-body">
				<legend>신규 동물 등록</legend>

				<!-- --------------------------------------------------------------------------------------------------------- -->

				<div class="container">

					<!-- 					<div class="alert alert-info">
						<a id="fullscreen" href="#fullscreen" class="alert-link"><strong>Click
								here</strong></a> to view this snippet in an iframe. <i
							class="fa fa-info-circle fa-2x pull-right"></i>
					</div>
 -->

					<!-- 					<div class="btn-group">
					<button type="button" class="btn btn-success btn-filter" data-target="pagado">Pagado</button>
					<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
					<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
					<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
				</div> -->


					<h1>
						<i class="fa fa-shopping-cart"></i> Produtos <small> -
							click on product for details</small> <a
							href="/ani/aniM/aniregister.action"
							class="btn btn-danger pull-right hide" id="back-to-bootsnipp">동물
							등록</a>
					</h1>

					<hr>
					<div class="result pull-right">
						<select for="anilistTable">
              				<option value="5">5</option>
			                <option value="10" selected>10</option>
			                <option value="20">20</option>
			                <option value="30">30</option>
				    	</select>
			    	</div>
			    	
					<table id="anilistTable"					
						class="table table-hover table-striped table-bordered table-list">
						<thead>
							<tr>
								<th class="hidden-xs">#번호</th>
								<th>분류</th>
								<th>사진</th>
								<th>이름</th>
								<th>나이</th>
								<th>등록일자</th>
								<th><em class="fa fa-cog"></em></th>
							</tr>
						</thead>
						<tbody id="anilistbody">
							<c:choose>
								<c:when test="${not empty aniList}">
									<c:forEach var="ani" items="${ aniList }">
										<tr>
											<c:choose>
												<c:when test="${ ani.aniDel eq 1 }">
													<td class="anitr">${ ani.aniNo }</td>
													<td colspan="5"><span style="color: lightgray">[ 동물 정보가 삭제되었습니다. ]</span><td>
												</c:when>
												<c:otherwise>
													<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniNo }</td>
													<td class="anitr" data-anino=${ ani.aniNo }>${ ani.speciesName }</td>
													<td class="anitr" data-anino=${ ani.aniNo }>
													<img src="/ani/resources/animg/${ ani.attachments[0].aniSaveName }" width="100">
													</td>
													<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniName }</td>
													<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniBirth }</td>
													<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniRegdate }</td>
													<td class="hidden-xs" align="center">
														<a class="btn btn-default"
														 	onclick="location.href='aniupdate.action?aniNo=${ ani.aniNo }'"><em class="fa fa-pencil"></em></a> 
														<a class="btn btn-danger" id="anidelete${ ani.aniNo }" data-anino=${ ani.aniNo }><em class="fa fa-trash"></em></a></td>														
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7" style='text-align: center'>조회된 동물 정보가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose> 
						</tbody>
					</table>

				        
					<div class="col-sm-12 ">
						<div class="result pull-left">
							<strong>Mostrando 1 até 6 de 5000</strong>
						</div>

<!-- 						<ul class="pagination pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul> -->
						<!-- <ul id="pagination-demo" class="pagination pull-right" ></ul> -->
						<!-- <div class="text-center">
							<ul id="pagination-demo" class="pagination" ></ul>
						</div> -->	
					</div>
				</div>




				<!-- Modal -->
				<div class="modal" id="aniDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<i class="text-danger fa fa-times"></i>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<i class="text-muted fa fa-shopping-cart"></i> <strong id="modal_no"></strong>
									<font id="modal_name"></font>
								</h4>
							</div>
							<div class="modal-body">

								<!-- <div class="col-md-4">
									<img id="modal_img" width="100" alt="teste" class="img-thumbnail">
								</div> -->

								<table class="pull-left col-md-8 ">
									<tbody>
										<tr>
											<td rowspan="9"><img id="modal_img" width="100" alt="teste" class="img-thumbnail"></td>
											<td class="h6"><strong>동물 분류</strong></td>
											<td></td>
											<td class="h5" id="modal_species"></td>
										</tr>

										<tr>
											<td class="h6"><strong>품종</strong></td>
											<td></td>
											<td class="h5" id="modal_breed"></td>
										</tr>

										<tr>
											<td class="h6"><strong>등록일자</strong></td>
											<td></td>
											<td class="h5" id="modal_regdate"></td>
										</tr>

										<tr>
											<td class="h6"><strong>생일</strong></td>
											<td></td>
											<td class="h5" id="modal_birth"></td>
										</tr>

										<tr>
											<td class="h6"><strong>성별</strong></td>
											<td></td>
											<td class="h5" id="modal_gender"></td>
										</tr>

										<tr>
											<td class="h6"><strong>중성화 여부</strong></td>
											<td></td>
											<td class="h5" id="modal_neuter"></td>
										</tr>

										<tr>
											<td class="h6"><strong>발견장소</strong></td>
											<td></td>
											<td class="h5" id="modal_site"></td>
										</tr>

										<tr>
											<td class="btn-mais-info text-primary"><i
												class="open_info fa fa-plus-square-o"></i> <i
												class="open_info hide fa fa-minus-square-o"></i> 상세정보</td>
											<td></td>
											<td class="h5"></td>
										</tr>
										<tr><td><p class="open_info hide" id="modal_info"></p></td></tr>

									</tbody>
								</table>


<!-- 								<div class="col-md-4">
									<img id="modal_img" width="100" alt="teste" class="img-thumbnail">
								</div>
 -->
								<div class="clearfix"></div>
									<!-- <p class="open_info hide" id="modal_info"></p> -->
								</div>

							<div class="modal-footer">

								<div class="text-right pull-right col-md-3">
									후원적립금: <br /> <span class="h3 text-muted"><strong>
											R$50,00 </strong></span>
								</div>

								<div class="text-right pull-right col-md-3">
									팔로워수: <br /> <span class="h3 text-muted"><strong>R$35,00</strong></span>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- fim Modal-->
			</div>
			<!-- fim Panel-->



		</div>

	</div>
</body>
</html>