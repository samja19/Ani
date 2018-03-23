
/*--------loader script-----------*/
$(function(){
    //var loading = $('#loadbar').show();
/*    $(document)
    .ajaxStart(function () {
        loading.show();
    }).ajaxStop(function () {
    	loading.hide();
    });*/ 
	//setInterval
	var q = new Array();
	var qanswer = new Array();
	$('#quiz').css('display','none');
	
	function getQuizProcess(data, status, xhr){
		 for(var i=0;i<data.length;i++){
			 q[i] = {'Q': data[i].questionContent};
			 q[i].C = new Array();
			 for(var j=0;j<data[i].stqdetail.length;j++){
				 q[i].C[j]=data[i].stqdetail[j];
			 }
		 } 

		 setQuestion();
		 $('#quiz').css('display','block');
	};
	
	function quizStart(){
		 
		$.ajax({
			url : '/duna/account/surveydata.action' ,
			method : 'POST',
			dataType : 'json',
			success : getQuizProcess , 
			error : function(xhr,status,error){alert("에러발생");}
		});
	};
	
	quizStart();
	
	
    var questionNo = 0;
     
    
    
    
    
    $(submitServey).on('click',function(event){
    	alert("aaa");
    });
    
    function setQuestion(){
   	 $('#qid').html(questionNo+1);
        $('input:radio').prop('checked', false);
        setTimeout(function(){
            $('#quiz').show();
            $('#loadbar').fadeOut();
        }, 500);
        $('#question').html(q[questionNo].Q);
        var qd = $('#question_detail');
        qd.children().css('display','none');
        
        
        for(var i=0;i<q[questionNo].C.length;i++){
        	 
        	$($('#qoption'+i).parent().find('label')).html(q[questionNo].C[i].content);
        	$('#qoption'+i).parent().css('display','block');
        }
        
        
        /*$($('#f-option').parent().find('label')).html(q[questionNo].C[0].content);
        $($('#s-option').parent().find('label')).html(q[questionNo].C[1].content);
        $($('#t-option').parent().find('label')).html(q[questionNo].C[2].content);*/
        questionNo++;
    }
    
 
    $('.container').on('click',"label.element-animation",function (e) {
    //ripple start
        var parent, ink, d, x, y;    	
         parent = $(this);
        if(parent.find(".ink").length == 0)
            parent.prepend("<span class='ink'></span>");
            
        ink = parent.find(".ink");
        ink.removeClass("animate");
        
        if(!ink.height() && !ink.width())
        {
            d = Math.max(parent.outerWidth(), parent.outerHeight());
            ink.css({height: "100px", width: "100px"});
        }
        
         x = e.pageX - parent.offset().left - ink.width()/2;
        y = e.pageY - parent.offset().top - ink.height()/2;
        
        ink.css({top: y+'px', left: x+'px'}).addClass("animate");
    //ripple end
        
        
        var choice = $(this).parent().find('input:radio').val();
        if(questionNo<=q.length){
        	q[questionNo-1].UC = choice;
        	qanswer[questionNo-1]=q[questionNo-1].C[choice-1].stqNo;
        	$('#useranswer').val(qanswer);
        	 
        } 
        
        var term = 300;
        
        setTimeout(function(){
            $('#loadbar').show();
            $('#quiz').fadeOut();
            
            if((questionNo + 1) > q.length){
                $('label.element-animation').unbind('click');
                setTimeout(function(){
                    var toAppend = '';
                    $.each(q, function(i, a){
                        toAppend += '<tr>'
                        toAppend += '<td>'+a.Q+'</td>';
                        toAppend += '<td>'+a.C[a.UC-1].content+'</td>';
                        toAppend += '</tr>'
                    });
                    $('#quizResult').html(toAppend);
                    $('#totalCorrect').html(" 설문 결과 " );
                    $('#quizResult').show();
                    $('#loadbar').fadeOut();
                    $('#result-of-question').show();
                    $('#graph-result').show();
                }, term);
            } else {
            	setQuestion();
               
            }
        }, term);
    });
    
    
     

 
    
});	
