<%@page import="pack_Reserve.ReserveRoomInfo"%>
<%@page import="pack_Reserve.ReserveRoomBean"%>
<%@page import="pack_Reserve.ReserveBean"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="objDAO" class="pack_Reserve.ReserveMgr" scope="page"/>    
<%
String uId_Session = (String)session.getAttribute("s_Key"); 
String rCode = request.getParameter("rCode");
String resev_start = request.getParameter("resvDate");

String hCode = request.getParameter("hCode");

// 호텔 or 리조트 리스트(드롭박스 표시)
List<ReserveBean> objHRList = objDAO.mtd_hotelList();
// 드롭박스 선택된 호텔의 객실 리스트 및 정보 출력
List<ReserveRoomBean> objHRInfo = null;

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
    <script src="/resources/script/script_Reserve.js"></script>
</head>
<body onload='pageLoadChkHotel();'>
    <div id="wrap">
    	
    	<!--  헤더템플릿 시작, *********(각자)iframe으로 변경 필요, jsp include를 사용하면 비표준이 될 수 있음********* -->
		<%@ include file="/common/header.jsp"%>
    	<!--  헤더템플릿 끝 -->    	
    	
    	
    	<main id="main">
   			<h1>객실 상세 예약</h1>
   			
   			<%
   			if((uId_Session == null) || (uId_Session == "")){
   			%>
   				<p id="sessionChk">로그인 후 이용해주세요.</p>
   			<%
   			} else {
   			%>
   			
   			<form id="changeRoomInfo" method="post">
   			
				<table id="resvHOrRDet">
		   			<caption>회원정보 <b><%= uId_Session %></b> 님</caption>
					<tr>
						<th>호텔/리조트</th>
						<td>
							<span id="HorR"></span>
							<select id="hotelName">
							<%
							for(int i=0; i<objHRList.size(); i++){
								ReserveBean objRB = objHRList.get(i);
							%>
									<option value="<%= objRB.gethCode() %>"><%= objRB.gethName() %></option>
							<%
							}
							%>
							</select>
							<input type="hidden" name="hCode" id="hCodeNum">
						</td>
					</tr>
					<tr>
						<th>도착일/숙박일수</th>
						<td><!-- id, name=resvDate -->
							<input type="date" id="resev_start" name="resev_start" value="<%= resev_start %>">
							<select id="dayOfNights" name="dayOfNights">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
							</select>
							<span>박</span>
						</td>
					</tr>
					<tr>
						<th>객실종류</th>
						<td>
							<div id="roomStyle">
								<input type="hidden" id="selectedRCode" value="<%= rCode%>">
								<div class="dFlex">
								<%
								int divLine = 0;
								objHRInfo = objDAO.mtd_selRoomList(hCode);
								for(int i=0; i<objHRInfo.size(); i++){
									divLine++;
									ReserveRoomBean objRIB = objHRInfo.get(i);
								%>
									<div class="roomTypeList">
										<label>
											<input type="checkbox" class="chkRCode" name="rCode" value="<%= objRIB.getrCode() %>">
											<img src="/images/hotelListImg/<%= objRIB.getrCode() %>-01.jpg" alt="<%= objRIB.getrName() %>">
											<p><b><%= objRIB.getrName() %></b></p>
											<p class="rPeople">객실정원 : <span><b><%= objRIB.getrPeople() %></b></span> 명</p>
											<input type="hidden" name="resev_people" value="<%= objRIB.getrPeople() %>">
										</label> 
										<button type="button" id="<%= objRIB.getrCode() %>_Btn" class="imgViewBtn">객실 사진보기</button>
										<input type="hidden" class="roomImg" value="<%= objRIB.getrCode() %>">
										<input type="hidden" class="roomImgName" value="<%= objRIB.getrName() %>">
									</div>
								<%
									if(divLine == 4){
								%>
								</div>
								<div class="dFlex">
								<%
										divLine = 0;
									}
								}
								%> 
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>예약자 정보</th>
						<td><!-- id=resvLoginID -->
							예약자 성함 : <input type="text" id="uId" name="uId" value="<%= uId_Session %>" readonly> 님
							<br>
							<select id="phone1" class="phone" name="phone1">
								<option>010</option>
								<option>011</option>
								<option>017</option>
								<option>02</option>
								<option>031</option>
							</select>
							<input type="text" class="phone" id="phone2" name="phone2" maxlength="4"> 
							-
							<input type="text" class="phone" id="phone3" name="phone3" maxlength="4">
							
						</td>
					</tr>
					<tr>
						<th>결제 방식</th>
						<td>
							<label><!-- name="payOption" -->
								카드 <input type="radio" name="resev_method" value="1" checked>		
							</label>
							<label>
								계좌이체 <input type="radio" name="resev_method" value="0">		
							</label>
						</td>
					</tr>
				</table>    	
				<div id="btnArea">
					<button type="button" id="resvConfirmBtn">예약하기</button>
				</div>
			</form>
		<%
   			}
   		%>	
    		    	
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