<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<script src="/ani/resources/bootstrap/jquery.twbsPagination.js"></script>

<script>


	$(document).ready(function(){
		var pageCount = 5;
		var aniCount = parseInt("${aniCount}");
		var totalPage = parseInt(aniCount/pageCount)+(aniCount%pageCount > 0 ? 1 : 0);
		
		var $pagination = $('#pagination-demo');
		
		var visiblePages = (totalPage < 5 ? totalPage : 5);
		
		//alert(totalPage+"/"+visiblePages);
		var defaultOpts = {
				startPage : 1,
				visiblePages : visiblePages,
			    totalPages : totalPage,
			    onPageClick : function (evt, page) {
		            //$('#content').text('Page ' + page);
		            $.ajax({
		    			url : '/ani/aniM/anilist.action',
		    			data : { pageno : page, pagecount : pageCount},
		    			method : "POST", 
		    			dataType : "json",
		    			success : listProcess,
		    			error :	(xhr,status,error)=>{alert("오류발생 : "+error);}
		    			
		    		});
		        }
		};
		
		
		$pagination.twbsPagination('destroy');
		$pagination.twbsPagination(defaultOpts);
		
		
		function listProcess(data, status, xhr){
			if(data!=null){
				
				anis=data;
				var newTotalPage = parseInt(anis.length/5)+(anis.length%5 > 0 ? 1 : 0);
				if(totalPage )
				
				
				$('#anilistbody').children().remove();
				for(var i =0 ; i<anis.length;i++){
					var atr = $('<tr></tr>');

					var td_animg = $('<td></td>');
					var td_anino = $('<td></td>');
					var td_anispecies = $('<td></td>');
					var td_aniname = $('<td></td>');
					var td_anibirth = $('<td></td>');
					var td_aniregdate = $('<td></td>');
					/* var td_adopted = $('<td></td>'); */
					var td_icon = $('<td style="text-align:right;"></td>');
					
					if (anis[i].attachments.length > 0)	{				
						img = $('<img src="/ani/resources/animg/'+ anis[i].attachments[0].aniSaveName+'" width="100">')						
						td_animg.addClass("anitd").attr("data-anino", anis[i].aniNo).append(img);
					};
					td_anino.addClass("anitd").attr("data-anino", anis[i].aniNo).text(anis[i].aniNo);
					td_anispecies.addClass("anitd").attr("data-anino", anis[i].aniNo).text(anis[i].speciesName);		
					td_aniname.addClass("anitd").attr("data-anino", anis[i].aniNo).text(anis[i].aniName);
					
					td_anibirth.addClass("anitd").attr("data-anino", anis[i].aniNo).text(anis[i].aniBirth);
					td_aniregdate.addClass("anitd").attr("data-anino", anis[i].aniNo).text(anis[i].aniRegdate);
					
/* 					adoptedChecked = $('<input id="adoptedToggle' + anis[i].aniNo + '" checked type="checkbox"' +
							'data-toggle="toggle" data-on="입양준비중" data-off="입양완료"' +
							'data-size="mini" data-anino=' + anis[i].aniNo + '>');
					
					if (anis[i].adopted = 1) {
						adoptedChecked.attr("checked", false);
					};
					

					td_adopted.append(adoptedChecked);
					 */
					
					td_update_icon = $('<a class=\'btn btn-default\' onclick=\'location.href="aniupdate.action?aniNo='+
							anis[i].aniNo + '"\'><em class="fa fa-pencil"></em></a>');
					td_delete_icon = $('<a class=\'btn btn-danger\' id="anidelete'+ anis[i].aniNo +
							'" data-anino=' + anis[i].aniNo + '><em class="fa fa-trash"></em></a>');
					td_icon.append(td_update_icon);
					td_icon.append(td_delete_icon);
						
		
					
					
					atr.append(td_animg);
					atr.append(td_anino);
					atr.append(td_anispecies);
					atr.append(td_aniname);
					atr.append(td_anibirth);
					atr.append(td_aniregdate);
					//atr.append(td_adopted);
					atr.append(td_icon);
					atr.attr("data-anitr", anis[i].aniNo);
					$('#anilistbody').append(atr);

				}
				 
				
			}
			
		};

		
		
		 
		
		
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
	  
	
/* 		$('input[id^=adoptedToggle]').change(function(event){
			//$(document).on('change','input[id^=adoptedToggle]', function(event){
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
			});		 */
	
	
	
	
	});
	function trDelete(data, status, xhr){
		$('tr[data-anitr='+data+']').remove();
	};
	
	$(document).on('click', 'a[id^=anidelete]', function(event){
		var aniNo = $(this).attr('data-anino');
		var yes = confirm(aniNo + '번을 삭제하시겠습니까?');
		if (yes) {
			$.ajax({
				url : 'anidelete.action',
				data : { aniNo : aniNo },
				method : "POST", 
				success : trDelete,
				error :	(xhr,status,error) => {
					alert("오류발생 : "+error);
				}
			});
			
			
			
		}
		
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
						<span class="glyphicon" style="vertical-align:top;">&#xe032;</span>&nbsp;동물 목록
							<a
							href="/ani/aniM/allanilist.action"
							class="btn btn-success pull-right" id="back-to-bootsnipp">전체 목록</a>
							<a
							href="/ani/aniM/aniregister.action"
							class="btn btn-warning pull-right" id="back-to-bootsnipp">동물
							등록</a>
					</h1>

					<hr>

					<div class="row">
						<div class="panel panel-primary filterable">
							<div class="panel-heading">
								<div>
									<h3 class="panel-title">List
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
										<!-- <th class="col-md-1" style="vertical-align: middle; text-align: center;">입양 상태</th>  -->
										<th class="col-md-1" style="vertical-align: middle; text-align: right;"><em
											class="fa fa-cog"></em></th>
									</tr>
								</thead>
								<tbody id="anilistbody">
								
								</tbody>
							</table>
						</div>
					</div>

					<div class="text-center">
						<ul id="pagination-demo" class="pagination pull-right"></ul>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal" id="aniDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<jsp:include page="./ani_detail_modal.jsp" />
				</div>
				<!-- fim Modal-->
			</div>
			<!-- fim Panel-->



		</div>

	</div>
</body>
</html>