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
</head>
<body>

	<div id="memberListWrap">
		<table>
			<tr>
				<th>선택</th>
				<th>순번</th>
				<th>아이디</th>
				<th>이름</th>
				<th>연락처</th>
				<th>상세 조회</th>
			</tr>
			<c:forEach var="member" items="${member}">

				<tr>
					<td><input type="checkbox" name="memberChk"
						value="${member.no}"></td>
					<td>${member.no}</td>
					<td>${member.uid}</td>
					<td>${member.name}</td>
					<td>${member.contact}</td>
					<td><span id="detailBtn">🔍</span></td>
				</tr>

			</c:forEach>
			<tr>
				<td colspan="5">
					<button type="button" id="delBtn">삭제하기</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>