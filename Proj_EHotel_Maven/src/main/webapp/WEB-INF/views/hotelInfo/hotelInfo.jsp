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
<link rel="stylesheet" href="/resources/style/style_hotelInfo.css">
</head>
<body>

	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<div id="hotelInfoWrap">

		<div class="head">
			<h1>
				<i class="fa-solid fa-list"></i>호텔 소개
			</h1>
			<hr>
		</div>

		<section>
			<p>우리는 우리와 함께하는 모든 사람들이 명실공히 최고가 될 수 있도록 배려하고자 합니다.</p>
			<p>이젠은 계속 성장해 나가는 과정에서 가장 중요한 부분, 즉 사람을 소홀히 하지 않습니다. 이젠은 가족이 세운
				기업입니다. 동료가 친구가 되는 일터입니다. 우리는 매일 고객을 배려합니다. 배려는 이젠 비즈니스의 핵심이며, 이 특별한
				고객 환경이야말로 이젠이 세계 최고의 호텔 브랜드로 손꼽히는 비결입니다.</p>
		</section>
		<section>
			<div class="inner dFlex">
				<div class="tArea">
					<p>우리는 가족</p>
					<p>가족주의 기업 이젠의 역사는 1957년 기업가 제이 프릿츠커가 원 이젠 하우스 모텔을 인수하면서
						시작되었습니다. 프릿츠커와 그의 형제 도널드는 무엇보다 가족과 배려가 중요하다는 믿음으로 함께 이젠 브랜드를 키워
						냈습니다. 2021년 12월 31일 기준으로 이젠의 포트폴리오에는 6개 대륙 70개 국가의 1,150여 개 호텔 및
						올인클루시브 호텔이 포함되었으며.</p>
					<button type="button">이젠의 뿌리 살펴보기</button>
				</div>
				<div>
					<img src="/resources/images/info_image_01.jpg" alt="">
				</div>
			</div>
		</section>
		<section>
			<div class="inner dFlex">
				<div>
					<img src="/resources/images/info_image_02.jpg" alt="">
				</div>
				<div class="tArea">
					<p>지역사회 배려</p>
					<p>이젠이 보유한 기업의 사회적 책임 플랫폼인 이젠 스라이브(Ezen Thrive)를 소개합니다. 이젠에서는
						배려라는 목적이 책임 이행의 진로를 결정합니다. 이젠은 탄탄한 지역사회를 구축하고 지속 가능한 사례를 장려하여 사람들이
						번영하는 환경을 조성하고자 노력하고 있습니다. 연결성 및 여행 수준이 더욱 높아진 세계가 바라는 요구를 충족하고자 활동
						무대를 확장해 나가는 동안, 이젠에는 목적에 맞추어 성장하고 후대를 위해 환경을 보호할 기회와 책임이 있습니다.</p>
					<button type="button">이젠의 번영 현황 보기</button>
				</div>
			</div>
		</section>
		<section>
			<div class="inner dFlex">
				<div class="tArea">
					<p>모든 사람이 중요합니다</p>
					<p>70개 국가에 130,000여 명의 직원을 보유한 이젠은 모든 문화, 인종, 민족, 성별, 성적 지향,
						나이, 기술, 관점 및 사고방식을 포용합니다. 이젠의 문화는 개개인이 각자 최고가 되도록 힘을 실어 주는 문화이며,
						이와 같이 진정한 연결이 곧 우리가 서로와 고객을 배려하는 방식에 영감을 줍니다.</p>
					<button type="button">차이 포용</button>
				</div>
				<div>
					<img src="/resources/images/info_image_03.png" alt="">
				</div>
			</div>
		</section>
		<section>
			<div class="inner dFlex">
				<div>
					<img src="/resources/images/info_image_04.jpg" alt="">
				</div>
				<div class="tArea">
					<p>이젠에서 찾는 자신의 자리</p>
					<p>더 큰 세상의 일원이 되십시오. 매일 삶을 만끽하십시오. 주변 사람들의 삶에 변화를 불러오십시오. 일하는
						곳에 애정을 느끼십시오. 존중, 도덕성, 겸손, 공감, 창의성, 즐거움을 중시하는 기업에서 일하십시오. 전 세계를
						망라하는 일자리를 통해 완벽한 기회가 여러분을 기다립니다. 이젠이 꾸준히 세계 최고의 직장으로 선정되는 이유를 확인해
						보십시오.</p>
					<button type="button">모험이 시작되는 곳</button>
				</div>
			</div>
		</section>
		
	</div>
	<!-- div#wrap -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>