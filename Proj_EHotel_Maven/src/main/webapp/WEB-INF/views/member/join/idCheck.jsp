<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 중복 체크</title>
<link rel="stylesheet" href="/resources/style/style_userJoin.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_userJoin.js"></script>
</head>

<body>
	<div id="wrap_Popup">

		<div>
			<h1>${uid}</h1>

			<c:set var="chk" value="N" />
			<c:set var="btnCap" value="ID 재입력" />

			<c:choose>
				<c:when test="${isExist.equals('no')}">
					<span> 는 사용가능합니다.</span>
					<c:set var="chk" value="Y" />
					<c:set var="btnCap" value="사용하기" />
				</c:when>
				<c:otherwise>
					<span> 는 존재하는 ID입니다.</span>
				</c:otherwise>
			</c:choose>
			
			<input name="chk" type="hidden" value="${chk}">

		</div>
		<hr>
		<div id="closeBtnArea">
			<button type="button">${btnCap}</button>
		</div>


	</div>
	<!-- div#wrap -->

</body>

</html>






