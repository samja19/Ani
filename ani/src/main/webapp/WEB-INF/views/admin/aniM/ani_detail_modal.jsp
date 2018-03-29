<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입양페이지2</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<!------ Include the above in your HEAD tag ---------->

<script>
$(function() {

	if (window.location == window.parent.location) {
		$('#back-to-bootsnipp').removeClass('hide');
		$('.alert').addClass('hide');
	}

	$('#fullscreen').on('click', function(event) {
		event.preventDefault();
		window.parent.location = "http://bootsnipp.com/iframe/Q60Oj";
	});
	
	$('.btn-mais-info').on('click', function(event) {
		$('.open_info').toggleClass("hide");
	});
	
	
	//$('tbody > tr > .anitd').on('click',function(event){
	$(document).on('click', 'tbody > tr > .anitd', function(event){
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
</script>
</head>
<body>

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
							<td rowspan="9"><img id="modal_img" width="100" alt="teste"
								class="img-thumbnail"></td>
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
</html>