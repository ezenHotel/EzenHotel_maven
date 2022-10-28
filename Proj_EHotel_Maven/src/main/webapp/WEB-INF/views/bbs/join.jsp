<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/member/join.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div id="wrap">
			<h1>입력 양식 화면</h1>
			
			<hr>
			
			<form method="post">
				<table id="memberTbl">
					<tbody>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="uId"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="uPw"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="uName"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="uEmail"></td>
						</tr>
					</tbody>
				</table>
				
				<button type="submit">전송</button>
				
			</form>
			
		</div>
		<!-- div#wrap -->
</body>
</html>