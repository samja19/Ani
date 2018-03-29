
/*--------loader script-----------*/
$(function(){
    var loading = $('#loadbar').hide();
/*    $(document)
    .ajaxStart(function () {
        loading.show();
    }).ajaxStop(function () {
    	loading.hide();
    });*/
    
    var questionNo = 0;
    var correctCount = 0;
    
    var q = [
        {'Q':'오늘 날씨는 어떤가요?', 'A':2,'C':['맑음','흐림','눈/비']},
        {'Q':'오늘 기분은 어떠신가요?', 'A':2,'C':['좋음','보통','나쁨']},
        {'Q':'오늘 점심은 어떤게 좋으신가요?', 'A':2,'C':['한식','중식','양식']}
        
    ];
    
    
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
        $($('#f-option').parent().find('label')).html(q[questionNo].C[0]);
        $($('#s-option').parent().find('label')).html(q[questionNo].C[1]);
        $($('#t-option').parent().find('label')).html(q[questionNo].C[2]);
        questionNo++;
    }
    
    setQuestion();
 
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
    	//var anscheck =  $(this).checking(questionNo, choice);//$( "#answer" ).html(  );      
        if(questionNo<=q.length){
        	q[questionNo-1].UC = choice;
        	$('#answer'+questionNo).val(q[questionNo-1].C[choice-1]);
        }
        /*if(anscheck){
            correctCount++;
            q[questionNo].result = "Correct";
        } else {
            q[questionNo].result = "Incorrect";        
        }*/
        
        var term = 300;
        
        //console.log((questionNo)+"your choice:" + choice);
        setTimeout(function(){
            $('#loadbar').show();
            $('#quiz').fadeOut();
            
            if((questionNo + 1) > q.length){
                //alert("설문을 완료 했습니다, 결과를 확인 해 주세요");
                $('label.element-animation').unbind('click');
                setTimeout(function(){
                    var toAppend = '';
                    $.each(q, function(i, a){
                        toAppend += '<tr>'
                        toAppend += '<td>'+a.Q+'</td>';
                        //toAppend += '<td>'+a.A+'</td>';
                        toAppend += '<td>'+a.C[a.UC-1]+'</td>';
                        // toAppend += '<td>'+a.result+'</td>';
                        toAppend += '</tr>'
                    });
                    $('#quizResult').html(toAppend);
                    $('#totalCorrect').html(" 설문 결과 " );
                    $('#quizResult').show();
                    $('#loadbar').fadeOut();
                    $('#result-of-question').show();
                    $('#graph-result').show();
                    //chartMake();
                }, term);
            } else {
            	setQuestion();
               
            }
        }, term);
    });
    
    
    
    $.fn.checking = function(qstn, ck) {
        var ans = q[questionNo].A;
        if (ck != ans)
            return false;
        else 
            return true;
    }; 

// chartMake();
/*    function chartMake(){

         var chart = AmCharts.makeChart("chartdiv",
            {
            "type": "serial",
            "theme": "dark",
            "dataProvider": [{
                "name": "Correct",
                "points": correctCount,
                "color": "#00FF00",
                "bullet": "http://i2.wp.com/img2.wikia.nocookie.net/__cb20131006005440/strategy-empires/images/8/8e/Check_mark_green.png?w=250"
            }, {
                "name": "Incorrect",
                "points":q.length-correctCount,
                "color": "red",
                "bullet": "http://4vector.com/i/free-vector-x-wrong-cross-no-clip-art_103115_X_Wrong_Cross_No_clip_art_medium.png"
            }],
            "valueAxes": [{
                "maximum": q.length,
                "minimum": 0,
                "axisAlpha": 0,
                "dashLength": 4,
                "position": "left"
            }],
            "startDuration": 1,
            "graphs": [{
                "balloonText": "<span style='font-size:13px;'>[[category]]: <b>[[value]]</b></span>",
                "bulletOffset": 10,
                "bulletSize": 52,
                "colorField": "color",
                "cornerRadiusTop": 8,
                "customBulletField": "bullet",
                "fillAlphas": 0.8,
                "lineAlpha": 0,
                "type": "column",
                "valueField": "points"
            }],
            "marginTop": 0,
            "marginRight": 0,
            "marginLeft": 0,
            "marginBottom": 0,
            "autoMargins": false,
            "categoryField": "name",
            "categoryAxis": {
                "axisAlpha": 0,
                "gridAlpha": 0,
                "inside": true,
                "tickLength": 0
            }
        });
    }*/
    
    
    
});	
