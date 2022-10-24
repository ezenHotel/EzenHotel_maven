$(document).ready(function(){
	
	$("button#loginBtn").click(function(){
		let idVal = $("input[name=uid]").val();
		let pwVal = $("input[name=upw]").val();
		
		if(idVal == ""){
			alert("아이디를 입력해주세요");
		} else if(pwVal == ""){
			alert("비밀번호를 입력해주세요");
		} else {
			$("form#loginFrm").attr("action", "/loginProc")
							  .submit();
		}
		
	});
	
})