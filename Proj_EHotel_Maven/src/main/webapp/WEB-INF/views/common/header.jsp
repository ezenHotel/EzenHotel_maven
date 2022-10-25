<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/style_common.css">
</head>
<body>
	<div id="headerWrap">
		<header id="header" class="dFlex">
			<div id="leftGNB">
				<ul class="dFlex">
					<li class="bar" onclick="location.href='/hotelInfo/hotelInfo.jsp'">호텔소개</li>
					<li class="bar" onclick="location.href='/bbs/list.jsp'">고객센터</li>
				</ul>
			</div>
			<div id="logoBox">
				<img src="/resources/images/logo2.png" alt="logo"
					onclick="location.href='/'">
			</div>
			<div id="rightGNB">
				<ul class="dFlex">
					<c:choose>
						<c:when test="${isLogin==null}">
							<li class="bar"
								onclick="location.href='/reserve/reserve.jsp?hCode=H01'">예약하기</li>
							<li class="bar" onclick="location.href='/join'">회원가입</li>
							<li>
								<button type="button" onclick="location.href='/login'">로그인</button>
							</li>
						</c:when>
						<c:otherwise>
							<li class="bar"
								onclick="location.href='/reserve/reserveConfirm.jsp?chkBtn=now'">예약확인</li>
							<li class="bar" onclick="location.href='/logout'">로그아웃</li>
							<li><button type="button"
									onclick="location.href='/mypage'">MY페이지</button></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>

		</header>

		<div id="floatMenu">
			<ul>
				<li onclick="location.href='/hotelInfo/wayToCome.jsp'"><span>오시는길</span>
					<i class="fa-solid fa-location-dot"></i></li>
				<li onclick="location.href='/hotelInfo/contact.jsp'"><span>연락처</span>
					<i class="fa-solid fa-phone"></i></li>
				<li onclick="location.href='https://www.tistory.com'"><span>블로그</span>
					<i class="fa-solid fa-blog"></i></li>
			</ul>
		</div>

	</div>
	<!-- div#wrap -->

</body>
</html>