<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/signUpForm.css">
<title>회원가입폼</title>
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="signUpForm">
					<form method="post" name="inputForm" id="signUpForm"
						action="${pageContext.request.contextPath}/signupProc.mem">
						<div>
							<table>
								<tr>
									<td><label for="user_id" required>아이디</td>
									<td><input type="text" name="user_id" id="id"
										class="inpform" maxlength=16> <input type="button"
										id="check" value="중복확인" class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="password"">비밀번호</td>
									<td><input type="password" name="user_password" id="pwd"
										class="inpform" maxlength=16> <!-- *영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자 --></td>
								</tr>
								<tr>
									<td><label for="pwdCheck">비밀번호 확인</td>
									<td><input type="password" name="pwdCheck" id="pwdCheck"
										class="inpform" maxlength=16></td>
								</tr>
								<tr>
									<td><label for="email">이메일</td>
									<td><input type="text" name="email" id="email"
										class="inpform" maxlength=16>@ <select id="email2"
										class="inpform">
											<option value="1">gmail.com</option>
											<option value="2">naver.com</option>
											<option value="3">daum.net</option>
											<option vlaue="4">nate.com</option></td>
								</tr>
								<tr>
									<td><label for="name">이름</td>
									<td><input type="text" name="name" id="name"
										class="inpform" maxlength=20></td>
								</tr>

								<tr>
									<td>생년월일</td>
									<td><span class="box"> <input type="text" id="yy"
											class="int inpform" maxlength=4 placeholder="년(4글자)"
											name="birthday_yy">
									</span><span class="box"> <select id="mm" class="inpform"
											name="birthday_mm">
												<option>월</option>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
									</span> <span class="box"> <input type="text" id="dd"
											class="inpform" maxlength="1" name="birthday_dd" maxlength=2
											placeholder="일">
									</span></td>
								</tr>
								<tr>
									<td><label for="phone">연락처</td>
									<td><select id="phone" class="inpform">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="019">019</option>
									</select> - <input type="text" name="phone" id="phone" class="inpform"
										name="contact1" maxlength=4> - <input type="text"
										name="phone" id="phone" class="inpform"
										name="contact2" maxlength=4></td>
								</tr>
								<tr>
								<tr>
									<td>입양 신청 상태</td>
									<td><input type="radio" name="status" value="Yes">Yes &nbsp;&nbsp;&nbsp;
										<input type="radio" name="status" value="No" checked>No</td>
								</tr>
								<tr>
									<td><label for="postcode">우편번호</td>
									<td><input type="text" name="postcode" id="postcode"
										class="inpform"> - <input type="text" name="postcode"
										id="postcode" class="inpform"> <input
										type="button" id="address" value="우편번호검색"
										class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="home">주소</td>
									<td><input type="text" name="address1" id="address1"
										 class="inpform"></td>
								</tr>
								<tr>
									<td><label for="homeAddress">상세주소 </td>
									<td><input type="text" name="address2" id="address2"
										class="inpform" maxlength=20></td>
								</tr>
							</table>
							<input type="button" id="join" value="회원가입"
								class="btn_m btn_default">
						</div>
					</form>
				</section>
			</div>
		</div>

	</div>

</body>
</html>