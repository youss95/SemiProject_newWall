<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2조 세미 프로젝트</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">

<script>
	$(function() {
		$(".writeBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/newsWrite.news";
		})
	})
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="news_list">
					<div class="list_wrap">
						<c:forEach var="newsAll" items="${newsAll}">
							<div class="item">
								<a href="${pageContext.request.contextPath}/newsView.news?news_seq=${newsAll.news_seq}">
									<div class="img_wrap">
<%-- 										<img src="${pageContext.request.contextPath}/resources/images/bannerImg.png"> --%>
											<img src="${pageContext.request.contextPath}/upload/news/${newsAll.news_photo}">
									</div>
									<div class="txt">
										<ul>
											<li class="date">등록일 : ${newsAll.news_reg_date}</li>
											<li class="view">조회수 : ${newsAll.news_view}</li>
										</ul>
										<h2>${newsAll.news_title}</h2>
										<p>${newsAll.news_sub_contents}</p>
									</div>
								</a>
							</div>
						</c:forEach>
						<div class="board_page">
							<div class="bt_wrap">
								<button class="writeBtn">
									<i class="far fa-edit"></i>글쓰기
								</button>
							</div>
							<c:forEach var="i" items="${navi}" varStatus="s">
								<c:choose>
									<c:when test="${i == '>'}">
										<a
											href="${pageContext.request.contextPath}/newsBoard.news?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">${i}</a>
									</c:when>
									<c:when test="${i == '<'}">
										<a
											href="${pageContext.request.contextPath}/newsBoard.news?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}">${i}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/newsBoard.news?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>

</body>
</html>