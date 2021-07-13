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
<style>
* {
	box-sizing: border-box;
}

#sp_com_input .su_banner img {
	opacity: 0.9;
}

#sp_com_input .su_title h2 {
	font-size: 36px;
	font-weight: 600;
	margin-bottom: 15px;
}

#sp_com_input .su_title h2::after {
	display: block;
	width: 100%;
	height: 8px;
	background-color: #FFA5A5;
	/* 안되네 나중에 다시 */
}

#sp_com_input .su_title {
	text-align: center;
	margin-top: 20px;
	padding-bottom: 10px;
	/* border-bottom: #FFF0F0 solid 2px; */
}

#sp_com_input .su_persnal_info input {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#sp_com_input .su_persnal_info select {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#sp_com_input .su_persnal_info dl {
	margin: 40px;
	/* width: 500px; */
}

#sp_com_input .su_persnal_info .su_ti {
	/*  margin: 10px;
            width: 500px; */
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 2px solid #FFA5A5;
}

#sp_com_input .su_persnal_info .su_s_ip {
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_l_ip {
	width: 500px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_btn_detail {
	margin-left: 10px;
	height: 40px;
	background-color: #FCDADA;
	color: #3D7EA6;
	border: 1px solid #FFF0F0;
}

#sp_com_input .btn_wrap .su_btn_detail_big {
	margin-left: 10px;
	width: 250px;
	height: 60px;
	/* background-color: #FCDADA;
            color: #3D7EA6;
            border: 1px solid #FCDADA; */
	font-size: 20px;
	font-weight: 600;
}

#sp_com_input .btn_wrap {
	text-align: center;
}

#sp_com_input .su_persnal_info .su_m_ip {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_pw_sub {
	padding-top: 10px;
}

#sp_com_input .su_persnal_info .su_pw_ck {
	margin-left: 10px;
}

#sp_com_input .su_persnal_info .su_birthday_con {
	overflow: hidden;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_birthday {
	float: left;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_address {
	float: left;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_birthday_text {
	margin-left: 10px;
	margin-right: 30px;
}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section id="sp_com_input">
					<!-- 하이 여기는 서브입니다 -->
					<div class="signup_con">
						<div class="su_banner">
							<img src="..\resources\images\signupmain_1100_400.jpg" alt="">
						</div>
						<div class="su_title">
							<h2>회원 가입</h2>
							<p>
								동물권행동 NEW-WAL의 회원 가입을 환영합니다.<br> 유기동물 뿐 아닌 모든 생명이 조화로운 세상을
								위해 쉼없이 노력하겠습니다.
							</p>
						</div>

						<form action="" method="post" id="">
							<!-- <h3>개인 정보</h3> -->
							<div class="su_persnal_info">
								<dl>
									<dt class="su_ti su_id">아이디</dt>
									<dd>
										<input type="text" class="inpform su_s_ip" name="" id=""
											placeholder="이름을 입력해주세요.">
										<button class="btn_m btn_light su_btn_detail">중복확인</button>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">비밀번호</dt>
									<dd>
										<input type="text" class="inpform su_m_ip" name="" id=""
											placeholder="비밀번호"> <span class="su_pw_sub">-영문대문자,
											영문소문자, 숫자 포함하여 8-12 글자 ***이거는우리정규식에맞게<br>
										</span>
									</dd>
									<dd>
										<input type="text" class="inpform su_m_ip" name="" id=""
											placeholder="비밀번호 확인"> <span class="su_pw_ck">
											일치여부 확인 메세지 </span>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">이름</dt>
									<dd>
										<input type="text" class="inpform su_s_ip" name="" id="">
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">이메일주소</dt>
									<dd>
										<input type="text" class="inpform su_m_ip" name="" id=""
											placeholder="example@naver.com">
									</dd>
								</dl>
								<dl>
									<dt class="su_ti ">생년월일</dt>
									<dd class="su_birthday_con">

										<div class="su_birthday">
											<input type="number" class="inpform  su_s_ip" id="" name=""
												placeholder="1999">
										</div>
										<span class="su_birthday su_birthday_text">년</span>
										<div class="inp_slct su_s_ip su_birthday">
											<select name="" class=" " id="" required>
												<option value="">선택</option>
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
										</div>
										<span class="su_birthday su_birthday_text">월</span>
										<div class="inp_slct su_s_ip su_birthday">
											<select name="" class=" " id="" required>
												<option value="">선택</option>
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
										</div>
										<span class="su_birthday su_birthday_text">일</span>

									</dd>
								</dl>
								<dl>
									<dt class="su_ti">연락처</dt>
									<dd>
										<input type="text" class="inpform su_m_ip" name="" id=""
											placeholder="01012341234">
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">주소</dt>
									<dd>
										<div class="sp_address">
											<div>
												<h3 class="ad_h3 su_address">우편번호</h3>
												<input type="text" id="sp_postcode" name="sp_postcode"
													class="inpform  su_s_ip su_address" required>
												<button class="btn_m btn_default su_btn_detail"
													id="sp_search" type="button">우편번호 찾기</button>
											</div>
											<div>
												<h3 class="ad_h3 su_address">도로명 주소</h3>
												<input type="text" id="sp_address1" name="sp_address1"
													class="inpform su_address su_l_ip" required>
											</div>
											<div>
												<h3 class="ad_h3 su_address">상세 주소</h3>
												<input type="text" id="sp_address2" name="sp_address2"
													class="inpform su_address su_l_ip" required>
											</div>
										</div>
									</dd>
								</dl>


							</div>

							<div class="btn_wrap">
								<input type="hidden" name="" value=""> <input
									type="hidden" name="" value="">
								<button type="button"
									class="btn_m btn_primary su_btn_detail_big" id="">회원가입하기</button>
							</div>
						</form>


					</div>

					<!-- 끝 -->
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<script>

	
</script>
</body>
</html>

