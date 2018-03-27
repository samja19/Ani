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
	<script src="/ani/resources/bootstrap/jquery.twbsPagination.js"></script>
	
	<script>
	$(document).ready(function(){
		$('[data-submenu]').submenupicker();
		
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
		
		
		
		function listProcess(data, status, xhr){
			if(data!=null){
				
				//members=data.members;
				members=data;
				var newTotalPage = parseInt(members.length/5)+(members.length%5 > 0 ? 1 : 0);
				if(totalPage )
				
				
				$('#listbody').children().remove();
				for(var i =0 ; i<members.length;i++){
					var atr = $('<tr></tr>');
					
					var td_aniname = $('<td></td>');
					var td_anibreed = $('<td></td>');
					var td_anigender = $('<td></td>');
					var td_neuter = $('<td></td>');
					var td_detail = $('<td></td>');
					
					td_aniname.text(members[i].id); 
					
					//td_check_glyphicon = $('<span class="glyphicon glyphicon-check" style="width:10px;height:10px;">a</span>');
					
					td_check_glyphicon = $('<a href="membersurveys.action?id='+members[i].id+'"><span class="glyphicon glyphicon-check"></span></a>');
					td_detail.append(td_check_glyphicon);
					
					
					
					mtr.append(td_aniname);
					mtr.append(td_anibreed);
					mtr.append(td_anigender);
					mtr.append(td_neuter);
					mtr.append(td_detail);
					 
					$('#listbody').append(atr);
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
		
	    <!-- 본문 들어가는 부분 -->
		<div class="container">
		    <h3>입양 목록 조회</h3>
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
		                        <th class="col-md-2"><input type="text" class="form-control" placeholder="AniBreed" disabled></th>
		                        <th class="col-md-2"><input type="text" class="form-control" placeholder="AniGender" disabled></th>
		                        <th class="col-md-6"><input type="text" class="form-control" placeholder="Neuter" disabled></th>
		                        <th class="col-md-1"><input type="text" class="form-control" placeholder="Detail" disabled></th>
		                    </tr>
		                </thead>
		                <tbody id="listbody">
		                	 
		                     
		                     
		                </tbody>
		            </table>
		        </div>
		    </div>
		    <div class="text-center">
				<ul id="pagination-demo" class="pagination" ></ul>
			</div>
		</div>
		
	    <!--// 본문 들어가는 부분 -->
	    
	          
	    <!-- footer --> 
        
    </body>
</html>