$(document).ready(function() {

	$("div#memberListWrap #delBtn").click(function() {

		let chkdNums = [];
		$("div#memberListWrap input[name='memberChk']:checked").each(function() {
			chkdNums.push($(this).val());
		});
		let del = confirm("정말 삭제하시겠습니까?");

		if (del) {

			console.log(chkdNums);

			location.href = "/memberDel?chkdNums=" + chkdNums

		}

	});

	$("div#memberListWrap #detailBtn").click(function() {

		let no = $(this).parent().parent().children()[1].innerText;

		location.href = "/memberList/detail?no=" + no;
	});

	// 페이지 로드시 국가 배열을 select 옵션 추가 //////////
	const country = ["가나", "가봉", "가이아나", "감비아", "과테말라", "그레나다", "그리스", "기니비사우", "나미비아", "나우루", "나이지리아", "남아프리카 공화국", "네덜란드", "네팔", "노르웨이", "뉴질랜드", "니제르", "니카라과", "대만", "대한민국", "덴마크", "도미니카", "도미니카 공화국", "독일", "라오스", "라이베리아", "라트비아", "러시아", "레바논", "루마니아", "룩셈부르크", "르완다", "리비아", "리투아니아", "마다가스카르", "마카오", "말라위", "말레이시아", "말리", "멕시코", "모로코", "모리셔스", "모리타니아", "모잠비크", "몬테네그로", "몬트세랫", "몰도바", "몰디브", "몰타", "몽골", "미국", "미얀마", "미크로네시아", "바누아투", "바레인", "바베이도스", "바하마", "버뮤다", "베냉", "베네수엘라", "베트남", "벨기에", "벨라루스", "벨리즈", "보스니아 헤르체고비나", "보츠와나", "볼리비아", "부르키나파소", "부탄", "북마케도니아", "불가리아", "브라질", "브루나이", "사우디 아라비아", "상투메 프린시페", "세네갈", "세르비아", "세이셀", "세인트루시아", "세인트빈센트 그레나딘", "세인트키츠 네비스", "솔로몬 제도", "수리남", "스리랑카", "스웨덴", "스위스", "스페인", "슬로바키아", "슬로베니아", "시에라리온", "싱가포르", "아랍 에미리트 연합국", "아르메니아", "아르헨티나", "아이슬란드", "아일랜드", "아제르바이찬", "아프가니스탄", "알바니아", "알제리", "앙골라", "엔티가 바부다", "앵귈라", "에스와티니", "에스토니아", "에콰도르", "엘살바도르", "영국", "영국령 버진 제도", "예맨", "오만", "오스트리아", "온두라스", "요르단", "우간다", "우루과이", "우즈베키스탄", "우크라이나", "이라크", "이스라엘", "이집트", "이탈리아", "인도", "인도네시아", "일본", "자메이카", "잠비아", "조지아", "중국 본토", "짐바브웨", "차드", "체코", "칠레", "카메룬", "카보베르데", "카자흐스탄", "카타르", "캄보디아", "캐나다", "케냐", "케이맨 제도", "코소보", "코스타리카", "코트디부아르", "콜롬비아", "콩고공화국", "콩고민주공화국", "쿠웨이트", "크로아티아", "키르기스스탄", "키프로스", "타지키스탄", "탄자니아", "태국", "터크스 케이커스 제도", "터키", "통가", "투르크메니스탄", "튀니지", "트리니다드 토바고", "파나마", "파라과이", "파키스탄", "파푸아 뉴기니", "팔라우", "페루", "포르투갈", "폴란드", "프랑스", "피지", "핀란드", "필리핀", "헝가리", "호주", "홍콩"];
	// 국가 배열
	for (let i = 0; i < country.length; i++) { // 현재 연도부터 130년 전까지의 연도를 옵션에 추가함
		let countryOption = "<option value='" + country[i] + "'>" + country[i] + "</option>";
		$("select[name=country]").append(countryOption);
	}
	////////////////////////////////////////////////

	// 페이지 로드시 생년월일 select 옵션 추가 /////////////
	let now = new Date(); // 현재 시간을 가져옴
	let nowYear = now.getFullYear() // 현재 연도를 구하는 메서드 getFullYear()

	for (let i = nowYear - 130; i <= nowYear; i++) { // 현재 연도부터 130년 전까지의 연도를 옵션에 추가함
		let BYoption = "<option value='" + i + "'>" + i + "</option>";
		$("select#birthYear").append(BYoption);
	}
	for (let i = 1; i <= 12; i++) {
		let BMoption = "<option value='" + i + "'>" + i + "</option>";
		$("select#birthMonth").append(BMoption);
	}
	for (let i = 1; i <= 31; i++) {
		let BDoption = "<option value='" + i + "'>" + i + "</option>";
		$("select#birthDay").append(BDoption);
	}
	////////////////////////////////////////////////

	// 페이지 로드시 연락처 앞자리 select 옵션 추가 /////////
	for (let i = 0; i <= 9; i++) {
		let num = "01" + i;
		let contactOption = "<option value='" + num + "'>" + num + "</option>";
		$("select#contact01").append(contactOption);
	}
	////////////////////////////////////////////////

	// 페이지 로드시 메일 select 옵션 추가 ////////////////
	const mail = ["naver.com", "google.com", "daum.net", "hotmail.com", "yahoo.co.kr", "hanmir.com", "empal.com", "nate.com"];
	// 메일 뒷자리 배열 
	mail.sort(); // 배열 오름차순 정렬
	for (let i = 0; i < mail.length; i++) {
		let mailOption = "<option value='" + mail[i] + "'>" + mail[i] + "</option>";
		$("select#selectMail").append(mailOption);
	}
	////////////////////////////////////////////////

	// 이메일 옵션에 따른 2번째 input의 value 변화 ////////
	$("select#selectMail").on("change", function() {
		let val = $(this).val(); // 선택된 옵션의 value 값을 변수에 저장
		if (val == "") {
			$("input#email02").attr("disabled", false); // 직접 입력 선택 시 해당 input 박스 disabled 속성 해제
			$("input#email02").trigger('change');
			$("input#email02").val(""); // 및 value를 공백으로 변경
		} else {
			$("input#email02").attr("disabled", true); // 직접 입력 외 선택 시 해당 input 박스 disabled 속성 추가
			$("input#email02").trigger('change');
			$("input#email02").val(val); // 및 value를 선택된 옵션의 value로 변경
		}
	});
	////////////////////////////////////////////////

	// 우편번호 자동 조회 //////////////////////////////
	$("button#searchAddress").click(function() {

		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("input[name=zipCode]").val(data.zonecode);
				$("input[name=zipCode]").trigger('change');
				$("input[name=address]").val(addr);
				$("input[name=address]").trigger('change');
				// 커서를 상세주소 필드로 이동한다.
				$("input[name=dAddress]").focus();

			}
		}).open();

	});
	////////////////////////////////////////////////

	// 우편번호 지우기 //////////////////////////////////////
	$("button#cleanAddress").click(function() {
		$("input[name=zipCode]").val(null);
		$("input[name=zipCode]").trigger('change');
		$("input[name=address]").val("");
		$("input[name=address]").trigger('change');
		$("input[name=dAddress]").val("");
		$("input[name=dAddress]").trigger('change');
	});
	//////////////////////////////////////////////////////

	// 유효성 검사 시작 ////////////////////////////////
	$("button#joinBtn").click(function() {

		if ($("input#isChked").val() == "Y") {

			let nameVal = $("input[name=name]").val();
			let idVal = $("input[name=uid]").val();
			let pwVal = $("input[name=upw]").val();
			let pwChkVal = $("input#upwChk").val();
			let countryVal = $("select[name=country]").val();
			let birthYearVal = $("select#birthYear").val();
			let birthMonthVal = $("select#birthMonth").val();
			let birthDayVal = $("select#birthDay").val();
			let contactVal01 = $("select#contact01").val();
			let contactVal02 = $("input#contact02").val();
			let contactVal03 = $("input#contact03").val();
			let emailVal01 = $("input#email01").val();
			let emailVal02 = $("input#email02").val();

			if (birthMonthVal.length < 2) {
				birthMonthVal = "0" + birthMonthVal;
			}

			if (birthDayVal.length < 2) {
				birthDayVal = "0" + birthDayVal;
			}

			$("input[name=email]").val(emailVal01 + "@" + emailVal02);
			$("input[name=contact]").val(contactVal01 + "-" + contactVal02 + "-" + contactVal03);
			$("input[name=bDate]").val(birthYearVal + birthMonthVal + birthDayVal);

			if (nameVal == "") {
				alert("이름을 입력해주세요");
				$("input[name=gender]").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (idVal == "") {
				alert("아이디를 입력해주세요");
				$("input[name=uid]").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (idVal.length < 5) {
				alert("아이디는 5자 이상 입력해주세요");
			} else if (pwVal == "") {
				alert("비밀번호를 입력해주세요");
				$("input[name=upw]").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (pwVal.length < 6) {
				alert("비밀번호는 6자 이상이어야 합니다");
				$("input[name=upw]").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (pwVal != pwChkVal) {
				alert("비밀번호가 일치하지 않습니다");
				$("input#upwChk").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (countryVal == "") {
				alert("국가를 선택해주세요");
				$("select[name=country]").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (birthYearVal == "") {
				alert("생년을 선택해주세요");
				$("select#birthYear").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (birthMonthVal == "") {
				alert("생월을 선택해주세요");
				$("select#birthMonth").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (birthDayVal == "") {
				alert("생일을 선택해주세요");
				$("select#birthDay").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (contactVal02 == "" || contactVal02.length != 4) {
				alert("전화번호를 입력해주세요");
				$("input#contact02").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (contactVal03 == "" || contactVal03.length != 4) {
				alert("전화번호를 입력해주세요");
				$("input#contact03").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (emailVal01 == "") {
				alert("이메일을 입력해주세요");
				$("input#email01").focus();
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			} else if (emailVal02 == "") {
				alert("이메일을 입력해주세요");
				//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
				$("input#email02").focus();
			} else {
				$("#joinFrm").attr("action", "/joinProc")
					.attr("onsubmit", "")
					.submit();
			}

		} else {
			alert("아이디 중복 검사 여부를 확인해 주세요");
			//			document.onkeydown = notReload; // 경고창 이후 새로고침 방지
		}

	});
	////////////////////////////////////////////////

	// 전화번호 입력 제한 //////////////////////////////
	$("input#contact02").attr("maxlength", "4"); // 최대 4자리 입력만 가능하도록
	$("input#contact03").attr("maxlength", "4"); // 최대 4자리 입력만 가능하도록

	$("input#contact02").keydown(function(e) {

		if (e.keyCode > 57) {
			e.preventDefault(); // 숫자 외의 keyCode가 입력될 시 입력을 아예 취소시킴
		}

	});

	$("input#contact03").keydown(function(e) {

		if (e.keyCode > 57) {
			e.preventDefault();
		}

	});
	///////////////////////////////////////////////

	// 아이디 입력 제한 ///////////////////////////////
	$("input[name=uid]").keyup(function(e) {

		if (!(e.keyCode >= 37 && e.keyCode <= 40)) {

			let inputVal = $(this).val(); // 입력된 값을 변수에 저장
			$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi, ''));
			// 입력된 값들 중 영어 및 숫자에 해당되지 않는(한글) 문자를 공백으로 대체함
			$("input#isChked").val("");

		}

	});
	///////////////////////////////////////////////

	// 이메일 입력 제한 ///////////////////////////////
	$("input#email01").keyup(function(e) {

		if (!(e.keyCode >= 37 && e.keyCode <= 40 || e.keyCode == 190)) {

			var inputVal = $(this).val(); // 입력된 값을 변수에 저장

			$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi, ''));
			// 입력된 값들 중 영어 및 숫자에 해당되지 않는(한글) 문자를 공백으로 대체함

		}

	});

	$("input#email02").keyup(function(e) {

		if (!(e.keyCode >= 37 && e.keyCode <= 40 || e.keyCode == 190)) {

			var inputVal = $(this).val(); // 입력된 값을 변수에 저장

			$(this).val(inputVal.replace(/[^a-zA-Z0-9+.]/gi, ''));
			// 입력된 값들 중 영어 및 숫자에 해당되지 않는(한글) 문자를 공백으로 대체함

		}

	});
	///////////////////////////////////////////////

	// editㅍ 페이지 로드시 해당 값 체크 /////////////////////////////
	let prevCountry = $("input#prevCountry").val();
	if (prevCountry != null && prevCountry != "") {
		$("select[name=country]").val(prevCountry);
	}

	let prevBDate = $("input#prevBDate").val();
	if (prevBDate != null && prevBDate != "") {
		let prevBY = prevBDate.substr(0, 4);
		let prevBM = prevBDate.substr(4, 2);
		let prevBD = prevBDate.substr(6);
		if (prevBM[0] == 0) {
			prevBM = prevBM[1];
		}
		if (prevBD[0] == 0) {
			prevBD = prevBD[1];
		}
		$("select#birthYear").val(prevBY);
		$("select#birthMonth").val(prevBM);
		$("select#birthDay").val(prevBD);
	}

	let prevContact = $("input#prevContact").val();
	if (prevContact != null && prevContact != "") {
		let prevCon01 = prevContact.substr(0, 3);
		let prevCon02 = prevContact.substr(4, 4);
		let prevCon03 = prevContact.substr(9);
		$("select#contact01").val(prevCon01);
		$("input#contact02").val(prevCon02);
		$("input#contact03").val(prevCon03);
	}

	let prevEmail = $("input#prevEmail").val();
	if (prevEmail != null && prevEmail != "") {
		let prevEmaliArr = prevEmail.split("@");
		let prevEmail01 = prevEmaliArr[0];
		let prevEmail02 = prevEmaliArr[1];
		$("input#email01").val(prevEmail01);
		$("input#email02").val(prevEmail02);
		let isExist = 0 != $("select#selectMail option[value='" + prevEmail02 + "']").length;
		if (isExist) {
			$("select#selectMail").val(prevEmail02);
			$("input#email02").attr("disabled", true);
		}
	}
	//////////////////////////////////////////////////

	// 정보 변경시 (input 박스 내용 변화시) 버튼 활성화/////////
	$("form#uEditFrm input, form#uEditFrm select").change(function() {
		let nowName = $("form#uEditFrm input[name=name]").val();
		let prevName = $("input#prevName").val();
		let nowGender = $("form#uEditFrm input:checked").val();
		let prevGender = $("input#prevGender").val();
		let nowCountry = $("select[name=country]").val();
		let nowBY = $("select#birthYear").val();
		let nowBM = $("select#birthMonth").val();
		let nowBD = $("select#birthDay").val();
		let nowPw = $("form#uEditFrm input[name=upw]").val();
		let prevPw = $("input#prevUpw").val();

		if (nowBM.length < 2) {
			nowBM = "0" + nowBM;
		}

		if (nowBD.length < 2) {
			nowBD = "0" + nowBD;
		}
		let nowBDate = nowBY + nowBM + nowBD;
		let nowC01 = $("select#contact01").val();
		let nowC02 = $("input#contact02").val();
		let nowC03 = $("input#contact03").val();
		let nowContact = nowC01 + "-" + nowC02 + "-" + nowC03;
		let nowEm01 = $("input#email01").val();
		let nowEm02 = $("input#email02").val();
		let nowEmail = nowEm01 + "@" + nowEm02;
		let prevZipCode = $("input#prevZipCode").val();
		let nowZipCode = $("input[name=zipCode]").val();
		let prevAddress = $("input#prevAddress").val();
		let nowAddress = $("input[name=address]").val();
		let prevDAddress = $("input#prevDAddress").val();
		let nowDAddress = $("input[name=dAddress]").val();

		if (nowName != prevName) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (nowGender != prevGender) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (nowCountry != prevCountry) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (nowBDate != prevBDate) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (nowContact != prevContact) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (prevEmail != nowEmail) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (prevZipCode != nowZipCode) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (prevAddress != nowAddress) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (prevDAddress != nowDAddress) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else if (nowPw != prevPw) {
			$("button#userInfoEditBtn").attr("disabled", false);
		} else {
			$("button#userInfoEditBtn").attr("disabled", true);
		}
	});
	////////////////////////////////////////////////////
	$("button#userInfoEditBtn").click(function() {
		let nameVal = $("input[name=name]").val();
		let contactVal01 = $("select#contact01").val();
		let contactVal02 = $("input#contact02").val();
		let contactVal03 = $("input#contact03").val();
		let emailVal01 = $("input#email01").val();
		let emailVal02 = $("input#email02").val();
		let birthYearVal = $("select#birthYear").val();
		let birthMonthVal = $("select#birthMonth").val();
		let birthDayVal = $("select#birthDay").val();
		if (birthMonthVal.length < 2) {
			birthMonthVal = "0" + birthMonthVal;
		}

		if (birthDayVal.length < 2) {
			birthDayVal = "0" + birthDayVal;
		}
		$("input[name=email]").val(emailVal01 + "@" + emailVal02);
		$("input[name=contact]").val(contactVal01 + "-" + contactVal02 + "-" + contactVal03);
		$("input[name=bDate]").val(birthYearVal + birthMonthVal + birthDayVal);

		if (nameVal == "") {
			alert("이름을 확인해주세요");
			$("input[name=gender]").focus();
		} else if (contactVal02 == "" || contactVal02.length != 4) {
			alert("전화번호를 확인해주세요");
			$("input#contact02").focus();
			//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
		} else if (contactVal03 == "" || contactVal03.length != 4) {
			alert("전화번호를 확인해주세요");
			$("input#contact03").focus();
			//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
		} else if (emailVal01 == "") {
			alert("이메일을 입력해주세요");
			$("input#email01").focus();
			//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
		} else if (emailVal02 == "") {
			alert("이메일을 입력해주세요");
			//				document.onkeydown = notReload; // 경고창 이후 새로고침 방지
			$("input#email02").focus();
		} else {
			$("form#uEditFrm").attr("action", "/detailEditProc")
				.attr("onsubmit", "")
				.submit();
		}
	});
	// 정보 변경 유효성 검사 ////////////////////////////////////////////////

	$("div#memberDetailWrap #delBtn").click(function() {

		let chkdNums = [];
		$("div#memberListWrap input[name='memberChk']:checked").each(function() {
			chkdNums.push($(this).val());
		});
		let del = confirm("정말 삭제하시겠습니까?");

		if (del) {

			console.log(chkdNums);

			location.href = "/memberDel?chkdNums=" + chkdNums

		}

	});

})