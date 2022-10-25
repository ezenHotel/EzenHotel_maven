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
</head>
<body>

	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<div id="hotelInfoWrap">

		<div class="head">
			<h1>
				<i class="fa-solid fa-address-book"></i>지점별 연락처
			</h1>
			<hr>
		</div>

		<section class="contactSection">
			<p>
				고객의 입장에서 이젠이 제공할 수 있는 최고의 서비스 이행표준을 설정하고<br>이를 성실히 이행할 것을
				약속드립니다.
			</p>
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
		</div>

		<div id="contactInfoContainer">

			<table>
				<tr>
					<th>예약문의</th>
					<td><b>TEL</b><span class="contactNumber">+82-2-3213-1111</span>
						<br> <b>E-MAIL</b><span class="contactMail">rsv.signiel.seoul@lotte.net</span>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<th>다이닝</th>
					<td><b>풀 바</b> <br> <b>TEL</b><span>+82-51-922-1256</span>
					</td>
					<td><b>더 뷰</b> <br> <b>TEL</b><span>+82-51-922-1230</span>
						<br> <b>FAX</b> <span>+82-2-319-9996</span></td>
					<td><b>인룸다이닝</b> <br> <b>TEL</b> <span>+82-2-922-1220</span></td>
				</tr>
				<tr>
					<th></th>
					<td><b>더 라운지</b> <br> <b>TEL</b><span>+82-51-922-1256</span>
					</td>
					<td><b>Pastry Salon</b> <br> <b>TEL</b><span>+82-51-922-1212~3</span>
						<br> <b>FAX</b> <span>+82-51-922-1212~3</span></td>
					<td><b>차오란</b> <br> <b>TEL</b> <span>+82-51-922-1250</span>
						<br> <b>FAX</b> <span>+82-2-319-9996</span></td>
				</tr>
			</table>
			<table>
				<tr>
					<th>웨딩&컨벤션</th>
					<td><b>프라이빗 파티</b> <br> <b>TEL</b> <span>+82-2-3213-1776</span>
					</td>
					<td><b>시그니엘 웨딩</b> <br> <b>TEL</b> <span>+82-2-3213-1777</span>
					</td>
					<td><b>그랜드 볼룸</b> <br> <b>TEL</b> <span>+82-2-3213-1776</span></td>
				</tr>
				<tr>
					<th></th>
					<td><b>스튜디오 I-IV</b> <br> <b>TEL</b> <span>+82-2-3213-1776</span>

						<br> <b>FAX</b> <span>+82-2-411-7455</span></td>
					<td><b>시그니엘 포이어</b> <br> <b>TEL</b> <span>+82-2-3213-1776</span>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<th>편의시설</th>
					<td><b>피트니스센터</b> <br> <b>TEL</b> <span>+82-2-3213-1372</span>
					</td>
					<td><b>호텔 사우나</b> <br> <b>TEL</b> <span>+82-2-3213-1372</span>
					</td>
					<td><b>호텔 수영장</b> <br> <b>TEL</b> <span>+82-2-3213-1372</span></td>
				</tr>
				<tr>
					<th></th>
					<td><b>살롱 드 시그니엘</b><br> <b>TEL</b> <span>+82-2-3213-1324</span></td>
					<td><b>미팅룸</b> <br> <b>TEL</b> <span>+82-2-3213-1324</span>
					</td>
				</tr>
			</table>

		</div>

	</div>
	<!-- div#wrap -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>
</html>