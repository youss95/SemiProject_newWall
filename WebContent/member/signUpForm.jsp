<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/signUpForm.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입폼</title>
</head>
<body>
	<div class="wrap">
		<%@ include file="../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="signUpForm">
					<h2>회원가입</h2>
					<form method="post" name="inputForm" id="signupForm"
						action="${pageContext.request.contextPath}/signupProc.mem">
						<div>
							<table>
								<tr>
									<td><label for="signup_user_id">아이디</label></td>
									<td><input type="text" name="user_id" id="signup_user_id"
										class="inpform" maxlength=16 required> <input
										type="button" id="idCheck" value="중복확인"
										class="btn_s btn_light"> <span style="color: crimson"
										id="duplCheckResult"></span></td>
								</tr>
								<tr>
									<td><label for="password">비밀번호</label></td>
									<td><input type="password" name="user_password"
										id="user_password" class="inpform" maxlength=16 required></td>
								</tr>
								<tr>
									<td><label for="pwdCheck">비밀번호 확인</label></td>
									<td><input type="password" name="pwdCheck" id="pwdCheck"
										class="inpform" maxlength=16 required></td>
								</tr>
								<tr>
									<td><label for="email">이메일</label></td>
									<td><input type="text" name="email" id="email"
										class="inpform" maxlength=16> @ <select
										id="emailSuffix" class="inpform">
											<option value="gmail.com">gmail.com</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="direct">직접입력</option>
									</select> <input type="button" id="check" value="이메일 인증"
										class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="name">이름</label></td>
									<td><input type="text" name="name" id="name"
										class="inpform" maxlength=20 required></td>
								</tr>

								<tr>
									<td>생년월일</td>
									<td><span class="box"> <select id="birthday_yy"
											class="int inpform" name="birthday_yy" required>
												<option disabled selected>년</option>
										</select>
									</span> <span class="box"> <select id="birthday_mm"
											class="inpform" name="birthday_mm" required>
												<option disabled selected>월</option>
												<option value="01">01</option>
												<option value="02">02</option>
												<option value="03">03</option>
												<option value="04">04</option>
												<option value="05">05</option>
												<option value="06">06</option>
												<option value="07">07</option>
												<option value="08">08</option>
												<option value="09">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
										</select>
									</span> <span class="box"> <select id="birthday_dd"
											class="inpform" name="birthday_dd" required>
												<option disabled selected>일</option>
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
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
										</select>
									</span></td>
								</tr>
								<tr>
									<td><label for="phone">연락처</label></td>
									<td><select class="inpform" name="contact1" id="contact1">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="019">019</option>
									</select> - <input type="text" class="inpform" name="contact2"
										id="contact2" maxlength=4> - <input type="text"
										name="contact3" id="contact3" class="inpform" maxlength=4></td>
								</tr>
								<tr>
									<!-- 	<tr>
									<td>입양 신청 상태</td>
									<td><input type="radio" name="status" value="Y">Yes
										&nbsp;&nbsp;&nbsp; <input type="radio" name="status" value="N"
										checked>No</td>
								</tr> -->
								<tr>
									<td><label for="postcode">우편번호</label></td>
									<td><input type="text" name="postcode" id="postcode"
										class="inpform" maxlength=5> <input type="button"
										id="searchAddr" value="우편번호검색" class="btn_s btn_light"
										required></td>
								</tr>
								<tr>
									<td><label for="address1">주소</label></td>
									<td><input type="text" name="address1" id="address1"
										class="inpform" placeholder="도로명/지번" maxlength=100 required></td>
								</tr>
								<tr>
									<td><label for="address2">상세주소</label></td>
									<td><input type="text" name="address2" id="address2"
										class="inpform" maxlength=100 required></td>
								</tr>
							</table>
							<input type="submit" id="join" value="회원가입"
								class="btn_m btn_default">
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<jsp:include page="/layout/jsp/modal.jsp"></jsp:include>
	<script>
		$(function() {
			let now = new Date();
			let year = now.getFullYear();
			for (let i = year; i >= 1900; i--) {
				$('#birthday_yy').append(
						'<option value="' + i + '">' + i + '</option>');
			}

			let idFlag = false;
			$("#signup_user_id").on("input", function() {
				idFlag = false;
			})

			$("#signupForm")
					.on(
							"submit",
							function() {
								let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
								let user_id = $("#signup_user_id").val();
								if (!idReg.test(user_id)) {
									alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
									return false;
								}

								let pwReg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
								let pw = $("#user_password").val();
								if (!pwReg.test(pwReg)) {
									alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
									return false;
								}

								let emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
								let email = $("#email").val()
										+ "@"
										+ $("#emailSuffix option:selected")
												.val();

								if (!emailReg.test(email)) {
									alert("이메일 형식을 다시 확인해주세요.");
									return false;
								}

								let nameReg = /^[가-힣]{2,4}$/;
								let name = $("#name").val();
								if (!nameReg.test(name)) {
									alert("이름은 한글 2 글자 이상 4글자 미만으로 입력해야 합니다.");
									return false;
								}

								let phoneReg = /^\d{3}\d{3,4}\d{4}$/;
								let phone = $("#contact1 option:selected")
										.val()
										+ $("#contact2").val()
										+ $("#contact3").val();

								if (!phoneReg.test(phone)) {
									alert("핸드폰 번호를 다시 확인해주세요.");
									return false;
								}

								if ($("#birthday_yy option:selected").val() == "년"
										|| $("#birthday_mm option:selected")
												.val() == "월"
										|| $("#birthday_dd option:selected")
												.val() == "일") {
									alert("생년월일을 선택하세요.")
									return false;
								}

								if (!idFlag) {
									alert("ID 중복체크를 진행하세요.")
									return false;
								}
							})

			$("#idCheck").on("click", function() {
				if ($("#signup_user_id").val() == "") {
					alert("ID를 입력하세요.")
					return;
				}

				$.ajax({
					url : "${pageContext.request.contextPath}/idDuplCheck.mem",
					data : {
						user_id : $("#signup_user_id").val()
					}
				}).done(function(resp) {
					if (resp == "true") {
						$("#duplCheckResult").css("color", "dodgerblue");
						$("#duplCheckResult").text("사용 가능한 ID 입니다.");
						idFlag = true;
					} else {
						$("#duplCheckResult").css("color", "crimson");
						$("#duplCheckResult").text("이미 사용중인 ID 입니다.");
					}

				})
			})

			$("#searchAddr")
					.on(
							"click",
							function() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												var roadAddr = data.roadAddress; // 도로명 주소 변수

												document
														.getElementById('postcode').value = data.zonecode;
												document
														.getElementById("address1").value = roadAddr;
												document
														.getElementById("address2").value = data.jibunAddress;
											}
										}).open();
							})

		})
	</script>
</body>
</html>