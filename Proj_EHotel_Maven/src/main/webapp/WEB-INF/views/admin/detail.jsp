<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/style_admin.css">
<script src="/resources/script/script_admin.js"></script>
<script src="https://kit.fontawesome.com/9a2dc8a1b1.js"></script>
</head>
<body>

	<div id="memberDetailWrap">
		
		<form id="uEditFrm" onsubmit="return false;">
			<input type="hidden" name="no" id="catchNum" value="${detail.no}">

			<table>
				<caption>
					<i class="fa-solid fa-address-card"></i>${detail.uid}
				</caption>
				<tbody>
					<tr>
						<th>사용자 이름</th>
						<td class="td01"><input type="text" name="name"
							value="${detail.name}"> <input type="hidden"
							id="prevName" value="${detail.name}"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td class="td01"><input type="text" name="upw"
							value="${detail.upw}"> <input type="hidden" id="prevUpw"
							value="${detail.upw}"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td class="td02"><c:set var="isF" /> <c:set var="isM" /> <c:choose>
								<c:when test="${(detail.gender).equals('F')}">
									<c:set var="isF" value="checked" />
								</c:when>
								<c:otherwise>
									<c:set var="isM" value="checked" />
								</c:otherwise>
							</c:choose> <input type="radio" name="gender" value="M" ${isM}> 남 <input
							type="radio" name="gender" value="F" ${isF}> 여 <input
							type="hidden" id="prevGender" value="${detail.gender}"></td>
					</tr>
					<tr>
						<th>
							<p>국가</p>
						</th>
						<td class="td03"><input type="hidden" id="prevCountry"
							value="${detail.country}"> <select name="country"></select>
						</td>
					</tr>
					<tr>
						<th>
							<p>생년월일</p>
						</th>
						<td class="td04"><input type="hidden" id="prevBDate"
							value="${detail.bDate}"> <select id="birthYear"></select>
							<span>년</span> <select id="birthMonth"></select> <span>월</span> <select
							id="birthDay"></select> <span>일</span> <input type="hidden"
							name="bDate"></td>
					</tr>
					<tr>
						<th>
							<p>연락처</p>
						</th>
						<td class="td05"><input type="hidden" id="prevContact"
							value="${detail.contact}"> <select id="contact01"></select>
							<span>-</span> <input type="text" id="contact02"> <span>-</span>
							<input type="text" id="contact03"> <input type="hidden"
							name="contact"></td>
					</tr>
					<tr>
						<th>
							<p>이메일</p>
						</th>
						<td class="td06"><input type="hidden" id="prevEmail"
							value="${detail.email}"> <input type="text" id="email01">
							<span>@</span> <input type="text" id="email02"> <select
							id="selectMail">
								<option value="">직접 입력</option>
						</select> <input type="hidden" name="email"></td>
					</tr>
					<tr>
						<th>
							<p>주소</p>
						</th>
						<td class="td07"><input type="hidden" id="prevZipCode"
							value="${detail.zipCode}"> <input type="text" readonly
							name="zipCode" value="${detail.zipCode}">
							<button type="button" id="searchAddress">우편번호 찾기</button>
							<button type="button" id="cleanAddress">주소 지우기</button> <br>
							<input type="text" readonly name="address"
							value="${detail.address}"> <br> <input type="hidden"
							id="prevAddress" value="${detail.address}"> <input
							type="text" name="dAddress" value="${detail.dAddress}"> <input
							type="hidden" id="prevDAddress" value="${detail.dAddress}">
						</td>
					</tr>
					<tr>
						<td colspan="2" class="td08">
							<button type="button" onclick="location.href='/admin/memberList'">회원 목록으로</button>
							<button id="userInfoEditBtn" type="button" disabled>변경사항
								저장</button>
							<button id="delBtn" type="button">회원 삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>