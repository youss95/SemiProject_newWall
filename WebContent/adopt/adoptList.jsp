<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<div class="wrap">
<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="contents">
			<section class="adopt_list">
				<div class="search_area">
					<div class="flex_box">
						<dl>
							<dt>
								<strong>동물구분</strong><span>개/고양이/기타</span>
							</dt>
							<dd>
								<div class="inp_slct">
									<select>
										<option>ALL</option>
										<option>개</option>
										<option>고양이</option>
										<option>기타</option>
									</select>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<strong>성별</strong><span>암컷/수컷</span>
							</dt>
							<dd>
								<div class="inp_slct">
									<select>
										<option>ALL</option>
										<option>암컷</option>
										<option>수컷</option>
									</select>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<strong>크기</strong><span>대/중/소</span>
							</dt>
							<dd>
								<div class="inp_slct">
									<select>
										<option>ALL</option>
										<option>대(18kg 이상)</option>
										<option>중(8~18kg 미만)</option>
										<option>소(8kg 미만)</option>
									</select>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<strong>연령</strong><span>puppy/junior/adult/senior</span>
							</dt>
							<dd>
								<div class="inp_slct">
									<select>
										<option>ALL</option>
										<option>puppy(~ 6개월)</option>
										<option>junior(7개월 ~ 2살)</option>
										<option>adult(3살 ~ 8살)</option>
										<option>senior(9살 ~)</option>
									</select>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>
								<strong>활발함</strong><span>얌전/보통/활발/매우활발</span>
							</dt>
							<dd>
								<div class="inp_slct">
									<select>
										<option>ALL</option>
										<option>얌전</option>
										<option>보통</option>
										<option>활발</option>
										<option>매우활발</option>
									</select>
								</div>
							</dd>
						</dl>
					</div>
					<div class="flex_box">
						<input type="text" class="inpform" placeholder="Placeholder">
						<button class="btn_m btn_default">취소</button>
						<button class="btn_m btn_white">등록</button>
					</div>
				</div>
				
				
				<div class="animal_list">
				<c:forEach var="i" items="${list}">
					<div class="item">
							<img src="" alt="">
							<div class="txt">
								<p>${i.code_seq} / ${i.an_name} / ${i.an_category} / ${an_gender}</p>
								<!-- <ul class="info">
									<li>고양이(코숏)</li>
									<li>암컷(중성화 X)</li>
									<li>8살 / 2.8kg / 삼색</li>
								</ul> -->
							</div>
						</div>
				</c:forEach>
				
				<%-- ${list}
					<c:forEach var="i" items="${list}">
					${list}
						<div class="item">
							<img src="" alt="">
							<div class="txt">
								<p>${i.code_seq} / ${i.an_name} / ${i.an_category} / ${an_gender}</p>
								<!-- <ul class="info">
									<li>고양이(코숏)</li>
									<li>암컷(중성화 X)</li>
									<li>8살 / 2.8kg / 삼색</li>
								</ul> -->
							</div>
						</div>
					</c:forEach> --%>
				
					
				<!-- 	<div class="item">
						<img src="" alt="">
						<div class="txt">
							<p>러쉬</p>
							<ul class="info">
								<li>개(포메라니안)</li>
								<li>수컷(중성화 O)</li>
								<li>3살 / 5.3kg / 브라운</li>
							</ul>
						</div>
					</div>
					<div class="item">
						<img src="" alt="">
						<div class="txt">
							<p>진숙</p>
							<ul class="info">
								<li>고양이(코숏)</li>
								<li>암컷(중성화 X)</li>
								<li>8살 / 2.8kg / 삼색</li>
							</ul>
						</div>
					</div>
					<div class="item">
						<img src="" alt="">
						<div class="txt">
							<p>러쉬</p>
							<ul class="info">
								<li>개(포메라니안)</li>
								<li>수컷(중성화 O)</li>
								<li>3살 / 5.3kg / 브라운</li>
							</ul>
						</div>
					</div> -->
				</div>
			</section>
		</div>
	</div>
</div>
<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
<script>
	$(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/animalList.apt"
		})
	})
</script>
