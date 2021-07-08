<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
		$(".writeBtn")
				.on(
						"click",
						function() {
							location.href = "${pageContext.request.contextPath}/noticeWrite.notice";
						})
	})
</script>
</head>
<body>
	<div class="wrap">
		<header class="header">
			<h1 class="logo">
				<a href="#">LOGO IMG</a>
			</h1>
			<div class="gnb">
				<ul class="clear">
					<li class="has"><a href="#">입양하기</a>
						<ul class="s_menu clear adopt">
							<li><a href="#">입양하기</a></li>
							<li><a href="#">입양 후기</a></li>
						</ul></li>
					<li class="has"><a href="#">후원하기</a>
						<ul class="s_menu clear support">
							<li><a href="#">1:1 후원</a></li>
							<li><a href="#">업체 정기 후원</a></li>
							<li><a href="#">임시보호자 지정 후원</a></li>
						</ul></li>
					<li class="has"><a href="#">도움이필요해요</a>
						<ul class="s_menu clear help">
							<li><a href="#">잃어버렸어요</a></li>
							<li><a href="#">보호중이에요</a></li>
						</ul></li>
					<li class="has"><a href="#">뉴스레터</a>
						<ul class="s_menu clear news">
							<li><a
								href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
							<li><a href="news.jsp">소식</a></li>
						</ul></li>
					<!-- <li><a href="#">봉사활동</a></li> 보류 -->
				</ul>
			</div>
			<div class="utils">
				<ul class="clear">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<!-- <li><a href="#">마이페이지</a></li> -->
					<!-- <li><a href="#">로그아웃</a></li> -->
				</ul>
			</div>
			<div class="s_menu_bg"></div>
		</header>
		<div class="container">
			<div class="contents">
				<section>
					<div class="board_wrap">
						<div class="board_title">
							<strong>공지사항</strong>
							<p>새로운 소식과 이야기를 전합니다</p>
							<form
								action="${pageContext.request.contextPath}/noticeBoard.notice"
								method="get">
								<div class="search">
									<input type="hidden" name="cpage" value=1> <select
										name="category">
										<option value="notice_title">제목</option>
										<option value="notice_writer">작성자</option>
									</select> <input type="text" name="keyword" placeholder="검색을 입력하세요.">
									<button class="btn_s btn_line" id="search">검색</button>
								</div>
							</form>
						</div>
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
									<div class="num">번호</div>
									<div class="title">제목</div>
									<div class="writer">글쓴이</div>
									<div class="date">작성일</div>
									<div class="count">조회</div>
								</div>
								<c:forEach var="noticeAll" items="${noticeAll}">
									<div>
										<div class="num">${noticeAll.notice_seq}</div>
										<div class="title">
											<a
												href="${pageContext.request.contextPath}/noticeView.notice?notice_seq=${noticeAll.notice_seq}">${noticeAll.notice_title}</a>
										</div>
										<div class="writer">${noticeAll.notice_writer}</div>
										<div class="date">${noticeAll.notice_reg_date}</div>
										<div class="count">${noticeAll.notice_view}</div>
									</div>
								</c:forEach>
							</div>
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
												href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=${navi[s.index-1]+1}&category=${category}&keyword=${keyword}">${i}</a>
										</c:when>
										<c:when test="${i == '<'}">
											<a
												href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=${navi[s.index+1]-1}&category=${category}&keyword=${keyword}">${i}</a>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=${i}&category=${category}&keyword=${keyword}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<!-- 부트스트랩 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<%-- 	<script src="${pageContext.request.contextPath}/resource/js/common.js"></script> --%>
	<!-- 	<script -->
	<%-- 		src="${pageContext.request.contextPath}/resource/js/jquery-3.6.0.min.js"></script> --%>
</body>
</html>