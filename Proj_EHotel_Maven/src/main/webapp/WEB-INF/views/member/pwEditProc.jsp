<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true" %>
    
<jsp:useBean id="ULMgr" class="pack_Join.UserListMgr" />
    
<%
request.setCharacterEncoding("UTF-8");

String upw = request.getParameter("upw");
String uid = (String) session.getAttribute("s_Key");

boolean isOK = ULMgr.mtd_UserPwEdit(upw, uid);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>
<link rel="stylesheet" href="/style/style_myPage.css">
</head>
<body>
	<div id="pwEditProcwrap">
		<%
		if (isOK == true) {
			%>
			<p>비밀번호 변경이 완료되었습니다</p>
			<%
		} else {
			%>
			<p>비밀번호 변경에 실패했습니다<br>다시 시도해주세요</p>
			<%
		}
		%>
		<button type="button" id="pwEditCloseBtn" onclick="window.close()">닫기</button>
	</div>
	<!-- div#wrap -->
</body>
</html>