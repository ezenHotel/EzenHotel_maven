<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/resources/style/style_bbs.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/resources/script/script_bbs.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div id="wrap" class="dFlex">


		<div id="Menu">
			<h2>고객센터</h2>
			<hr>
			<span onclick="location.href='/bbs/list'">Q&A</span><br> <span
				onclick="location.href='/bbs/faq'">FAQ</span>
		</div>

		<main id="main" class="dFlex">

			<div id="contents" class="bbsWrite">
				<h2>FAQ</h2>
				<hr>
				<div class="multiTB all">
						<ul>
							<li id="faqHr" class="dFlex">
								<span id="faqHrType">구분</span>
								<span id="faqHrTitle">제목</span>
							</li>
						</ul>
					
						<ul>
							<li class="menu" id="room">
	                            <span class="faqType">객실</span>
	                            <span class="faqTitle">객실에서 인터넷을 사용할 수 있을까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu room">
	                            <span class="faqType">객실</span>
	                            <span class="faqTitle">체크인과 체크 아웃 시간은 언제입니까?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                         <li class="menu reserve">
	                            <span class="faqType" >예약</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu reserve">
	                            <span class="faqType">예약</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        
	                       <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                        <li class="menu etc">
	                            <span class="faqType">기타</span>
	                            <span class="faqTitle">체크인 전에 부대시설 이용 가능할까요?</span>
	                            <img src="/resources/images/ico_down.png" art="아이콘이미지">
	                            <ul class="hide">
	                            	<li class="reply">답변</li>
	                            </ul>
	                        </li>
	                        
	                    </ul>
					</div>
				
			</div>
		</main>
	</div>
		<div id="footerWrap">

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>