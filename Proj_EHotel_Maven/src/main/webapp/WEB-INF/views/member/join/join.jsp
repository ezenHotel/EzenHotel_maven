<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/style/style_common.css">
<link rel="stylesheet" href="/resources/style/style_userJoin.css">
<script src="https://kit.fontawesome.com/9a2dc8a1b1.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_userJoin.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	<div id="wrap" class="joinWrap">

		<ul id="progress" class="dFlex">
			<li class="complete"><span>약관 동의</span></li>
			<li class="check">정보 입력</li>
			<li>가입 완료</li>
		</ul>

		<main id="main" class="dFlex">

			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="joinInsert">

				<form name="joinFrm" id="joinFrm" onsubmit="return false;"
					accept-charset="utf-8">

					<table id="joinFrmTbl">
						<caption>
							<i class="fa-solid fa-user"></i>가입 정보
						</caption>
						<tbody>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">이름</th>
								<td class="td01"><input type="text" name="name"><input
									type="radio" name="gender" value="M" checked>남 <input
									type="radio" name="gender" value="F">여</td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">아이디</th>
								<td class="td02"><input type="text" name="uid">
									<button type="button" id="idChkBtn">중복검사</button> <input
									id="isChked" type="hidden" disabled> <span
									class="caption">5자 이상의 영문, 숫자 조합</span></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">비밀번호</th>
								<td class="td03"><input type="password" name="upw">
									<span class="caption">6자 이상의 영문, 한글, 숫자, 특수문자 조합</span></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">비밀번호 확인</th>
								<td class="td04"><input type="password" id="upwChk"></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">국가</th>
								<td class="td05"><select name="country">
										<option value="">국가/지역</option>
								</select></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">생년월일</th>
								<td class="td06"><select id="birthYear">
										<option value="">출생연도</option>
								</select> <span>년</span> <select id="birthMonth">
										<option value="">월</option>
								</select> <span>월</span> <select id="birthDay">
										<option value="">일</option>
								</select> <span>일</span> <input type="hidden" name="bDate"></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">연락처</th>
								<td class="td07"><select id="contact01">
								</select> <span> - </span> <input type="text" id="contact02"> <span>
										- </span> <input type="text" id="contact03"> <input
									type="hidden" name="contact"></td>
							</tr>
							<tr>
								<th><img src="/resources/images/dot.png" alt="dot">이메일</th>
								<td class="td08"><input type="text" id="email01"> <span>@</span>
									<input type="text" id="email02"> <select
									id="selectMail">
										<option value="">직접 입력</option>
								</select> <input type="hidden" name="email"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td class="td09"><input type="text" readonly name="zipCode">
									<button type="button" id="searchAddress">우편번호 검색</button> <br>
									<input type="text" readonly name="address"> <br> <input
									type="text" name="dAddress"></td>
							</tr>
							<tr>
								<td class="td10" colspan="3">
									<button type="button" id="joinBtn">회원가입</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<!-- form[name=joinFrm] -->

			</div>
			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->

	</div>
	<!-- div#wrap -->
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>

</html>