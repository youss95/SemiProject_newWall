<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="notice_list">
					<div class="news_wrap">
						<div class="board_title">
							<strong>뉴스</strong>
						</div>
						<div class="news_view_wrap">
							<div class="title">${newsView.news_title}</div>
							<c:forEach var="file" items="${flist}">
								<div class="file">
									<a
										href="download.file?seq=${file.seq}&sysname=${file.sysName}&oriname=${file.oriName}">${file.oriName}</a>
								</div>
							</c:forEach>
							<div class="info">
								<dl>
									<dt>글쓴이</dt>
									<dd>${newsView.news_writer}</dd>
								</dl>
								<dl>
									<dt>작성일</dt>
									<dd>${newsView.news_reg_date}</dd>
								</dl>
								<dl>
									<dt>조회수</dt>
									<dd>${newsView.news_view}</dd>
								</dl>
							</div>
							<div class="cont">${newsView.news_contents}</div>
						</div>
						<div class="news_bt_wrap">
							<a href="" class="btn_s btn_light">목록</a> <a href=""
								class="btn_s btn_primary" id="newsmodify">수정</a> <a href=""
								class="btn_s btn_default" id="newsdelete">삭제</a>

						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<!-- 부트스트랩 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>