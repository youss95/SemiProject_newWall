<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<jsp:include page="../layout/jsp/commonModal.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="review_list">
					<div class="title">
						<h2>입양 후기</h2>
						<p>뉴월을 통해 입양하신 분들은 누구나! <em>입양후기</em>를 올려주세요.<br> 가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</p>
					</div>
					<div class="search_box">
						<form action="${pageContext.request.contextPath}/reviewList.apt" method="post">
							<div class="inp_slct">
								<select name="category" id="">
									<option value="">선택</option>
									<option value="title">글제목</option>
									<option value="writer">작성자</option>
									<option value="introduce">소개글</option>
									<option value="contents">글내용</option>
								</select>
							</div>
							<input type="text" class="inpform" placeholder="검색하실 내용을 입력하세요." name="inp_contents">
							<button class="btn_m btn_default">검색</button>
							<input type="hidden" name="cpage" value="1">
						</form>
						
					</div>
					<div class="list_wrap">
						<c:choose>
							<c:when test="${list.size() == 0}">
								<p class="nodata">검색결과가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${list}">
									<div class="item">
										<a href="${pageContext.request.contextPath}/reviewDetail.apt?review_seq=${i.review_seq}">
											<div class="img_wrap">
												<img src="${pageContext.request.contextPath}/upload/review/${i.review_thumbnail}">
											</div>
											<div class="txt">
												<ul>
													<li class="date">등록일 : ${i.reg_date}</li>
													<li class="view">조회수 : ${i.review_view }</li>
													<li class="like">좋아요 : ${i.review_like }</li>
												</ul>
												<h2>${i.review_title }</h2>
												<p>${i.review_introduce }</p>
												<span class="writer">작성자 : ${i.review_writer }</span>
											</div>
										</a>
									</div> 
								
								</c:forEach>
							</c:otherwise>
						</c:choose>
							
					</div>
					
					<c:choose>
						<c:when test="${adopt_chk > 0}">
							<div class="btn_wrap">
								<button type="button" class="btn_m btn_line" id="btn_write" style="float:right;">후기 작성</button>
							</div>
						</c:when>
					</c:choose>

					<div class="page_nav">
						<c:forEach var="i" items="${navi}" varStatus="s">
							<c:choose>
								<c:when test="${i == '>'}">
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${navi[s.index-1]+1}&category=${category}&inp_contents=${contents}">${i}</a>
								</c:when>
								<c:when test="${i == '<'}">
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${navi[s.index+1]-1}&category=${category}&inp_contents=${contents}">${i}</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${i}&category=${category}&inp_contents=${contents}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div> 
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<jsp:include page="/layout/jsp/modal.jsp"></jsp:include> 
	<script>
		$(function(){
			$('#btn_write').on('click', function(){
				location.href = "adopt/reviewWrite.jsp";
			});
		})
	</script>
</body>
</html>