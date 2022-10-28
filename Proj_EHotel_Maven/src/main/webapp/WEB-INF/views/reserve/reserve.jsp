<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uId_Session = (String)session.getAttribute("s_Key"); 
String hCode = request.getParameter("hCode");

%>    

<%
Calendar cal = Calendar.getInstance();

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);


if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
  
}else{

}
//년도/월 셋팅
cal.set(year, month, 1);

int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
//out.print("startDay : "+ startDay + " / endDay : " + endDay + " / start : "+start);
int newLine = 0;

//오늘 날짜 저장.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));


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
    <!-- <script src="/resources/script/script_Reserve2.js"></script> -->
<script>

	var rListArray = new Array() ;
	var rListData;
	var rListjsonData;
	
    function resvRoomList(){
    	console.log("resvRoomList 함수 실행")
		let url = $(location).attr('href'); 
		let hCode = url.split("?hCode=").reverse()[0];
		hCode = hCode.split("&")[0];
		
    	pattern="/resvRoomList";
    	let data={};
    	data.hCode = hCode;
    	//console.log(data.hCode);
    	
    	sendServer(pattern,data);    	
    }
	
	function sendServer(pattern, data){	       
        //console.log("sendServer에 들어옴");	   
        
        $.ajax({
            url:pattern,
            type:"get",
            data:data,
            dataType:"JSON",
            success:function(data){

            	let dataJSON = JSON.stringify(data);
            	
		    	if(pattern == "/resvRoomList") {
			    	
			    	console.log("success ====> 1. resvRoomList" );
			    	
			    	
			    	for(let i=0; i<data.length; i++){
			    		//console.log(i);
				    	$("th.leftTxt").append("<span style='font-size:12px'>"+data[i].rName+"</span><br>");
				    	
				    	rListData = new Object() ;
							
				    	rListData.rName = data[i].rName;
				    	rListData.rCode = data[i].rCode;
				    	rListData.hCode = data[i].hCode;
							
				    	
						rListArray.push(rListData) ;
			    	}
			    	rListjsonData = JSON.stringify(rListArray) ;
		    		
		    	} else if(pattern == "/resvRoomCnt"){
			    	
			    	console.log("success ====> 2. resvRoomCnt" );
			    	
			    	//console.log("dataJSON : "+dataJSON);
			    	
			    	let resvCnt = parseInt(data.resvCnt);
			    	let totCnt = parseInt(data.totCnt);
			    	
			    	$("b#"+data.resev_start).after(
			    			"<br><button class='resvBtn' name='rCode' value='"+data.rCode+"'>예약하기("+(totCnt-resvCnt)+" / "+totCnt+")</button>"
			    			+"<input type='hidden' class='resev_start' name='resev_start' value='"+data.resev_start+"'>"
			    			+"<input type='hidden' value='"+data.hCode+"'>");
			    	
			    }		    	
		    	
            },error:function(error){
                console.log(error);
                console.log("요청에 실패 했습니다.");
            }
        })
        
    }
	
	function endDate(resev_start){
		//console.log("예약마감 텍스트 함수 실행");
		
		for (var i = 0; i < rListArray.length; i++) {
			$("b#"+resev_start).after("<br><span class='resvTxt'>예약마감</span>");
    	}
		
	}
	
	function resvRoomCnt_data(resev_start){
		let rCode;
		
    	console.log("resvRoomCnt_data 시작 : " + resev_start);
    	//console.log(rListArray.length);
    	
    	for (var i = 0; i < rListArray.length; i++) {
    		
    		rCode = rListArray[i].rCode;
    		hCode = rListArray[i].hCode;
    	    //console.log(i+" 배열d : "+rCode);
    	
    		resvRoomCnt(hCode, rCode, resev_start);
    	}
    }
	
	function resvRoomCnt(hCode, rCode, resev_start){
		console.log("resvRoomCnt 함수 실행");
    	pattern="/resvRoomCnt";
    	let data={};
    	data.rCode = rCode;
    	data.resev_start = resev_start;
    	data.hCode = hCode;
    	//console.log(data);
    	
    	sendServer(pattern,data);    	
    }
	
	resvRoomList(()=>{
				endDate(()=>{
							resvRoomCnt_data();
				});
	});
	
