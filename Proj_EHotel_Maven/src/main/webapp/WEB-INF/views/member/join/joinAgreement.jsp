<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입동의</title>
<link rel="stylesheet" href="/resources/style/style_userJoin.css">
<link rel="stylesheet" href="/resources/style/style_common.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_userJoin.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<div id="wrap" class="agreement">


		<ul id="progress" class="dFlex">
			<li class="check">약관 동의</li>
			<li>정보 입력</li>
			<li>가입 완료</li>
		</ul>

		<main id="main" class="dFlex">

			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="joinAgree">

				<div id="chkAllArea">
					<label> <input type="checkbox" id="chkAll"> 이용약관 및
						개인정보수집 및 이용, 이벤트 정보 수신(선택)에 모두 동의합니다.
					</label>
				</div>

				<div id="licenseArea">

					<div class="termArea">
						<h3>[필수] 이용약관 동의</h3>
						<!--  iframe, textarea, div 중 선택하여 제작한다. -->
						<iframe src="/WEB-INF/views/member/ind/uA" class="usingAgree"></iframe>
						<br> <label> 이용약관에 동의하십니까? <input type="checkbox"
							class="usingAgreeChk chkRequired" data-link="0"> 동의함 (필수)
						</label>
					</div>

					<div class="termArea">
						<h3>[필수] 개인정보 수집 및 이용 동의</h3>
						<iframe src="/WEB-INF/views/member/ind/pA.jsp" class="usingAgree"></iframe>
						<br> <label> 개인정보 수집 및 이용에 동의하십니까? <input
							type="checkbox" class="usingAgreeChk chkRequired" data-link="1">
							동의함 (필수)
						</label>
					</div>

					<div class="termArea">
						<h3>[선택] 이벤트 정보 수신 동의</h3>
						<iframe src="/WEB-INF/views/member/ind/sA.jsp" class="usingAgree"></iframe>
						<br> <label> 이벤트 정보 수신에 동의하십니까? <input
							type="checkbox" class="usingAgreeChk" data-link="2"> 동의함
							(선택)
						</label>
					</div>

				</div>
				<!--  div#licenseArea -->


			</div>
			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->

		<form id="agreementFrm" action="/joinFrm">
			<input type="hidden" name="vCode" value="chkOK1234">
			<div id="formArea">
				<button type="button">회원가입</button>
			</div>

		</form>
		<!--  form#joinFrm -->

	</div>
	<!-- div#wrap -->

	<c:import url="/WEB-INF/views/common/footer.jsp" />


</body>

</html>