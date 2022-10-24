<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true" %>
<jsp:useBean id="ULMgr" class="pack_Join.UserListMgr" />

<jsp:useBean id="uList" class="pack_Join.UserList" />
<jsp:setProperty name="uList" property="*" />

<%
request.setCharacterEncoding("UTF-8");
String uid = (String) session.getAttribute("s_Key");

boolean isOK = ULMgr.mtd_UserInfoEdit(uList, uid);

if (isOK == true) {
	response.sendRedirect("userEdit.jsp");
} else {
	response.sendRedirect("userEdit.jsp");
}

%>