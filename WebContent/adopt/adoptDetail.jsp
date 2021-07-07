<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="contents">
			<section class="adoptDetail">
				<div class="animal_info">
					<div class="photo_box">
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<c:forEach var="f" items="${files}">				
									<div class="swiper-slide">
										<div class="img_bg"
											style="width:100%;height:100%;background:url(${pageContext.request.contextPath}/upload/animalInfo/${f.ori_name}) 50% 50% no-repeat;background-size:cover;">
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
					<div class="info_box">
						<a href="javascript:history.back();" class="move_list">< 목록으로</a>
						<h2>${info.an_name} <span>${info.code_seq}</span></h2>
						<dl>
							<dt>종 / 품종</dt>
							<dd>${info.an_category} / ${info.an_kind}</dd>
							<dt>성별(중성화)</dt>
							<dd>${info.an_gender} / 중성화 ${info.an_neutering}</dd>
							<dt>추정나이</dt>
							<dd>${info.an_age}살</dd>
							<dt>몸무게</dt>
							<dd>${info.an_weight}kg</dd>
							<dt>성격</dt>
							<dd>${info.an_character}</dd>
						</dl>
						<div class="btn_wrap">
							<a href="${pageContext.request.contextPath}/adoptRegForm.apt?code_seq=${info.code_seq}" class="btn_m btn_primary">입양하기</a>
							<button type="button" class="btn_m btn_line">후원하기</button>
						</div>
					</div>
				</div>
				<div class="animal_history">
					<div class="cont">
						<h2>히스토리</h2>
						<div>
							<p>${info.an_contents}</p>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>
<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>

<script>
	const swiper = new Swiper('.animal_info .swiper-container', {
		loop: true,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		}
	});
</script>
</body>
</html>
