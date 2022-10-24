$(document).ready(function(){
	
	//////////////////////////////////////////////////////////////////////
	// 지도 생성
	/////////////////////////////////////////////////////////////////////
	var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(35.1885981, 129.2148556), 
        level: 3 
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);

	//////////////////////////////////////////////////////////////////////
	// 항목에 따른 이벤트 (지도 이동) 및 마커 생성
	/////////////////////////////////////////////////////////////////////
	
	// 오시리아 
	$("ul#directionList>li:nth-child(1)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(35.1885981, 129.2148556);
		map.panTo(moveLatLon);
		//맵 이동
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(35.1885981, 129.2148556); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 여수 벨메르
	$("ul#directionList>li:nth-child(2)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(34.7431223, 127.6722439);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(34.7431223, 127.6722439); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 브리드 호텔 양양
	$("ul#directionList>li:nth-child(3)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(37.9707867,128.761887);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(37.9707867,128.761887); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 더 플라자
	$("ul#directionList>li:nth-child(4)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(37.56445602268097,126.97783194686578);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(37.56445602268097,126.97783194686578); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 사이판
	$("ul#directionList>li:nth-child(5)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(15.1559358,145.6973998);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(15.1559358,145.6973998); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 설악 쏘라노
	$("ul#directionList>li:nth-child(6)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(38.21023822268097,128.52823674674642);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(38.21023822268097,128.52823674674642); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 거제 벨버디어
	$("ul#directionList>li:nth-child(7)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(35.00768602268097,128.71091136713744);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(35.00768602268097,128.71091136713744); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 경주
	$("ul#directionList>li:nth-child(8)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(35.8114236,129.1824938);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(35.8114236,129.1824938); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 대천 파로스
	$("ul#directionList>li:nth-child(9)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(36.304569,126.5198815);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(36.304569,126.5198815); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 산정호수 안시
	$("ul#directionList>li:nth-child(10)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(38.06537562268097,127.31421580100582);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(38.06537562268097,127.31421580100582); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 설악 별관
	$("ul#directionList>li:nth-child(11)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(38.203759322680966,128.5356509671328);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(38.203759322680966,128.5356509671328); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 용인 베잔송
	$("ul#directionList>li:nth-child(12)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(37.13143222268097,127.14392355262547);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(37.13143222268097,127.14392355262547); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 제주
	$("ul#directionList>li:nth-child(13)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(33.44881352268097,126.63719629732262);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(33.44881352268097,126.63719629732262); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 평창
	$("ul#directionList>li:nth-child(14)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(37.57865542268096,128.33143620357234);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(37.57865542268096,128.33143620357234); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 해운대
	$("ul#directionList>li:nth-child(15)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(35.15431312268097,129.1448818718499);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(35.15431312268097,129.1448818718499); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
	
	// 백암온천
	$("ul#directionList>li:nth-child(16)").click(function() {
		var moveLatLon = new kakao.maps.LatLng(36.72242162268097,129.33804236054345);
	    map.panTo(moveLatLon);
		$(this).attr("class","selectedMap");
		$("ul#directionList>li").not(this).attr("class", "");
	});
	var markerPosition  = new kakao.maps.LatLng(36.72242162268097,129.33804236054345); 
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	marker.setMap(map);
})