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

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

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
		
		
		$('input[id^=adoptedToggle]').change(function(event){
			var aniNo = $(this).attr('data-anino');
			var adopted = ($(this).prop('checked')) ? 0 : 1;
			
			
				$.ajax({
					url : 'updateadopted.action',
					data : { aniNo : aniNo, adopted : adopted },
					method : "POST", 
					error :	(xhr,status,error) => {
						alert("오류발생 : "+error);
					}
				});
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
		
		
	    $('.filterable .btn-filter').click(function(){
	        var $panel = $(this).parents('.filterable'),
	        $filters = $panel.find('.filters input'),
	        $tbody = $panel.find('.table tbody');
	        if ($filters.prop('disabled') == true) {
	            $filters.prop('disabled', false);
	            $filters.first().focus();
	        } else {
	            $filters.val('').prop('disabled', true);
	            $tbody.find('.no-result').remove();
	            $tbody.find('tr').show();
	        }
	    });

	    $('.filterable .filters input').keyup(function(e){
	        /* Ignore tab key */
	        var code = e.keyCode || e.which;
	        if (code == '9') return;
	        /* Useful DOM data and selectors */
	        var $input = $(this),
	        inputContent = $input.val().toLowerCase(),
	        $panel = $input.parents('.filterable'),
	        column = $panel.find('.filters th').index($input.parents('th')),
	        $table = $panel.find('.table'),
	        $rows = $table.find('tbody tr');
	        /* Dirtiest filter function ever ;) */
	        var $filteredRows = $rows.filter(function(){
	            var value = $(this).find('td').eq(column).text().toLowerCase();
	            return value.indexOf(inputContent) === -1;
	        });
	        /* Clean previous no-result if exist */
	        $table.find('tbody .no-result').remove();
	        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
	        $rows.show();
	        $filteredRows.hide();
	        /* Prepend no-result row if all rows are filtered */
	        if ($filteredRows.length === $rows.length) {
	            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
	        }
	    });
	});
	
</script>
</head>


<body>

	<jsp:include page="../include/template.jsp" />
	<div class="col col-md-9">
		<div class="panel">
			<div class="panel-body">
				<!-- <legend>신규 동물 등록</legend> -->

				<!-- --------------------------------------------------------------------------------------------------------- -->

				<div class="container">
					<h1>
						<span class="glyphicon" style="vertical-align: top;">&#xe032;</span>&nbsp;전체
						동물 목록 <small>&nbsp;&nbsp; # 삭제된 동물은 등록번호만 표시됩니다.</small> <a
							href="/ani/aniM/anilist.action"
							class="btn btn-success pull-right" id="back-to-bootsnipp">목록</a>
						<a href="/ani/aniM/aniregister.action"
							class="btn btn-warning pull-right" id="back-to-bootsnipp">동물
							등록</a>
					</h1>

					<hr>

					<div class="row">
						<div class="panel panel-primary filterable">
							<div class="panel-heading">
								<div>
									<h3 class="panel-title">
										List
										<button class="btn btn-default btn-xs btn-filter pull-right">
											<span class="glyphicon glyphicon-filter"></span> 필터 On/Off
										</button>
									</h3>
								</div>
							</div>
							<table class="table">
								<thead>
									<tr class="filters">
										<th style="vertical-align: middle;">사진</th>
										<th class="col-md-1"><input type="text"
											class="form-control" placeholder="번호" disabled></th>
										<th class="col-md-2"><input type="text"
											class="form-control" placeholder="동물분류" disabled></th>
										<th class="col-md-2"><input type="text"
											class="form-control" placeholder="이름" disabled></th>
										<th class="col-md-2"><input type="text"
											class="form-control" placeholder="생일" disabled></th>
										<th class="col-md-1"><input type="text"
											class="form-control" placeholder="등록일자" disabled></th>
										<th class="col-md-1" style="vertical-align: middle; text-align: center;">입양 상태</th>
										<th class="col-md-1" style="vertical-align: middle; text-align: right;"><em
											class="fa fa-cog"></em></th>
									</tr>
								</thead>
								<tbody id="anilistbody">
									<c:choose>
										<c:when test="${not empty aniList}">
											<c:forEach var="ani" items="${ aniList }">
												<tr>
													<c:choose>
														<c:when test="${ ani.aniDel eq 1 }">
															<td></td>
															<td class="anitr">${ ani.aniNo }</td>
															<td colspan="6"><span style="color: lightgray">[
																	동물 정보가 삭제되었습니다. ]</span>
															<td>
														</c:when>
														<c:otherwise>
															<td class="anitr" data-anino=${ ani.aniNo }><img
																src="/ani/resources/animg/${ ani.attachments[0].aniSaveName }"
																width="100"></td>
															<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniNo }</td>
															<td class="anitr" data-anino=${ ani.aniNo }>${ ani.speciesName }</td>
															<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniName }</td>
															<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniBirth }</td>
															<td class="anitr" data-anino=${ ani.aniNo }>${ ani.aniRegdate }</td>
															<td><c:choose>
																	<c:when test="${ ani.adopted == '0'}">
																		<input id="adoptedToggle${ ani.aniNo }" checked type="checkbox"
																			data-toggle="toggle" data-on="입양준비중" data-off="입양완료"
																			data-size="mini" data-anino=${ ani.aniNo }>
																	</c:when>
																	<c:otherwise>
																		<input id="adoptedToggle${ ani.aniNo }" type="checkbox"
																			data-toggle="toggle" data-on="입양준비중" data-off="입양완료"
																			data-size="mini" data-anino=${ ani.aniNo }>
																	</c:otherwise>
																</c:choose></td>
															<td class="hidden-xs" style="text-align: right;"><a
																class="btn btn-default"
																onclick="location.href='aniupdate.action?aniNo=${ ani.aniNo }'"><em
																	class="fa fa-pencil"></em></a> <a class="btn btn-danger"
																id="anidelete${ ani.aniNo }" data-anino=${ ani.aniNo }><em
																	class="fa fa-trash"></em></a></td>

														</c:otherwise>
													</c:choose>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7" style='text-align: center'>조회된 동물 정보가
													없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
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
									no. <strong id="modal_no"></strong>&nbsp;&nbsp;&nbsp; @ <font id="modal_name"></font> 
								</h4>
							</div>
							<div class="modal-body">

								<!-- <div class="col-md-4">
									<img id="modal_img" width="100" alt="teste" class="img-thumbnail">
								</div> -->

								<table class="pull-left col-md-8 ">
									<tbody>
										<tr>
											<td rowspan="9"><img id="modal_img" width="100"
												alt="teste" class="img-thumbnail"></td>
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
										<tr>
											<td><p class="open_info hide" id="modal_info"></p></td>
										</tr>

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