<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/style_common.css">
<link rel="stylesheet" href="/resources/style/style_myPage.css">
<script src="/resources/script/script_userJoin.js"></script>
<script src="https://kit.fontawesome.com/9a2dc8a1b1.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div id="userInfoWrap">

		<form id="uEditFrm" onsubmit="return false;">

			<table>
				<caption>
					<i class="fa-solid fa-address-card"></i>MYPAGE
				</caption>
				<tbody>
					<tr>
						<th>사용자 이름</th>
						<td class="td01"><input type="text" name="name"
							value="${data.name}"> <input type="hidden"
							id="prevName" value="${data.name}">
							<button id="pwEditBtn" type="button">비밀번호 변경</button></td>
					</tr>
					<tr>
						<th>성별</th>
						<td class="td02">
							<c:set var="isF"/>
							<c:set var="isM"/>
							
							<c:choose>
								<c:when test = "${(data.gender).equals('F')}">
									<c:set var="isF" value="checked"/>
								</c:when>
								<c:otherwise>
									<c:set var="isM" value="checked"/>
								</c:otherwise>
							</c:choose>
							
							<input type="radio" name="gender" value="M" ${isM}>
							남 <input type="radio" name="gender" value="F" ${isF}> 여
							<input type="hidden" id="prevGender"
							value="${data.gender}">
						</td>
					</tr>
					<tr>
						<th>
							<p>국가</p>
						</th>
						<td class="td03"><input type="hidden" id="prevCountry"
							value="${data.country}"> <select name="country"></select>
						</td>
					</tr>
					<tr>
						<th>
							<p>생년월일</p>
						</th>
						<td class="td04"><input type="hidden" id="prevBDate"
							value="${data.bDate}"> <select id="birthYear"></select>
							<span>년</span> <select id="birthMonth"></select> <span>월</span> <select
							id="birthDay"></select> <span>일</span> <input type="hidden"
							name="bDate"></td>
					</tr>
					<tr>
						<th>
							<p>연락처</p>
						</th>
						<td class="td05"><input type="hidden" id="prevContact"
							value="${data.contact}"> <select id="contact01"></select>
							<span>-</span> <input type="text" id="contact02"> <span>-</span>
							<input type="text" id="contact03"> <input type="hidden"
							name="contact"></td>
					</tr>
					<tr>
						<th>
							<p>이메일</p>
						</th>
						<td class="td06"><input type="hidden" id="prevEmail"
							value="${data.email}"> <input type="text"
							id="email01"> <span>@</span> <input type="text"
							id="email02"> <select id="selectMail">
								<option value="">직접 입력</option>
						</select> <input type="hidden" name="email"></td>
					</tr>
					<tr>
						<th>
							<p>주소</p>
						</th>
						<td class="td07">
						<input type="hidden" id="prevZipCode" value="${data.zipCode}">
							<input type="text" readonly name="zipCode" value="${data.zipCode}">
							<button type="button" id="searchAddress">우편번호 찾기</button>
							<button type="button" id="cleanAddress">주소 지우기</button> <br>
							<input type="text" readonly name="address" value="${data.address}">
							<br> <input type="hidden" id="prevAddress"
							value="${data.address}"> <input type="text" name="dAddress"
							value="${data.dAddress}"> <input type="hidden"
							id="prevDAddress" value="${data.dAddress}">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td08">
							<button id="userInfoEditBtn" type="button" disabled>변경사항
								저장</button>
								<button id="withdrawalBtn" type="button">회원 탈퇴</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- div#wrap -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>