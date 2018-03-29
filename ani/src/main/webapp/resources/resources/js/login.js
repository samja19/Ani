$(function(){
	$('#btnLogin').on('click',function(event){
		 
		var loginid = $('#loginid').val().trim(' ');
		var loginpassword = $('#loginpassword').val().trim(' ');
		var loginstat=false;
		if(loginstat==true){
			alert("확인 중....")
			return;	
		}
		
		function loginProcess(data, status, xhr){
			if(data=='fail')
				alert("로그인 실패");
			else if(data=='survey'){
				var yes = confirm("설문조사를 하시겠습니까?");
				if(yes)
					location.href="/duna/account/survey.action";
				else
					location.reload();
					
			}
			else if(data=='success'){
				location.reload();
			}
			else{
				alert("다시 시도 해 주세요");
			}
				
		};
		
		loginstat=true;
		$.ajax({
			url : '/duna/account/login.action',
			data : { loginid : loginid, loginpassword : loginpassword },
			method : "POST", 
			success : loginProcess,
			error :	(xhr,status,error)=>{alert("오류발생 : "+error);}
			
		});
	});
	
});