<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%-- <%@page import="pack_Reserve.ReserveBean"%> --%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="objDAO" class="pack_Reserve.ReserveMgr" scope="page"/>       --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="/resources/style/style_main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script.js"></script>
</head>
<body>
	
	<div id="wrap">
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	
	   <!--  <header id="header" onclick="location.href='/bbs/write.jsp'">
	    	<img src="/images/header_img.png" width="100%" alt="예약이미">
		</header> -->
		
	    <!-- header#header -->
	    
	    
		<main id="main">
	    
			<div id="slideshowArea">
	                
	                
                <div id="slideFrame">	                
                
                	
                	<a href="#" data-no="1">   
                		<img src="/resources/images/bg_main01.jpeg" width="100%" alt="슬라이드1">
                	</a>
                	
                	<a href="#" data-no="2">  
                		<img src="/resources/images/bg_main02.jpg" width="100%"  alt="슬라이드2">
                	</a>
                	
                	<a href="#" data-no="3">  
                		<img src="/resources/images/bg_main06.png" width="100%" alt="슬라이드3">
                	</a>
                
                </div>
                <!-- div#slideFrame -->
                
            </div>
			<!-- #slideshowArea -->
	            
        	<form action="" id="mainReserve">
		        <div id="reserve" class="dFlex">
		            <div>
		            	<h5>호텔 또는 리조트</h5>
		            	<select id="hotelName">
		            		<option value="">----- 선택 -----</option>
<%-- 							<%
							// 호텔 or 리조트 리스트(드롭박스 표시)
							List<ReserveBean> objHRList = objDAO.mtd_hotelList();
							
							for(int i=0; i<objHRList.size(); i++){
								ReserveBean objRB = objHRList.get(i);
							%>
								<option value="<%= objRB.gethCode() %>"><%= objRB.gethName() %></option>
							<%
							}
							
							//오늘 날짜 저장.
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
							String today = sdf.format(todayCal.getTime());
							todayCal.add(Calendar.DATE, +1);
							String tomorrow = sdf.format(todayCal.getTime());
							
							%> --%>
						</select>
						<input type="hidden" name="hCode" id="hCode">
		            </div>
		            
<%-- 		            <div>
		            	<h5>체크인 / 체크아웃</h5>
		            	<input type="date" id="resev_start" value="<%= today %>">
		            	<input type="hidden" id="resev_yy" name="year" value="<%= todayCal.get(Calendar.YEAR) %>">
		            	<input type="hidden" id="resev_mm" name="month" value="<%= todayCal.get(Calendar.MONTH) %>">
		            	<b> ~ </b> 
		            	<input type="date" id="resev_end" value="<%= tomorrow %>">
		            </div> --%>
		            
		            <div class="people">
		            	<h5>객실수</h5>
		            	<input type="number" id="roomCnt" value="1" max="6">
		            </div>
		            
		            <div class="people">
		            	<h5>예약 인원</h5>
		            	<input type="number" id="peopleCnt" value="2" max="6">
		            </div>
		            
		            <div>
		            	<button type="button" id="mainReserveBtn">예약</button>
		            </div>
				</div>
            </form>
			<!-- #reserve -->
			
			
			<div id="contTitle" class="dFlex">
				<img src="/resources/images/specialOffer.gif" alt="이미지01">
			</div>
			
			<div id="contents" class="dFlex">
			
			<div class="cont">
				<img src="/resources/images/sub01.png" alt="이미지01">
				<h3>
					Autunm in the city
				</h3>
				<span>
					와인과 플래터를 함께 즐기는 서울 도심 속 여유로운<br>
					2022.09.20 - 2022.11.30
				</span>
			</div>
			
			<div class="cont">
				<img src="/resources/images/sub02.png" alt="이미지01">
				<h3>
					Discover Your Autumn
				</h3>
				<span>
					올 가을 'diptyque'의 다섯 가지 향과 함께 당신의<br>
					2022.09.15 - 2022.11.30
				</span>
			</div>
			
			<div class="cont">
				<img src="/resources/images/sub03.png" alt="이미지01">
				<h3>
					가을달밤 패키지
				</h3>
				<span>
					청량한 가을 햇살과 해운대 바다의 낭만이 흐르는<br>
					2022.09.20 - 2022.10.31
				</span>
			</div>
				
				
			</div>
			<!-- #contents -->
	
		</main>
		
		
	</div>
	<!-- div#wrap -->
	    
	    <div id="footerWrap">
	
	       <%@ include file="/WEB-INF/views/common/footer.jsp"%>
	    </div>
		<!-- div#footerWrap -->
				
</body>
</html>