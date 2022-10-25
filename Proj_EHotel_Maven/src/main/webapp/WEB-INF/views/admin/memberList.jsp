<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
		<th>선택</th>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
	</tr>
	<c:forEach var="member" items="${member}">
	
		<tr>
			<td>
			<input type="radio">
			</td>
			<td>${member.no}</td>
			<td>${member.uid}</td>
			<td>${member.name}</td>
			<td>${member.contact}</td>
		</tr>
	
	</c:forEach>
	</table>
</body>
</html>