</script>
</head>
<body onload='pageLoading();'>
    <div id="wrap">
    	<input type="hidden" id="loginID" value="<%= uId_Session %>">
    	
    	<!--  헤더템플릿 -->    	
		<c:import url="/WEB-INF/views/common/header.jsp" />
    	
    	
    	<main id="main">
    		
   			<h1>예약 현황</h1>
   			
    		<!-- 호텔 메뉴 Area -->
    		<div id="hotelMenu">
   			
   				<ul id="hotelList" class="dFlex">
   					<c:forEach var="hList" items="${HList}" varStatus="status">
   						<c:if test="${status.index%10 == 0 }">
   							</ul>
   							<ul class="dFlex">
   						</c:if>
  						<li id="${hList.hCode}"><a href="/resvHome?hCode=${hList.hCode}&year=<%=year%>&month=<%=month%>">${hList.hName}</a></li>
   					</c:forEach>
    			</ul>
    		</div>
    		
    		<!-- 년, 월 및 달력 넘기기 표시 -->
    		<div id="nowMonthArea" class="dFlex">
    		
    			<div id="nowYearMonth">
	    			<!-- 이전해 -->
	    			<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year-1%>&amp;month=<%=month%>" target="_self">
						<b class="ltGtTxt">&lt;&lt;</b>
					</a>
					<!-- 이전달 -->
					<%
					String nowMonth1 = Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
					if(month > 0 ){ %>
					<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year%>&amp;month=<%=month-1%>" target="_self">
						<b class="ltGtTxt">&lt;</b>
					</a>
					<%} else {%>
					<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year-1%>&amp;month=11" target="_self">
						<b class="ltGtTxt">&lt;</b>
					</a>
					<%} %>
					
					&nbsp;&nbsp;
					<b class="yearTxt"><%=year%> 년</b>
					&nbsp;&nbsp;
					<b class="monthTxt"><%=nowMonth1%> 월</b>
					&nbsp;&nbsp;
					
					<!-- 다음달 -->
					<%if(month < 11 ){ %>
					<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year%>&amp;month=<%=month+1%>" target="_self">
						<b class="ltGtTxt">&gt;</b>
					</a>
					<%}else{%>
					<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year+1%>&amp;month=0" target="_self">
						<b class="ltGtTxt">&gt;</b>
					</a>
					<%} %>
					<!-- 다음해 -->
					<a href="<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year+1%>&amp;month=<%=month%>" target="_self">
						<b class="ltGtTxt">&gt;&gt;</b>
					</a>
    			</div>
				
				<div id="todayBtn">
					<input type="button" onclick="javascript:location.href='<c:url value='/resvHome' />?hCode=<%= hCode %>&amp;year=<%=year%>&amp;month=<%=month%>'" value="today"/>				
				</div>
    		</div>
    		
    		<!-- 달력 Area -->
    		<div id="resvCal">
    		
<form name="calendarFrm" id="calendarFrm" action="" method="post">

	<div id="content" style="width:100%;">
		<!--날짜 네비게이션  -->
		
		<br>
		<table id="calResvArea" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
			<caption>회원정보 <b><%= uId_Session %></b> 님</caption>
			<thead>
				<tr bgcolor="#CECECE">
					<th width='180px'>객실구분</th>
					<th width='115px'><font color="red">일</font></th>
					<th width='115px'>월</th>
					<th width='115px'>화</th>
					<th width='115px'>수</th>
					<th width='115px'>목</th>
					<th width='115px'>금</th>
					<th width='115px'><font color="#529dbc">토</font></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th class='leftTxt'>
						<br>		
		  			</th>	
		 <%
		//처음 빈공란 표시
		for(int index = 1; index < start ; index++ ) {
		  out.println("<TD >&nbsp;</TD>");
		  newLine++;
		}
		
		for(int index = 1; index <= endDay; index++) {
			String nowMonth = Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
			String nowDay = Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);
			
			String resev_start = year+"-"+nowMonth+"-"+nowDay;
			String color = "";
			
			if(newLine == 0){			color = "RED";
			}else if(newLine == 6){ 	color = "#529dbc";
			}else{						color = "BLACK"; };
		
			String sUseDate = Integer.toString(year);
		
			sUseDate += nowMonth;
			sUseDate += nowDay;
		
			int iUseDate = Integer.parseInt(sUseDate);
			
			//out.print("year : "+ year + " / month : " + month + " / index : "+index);
			
			
			String backColor = "#fff";
			if(iUseDate == intToday ) {
				//out.print("intToday : "+intToday);	// 20220929
				//out.print("iUseDate : "+iUseDate);	// 20220929
				backColor = "#d7dbab";
			} 
			%>
			<td valign='top' align='left' height='100px' bgcolor='<%=backColor %>' nowrap>
				

					<%
						if(iUseDate < intToday){
					%>
							<b id="<%=resev_start%>" class="past" style="color:<%=color%>"><%=index %></b><br>
						 	<script>endDate('<%=resev_start%>')</script>
				  	<%
						} else {
					%>
							<b id="<%=resev_start%>" class="forword" style="color:<%=color%>"><%=index %></b><br>
							<script>resvRoomCnt_data('<%=resev_start%>')</script>
					<%	
						}
					%>
					
					
			</td>
			<%
			newLine++;
		
			if(newLine == 7) {
			  out.println("</tr>");
			  if(index <= endDay) {
			      out.println("<tr>");
			  	  // 객실구분 td 공란 만들기
				  out.println("<th class='leftTxt'><br>");
			 			  	  
				  out.println("</th>");
			  }
			  newLine=0;
			}
		}
		//마지막 공란 LOOP
		while(newLine > 0 && newLine < 7) {
		  out.println("<td>&nbsp;</td>");
		  newLine++;
		}
		%>
		</tr>
		
		</tbody>
		</table>
	</div>
</form>
    		</div>
    		
    		<!-- 실제 작업 영역 끝 -->
    		    	
    	</main>
    	<!--  main#main  -->
    
        	   	
    	<!--  푸터템플릿 시작 -->
		<div id="footerWrap">
	
	       <c:import url="/WEB-INF/views/common/footer.jsp" />
	    </div>
    	<!--  푸터템플릿 끝 -->  
        
    </div>
    <!-- div#wrap -->
    
</body>
    <script>	resvRoomList()</script>	

</html>