<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
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
	<div id="adminWrap">

		<h1>작업 선택</h1>

		<button type="button" onclick="location='/adminOut'">로그아웃</button>
		<button type="button" onclick="location='/admin/memberList'">멤버
			리스트</button>

	</div>
	<!-- div#wrap -->

</body>
</html>

