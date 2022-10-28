<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 작성</title>
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


			<!-- 실제 작업 영역 시작 -->
			<div id="contents" class="bbsWrite">
				<h2>문의하기</h2>
				<hr>
				<form method="post">
					<table>
						<tbody>
							<tr>
								<th>문의유형</th>
								<td>
									<select name="txtType" id="txtType">
											<option>선택</option>
											<option value="예약문의">예약문의</option>
											<option value="기타">기타</option>
									</select>
								</td>
							</tr>

							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="name" id="name" maxlength="50">
								</td>
							</tr>

							<tr>
								<th>제목</th>
								<td>
									<input type="text" name="subject" id="subject" maxlength="50">
								</td>
							</tr>

							<tr>
								<th>내용</th>
								<td>
									<textarea name="content" id="content" cols="60"
											wrap="hard">
									</textarea>
								</td>
							</tr>
							
						</tbody>
					</table>

					<div id="btn">
						<button type="button" id="regBtn">등록</button>
						<button type="button" id="cencelBtn"
							onclick="location.href='/bbs/list'">취소</button>
					</div>
				</form>

			</div>
			<!-- 실제 작업 영역 끝 -->

		</main>
		<!--  main#main  -->

	</div>
	<!-- div#wrap -->
	<div id="footerWrap">

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>

</body>
</html>