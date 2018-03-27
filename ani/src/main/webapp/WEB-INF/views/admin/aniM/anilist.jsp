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
	var cssId = 'myCss'; // you could encode the css path itself to generate id..
	if (!document.getElementById(cssId)) {
		var head = document.getElementsByTagName('head')[0];
		var link = document.createElement('link');
		link.id = cssId;
		link.rel = 'stylesheet';
		link.type = 'text/css';
		link.href = 'https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css';
		link.media = 'all';
		head.appendChild(link);
	}
</script>
</head>


<body>

	<jsp:include page="../include/template.jsp" />
	<div class="col col-md-9">
		<div class="panel">
			<div class="panel-body">
				<legend>신규 동물 등록</legend>


				<link
					href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
					rel='stylesheet' type='text/css'>

				<div class="col-md-12">

					<div class="panel panel-default panel-table">
						<div class="panel-heading">
							<div class="row">
<!-- 								<div class="col col-xs-6">
									<h3 class="panel-title">Panel Heading</h3>
								</div> -->
							<div class="btn-group">
								<button type="button" class="btn btn-success btn-filter" data-target="pagado">Pagado</button>
								<button type="button" class="btn btn-warning btn-filter" data-target="pendiente">Pendiente</button>
								<button type="button" class="btn btn-danger btn-filter" data-target="cancelado">Cancelado</button>
								<button type="button" class="btn btn-default btn-filter" data-target="all">Todos</button>
							</div>
							
<!-- 								<div class="col col-xs-6 text-right">
									<button type="button" class="btn btn-sm btn-primary btn-create">Create
										New</button>
								</div> -->
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

				</div>

			</div>



		</div>

	</div>
</body>
</html>