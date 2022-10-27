<%@page import="pack_Reserve.ReserveRoomInfo"%>
<%@page import="pack_Reserve.ReserveRoomBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="pack_Reserve.ReserveBean"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="objDAO" class="pack_Reserve.ReserveMgr" scope="page"/>    
<%
String uId_Session = (String)session.getAttribute("s_Key"); 
String chkBtn = request.getParameter("chkBtn");

// 호텔 리스트 조회(호텔 Nav)
List<ReserveBean> objList = objDAO.mtd_hotelList();  


%>    


<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
	<link rel="stylesheet" href="/resources/style/style_main.css">
    <link rel="stylesheet" href="/resources/style/style_Reserve.css">
    <script src="/resources/script/jquery-3.6.0.min.js"></script>
    <script src="/resources/script/script.js"></script>
    <script src="/resources/script/script_Reserve.js"></script>
</head>
<body onload="onloadBtnChk();">
    <div id="wrap">
    	<input type="hidden" id="loginID" value="<%= uId_Session %>">
    	
    	<!--  헤더템플릿 시작, *********(각자)iframe으로 변경 필요, jsp include를 사용하면 비표준이 될 수 있음********* -->
		<%@ include file="/common/header.jsp"%>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main">
    	<%
		if((uId_Session == null) || (uId_Session == "")){
		%>
			<p id="sessionChk">로그인 후 이용해주세요.</p>
		<%
		} else {
		%>
		   	<input type="hidden" value="<%= uId_Session %>" id="uid">
    		
   			<h1>나의 예약 현황 보기</h1>
		<div id="divArea">
			<div id="ResvTermBtnArea" class="dFlex">
				<div id="nowTermBtn">다가올 예약 보기</div>
				<div id="pastTermBtn">지난 예약 보기</div>
			</div>
   			
    		<%
    		List<ReserveRoomInfo> objRoomList = objDAO.mtd_myResvList(uId_Session, chkBtn);
    		if(objRoomList.size() == 0){
    			%>
    			<div id="noResev">
	    			<h3>예약 내역이 없습니다.</h3>
    			</div>
    			<%
    		}else {
	    		for(int i=0; i<objRoomList.size(); i++){
	    			ReserveRoomInfo objResvInfo = objRoomList.get(i);
	    			String resev_method = "현금";
	    			if(objResvInfo.getResev_method() == 1){
	    				resev_method = "카드";
	    			}
	    			
	    		%>
	    			
		   			<h2><%= objResvInfo.gethName() %></h2>    			
		   			<input type="hidden" class="resvCode" value="<%= objResvInfo.getResev_date()%>">
		   			<button type="button" class="resvDelBtn" value="<%= objResvInfo.getrCode() %>">예약 취소</button>
		   			
		   			
		    		<div class="myResvList dFlex">
		    			<div class="resvImgArea">
		    				<a href="#">
		    					<img src="/images/hotelListImg/<%= objResvInfo.getrCode() %>-01.jpg" width="350px" alt="<%= objResvInfo.getrName() %>">
			    				<input type="hidden" class="roomImg" value="<%= objResvInfo.getrCode() %>">
								<input type="hidden" class="roomImgName" value="<%= objResvInfo.getrName() %>">
		    				</a>	
		    			</div>
		    			<div class="myResvInfo">
			    			<table>
			    				<tr>
			    					<th colspan="2" class="thLine">
			    						<h3><%= objResvInfo.getrName() %></h3>
			    					</th>
			    				</tr>
			    				<tr>
			    					<th>객실 정원   </th>
			    					<td><%= objResvInfo.getResev_people()%></td>
			    				</tr>
			    				<tr>
			    					<th>숙박 날짜   </th>
			    					<td>
			    						<%= objResvInfo.getResev_start()%> ~ <%= objResvInfo.getResev_end()%>
			    						(<%= objResvInfo.getDayOfNights()%>박)
			    					</td>
			    				</tr>
			    				<tr>
			    					<th>예약일   </th>
			    					<td><%= objResvInfo.getResev_date()%></td>
			    				</tr>
			    				<tr>
			    					<th>결제 방식  </th>
			    					<td><%= resev_method%></td>
			    				</tr>
			    			</table>
		    			</div>
		   			</div> 
	    		<%
	    		}
    		}
    		%>
    		
    	<%
		}
		%>	    	
		</div>
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<div id="footerWrap">
	
	       <%@ include file="/common/footer.jsp"%>
	    </div>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->
    
    
        <!-- 모달 레이어 팝업 시작 -->
    <div id="modalBG">
    
    	<!-- 불투명 검정 배경 시작 -->
    	<div id="modalLayer">
    		<!-- 레이업 팝업 내용 시작 -->
    		<div id="modalLayerImg" >
    			<div id="imgArea" class="dFlex">
    			
    			</div>
                <!-- <img src="" alt="모달레이어 이미지"> -->
                <h3 id="artSubject"> </h3>
                <p id="artistInfo"> </p>
    		</div>
    		
    		<span id="modalCloseBtn">&times;</span>
    		
    	</div>
    	
    </div>

</body>
</html>