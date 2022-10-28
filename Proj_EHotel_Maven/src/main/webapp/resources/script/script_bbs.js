
$(function(){
	
	/* 리스트 페이지 글쓰기 버튼 시작 */
	$("#loginAlertBtn").click(function(){		
		
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});	
	/* 리스트 페이지 글쓰기 버튼 끝 */

	/* 문의글 작성 유효성 검사 시작  */
	$("#regBtn").click(function(){		
		let txtType = $("#txtType").val();
		let name = $("#name").val();
		let subject = $("#subject").val();
		let content = $("#content").val().trim();
	
		if(txtType=="선택"){
			alert("문의유형을 선택해주세요.");
		}else if(name==""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
		} else if(subject==""){
			alert("제목을 입력해주세요.");
			$("#subject").focus();
		} else if(content==""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
		} else{
			$("#regBtn").attr("type","submit");
		}
	});
 	/* 문의글 작성 유효성 검사 끝  */

	/* 문의글 상세보기 시작  */
	$("#delBtn").click(function(){
		alert("문의글이 삭제되었습니다.");
	});
	
	$("#updateBtn").click(function(){
		let txtType = $("#txtType").val();
		let name = $("#name").val();
		let subject = $("#subject").val();
		let content = $("#content").val().trim();
	
		if(txtType=="선택"){
			alert("문의유형을 선택해주세요.");
		}else if(name==""){
			alert("이름을 입력해주세요.");
			$("#name").focus();
		} else if(subject==""){
			alert("제목을 입력해주세요.");
			$("#subject").focus();
		} else if(content==""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
		} else{
			alert("문의글이 수정되었습니다.");
			location.href="/list";
		}
	});
	/* 문의글 상세보기 끝  */
	
	/* FAQ 시작 */
	$(".menu>img").click(function(){
		let submenu = $(this).next("ul");
		
		/*submenu.toggleClass("hide");*/
		 
		if( submenu.is(":visible") ){
			submenu.slideUp();
		}else{
			submenu.slideDown();           
		} 
		
		$(this).attr("src",function(index, attr){
			if(attr.match('up')){
				return attr.replace("up","down");
			} else{
				return attr.replace("down","up");
			}
		});
	/* FAQ 끝 */
		
});

});






