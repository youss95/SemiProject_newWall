<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<jsp:include page="../layout/jsp/commonModal.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<script>
	$(function() {
		$(".writeBtn").on("click",function() {
			location.href = "${pageContext.request.contextPath}/noticeWrite.notice";
		})
	})
</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="notice_list">
					<div class="title">
						<h2>공지사항</h2>
						<p>새로운 소식과 이야기를 전합니다</p>
					</div>
					<div class="board_wrap">
						<div class="board_title">
							<form
								action="${pageContext.request.contextPath}/noticeBoard.notice"
								method="get">
								<div class="search">
									<input type="hidden" name="cpage" value=1> 
									<div class="inp_slct">
										<select
											name="category">
											<option value="notice_title">제목</option>
											<option value="notice_writer">작성자</option>
										</select>
									</div>
									 <input type="text" name="keyword" class="inpform" placeholder="검색을 입력하세요.">
									<button class="btn_m btn_default" id="search">검색</button>
								</div>
							</form>
						</div>
						<div class="board_list_wrap">
							<div class="board_list">
								<div class="top">
<!-- 									<div class="num">번호</div> -->
									<div class="title">제목</div>
									<div class="writer">글쓴이</div>
									<div class="date">작성일</div>
									<div class="count">조회</div>
								</div>
								<c:forEach var="noticeAll" items="${noticeAll}">
									<div>
										<input type="hidden" class="num" name="notice_seq" value="${noticeAll.notice_seq}">
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
<!-- 								<div class="bt_wrap"> -->
<!-- 									<button class="writeBtn"> -->
<!-- 										<i class="far fa-edit"></i>글쓰기 -->
<!-- 									</button> -->
<!-- 								</div> -->
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
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<jsp:include page="../layout/jsp/modal.jsp"></jsp:include>
</body>
</html>