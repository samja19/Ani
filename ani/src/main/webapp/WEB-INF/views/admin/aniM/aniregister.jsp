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
</head>


<body>

	<jsp:include page="../include/template.jsp" />
		<div class="col col-md-9">
			<div class="panel">
				<div class="panel-body">
					<legend>신규 동물 등록</legend>
				</div>
				
				<form:form id="regform" modelAttribute="ani"
	       			 class="form-horizontal" role="form" method="post" action="aniregister.action" enctype="multipart/form-data">
	       			 
	            <div class="form-group" id="divSpecies">
	                <label for="inputSpecies" class="col-lg-2 control-label"> 동물 분류 </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="1" />
	                          	  개
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="2" />
	                          	 고양이
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="3" />
	                          	 설치류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="4" />
	                          	 조류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="5" />
	                          	 파충류
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="speciesNo" path="speciesNo" value="0"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
	            <div class="form-group" id="divBreeds">
	                <label for="inputBreeds" class="col-lg-2 control-label">품종</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="aniBreed" path="aniBreed"
                        data-rule-required="true" placeholder="품종을 입력하세요" maxlength="30"/>
	                </div>
	            </div>
	  			
	            <div class="form-group" id="divName">
	                <label for="inputName" class="col-lg-2 control-label">이름</label>
	                <div class="col-lg-10">
                        <form:input class="form-control" id="aniName" path="aniName"
                        data-rule-required="true" placeholder="이름을 입력하세요" maxlength="30"/>
	                </div>
	            </div>
	            
	            <div class="form-group" id="divBirth">
	                <label for="inputBirth" class="col-lg-2 control-label">생년월일</label>
	                <div class="col-lg-10">
                        <form:input type="date" class="form-control" id="aniBirth" path="aniBirth"
                        data-rule-required="true" min="1980-01-01" max="9999-12-31" placeholder="-날짜를 입력하세요" />
	                </div>
	            </div>
	            
	            <div class="form-group" id="divGender">
	                <label for="inputGender" class="col-lg-2 control-label"> 성별 </label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="F"/>
	                          	  암컷
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="M" />
	                          	 수컷
	                        </label>
	                        &nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="aniGender" path="aniGender" value="-"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
	            <div class="form-group" id="divNeuter">
	                <label for="inputNeuter" class="col-lg-2 control-label"> 중성화 여부</label>
	                <div class="col-lg-10">
                         <div class="radio">
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="O"/>
	                          	  O
	                        </label>
	                        &nbsp;&nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="X" />
	                          	 X
	                        </label>
	                        &nbsp;&nbsp;&nbsp;
	                        <label>
	                            <form:radiobutton id="neuter" path="neuter" value="-"  checked="checked" />
	                          	 기타
	                        </label>
	                    </div> 
	                </div>
	            </div>	
	            
	  			<div class="form-group">
	    			<label for="File" class="col-lg-2 control-label">동물 사진</label>
	    			<div class="col-lg-10">
	    				<table id="fileview">
	    					<tr><td><input id="addFile" type="button" value="파일 추가" /></td><td></td><td></td></tr>
					    </table>
	    			</div>
	  			</div>
	            
				<div class="form-group" id="divSite">
	                <label for="inputSite" class="col-lg-2 control-label"> 발견 장소  </label>
	                <div class="col-lg-10">
                        <form:input class="form-control col-lg-5" id="aniSite" path="aniSite"
                        data-rule-required="true"  maxlength="40"/>
	                </div>
	            </div>

	            <div class="form-group" id="divAniInfo">
	                <label for="aniInfo" class="col-lg-2 control-label">상세정보</label>
	                <div class="col-lg-10" id="aniInfoDiv">
	                    <form:textarea class="form-control" id="aniInfo" path="aniInfo"
	                    maxlength ="1000" rows="20" style="resize:none"></form:textarea> 
	                </div>
	            </div>	            
				
         
	            <div class="form-group">
	                <div class="col-lg-offset-2 col-lg-10">
	                    <button type="submit" class="btn btn-default">등록</button>
	                </div>
	            </div>
	        </form:form>
	        
	        
	        <!-- 모달창 -->
	        <div class="modal fade" id="defaultModal">
	            <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                        <h4 class="modal-title">알림</h4>
	                    </div>
	                    <div class="modal-body">
	                        <p class="modal-contents"></p>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	                    </div>
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	        </div><!-- /.modal -->
	        <!--// 모달창 -->
	        
        </div><!-- 본문 --> 
        
        <script>
         
        	$(document).ready(function(){
        		
        	    //add more file components if Add is clicked
        	    $('#addFile').click(function() {
        	        var trno = $('#fileview tr').children().length;   
        	        $('#fileview').append(
        	                '<tr id="trIndex'+trno+'">'+
        	                '   <td><input type="file" id="File" name="aniAttach"></td>'+
        	                '   <td><a id="delFile'+trno+'" data-trno="'+trno+'">취소</a></td>'+
        	                '</tr>'
        	        );
        	    });  
        	    
        	    //delete file
        	    $('table#fileview').on('click', 'a[id^=delFile]', function(event) {
        	    	var trno = $(this).attr('data-trno');
        	    	$("#fileview tr[id=trIndex" + trno + "]").remove();
        	    });   
        		
                //모달을 전역변수로 선언
                var modalContents = $(".modal-contents");
                var modal = $("#defaultModal");
                $('#id').focus(); 
                
                
                
                //------- validation 검사
                
                
                $( "#regform" ).submit(function( event ) {
                	var divBreeds = $('#divBreeds');
                    var divName = $('#divName');
                    var divBirth = $('#divBirth');
                    var divSite = $('#divSite');
                    var divAniInfo = $('#divAniInfo');
                    
                    //품종
                    if($('#aniBreed').val()==""){
                        modalContents.text("품종을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divBreeds.removeClass("has-success");
                        divBreeds.addClass("has-error");
                        $('#aniBreed').focus();
                        return false;
                    }else{
                    	divBreeds.removeClass("has-error");
                    	divBreeds.addClass("has-success");
                    }
                    
                    
                    //이름
                    if($('#aniName').val()==""){
                        modalContents.text("이름을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divName.removeClass("has-success");
                        divName.addClass("has-error");
                        $('#aniName').focus();
                        return false;
                    }else{
                        divName.removeClass("has-error");
                        divName.addClass("has-success");
                    }
                    
                    
                    //생년월일
                    if($('#aniBirth').val()==""){
                        modalContents.text("생년월일을 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divBirth.removeClass("has-success");
                        divBirth.addClass("has-error");
                        $('#aniBirth').focus();
                        return false;
                    }else{
                    	divBirth.removeClass("has-error");
                    	divBirth.addClass("has-success");
                    }
                    
                
                    
                    // 주소
                    if($('#aniSite').val()==""){
                        modalContents.text("발견장소를 입력하여 주시기 바랍니다.");
                        modal.modal('show');
                         
                        divSite.removeClass("has-success");
                        divSite.addClass("has-error");
                        $('#aniSite').focus();
                        return false;
                    }else{
                        divSite.removeClass("has-error");
                        divSite.addClass("has-success");
                    }
                    
                 // 상세정보
                    if($('#aniInfo').val()==""){
                        modalContents.text("상세정보를 입력하여 주시기 바랍니다..");
                        modal.modal('show');
                         
                        divAniInfo.removeClass("has-success");
                        divAniInfo.addClass("has-error");
                        $('#aniInfo').focus();
                        return false;
                    }else{
                    	divAniInfo.removeClass("has-error");
                    	divAniInfo.addClass("has-success");
                    }
                    
                   
                     
                });
                
                
                
            });
             
        </script>
	</div>


</body>
</html>