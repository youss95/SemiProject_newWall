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
				<section class="review_detail">
					<div class="title">
						<h2>입양 후기</h2>
						<p>뉴월을 통해 입양하신 분들은 누구나! <em>입양후기</em>를 올려주세요.<br> 가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</p>
					</div>
					<div class="view">
						<div class="title">
							<h3>${rv.review_title}</h3>
							<ul class="utils">
								<li>작성자 : <span>${rv.review_writer}</span></li>
								<li>작성일 : <span>${rv.reg_date}</span></li>
 								<li>좋아요 : <span>${rv.review_like}</span></li>
								<li>조회수 : <span>${rv.review_view}</span></li>
							</ul>
							<div class="v_like">
								
							</div>
						</div>
						<div class="contents">
							<div>${rv.review_contents}</div>
						</div>
						<div class="btn_wrap">
							<a href="${pageContext.request.contextPath}/reviewList.apt?cpage=1" class="btn_m btn_line btn_list">목록으로</a>
							<button type="button" class="btn_m btn_white" id="btn_del">삭제</button>
							<a href="${pageContext.request.contextPath}/reviewModifyView.apt?review_seq=${rv.review_seq}" class="btn_m btn_default" id="btn_modi">수정</a>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<script>
		function goBack(){
			window.history.back();
		}
		
		$("#btn_del").on("click", function () {
			let result = confirm("정말 삭제 하시겠습니까?");
			if (result) {
				location.href = "${pageContext.request.contextPath}/reviewDelete.apt?review_seq=${rv.review_seq}";
			}
		});
		
	</script>
	
</body>
</html>