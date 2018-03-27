<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>입양리스트</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
	<link rel="stylesheet" href="/ani/resources/bootstrap/bootstrap-submenu.min.css">
	
	<style type="text/css" >
		@import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css");
	</style>
	
	<script src="/ani/resources/bootstrap/bootstrap-submenu.min.js" defer></script>
	
	<script src="/ani/resources/js/jquery-validation/jquery.validate.js"></script>
	<script src="/ani/resources/js/jquery-validation/additional-methods.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.0/js/materialize.min.js'></script>
	<script src='https://ajax.googleapis.com/ajax/libs/angularjs/1.4.5/angular.min.js'></script>
	<script src="/ani/resources/bootstrap/jquery.twbsPagination.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	$(document).ready(function(){
		$('[data-submenu]').submenupicker();
        var modalContents = $(".modal-contents");
        var modal = $("#defaultModal");
		var members; 
		var pageCount = 5;
		var memberCount = parseInt("${aniCount}");
		var totalPage = parseInt(memberCount/pageCount)+(memberCount%pageCount > 0 ? 1 : 0);
		
		var $pagination = $('#pagination-demo');
		
		var visiblePages = (totalPage < 5 ? totalPage : 5);
		
		//alert(totalPage+"/"+visiblePages);
		var defaultOpts = {
				startPage : 1,
				visiblePages : visiblePages,
			    totalPages : totalPage,
			    onPageClick : function (evt, page) {
		            $('#content').text('Page ' + page);
		            $.ajax({
		    			url : '/ani/adoption/list.action',
		    			data : { pageno :  page, pagecount : pageCount},
		    			method : "POST", 
		    			dataType : "json",
		    			success : listProcess,
		    			error :	(xhr,status,error)=>{alert("오류발생 : "+error);}
		    			
		    		});
		        }
		};
		
		
		$pagination.twbsPagination('destroy');
		$pagination.twbsPagination(defaultOpts);
		
		function showModal(event){
			var anino = $(this).attr("data-anino");
			$('#anino').val(anino);
			modal.modal('show');
		}
		
		
		function listProcess(data, status, xhr){
			if(data!=null){
				
				//members=data.members;
				anis=data;
				var newTotalPage = parseInt(anis.length/5)+(anis.length%5 > 0 ? 1 : 0);
				if(totalPage )
				
				
				$('#listbody').children().remove();
				for(var i =0 ; i<anis.length;i++){
					var atr = $('<tr></tr>');
					
					var td_aniname = $('<td></td>');
					var td_anispecies = $('<td></td>');
					var td_anibreed = $('<td></td>');
					var td_anigender = $('<td></td>');
					var td_anibirth = $('<td></td>');
					var td_neuter = $('<td></td>');
					var td_detail = $('<td></td>');
					
					td_aniname.text(anis[i].aniName);
					td_anispecies.text(anis[i].speciesName);
					td_anibreed.text(anis[i].aniBreed);					 
					td_anigender.text(anis[i].aniGender);
					td_neuter.text(anis[i].neuter); 
					birth = new Date(anis[i].aniBirth);
					td_anibirth.text(birth.getFullYear()+"-"+(birth.getMonth()+1)+"-"+birth.getDate()+" "+
							birth.getHours()+":"+birth.getMinutes()); 
					//td_check_glyphicon = $('<span class="glyphicon glyphicon-check" style="width:10px;height:10px;">a</span>');
					
					//td_check_glyphicon = $('<a href="main.action?anino='+anis[i].aniNo+'"><span class="glyphicon glyphicon-check"></span></a>');
					td_check_glyphicon = $('<span class="glyphicon glyphicon-check" >'+anis[i].aniNo+'</span>');
					
					
					td_detail.append(td_check_glyphicon);
					
					
					
					atr.append(td_aniname);
					atr.append(td_anispecies);
					atr.append(td_anibreed);
					atr.append(td_anigender);
					atr.append(td_anibirth);
					atr.append(td_neuter);
					atr.append(td_detail);
					 
					$('#listbody').append(atr);
					td_detail.attr('data-anino', anis[i].aniNo)
					td_detail.click(showModal);

					
				}
				 
				
			}
			
		};
		
		
		 
		
		
	/* 	$('#pagination-demo').twbsPagination({
    		totalPages: 5,
    		visiblePages: 5,
   			onPageClick: function (event, page) {
        		$('#page-content').text('Page 1' + page);
        		
    		} 
		}); */
		
		
		 
		
		
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
    
    	<!-- header -->
     	
      

     	
    	<br><br><br><br> 
    	
    	
    	<%-- <jsp:include page="../adoption/adoption_main2.jsp"/> --%>


<!-- 모달창 -->
<div class="modal fade" id="defaultModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">알림</h4>
            </div>
            <div class="modal-body">
                <p class="modal-contents"><jsp:include page="../adoption/adoption_main2.jsp"/></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--// 모달창 --> 
    	
    	
	    <!-- 본문 들어가는 부분 -->
		<div class="container">
		    <h3>입양 목록 조회1</h3>
		    <hr>
		    <br>
		    
		    <div class="row">
		        <div class="panel panel-primary filterable">
		            <div class="panel-heading">
		                <h3 class="panel-title">Users</h3>
		                <div class="pull-right">
		                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
		                </div>
		            </div>
		            <table class="table">
		                <thead>
		                    <tr class="filters">
		                        <!-- <th><input type="text" class="form-control" placeholder="num" disabled></th> -->
		                        <th class="col-md-1"><input type="text" class="form-control" placeholder="AniName" disabled></th>
		                        <th class="col-md-2"><input type="text" class="form-control" placeholder="AniSpecies" disabled></th>
		                        <th class="col-md-2"><input type="text" class="form-control" placeholder="AniBreeds" disabled></th>
		                        <th class="col-md-2"><input type="text" class="form-control" placeholder="AniGender" disabled></th>
		                        <th class="col-md-3"><input type="text" class="form-control" placeholder="AniBirth" disabled></th>
		                        <th class="col-md-1"><input type="text" class="form-control" placeholder="Neuter" disabled></th>
		                        <th class="col-md-1"><input type="text" class="form-control" placeholder="Detail" disabled></th>
		                    </tr>
		                </thead>
		                <tbody id="listbody">
		                	 
		                     
		                     
		                </tbody>
		            </table>
		        </div>
		    </div>
		    <div class="text-center">
				<ul id="pagination-demo" ></ul>
			</div>
		</div>
		
	    <!--// 본문 들어가는 부분 -->
	    
	          
	    <!-- footer --> 
        
    </body>
</html>