<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="resvDAO" class="pack_Reserve.ReserveMgr" />

<jsp:useBean id="rBean" class="pack_Reserve.ReserveRoomInfo" />
<%-- <jsp:setProperty name="rBean" property="*" /> --%>

<%
String uId_Session = (String)session.getAttribute("s_Key"); 

String hCode = request.getParameter("hCode");
String resev_start = request.getParameter("resev_start");
int dayOfNights = Integer.parseInt(request.getParameter("dayOfNights"));

String uId = request.getParameter("uId");

String rCode = request.getParameter("rCode");
//String[] rCode = request.getParameterValues("rCode");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String phone = phone1 + "-" + phone2 + "-" + phone3;
int resev_people = Integer.parseInt(request.getParameter("resev_people"));
int resev_method = Integer.parseInt(request.getParameter("resev_method"));


out.print("start date : "+ resev_start + "<br>");
int year = Integer.parseInt(resev_start.split("-")[0]);
int month = Integer.parseInt(resev_start.split("-")[1]);
int day = Integer.parseInt(resev_start.split("-")[2]);
out.print(year + " / " + month + " / " + day + "<br>");
int nights = dayOfNights;
out.print("숙박 일 : "+ dayOfNights + "<br>"); 

// 선택한 숙박일에 맞게 체크아웃 날짜 계산
/* day = day + nights;
String dayDate = day + "";
if(day < 10){
	dayDate = "0"+day;
}
String endDate = year + "-"+ month +"-"+dayDate;
out.print("end Date : "+ endDate + "<br>"); */

boolean resvFlag = resvDAO.insertResvInfo(hCode, rCode, uId, resev_start, dayOfNights, resev_people, resev_method);

%>


<script>
<% if (resvFlag) { %>
	alert("예약되었습니다.");
	location.href="/reserve/reserveConfirm.jsp?chkBtn=now";
<% } else { %>
	alert("객실 예약 중 문제가 발생했습니다. 다시 시도해주세요.\n만일 문제가 계속될 경우 고객센터(02-1234-5678)로 연락해주세요.");
	history.back();
<% } %>
</script>
