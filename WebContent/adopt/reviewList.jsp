<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
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
							<input type="text" class="inpform" placeholder="검색하실 내용을 입력하세요.">
							<button class="btn_m btn_default">검색</button>
							<input type="hidden" name="cpage" value="1">
						</form>
						
					</div>
					<div class="list_wrap">
					
						<c:forEach var="i" items="${list}">
							<%-- <tr>
								<td>${rowNum -(cpage-1)*10 - vs.index}</td>
								<td><a class="t_link" href="${pageContext.request.contextPath}/animalInfoDetail.adm?code_seq=${i.code_seq}">${i.code_seq}</a></td>
								<td>${i.an_name}</td>
								<td>${i.an_category}</td>
								<td>${i.an_status}</td>
								<td>${i.an_date}</td>
							</tr> --%>
							
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
					
						
						<!-- <div class="item">
							<a href="#">
								<div class="img_wrap">
									<img src="../resources/images/bannerImg.png" alt="">
								</div>
								<div class="txt">
									<ul>
										<li class="date">등록일 : 2021-07-07</li>
										<li class="view">조회수 : 0</li>
									</ul>
									<h2>[카라 동물권 더배움 2021] 온라인 주제강좌 '동물학대와 미디어' 참여자 모집</h2>
									<p>카라 동물권 더배움의 이번 주제는 동물 학대와 미디어입니다. 반드시 처벌해야 하는 동물학대 범죄를 국내외 사례와 프로파일링을 중심으로 분석하고, 오직 인간의 흥미를 위해 학대받는 야생동물의 삶을 살펴봅니다. 또한, 미디어에서 모든 생명이 해를 입지 않기 위한 각 분야의 고민과 경험을 나</p>
								</div>
							</a>
						</div> 
						<div class="item">
							<a href="#">
								<div class="img_wrap">
									<img src="../resources/images/bannerImg.png" alt="">
								</div>
								<div class="txt">
									<ul>
										<li class="date">등록일 : 2021-07-07</li>
										<li class="view">조회수 : 0</li>
									</ul>
									<h2>[카라 동물권 더배움 2021] 온라인 주제강좌 '동물학대와 미디어' 참여자 모집</h2>
									<p>카라 동물권 더배움의 이번 주제는 동물 학대와 미디어입니다. 반드시 처벌해야 하는 동물학대 범죄를 국내외 사례와 프로파일링을 중심으로 분석하고, 오직 인간의 흥미를 위해 학대받는 야생동물의 삶을 살펴봅니다. 또한, 미디어에서 모든 생명이 해를 입지 않기 위한 각 분야의 고민과 경험을 나</p>
								</div>
							</a>
						</div> 
						<div class="item">
							<a href="#">
								<div class="img_wrap">
									<img src="../resources/images/bannerImg.png" alt="">
								</div>
								<div class="txt">
									<ul>
										<li class="date">등록일 : 2021-07-07</li>
										<li class="view">조회수 : 0</li>
									</ul>
									<h2>[카라 동물권 더배움 2021] 온라인 주제강좌 '동물학대와 미디어' 참여자 모집</h2>
									<p>카라 동물권 더배움의 이번 주제는 동물 학대와 미디어입니다. 반드시 처벌해야 하는 동물학대 범죄를 국내외 사례와 프로파일링을 중심으로 분석하고, 오직 인간의 흥미를 위해 학대받는 야생동물의 삶을 살펴봅니다. 또한, 미디어에서 모든 생명이 해를 입지 않기 위한 각 분야의 고민과 경험을 나</p>
								</div>
							</a>
						</div>  -->
					</div>
					<div class="btn_wrap">
						<button type="button" class="btn_m btn_line" id="btn_write" style="float:right;">후기 작성</button>
					</div>

					<div class="page_nav">
						<c:forEach var="i" items="${navi}" varStatus="s">
							<c:choose>
								<c:when test="${i == '>'}">
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${navi[s.index-1]+1}&category=${category}&contents=${contents}">${i}</a>
								</c:when>
								<c:when test="${i == '<'}">
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${navi[s.index+1]-1}&category=${category}&contents=${contents}">${i}</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/reviewList.apt?cpage=${i}&category=${category}&contents=${contents}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div> 
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<script>
		$(function(){
			$('#btn_write').on('click', function(){
				location.href = "adopt/reviewWrite.jsp";
			});
		})
	</script>
</body>
</html>