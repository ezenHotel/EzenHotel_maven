<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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
				<h2>Q&A</h2>
				<hr>
				<form>
					<table id="boardList">
						<tbody>
							<tr>
								<th>질문유형</th>
								<th>제목</th>
								<th>이름</th>
								<th>날짜</th>
							</tr>
							<c:forEach var="row" items="${data}">
								<tr>
									<td>${row.txtType}</td>
									<td>
										<a id="subjRead" href="/bbs/detail?no=${row.no}&uid=${sessionuid}"> 
										${row.subject}  
										</a>
									</td>
									<td>${row.name} </td>
									<td>${row.regTM} </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
				<div id="btn">
					<button type="button" id="writeBtn" class="regBtn"
						onclick="location.href='/bbs/write'">문의하기</button>
					
				</div>
			</div>
		</main>
	</div>
	<div id="footerWrap">

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	
</body>
</html>