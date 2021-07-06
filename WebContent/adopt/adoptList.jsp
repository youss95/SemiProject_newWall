<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="adopt_list">
					<div class="search_area">
						<form action="${pageContext.request.contextPath}/adoptList.apt"
							method="post">
							<div class="flex_box">
								<dl>
									<dt>
										<strong>동물구분</strong><span>개/고양이/기타</span>
									</dt>
									<dd>
										<div class="inp_slct">
											<select name="category" class="category">
												<option value="all">ALL</option>
												<option value="개">개</option>
												<option value="고양이">고양이</option>
											</select>
										</div>
										<input type="hidden" class="h_category" name="h_category"
											value="${h_category}">
									</dd>
								</dl>
								<dl>
									<dt>
										<strong>성별</strong><span>암컷/수컷</span>
									</dt>
									<dd>
										<div class="inp_slct">
											<select name="gender" class="gender">
												<option value="all">ALL</option>
												<option value="암컷">암컷</option>
												<option value="수컷">수컷</option>
											</select>
										</div>
										<input type="hidden" class="h_gender" name="h_gender"
											value="${h_gender}">
									</dd>
								</dl>
								<dl>
									<dt>
										<strong>크기</strong><span>대/중/소</span>
									</dt>
									<dd>
										<div class="inp_slct">
											<select name="weight" class="weight">
												<option value="all">ALL</option>
												<option value="big">대(18kg 이상)</option>
												<option value="middle">중(8~18kg 미만)</option>
												<option value="small">소(8kg 미만)</option>
											</select>
										</div>
										<input type="hidden" class="h_weight" name="h_weight"
											value="${h_weight}">
									</dd>
								</dl>
								<dl>
									<dt>
										<strong>연령</strong><span>puppy/junior/adult/senior</span>
									</dt>
									<dd>
										<div class="inp_slct">
											<select name="age" class="age">
												<option value="all">ALL</option>
												<option value="puppy">puppy(~ 6개월)</option>
												<option value="junior">junior(7개월 ~ 2살)</option>
												<option value="adult">adult(3살 ~ 8살)</option>
												<option value="senior">senior(9살 ~)</option>
											</select>
										</div>
										<input type="hidden" class="h_age" name="h_age"
											value="${h_age}">
									</dd>
								</dl>
								<dl>
									<dt>
										<strong>활발함</strong><span>얌전/보통/활발/매우활발</span>
									</dt>
									<dd>
										<div class="inp_slct">
											<select name="character" class="character">
												<option value="all">ALL</option>
												<option value="얌전">얌전</option>
												<option value="보통">보통</option>
												<option value="활발">활발</option>
												<option value="매우활발">매우활발</option>
											</select>
										</div>
										<input type="hidden" class="h_character" name="h_character"
											value="${h_character}">
									</dd>
								</dl>
							</div>
							<div class="flex_box">
								<input type="text" class="inpform an_name" name="an_name"
									placeholder="이름을 입력해 주세요." value="${an_name}">
								<button class="btn_m btn_default">검색</button>
								<input type="reset" class="btn_m btn_white" value="취소">
								<input type="hidden" value="1" name="cpage"> <input
									type="hidden" value="1" name="cpage">
							</div>
						</form>
					</div>

					<div class="animal_list">
						<c:choose>
							<c:when test="${list.size() == 0}">
								<p class="nodata">검색결과가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" items="${list}">
									<div class="item">
										<a
											href="${pageContext.request.contextPath}/adoptDetail.apt?code_seq=${i.code_seq}">
											<div class="img_wrap">
												<img
													src="${pageContext.request.contextPath}/upload/animalInfo/${i.an_photo}">
											</div>
											<div class="txt">
												<p class="name">${i.an_name}</p>
												<ul class="info">
													<li>${i.an_category}/${i.an_gender}</li>
													<li>${i.an_age}살/${i.an_weight}kg</li>
												</ul>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>

					<div class="page_nav">
						<c:forEach var="i" items="${navi}" varStatus="s">
							<c:choose>
								<c:when test="${i == '>'}">
									<a
										href="${pageContext.request.contextPath}/adoptList.apt?cpage=${navi[s.index-1]+1}&category=${h_category}&gender=${h_gender}&weight=${h_weight}&age=${h_age}&character=${h_character}&an_name=${an_name}">${i}</a>
								</c:when>
								<c:when test="${i == '<'}">
									<a
										href="${pageContext.request.contextPath}/adoptList.apt?cpage=${navi[s.index+1]-1}&category=${h_category}&gender=${h_gender}&weight=${h_weight}&age=${h_age}&character=${h_character}&an_name=${an_name}">${i}</a>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/adoptList.apt?cpage=${i}&category=${h_category}&gender=${h_gender}&weight=${h_weight}&age=${h_age}&character=${h_character}&an_name=${an_name}">${i}</a>
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
		$(function() {

			let category = $(".h_category").val();
			let gender = $(".h_gender").val();
			let weight = $(".h_weight").val();
			let age = $(".h_age").val();
			let character = $(".h_character").val();

			$('.category option[value=' + category + ']').prop('selected',
					'selected').change();
			$('.gender option[value=' + gender + ']').prop('selected',
					'selected').change();
			$('.weight option[value=' + weight + ']').prop('selected',
					'selected').change();
			$('.age option[value=' + age + ']').prop('selected', 'selected')
					.change();
			$('.character option[value=' + character + ']').prop('selected',
					'selected').change();

		});
	</script>