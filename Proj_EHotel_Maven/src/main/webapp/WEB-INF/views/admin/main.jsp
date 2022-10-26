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
<link rel="stylesheet" href="/resources/style/style_admin.css">
<script src="/resources/script/script_admin.js"></script>
</head>
<body>
	<div id="adminWrap" class="">

		<main id="main" class="dFlex">

			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="loginDiv">
				<form id="adminFrm" action="/adminProc" method="post">
					<div id="loginArea">
						<div id="loginInput">
							<input type="text" name="aid" placeholder="아이디 입력"> <input
								type="password" name="apw" placeholder="비밀번호 입력">
						</div>

						<button>로그인</button>
					</div>
					<!-- div#loginArea -->

				</form>

			</div>
			<!-- 실제 작업 영역 끝 div.loginDiv -->

		</main>
		<!--  main#main  -->

	</div>
	<!-- div#wrap -->

</body>
</html>

