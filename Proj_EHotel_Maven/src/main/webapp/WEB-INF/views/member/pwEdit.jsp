<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/style_myPage.css">
<script src="/resources/source/jquery-3.6.0.min.js"></script>
<script src="/resources/script/script_userJoin.js"></script>
</head>
<body>
	<div id="wrap" class="pwEditWrap">
		<form id="pwEditFrm" onsubmit="return false;" method="post">
			<h1>비밀번호 변경 페이지</h1>
			<hr>

			<table>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="upw"> <input
						type="checkbox" id="isVisible"> <span>비밀번호 보기</span> <br>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="pwChk"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="pwEditBtn">변경하기</button>
					</td>
				</tr>
				<tr>
					<td colspan="2"><span id="pwErrMsg01"
						style="color: red; display: none">비밀번호를 입력해주세요</span> <span
						id="pwErrMsg02" style="color: red; display: none">6자리 이상
							입력해주세요</span> <span id="pwErrMsg03" style="color: red; display: none">비밀번호가
							일치하지 않습니다</span></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- div#wrap -->
</body>
</html>