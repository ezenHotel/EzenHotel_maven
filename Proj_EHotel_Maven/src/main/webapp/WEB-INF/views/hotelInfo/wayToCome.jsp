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
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8748a164bec19361e022336c9a56a682"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c1d369b7687832ffae937bd2fd7cb6f"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1612ab19b3ae7d6f18d853f2918d5817"></script>

</head>
<script src="/resources/script/script_hotelInfo.js"></script>
<body>

	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div id="hotelInfoWrap">

		<div class="head">
			<h1>
				<i class="fa-solid fa-location-dot"></i>오시는 길
			</h1>
			<hr>
		</div>

		<section>
			<p>이젠 호텔로 오시는 길을 안내해 드립니다</p>
			<p>실내 수영장, 피트니스, 스크린골프 등 다양한 피트니스 시설을 갖춘 웰니스 센터에서는 전문적인 퍼스널 트레이닝
				시스템을 통해 스마트한 라이프 스타일을 경험하실 수 있으며, 도심 속 휴양지 어반 이스케이프에서는 도심 속 자연을 느끼며
				여유로운 휴식을 만끽하실 수 있습니다. 친환경, 스마트 그리고 럭셔리의 모든 가치를 겸비하고 있는 이젠 호텔은 여행과
				출장을 위해 방문한 모든 분들을 위한 최적의 공간입니다. 세심하고 품격 있는 서비스를 통해 고객 여러분의 모든 순간을
				특별한 순간으로 이루어드립니다.</p>
		</section>

		<div id="mapContainer">
			<ul id="directionList" class="dFlex">
				<li class="selectedMap">MATIE Osiria</li>
				<li>여수 벨메르</li>
				<li>브리드호텔 양</li>
				<li>더 플라자</li>
				<li>사이판</li>
				<li>설악 쏘라노</li>
				<li>거제 벨버디어</li>
				<li>경주</li>
				<li>대천 파로스</li>
				<li>산정호수 안시</li>
				<li>설악 별관</li>
				<li>용인 베잔송</li>
				<li>제주</li>
				<li>평창</li>
				<li>해운대</li>
				<li>백암온천</li>
			</ul>

			<div id="map" class="map"></div>

		</div>

		<div id="sideInfoContainer">

			<table>
				<caption>대중교통</caption>
				<tr>
					<th>구분</th>
					<th>도착지</th>
				</tr>
				<tr>
					<td>지하철</td>
					<td>시청역(1호선/2호선)에서 하차, 6번 출구에서 도보 1~2분 거리</td>
				</tr>
				<tr>
					<td>버스</td>
					<td>서울시청 앞 정류소 하차</td>
				</tr>
			</table>

			<table>
				<caption>공항에서 오실 때</caption>
				<tr>
					<th colspan="2">구분</th>
					<th>인천국제공항</th>
					<th>김포국제공항</th>
				</tr>
				<tr>
					<td rowspan="4">리무진</td>
					<td>노선번호</td>
					<td>Kal 리무진(6701번)</td>
					<td>공항리무진(6021번)</td>
				</tr>
				<tr>
					<td>요금</td>
					<td>16,000원(편도)</td>
					<td>7,000원(편도)</td>
				</tr>
				<tr>
					<td>소요시간</td>
					<td>약 1시간 30분</td>
					<td>약 1시간 (명동 이비스호텔 앞 하차)</td>
				</tr>
				<tr>
					<td>운행시간</td>
					<td>04:50~22:49 (공항 → 호텔) <br> 05:00~18:35 (호텔 → 공항)
					</td>
					<td>05:00~23:10 (공항 → 명동 이비스) <br> 05:45~20:40 (명동 이비스 →
						공항)
					</td>
				</tr>
				<tr>
					<td rowspan="2">지하철</td>
					<td>노선</td>
					<td>공항철도 탑승 → 서울역 1호선 환승 <br> → 시청역 하차
					</td>
					<td>공항철도 탑승 → 서울역 1호선 환승 <br></br> → 시청역 하차
					</td>
				</tr>
				<tr>
					<td>소요시간</td>
					<td>약 1시간 10분</td>
					<td>약 35분</td>
				</tr>
				<tr>
					<td rowspan="2">택시</td>
					<td>요금</td>
					<td>약75,000원(일반) / 약95,000원(모범)</td>
					<td>약35,000원(일반) / 약45,000원(모범)</td>
				</tr>
				<tr>
					<td>소요시간</td>
					<td>약 50분</td>
					<td>약 30분</td>
				</tr>
			</table>

		</div>

	</div>
	<!-- div#wrap -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>