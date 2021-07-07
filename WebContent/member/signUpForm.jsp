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
	<%@ include file="../layout/jsp/header.jsp"%>

	<form method="GET" name="inputForm" id="signUpForm" action="${pageContext.request.contextPath}/signupProc.mem">
		<div>
			<table>
				<tr>
					<td><label for="id" required>아이디 </td>
					<td><input type="text" name="id" id="id" class="inpform" maxlength=16 required/>
						<input type="button" id="check" value="중복확인" class="btn_s btn_light"></td>
				</tr>
				<tr>
					<td><label for="pwd">비밀번호 </td>
					<td><input type="password" name="pwd" id="pwd" class="inpform" maxlength=16 required/>
						<!-- *영문 대소문자/숫자/특수문자를 혼용하여 2종류10~16자 또는 3종 8~16자 --></td>
				</tr>
				<tr>
					<td><label for="pwdCheck">비밀번호 확인 </td>
					<td><input type="password" name="pwdCheck" id="pwdCheck"
						size="20px" class="inpform" required/></td>
				</tr>
				<tr>
					<td><label for="email">이메일 </td>
					<td><input type="text" name="email" id="email" size="10" class="inpform" required/>@
						<select id="email2" class="inpform">
							<option value=""></option>
							<option value="1">gmail.com</option>
							<option value="2">naver.com</option>
							<option value="3">daum.net</option>
							<option vlaue="4">nate.com</option>

					</select> <input type="button" id="check2" value="중복확인" class="btn_s btn_light"></td>
				</tr>
				<tr>
					<td><label for="sname">이름 </td>
					<td><input type="text" name="sname" id="sname" size="20px" class="inpform">
					</td>
				</tr>

				<tr>
					<td>생년월일</td>
					<td><span class="box"> <input type="text" id="yy"
							class="int inpform" maxlength="4" placeholder="년(4자)">
					</span> <span class="box" > <select id="mm" class="inpform">
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
					</span> <span class="box"> <input type="text" id="dd" class="inpform"
							maxlength="1" placeholder="일" >
					</span></td>
				</tr>
				<tr>
					<td><label for="phone" >연락처</td>
					<td><select id="phone" class="inpform">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
					</select> - <input type="text" name="phone" id="phone" size="10" class="inpform">- <input
						type="text" name="phone" id="phone" size="10" class="inpform"></td>
				</tr>
				<tr>
				<tr>
					<td>성별</td>
					<td><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<td><label for="dong">우편번호 </td>
					<td><input type="text" name="dong" id="dong" size="5" class="inpform">-
						<input type="text" name="dong" id="dong" size="5" class="inpform"> <input
						type="button" id="address" value="우편번호검색" class="btn_s btn_light"></td>
				</tr>
				<tr>
					<td><label for="home">주소</td>
					<td><input type="text" name="home" id="home" size="60" class="inpform">
					</td>
				</tr>
				<tr>
					<td><label for="homeAddress">상세주소 </td>
					<td><input type="text" name="homeAddress" id="homeAddress"
						size="60" class="inpform"></td>
				</tr>

				<td>휴대폰</td>
				<td><select id="phone" name="phone id=" >
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="019">019</option>
				</select> -<input type="text" name="Phone1" size="5" class="inpform"> -<input
					type="text" name="Phone2" size="5" class="inpform"></td>
				</tr>
				<tr>
				</tr>
			</table>
			<input type="button" id="join" value="회원가입" class="btn_m btn_default">
		</div>
	</form>

</body>
</html>