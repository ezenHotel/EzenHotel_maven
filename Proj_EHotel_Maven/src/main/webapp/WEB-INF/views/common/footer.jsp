<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/style_common.css">
<script src="https://kit.fontawesome.com/9a2dc8a1b1.js"></script>
</head>
<body>
	<div id="footerWrap">
		<section class="dFlex">
			<ul class="dFlex">
				<li class="icon" onclick="location.href='https://www.facebook.com'"><i
					class="fa-brands fa-facebook-f"></i></li>
				<li class="icon"
					onclick="location.href='https://www.pinterest.co.kr'"><i
					class="fa-brands fa-pinterest-p"></i></li>
				<li class="icon" onclick="location.href='https://www.instagram.com'"><i
					class="fa-brands fa-instagram"></i></li>
				<li class="icon" onclick="location.href='https://twitter.com'"><i
					class="fa-brands fa-twitter"></i></li>
			</ul>
			<ul class="dFlex">
				<li onclick="location.href='/main.jsp'">HOME</li>
				<li onclick="location.href='/hotelInfo/hotelInfo.jsp'">호텔소개</li>
				<li onclick="location.href='/bbs/list.jsp'">고객문의</li>
				<li onclick="location.href='/reserve/reserve.jsp?hCode=H01'">예약하기</li>
				<li onclick="location.href='/reserve/reserveConfirm.jsp'">예약확인</li>
			</ul>
			<ul class="dFlex">
				<li onclick="location.href='/hotelInfo/contact.jsp'">연락처</li>
				<li>|</li>
				<li onclick="location.href='https://www.tistory.com'">블로그</li>
				<li>|</li>
				<li>이용약관</li>
				<li>|</li>
				<li onclick="location.href='/hotelInfo/wayToCome.jsp'">오시는길</li>
			</ul>
		</section>
		<section>
			<p>THE BEST HOSPITALITY COMPANY</p>
			<p>©EZEN HOTEL | ALL RIGHTS RESERVED</p>
		</section>

		<div id="goToTop">
			<i class="fa-solid fa-caret-up"></i>
		</div>

		<script>
		$("div#goToTop").click(function(){
			$("html, body").animate({scrollTop: 0}, "slow");
		});
		
		$(window).scroll(function(){
		let docH = $(document).height();
		let scrollH = $("html, body").scrollTop();
		if(scrollH > docH/4) {
			$("div#goToTop").fadeIn(100);
		}	else {
			$("div#goToTop").fadeOut(100);
		}		
		});
		</script>

	</div>
	<!-- div#wrap -->
</body>
</html>