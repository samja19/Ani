/**
 * 
 */

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
		    			data : { pageno :  page, pagecount : pageCount},
		    			method : "POST", 
		    			dataType : "json",
		    			success : successmessage,
		    			error :	(xhr,status,error)=>{alert("오류발생 : "+error);}
		    		});
		        }
		};
		
		function successmessage() {
			System.out.println("success");
		}
		
		$pagination.twbsPagination('destroy');
		$pagination.twbsPagination(defaultOpts);
	});	