
$(function(){
	
	/* 상단 메뉴 고정 시작 */
	
	/* 상단 메뉴 고정 끝 */
	
	/* 공지사항 시작 
	$("#tabBtn>button").click(function(){
		
		$("#tabBtn>button").css({
	            "border": "1px solid #eceae1",
	            "background-color": "#faf9f4"
	        });

	        $(this).css({
	            "background": "#fff",
	            "border-bottom": "1px solid #fff"
	        });
	
	      let dataLink = $(this).attr("data-link");
        alert("dataLink ID 속성 값 : " + ("#" + dataLink));
        // 탭 버튼 처리 끝

        // 탭 콘텐츠 처리 시작
        $("div.multiTB").css({
            "display": "none"
        });
        $("#" + dataLink).css({
            "display": "inline-block"
        });
	});
	*/

	
	$(".menu>img").click(function(){
		
		let submenu = $(this).next("ul");
		
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
});
		
		
	
	/* 공지사항 끝 */
	
	/* 고객센터 유효성 검사 시작  */	
	$("#regBtn").click(function(){
	let uName = $("#uName").val().trim();
	$("#uName").val(uName);
	
	let subject = $("#subject").val().trim();
	$("#subject").val(subject);
	
	let content = $("#content").val().trim();
	$("#content").val(content);
	
	if(uName==""){
		alert("이름을 입력해주세요.");
			$("#uName").focus();
			return false;
	} else if(subject==""){
		alert("제목을 입력해주세요.");
			$("#subject").focus();
			return false;
	} else if(content==""){
		alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
	} 

	});
	/* 고객센터 유효성 검사   */
	
	/* 슬라이드 쇼 시작 */
	setInterval(fnSlide_Fade, 6000);
	
	 function fnSlide_Fade() {
		$("#slideFrame>a:nth-child(1)").fadeOut(
				3000,
				function(){
					$(this).insertAfter("#slideFrame>a:nth-child(3)");
					
				}
			);
		$("#slideFrame>a:nth-child(2)").fadeIn(3000);
	} 
	
	/* 슬라이드 쇼 끝 */
	
	/* 상세보기 시작 */
	$(".readNum").click(function(){
		let num = $(this).attr('value');
		let param = "read.jsp?num="+num;
		
		location.href=param;
		
	});
	
	/* 상세보기 끝 */
	
	/* 삭제 시작 */
	$("#delBtn").click(function(){
		let num = $(this).attr('value');
		let param = "deleteProc.jsp?num="+num;
		
		
		location.href=param;
		
	});
	
	/* 삭제 끝 */
	
	/* 수정 시작 */
	$(".corBtn").click(function(){
		let num = $(this).attr('value');
		let param = "modifyProc.jsp?num="+num;
		
		location.href=param;
		
	});
	
	
	/* 수정 끝 */
	
	
	
	/* ===== 호텔 예약 관련 스크립트 ====== */	
	$("select#hotelName").change(function(){
		let selHotelCodeVal = $(this).val();
		$("input#hCode").val(selHotelCodeVal);
	});
	
	// '예약' 버튼 submit 실행 / 유효성 검사 진행
	$("button#mainReserveBtn").click(function(){
		let selHotelCodeVal = $("input#hCode").val();
		if(selHotelCodeVal == "" || selHotelCodeVal == null){
			alert("호텔 또는 리조트를 선택해주세요.");
		}else{
			$("form#mainReserve").attr("action", "/reserve/reserve.jsp").submit();
		}
	});
	
	$("input#resev_start").change(function(){
		let resev_start = $(this).val();
		
		let year = resev_start.split("-")[0];
		let month = resev_start.split("-")[1];
		let day = resev_start.split("-")[2];
		
		let now = new Date(year, month-1, day);
		console.log('현재 : ' + now + ' / ');
		
		var tomorrow = new Date(now.setDate(now.getDate() + 1));	// 내일
		console.log("내일 : ", tomorrow);
		let toY = tomorrow.getFullYear();
		let toM = tomorrow.getMonth()+1;
		toM = toM >= 10 ? toM : '0'+toM;
		let toD = tomorrow.getDate();
		toD = toD >= 10 ? toD : '0'+toD;
		
		let resev_end = toY + "-" + toM + "-" +toD;
		
		$("input#resev_end").val(resev_end);
		$("input#resev_mm").val(toM-1);
	});
	
});




