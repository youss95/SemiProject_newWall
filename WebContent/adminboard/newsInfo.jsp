<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자페이지</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded">
					<div class="title_area">
						<h2>뉴스</h2>
					</div>
					<div class="contents news_list">
						<table class="table table-hover text-center">
							<colgroup>
								<col width="10%">
								<col width="60%">
								<col width="10%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>작성일</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${newsAll}" varStatus="vs">
									<tr>
										<td>${rowNum -(cpage-1)*10 - vs.index}</td>
										<td><a class="t_link" href="${pageContext.request.contextPath}/newsInfoView.newsAdm?news_seq=${i.news_seq}">${i.news_title}</a></td>
										<td>${i.news_writer}</td>
										<td>${i.news_reg_date}</td>
										<td>${i.news_view}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="btn_wrap" style="text-align : right;">
							<a href="${pageContext.request.contextPath}/adminboard/newsInfoWrite.jsp" class="btn_m btn_default">글쓰기</a>
						</div>
						
						<div class="page_nav">
						<c:forEach var="i" items="${navi}" varStatus="s">
							<c:choose>
								<c:when test="${i == '>'}">
									<a
										href="${pageContext.request.contextPath}/newsInfo.newsAdm?cpage=${navi[s.index-1]+1}">${i}</a>
								</c:when>
								<c:when test="${i == '<'}">
									<a
										href="${pageContext.request.contextPath}/newsInfo.newsAdm?cpage=${navi[s.index+1]-1}">${i}</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/newsInfo.newsAdm?cpage=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					</div>
				</section>
				
			</div>
		</div>
	</div>
	
</body>

</html>s