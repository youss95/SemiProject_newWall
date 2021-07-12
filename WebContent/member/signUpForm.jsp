<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login/signUpForm.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
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
									<td><label for="user_id">아이디</label></td>
									<td><input type="text" name="user_id" id="id"
										class="inpform" maxlength=16> <input type="button"
										id="check" value="중복확인" class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="password">비밀번호</label></td>
									<td><input type="password" name="user_password" id="pwd"
										class="inpform" maxlength=16></td>
								</tr>
								<tr>
									<td><label for="pwdCheck">비밀번호 확인</label></td>
									<td><input type="password" name="pwdCheck" id="pwdCheck"
										class="inpform" maxlength=16></td>
								</tr>
								<tr>
									<td><label for="email">이메일</label></td>
									<td><input type="text" name="email" id="email"
										class="inpform" maxlength=16> @ <select
										name="email2 selectEmail" class="inpform">
											<option value="1">gmail.com</option>
											<option value="2">naver.com</option>
											<option value="3">daum.net</option>
											<option value="4">nate.com</option>
											<option value="direct">직접입력</option>
									</select> <input type="button" id="check" value="이메일 인증"
										class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="name">이름</label></td>
									<td><input type="text" name="name" id="name"
										class="inpform" maxlength=20></td>
								</tr>

								<tr>
									<td>생년월일</td>
									<td><span class="box"> <input type="text" id="yy"
											class="int inpform" maxlength=4 placeholder="년(4글자)"
											name="birthday_yy"></span> <span class="box"> <select
											id="mm" class="inpform" name="birthday_mm">
												<option>월</option>
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
									</span> <span class="box"> <select id="dd" class="inpform"
											name="birthday_dd">
												<option>일</option>
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
									<td><select id="phone" class="inpform" name="contact1">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="019">019</option>
									</select> - <input type="text" id="phone" class="inpform"
										name="contact2" maxlength=4> - <input type="text"
										name="contact3" id="phone" class="inpform" maxlength=4></td>
								</tr>
								<tr>
								<tr>
									<td>입양 신청 상태</td>
									<td><input type="radio" name="status" value="Y">Yes
										&nbsp;&nbsp;&nbsp; <input type="radio" name="status" value="N"
										checked>No</td>
								</tr>
								<tr>
									<td><label for="postcode">우편번호</label></td>
									<td><input type="text" name="postcode" id="postcode"
										class="inpform" maxlength=5> <input type="button"
										id="address" value="우편번호검색" class="btn_s btn_light"></td>
								</tr>
								<tr>
									<td><label for="home">주소</label></td>
									<td><input type="text" name="address1" id="address1"
										class="inpform" placeholder="도로명/지번" maxlength=20></td>
								</tr>
								<tr>
									<td><label for="homeAddress">상세주소</label></td>
									<td><input type="text" name="address2" id="address2"
										class="inpform" maxlength=20></td>
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
		//이메일 입력방식 선택
		$('#selectEmail').change(function(){
		   $("#selectEmail option:selected").each(function () {
				
				if($(this).val()== 'direct'){ //직접입력일 경우
					 $("#email2").val('');                        //값 초기화
					 $("#email2").attr("disabled",false); //활성화
				}else{ //직접입력이 아닐경우
					 $("#email2").val($(this).text());      //선택값 입력
					 $("#email2").attr("disabled",true); //비활성화
				}
		   });
		});
		
</script>
</body>
</html>