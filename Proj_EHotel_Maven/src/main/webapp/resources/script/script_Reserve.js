/**
 * 
 */

/* 페이지 로딩 시 reserve.jsp 페이지라면 호텔 선택 활성화하기 */
function pageLoading(){
	let url = $(location).attr('href'); 
	if(url.includes("resvHome")){
		let clsName = url.split("?hCode=").reverse()[0];
		clsName = clsName.split("&")[0];
		
		let liHotel = document.getElementById(clsName);
		let liChild = liHotel.firstChild;
		
		liHotel.style.backgroundColor="#896825";
		liChild.style.color = "#ffffff";
		
	} else if(url.includes("reserveConfirm.jsp")){
		let clsName = url.split("?hCode=").reverse()[0];
		clsName = clsName.split("&")[0];
		
		let liHotel = document.getElementById(clsName);
		let liChild = liHotel.firstChild;
		
		liHotel.style.backgroundColor="#896825";
		liChild.style.color = "#ffffff";
		
	}
}

/* 페이지 로딩 시 reserveInsert.jsp 페이지라면 호텔 선택 활성화하기 */
function pageLoadChkHotel(){
	let url = $(location).attr('href'); 
	if(url.includes("reserveInsert.jsp")){
		let chkHotel = url.split("?hCode=").reverse()[0];
		chkHotel = chkHotel.split("&")[0];
		
		console.log(chkHotel);
		document.getElementById("hCodeNum").value=chkHotel;
		
		// 선택한 호텔이 예약 상세보기의 호텔 드롭박스에서도 선택되도록
		let sel = document.getElementById("hotelName");
		let selLength = sel.options.length;
		
		for(let i=0; i<selLength; i++){
			if(sel.options[i].value == chkHotel){
				sel.options[i].selected = "true";
			}
		}
		
		if(chkHotel.substring(0,1) == "H"){
			document.getElementById("HorR").innerText = "호텔 - ";
		}else if(chkHotel.substring(0,1) == "L"){
			document.getElementById("HorR").innerText = "리조트 - ";
		}
		
		// 선택한 객실로 예약 상세보기의 객실이 체크박스로 선택되도록
		let chk = document.getElementsByClassName("chkRCode");
		let chkLength = chk.length;
		console.log(chkLength);
		
		let rCode = document.getElementById("selectedRCode").value;
		let chkVal = "";
		for(let i=0; i<chkLength; i++){
			chkVal = chk[i].value;
			//console.log(chkVal);
			if(rCode == chkVal){
				console.log(rCode +" / "+ chkVal)
				chk[i].checked = true;
			}
		}
		
	}
}

