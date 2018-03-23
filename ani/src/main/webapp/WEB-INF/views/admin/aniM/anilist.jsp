<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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

		$('tbody > tr').on('click', function(event) {
			event.preventDefault();
			$('#myModal').modal('show');
		})

		$('.btn-mais-info').on('click', function(event) {
			$('.open_info').toggleClass("hide");
		})

	});
</script>
</head>


<body>

	<jsp:include page="../include/template.jsp" />
	<div class="col col-md-9">
		<div class="panel">
			<div class="panel-body">
				<legend>신규 동물 등록</legend>


				<!-- 				<link
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
					rel='stylesheet' type='text/css'>

				<div class="col-md-12">

					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
								<div class="col col-xs-6">
									<h3 class="panel-title">Panel Heading</h3>
								</div>
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" data-target="pagado">Pagado</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
							</div>
							
								<div class="col col-xs-6 text-right">
									<button type="button" class="btn btn-sm btn-primary btn-create">Create
										New</button>
								</div>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered table-list">
								<thead>
									<tr>
										<th class="hidden-xs">번호</th>
										<th>사진</th>
										<th>이름</th>
										<th>나이</th>
										<th>등록일자</th>
										<th class="hidden-xs"><em class="fa fa-cog"></em></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="hidden-xs">1</td>
										<td>ㄷㅁ</td>
										<td>동물</td>
										<td>10</td>
										<td>2018-03-31</td>
										<td class="hidden-xs" align="center"><a class="btn btn-default"><em
												class="fa fa-pencil"></em></a> <a class="btn btn-danger"><em
												class="fa fa-trash"></em></a></td>
									</tr>
								</tbody>
							</table>

						</div>
						<div class="panel-footer">
							<div class="row">
								<div class="col col-xs-4">Page 1 of 5</div>
								<div class="col col-xs-8">
									<ul class="pagination hidden-xs pull-right">
										<li><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
									</ul>
									<ul class="pagination visible-xs pull-right">
										<li><a href="#">«</a></li>
										<li><a href="#">»</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

				</div> -->



				<div class="container">

					<div class="alert alert-info">
						<a id="fullscreen" href="#fullscreen" class="alert-link"><strong>Click
								here</strong></a> to view this snippet in an iframe. <i
							class="fa fa-info-circle fa-2x pull-right"></i>
					</div>

					<h1>
						<i class="fa fa-shopping-cart"></i> Produtos <small> -
							click on product for details</small> <a
							href="http://bootsnipp.com/alisonpedro/snippets/Q60Oj"
							class="btn btn-danger pull-right hide" id="back-to-bootsnipp">Back
							to Bootsnipp</a>
					</h1>

					<hr>

					<table class="table table-hover">
						<thead>
							<tr>
								<th>#Cod</th>
								<th>Name</th>
								<th>Manufacturers</th>
								<th>Model</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>Dell 18.5 Inch Monitor</td>
								<td>Dell</td>
								<td>IN1930</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Intel Core i5</td>
								<td>Intel</td>
								<td>Core i5</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Gaming Keyboard G510</td>
								<td>Logitech</td>
								<td>G510</td>
							</tr>

							<tr>
								<td>1</td>
								<td>Dell 18.5 Inch Monitor</td>
								<td>Dell</td>
								<td>IN1930</td>
							</tr>
							<tr>
								<td>2</td>
								<td>Intel Core i5</td>
								<td>Intel</td>
								<td>Core i5</td>
							</tr>
							<tr>
								<td>3</td>
								<td>Gaming Keyboard G510</td>
								<td>Logitech</td>
								<td>G510</td>
							</tr>
						</tbody>
					</table>

					<div class="col-sm-12 ">
						<div class="result pull-left">
							<strong>Mostrando 1 até 6 de 5000</strong>
						</div>

						<ul class="pagination pull-right">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>

					</div>



				</div>

				<!-- Modal -->
				<div class="modal" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">
									<i class="text-danger fa fa-times"></i>
								</button>
								<h4 class="modal-title" id="myModalLabel">
									<i class="text-muted fa fa-shopping-cart"></i> <strong>(동물번호)</strong>
									- (동물이름)
								</h4>
							</div>
							<div class="modal-body">

								<table class="pull-left col-md-8 ">
									<tbody>
										<tr>
											<td class="h6"><strong>동물 분류</strong></td>
											<td></td>
											<td class="h5">02051</td>
										</tr>

										<tr>
											<td class="h6"><strong>품종</strong></td>
											<td></td>
											<td class="h5">descrição do produto</td>
										</tr>

										<tr>
											<td class="h6"><strong>Marca/Fornecedor</strong></td>
											<td></td>
											<td class="h5">Marca do produto</td>
										</tr>

										<tr>
											<td class="h6"><strong>Número Original</strong></td>
											<td></td>
											<td class="h5">0230316</td>
										</tr>

										<tr>
											<td class="h6"><strong>Código N.C.M</strong></td>
											<td></td>
											<td class="h5">032165</td>
										</tr>

										<tr>
											<td class="h6"><strong>Código de Barras</strong></td>
											<td></td>
											<td class="h5">0321649843</td>
										</tr>

										<tr>
											<td class="h6"><strong>Unid. por Embalagem</strong></td>
											<td></td>
											<td class="h5">50</td>
										</tr>

										<tr>
											<td class="h6"><strong>Quantidade Mínima</strong></td>
											<td></td>
											<td class="h5">50</td>
										</tr>

										<tr>
											<td class="h6"><strong>Preço Atacado</strong></td>
											<td></td>
											<td class="h5">R$ 35,00</td>
										</tr>

										<tr>
											<td class="btn-mais-info text-primary"><i
												class="open_info fa fa-plus-square-o"></i> <i
												class="open_info hide fa fa-minus-square-o"></i> informações
											</td>
											<td></td>
											<td class="h5"></td>
										</tr>

									</tbody>
								</table>


								<div class="col-md-4">
									<img src="http://lorempixel.com/150/150/technics/" alt="teste"
										class="img-thumbnail">
								</div>

								<div class="clearfix"></div>
								<p class="open_info hide">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit, sed do eiusmod tempor incididunt
									ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
									nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							</div>

							<div class="modal-footer">

								<div class="text-right pull-right col-md-3">
									Varejo: <br /> <span class="h3 text-muted"><strong>
											R$50,00 </strong></span></span>
								</div>

								<div class="text-right pull-right col-md-3">
									Atacado: <br /> <span class="h3 text-muted"><strong>R$35,00</strong></span>
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