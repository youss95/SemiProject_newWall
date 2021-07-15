<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<jsp:include page="/layout/jsp/commonModal.jsp"/>

</head>
<body>
	<div id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" id="modal-logo">
					<img
						src="${pageContext.request.contextPath}/resources/images/login_logo6.png"
						id="popup-logo">
				</div>

				<form action="${pageContext.request.contextPath}/login.adm">
					<div class="modal-body">
						<div class="form-group">
							<label for="user-id" class="col-form-label"></label> <input
								type="text" class="form-control" id="user_id" name="user_id"
								placeholder="Admin ID">
						</div>
						<div class="form-group">
							<label for="user-password" class="col-form-label"></label> <input
								type="password" class="form-control" id="user_pw"
								name="user_password" placeholder="Password">
						</div>

					</div>
					<div class="modal-footer">
						<button class="btn_m btn_default" data-dismiss="modal"
							style="width: 125%; margin-bottom: 16px;">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>