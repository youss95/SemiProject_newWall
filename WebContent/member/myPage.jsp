<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/myPage.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="myPage">
					<h2>내정보</h2>
					<form method="post" name="modiForm" id="modiForm"
						action="${pageContext.request.contextPath}/myPage.mem">
						<div class="title">
							<div>
								<table>
									<tr>
										<td><label for="user_id">아이디</label></td>
										<td>${user_id}</td>
									</tr>
									<tr>
										<td><label for="password">비밀번호</label></td>
										<td>${user_password}</td>
										<td><button id="modiPassword" type="button"
												class="btn_s btn_light">수정</button>
										<td>
									</tr>
									<tr>
										<td><label for="pwdCheck">비밀번호 확인</label></td>
										<td>${user_password}</td>
										<td><button id="modiPasword" type="button"
												class="btn_s btn_light">수정</button>
										<td>
									</tr>
									<tr>
										<td><label for="email">이메일</label></td>
										<td>${email}
										<td><input type="button" id="check" value="이메일 인증"
											class="btn_s btn_light"></td>
										<td><button id="modiEmail" type="button"
												class="btn_s btn_light">수정</button>
										<td>
									</tr>
									<tr>
										<td><label for="name">이름</label></td>
										<td>${name}</td>
										<td><button id="modiName" type="button"
												class="btn_s btn_light">수정</button>
										<td>
									</tr>
									<tr>
										<td>생년월일</td>
										<td>${birthday_yy}-${birthday_mm} - ${birthday_dd}</td>
										<td><button id="modiBirthday" type="button"
												class="btn_s btn_light">수정</button></td>
									</tr>
									<tr>
										<td><label for="phone">연락처</label></td>
										<td>${contact1}-${contact2} - ${contact3}</td>
										<td><button id="modiPhone" type="button"
												class="btn_s btn_light">수정</button></td>
									</tr>
									<tr>
										<td><label for="postcode">우편번호</label></td>
										<td>${postcode}</td>
										<td><button id="modiPostcode" type="button"
												class="btn_s btn_liht">수정</button></td>
									</tr>
									<tr>
										<td><label for="address1">주소</label></td>
										<td>${address1}</td>
										<td><button id="modiAddress1" type="button"
												class="btn_s btn_liht">수정</button></td>
									</tr>
									<tr>
										<td><label for="address2">상세주소</label></td>
										<td>${address2}</td>
										<td><button id="modiAddress2" type="button"
												class="btn_s btn_liht">수정</button></td>								
										</tr>
								</table>
								<input type="reset" id="reset" value="초기화"
									class="btn_m btn_light"> <input type="submit" id="withdraw"
									value="회원 탈퇴" class="btn_m btn_default">
							</div>
					</form>
				</section>
			</div>
		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>

	<script src="../../resources/js/jquery-3.6.0.min.js"></script>
	<script src="../../resources/js/common.js"></script>
</body>
</html>