<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="resvDAO" class="pack_Reserve.ReserveMgr" />

<%
String uId_Session = (String)session.getAttribute("s_Key"); 

String uid = request.getParameter("uid");
String rCode = request.getParameter("rCode");
String resvCode = request.getParameter("resvCode");

boolean resvFlag = resvDAO.delResvInfo(uid, rCode, resvCode); 

%>


<script>
<% if (resvFlag) { %>
	alert("삭제되었습니다.");
	location.href="/reserve/reserveConfirm.jsp?chkBtn=now";
<% } else { %>
	alert("예약 삭제 중 문제가 발생했습니다. 다시 시도해주세요.\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.");
	history.back();
<% } %>
</script>