$(function(){

	/* reserve.jsp - 달력에서 '예약하기' 버튼 클릭 시 예약 페이지로 이동 */
	$("button.resvBtn").click(function(){
		let loginID = $("#loginID").val();
		console.log(loginID);
		let rCode = $(this).val();
		let resvDate = $(this).next().val();
		let hCode = $(this).next().next().val();
		
		if(loginID != "" && loginID != "null"){
			$("form#calendarFrm").attr("action", "/reserve/reserveInsert.jsp?hCode="+hCode+"&rCode="+rCode+"&resvDate="+resvDate).submit();			
		}else{
			alert("로그인 후 이용해주세요.");
			location.href="/login/login.jsp";
		}
	});
	
	// reserveInsert.jsp - 드롭박스의 호텔 변경 시마다 객실 정보 변경 함수 
	$("select#hotelName").change(function(){
		let hCode = $(this).val();
		console.log(hCode);
		let hType = hCode.substring(0,1);
		console.log(hType);
		// 호텔 변경 시에 리조트인지 호텔인지 구분
		if(hType == "H"){
			$("span#HorR").text("호텔 - ");
		}else if(hType == "L"){
			$("span#HorR").text("리조트 - ");
		}
		$("input#hCodeNum").val(hCode);
		//console.log("/reserve/reserveRoomInfoProc.jsp?hCode="+hCode);
	
		// 호텔 변경 시마다 변경한 호텔 코드를 다시 가져와 해당 호텔로 페이지 리로드
		let url = $(location).attr('href');
		console.log("url : " + url);
		
		// 현재 페이지 url을 가져와 hCode 앞부분은 url 변수에 재 선언 후 
		// 변경한 호텔 코드를 넣고
		// 이후 url 파라미터를 그 뒤에 붙여줌
		// 그 후 페이지 재로드
		let chkHCode = url.split("?hCode=").reverse()[0];
		chkHCode = chkHCode.split("&");
		// console.log("url 파라미터 값 배열 [] : "+chkHCode);
		
		let chUrl = url.split("?hCode=")[0];
		chUrl += "?hCode="+hCode;
		// 첫번째 값은 이전 호텔 코드이기 때문에 chkHCode[0] 값은 뺴고 for문 돌려 url에 파라미터 넣어주기
		for(let i=1; i<chkHCode.length; i++){
			//console.log("chkHCode[i] : "+ chkHCode[i]);
			chUrl += "&" + chkHCode[i];
		}
		console.log("변경한 호텔 URL : " + chUrl);
		window.location.replace(chUrl);
		//$("form#changeRoomInfo").attr("action", "/reserve/reserveRoomInfoProc.jsp").submit();
		
	});
	
	// reserveInsert.jsp - 객실 선택 한가지만 가능하도록(체크박스 다중 선택 불가)
	$("input.chkRCode").click(function(){
		if($(this).prop("checked")){
			$("input.chkRCode").prop("checked", false);
			$(this).prop("checked", true);
		}
	});
	
	// reserveInsert.jsp - '예약하기' 버튼 submit 실행 및 유효성 검사 진행
	$("button#resvConfirmBtn").click(function(){
		let phone2 = $("#phone2").val();
		let phone3 = $("#phone3").val();
		
		let chkLength = $(".chkRCode").length;
		let chkCnt = 0;
		for(let i=0; i<chkLength; i++){
			if($(".chkRCode").eq(i).prop("checked")){
				chkCnt++; 
				console.log(chkCnt);
			}
		}
		
		if(chkCnt == 0 ){
			alert("객실을 선택해주세요. ");
		}else if(phone2=="" || phone3==""){
			alert("핸드폰 번호를 입력해주세요. ");
		} else {
			$("form#changeRoomInfo").attr("action", "/reserve/reserveInsertProc.jsp").submit();
		}
	});
	
	
	//reserveInsert.jsp - input 핸드폰 번호 숫자만 입력
    $(".phone").on("keyup", function(event) {
        if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {
            
        }else{
            alert('숫자만 입력해주세요.');
            $(this).val($(this).val().replace(/[^0-9]/g,""));
        }
    });



	/*모달 슬라이드쇼*/
	// 현재 두번째 버튼 클릭 시부터 슬라이드가 되지 않음
	setInterval(fnSlide_fade, 1000);
	
	function fnSlide_fade(){
		$("#imgArea>a:nth-child(1)").fadeOut(1000, function(){
			$(this).insertAfter("#imgArea>a:nth-child(3)");
		});
		$("#imgArea>a:nth-child(2)").fadeIn(1000);
		
	}

	/* 모달레이어 팝업 시 */
	$("div.roomTypeList button.imgViewBtn, div.resvImgArea img").click(function(){
		console.log("모달");
		$("img.imgForRoom").remove();
		
		$("div#modalBG").show();
		let btnVal = $(this).nextAll("input.roomImg").attr("value");
		let roomName = $(this).nextAll("input.roomImgName").attr("value");
		console.log("객실정보 : "+roomName);
		console.log("객실코드 : " + btnVal);
		
		let imgAttr="";
		// 이미지 3장씩만 저장되어있음.....
		for(let i=1; i<=3; i++){
			imgAttr = "/images/hotelListImg/" + btnVal + "-0" + i + ".jpg";
			console.log(imgAttr);
			$("div#imgArea").append("<a href='#'><img class='imgForRoom' src='"+imgAttr+"' alt='test' /></a>");
		}
		
		$("div#modalLayerImg").find("h3#artSubject").text("객실 정보 : "+roomName);
	});
	
	$("span#modalCloseBtn").click(function(){
		$("div#modalBG").hide();
	});
	
	
	/* reserveConfirm.jsp 페이지 예약 보기 버튼 url 변경 */
	$("div#nowTermBtn").click(function(){
		let chUrl = "/reserve/reserveConfirm.jsp?chkBtn=now";
		window.location.replace(chUrl);
	});
	
	$("div#pastTermBtn").click(function(){
		let chUrl = "/reserve/reserveConfirm.jsp?chkBtn=past";
		window.location.replace(chUrl);
	});
	
	// reserveDelProc.jsp로 이동
	$("button.resvDelBtn").click(function(){
		let uid = $("input#uid").val();
		let rCode = $(this).val();
		let resvCode = $(this).prev().val();
		console.log(resvCode);
		
		let chkTF = confirm("예약을 취소하시겠습니까?");
		
		if(chkTF){
			location.href= "/reserve/reserveDelProc.jsp?uid="+uid+"&rCode="+rCode+"&resvCode="+resvCode;
		}
		
	});
	
	
	
	
});

/* reserveConfirm.jsp 페이지 예약 보기 버튼 표시 */
function onloadBtnChk(){
	let url = $(location).attr('href'); 
	
	if(url.includes("chkBtn")){
		let chkBtn = url.split("chkBtn=").reverse()[0];
	
		let chkBtnVal = chkBtn;
		
		if(chkBtn.includes("&")){
			chkBtnVal = chkBtn.split("&")[0];			
		}
	
		console.log("url 체크 : "+chkBtnVal);
		
		let pastOrNow = document.getElementById("pastOrNow");
		
		if(chkBtnVal == "past"){
			let pastTermBtn = document.getElementById("pastTermBtn");
			let nowTermBtn = document.getElementById("nowTermBtn");
		
			nowTermBtn.style.backgroundColor="#fff";
			nowTermBtn.style.color = "#9e7d3a";
			pastTermBtn.style.backgroundColor="#ca7a49";
			pastTermBtn.style.color = "#ffffff";
			
			pastOrNow.value = "past";
		}else {
			let nowTermBtn = document.getElementById("nowTermBtn");
			let pastTermBtn = document.getElementById("pastTermBtn");
		
			pastTermBtn.style.backgroundColor="#fff";
			pastTermBtn.style.color = "#9e7d3a";
			nowTermBtn.style.backgroundColor="#ca7a49";
			nowTermBtn.style.color = "#ffffff";
			
			pastOrNow.value = "now";
		}

	}
}










		/*let todayDate = new Date();
		
		let month = todayDate.getMonth()+1;
		
		if(month < 10){
			month = "0"+month;
		}
		let day = todayDate.getFullYear() + "-" + month + "-" + todayDate.getDate();*/