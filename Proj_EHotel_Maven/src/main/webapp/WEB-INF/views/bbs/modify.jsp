<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
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
			<span onclick="location.href='/bbs/list">Q&A</span><br> <span
				onclick="location.href='/bbs/faq">FAQ</span>
		</div>

		<main id="main" class="dFlex">

			<div id="contents" class="bbsWrite">

				<h2>문의글 수정</h2>
				<hr>
				<form method="post">
					<table id="memberTbl">
						<tbody>
							<tr>
								<th>문의유형</th>
								<td>
									<select name="txtType" id="txtType" value="${data.txtType}">
											<option>선택</option>
											<option value="예약문의">예약문의</option>
											<option value="기타">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td>${sessionuid}</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="name" id="name" maxlength="50"
									       value="${data.name}">
								</td>
								
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" name="subject" id="subject" maxlength="50"
										 value="${data.subject}">
								</td>
								
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<input type="text" name="content" id="content" maxlength="50"
										 value="${data.content}">
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div id="btn">
					<button id="updateBtn" class="regBtn"
						onclick="location.href='/bbs/update?no=${data.no}'">수정</button>
					<button id="listBtn" class="regBtn"
						onclick="location.href='/bbs/list'">목록</button>
				</div>
			</div>
		</main>
	</div>
	<div id="footerWrap">

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
</body>
</html>