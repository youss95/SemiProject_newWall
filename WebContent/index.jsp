<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2조 세미 프로젝트</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/loginPopUp.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrap">
		<%@ include file="layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="">
					<!-- 하이 여기는 서브입니다 -->
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<img
						src="${pageContext.request.contextPath}/resources/images/login_image4.png"
						id="popup-img">
				</div>
				<div class="modal-header" id="modal-logo"
					style="padding-bottom: 20px;">
					<img
						src="${pageContext.request.contextPath}/resources/images/login_logo5.png"
						id="popup-logo">
					<div class="modal-header login-title"></div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="user-id" class="col-form-label"></label> <input
									type="text" class="form-control" id="user_id"
									placeholder="Your ID">
							</div>
							<div class="form-group">
								<label for="user-password" class="col-form-label"></label> <input
									type="text" class="form-control" id="user_pw"
									placeholder="Password">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn_m btn_default"
							data-dismiss="modal" style="width: 125%">로그인</button>
						<button type="button" class="" data-dismiss="modal" id="idPwHov"
							style="width: 125%; text-decoration: underline;">아이디/비밀번호
							찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
>>>>>>> 1ddafbb3f31e0457f0ada98e9c48052d7affe1c7
</body>
</html>