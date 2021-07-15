<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴월</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/loginPopUp.css">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<style>
section>.title>h2:after {
	background-color: #254E7C;
	opacity: .4;
}

* {
	box-sizing: border-box;
}

/* 메인 후원신청 제목 */
.sp_com_input .spp_title {
	font-size: 30px;
	font-weight: bold;
	/* margin-top: 60px; */
}

/* 각 소제목 아래 수평선 */
.sp_com_input .spp_category h2 {
	/* font-size: 20px;
            margin-bottom: 20px;
            border-bottom: 2px solid #769FCD;
            padding-bottom: 15px; */
	font-weight: 600;
	font-size: 20px;
	margin-bottom: 20px;
	border-bottom: 2px solid #769FCD;
	margin: 40px 0 20px;
	padding-bottom: 15px;
}

.sp_com_input {
	overflow: hidden;
}
.sp_com_input .directname{
	width: 30%;
}

/* 각 항목 사이 공간 띄우기 */
.sp_com_input .spp_category {
	float: left;
	width: 100%;
}

/* 01기부금액 관련 */
.sp_com_input .spp_category1 li {
	display: inline-block;
	margin-right: 10px;
	vertical-align: top;
}

.sp_com_input .spp_category1 ul {
	overflow: hidden;
}

.sp_com_input .spp_category1 input {
	width: 150px;
}

.sp_com_input .spp_category1 input+span {
	display: inline-block;
	vertical-align: bottom;
	padding-bottom: 5px;
	font-size: 14px;
}

.sp_com_input .spp_category1 .btn_pay_set {
	word-break: keep-all;
}

/* 02기부자정보 */
.sp_com_input .spp_category2 .age14 {
	margin-top: 20px;
}

.sp_com_input .spp_category2 .ph:first-of-type {
	margin-left: 0;
}

.sp_com_input .spp_category2 .ph {
	width: 70px;
	margin-left: 10px;
	margin-right: 10px;
}

.sp_com_input .spp_category2 .na {
	width: 150px;
}

.sp_com_input .spp_category2 .bi {
	min-width: 90px;
	width: 90px;
	margin-left: 10px;
}

.sp_com_input .spp_category2 .bi_y {
	width: 100px;
}

.sp_com_input .spp_category2 .phone {
	margin-top: 20px;
}

.sp_com_input .spp_category2 .name {
	margin-top: 20px;
}

.sp_com_input .spp_category2 .birth {
	margin-top: 20px;
}

.sp_com_input .spp_category2 .phone h3, .sp_com_input .spp_category2 .name h3,
	.sp_com_input .spp_category2 .birth h3 {
	display: inline-block;
	line-height: 40px;
	vertical-align: top;
	width: 120px;
}

.sp_com_input .spp_category2 .phone h3 span, .sp_com_input .spp_category2 .name h3 span,
	.sp_com_input .spp_category2 .birth h3 span {
	display: block;
	font-size: 11px;
	font-weight: 300;
	margin-top: -10px;
	line-height: 1;
}

.sp_com_input .spp_category2 .birth_wrap {
	display: inline-block;
}

.sp_com_input .spp_category2 .birth_wrap>div {
	display: inline-block;
	vertical-align: top;
}

.sp_com_input .spp_category2 .birth_wrap>div span {
	display: inline-block;
	line-height: 40px;
	font-size: 14px;
	margin-left: 5px;
}

.sp_com_input .spp_category2 .a14down {
	display: none;
}

/* 02_01 기부자정보  */
.sp_com_input .spp_category2_1 .sp_email {
	margin-top: 20px;
	overflow: hidden;
}

.sp_com_input .spp_category2_1 .sp_email h3, .sp_com_input .spp_category2_1 .sp_address h3
	{
	display: inline-block;
	line-height: 40px;
	vertical-align: top;
	width: 120px;
}

.sp_com_input .spp_category2_1 .sp_email .sp_email_inp {
	width: 200px;
}

.sp_com_input .spp_category2_1 .sp_address div {
	margin-top: 20px;
	overflow: hidden;
}

.sp_com_input .spp_category2_1 .sp_address button {
	margin-left: 5px;
}

.sp_com_input .spp_category2_1 .sp_address .sp_address_inp1 {
	width: 120px;
}

.sp_com_input .spp_category2_1 .sp_address .sp_address_inp2 {
	width: 500px;
}

/* 03  후원 분야 선택 */
.sp_com_input .spp_category3 .ca {
	width: 300px;
	margin-left: 10px;
	margin-right: 10px;
}

/* 약관 */
.sp_com_input .spp_category4 .terms {
	margin-top: 30px;
}

/* 05. 회원여부  */
.sp_com_input .spp_category5 .sp_id_ck {
	margin-top: 30px;
	overflow: hidden;
	display: none;
}

.sp_com_input .spp_category5 .sp_id_ck h3 {
	float: left;
	width: 100px;
	line-height: 40px;
}

.sp_com_input .spp_category5 .sp_id_ck .sp_id_ck_inp {
	float: left;
	width: 200px;
}

/* 후원하기 버튼  */
.sp_com_input .spp_category6 button {
	width: 200px;
	font-size: 18px;
}

.sp_com_input .spp_category6 {
	margin-top: 80px;
	text-align: center;
}

/* reg */
/*.sp_com_input .spp_category2 .sp_name_01_reg {
            font-size: 14px;
    		color: #FFA5A5;
            margin-left: 10px;
            display: none;  
             
        } */
.sp_com_input .sp_reg {
	font-size: 13px;
	color: #FFA5A5;
	margin-left: 10px;
	display: none;
}

.terms .box {
	padding: 20px;
	background-color: #F7FBFC;
	border: 1px solid #D6E6F2
}

.terms .box+p {
	margin: 5px 0 10px;
	font-weight: 300;
	font-size: 13px;
}

.terms h3 {
	margin-bottom: 10px;
	font-weight: 600;
}

.terms ul {
	margin-left: 20px;
}

.terms ul li {
	font-size: 14px;
	line-height: 1.6;
}

.terms .box+.rd_group {
	margin-top: 10px;
}

dl.member_chk dt {
	margin-bottom: 10px;
	font-weight: 600;
}

dl.member_chk dd {
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="sp_com_input">
					<div class="title">
						<h2>후원신청</h2>
						<p>동물권 행동 NEW-WAL을 통해 동물과 사람이 함께사는 삶을 응원해주세요</p>
					</div>
					<div class="spp_con">
						<div class="spp_body">
							<form
								action="${pageContext.request.contextPath}/PaymentCheck.sp?sp_category=${p_name}"
								method="post" id="joinForm">
								<div class="spp_category3 spp_category">
									<h2 class="spp_category1_title">선택한 후원 대상 확인</h2>
									<!-- 수평선 -->
									<input type="text" name="sp_category"
										class="inpform directname" value="${p_name}" disabled>
								</div>
								<div class="spp_category1 spp_category">
									<h2 class="spp_category1_title">기부금액</h2>
									<!-- 수평선 -->
									<ul>
										<li><button type="button" id="btn_pay5"
												class="btn_m btn_light btn_pay_set" value="5000">5천원</button>
										</li>
										<li><button type="button" id="btn_pay10"
												class="btn_m btn_light btn_pay_set" value="10000">1만원</button></li>
										<li><button type="button" id="btn_pay20"
												class="btn_m btn_light btn_pay_set" value="20000">2만원</button></li>
										<li><button type="button" id="btn_pay30"
												class="btn_m btn_light btn_pay_set" value="30000">3만원</button></li>
										<li><button type="button" id="btn_pay50"
												class="btn_m btn_light btn_pay_set" value="50000">5만원</button></li>
										<li><button type="button" id="btn_pay100"
												class="btn_m btn_light btn_pay_set" value="100000">10만원</button></li>
										<li><button type="button" id="btn_pay"
												class="btn_m btn_default btn_input btn_pay_set">직접입력</button></li>
										<li><input type="number" id="inp_pay" name="sp_amount"
											class="inpform inp_pay" placeholder="숫자만 입력" value=""
											required min="100" max="50000000"> <span>원</span></li>
									</ul>
								</div>
								<div class="spp_category2 spp_category">
									<h2 class="spp_category1_title">기부자 정보</h2>
									<!-- 수평선 -->
									<dl class="member_chk">
										<dt>만 14세 미만입니까?</dt>
										<dd>
											<div class="rd_group age14 selectBox">
												<div class="inp_rd">
													<input type="radio" class="sp_age14_ck" id="age_ck_rd1"
														name="sp_agecheck" value="Y"> <label
														for="age_ck_rd1">예</label>
												</div>
												<div class="inp_rd">
													<input type="radio" class="sp_age14_ck" id="age_ck_rd2"
														name="sp_agecheck" value="N" checked> <label
														for="age_ck_rd2">아니요</label>
												</div>
											</div>
										</dd>
									</dl>
									<div class="a14up" id="a14up">
										<div class="name">
											<h3>이름</h3>
											<input type="text" class="inpform na" id="sp_name_01"
												name="sp_name_01"  maxlength=5 required> <span
												class="sp_name_01_reg sp_reg" id="sp_name_01_reg">2 ~
												5 글자의 한글로 작성해주세요</span>
										</div>
										<div class="phone">
											<h3>휴대폰 번호</h3>
											<input type="number" class="inpform ph sp_ph01"
												id="sp_ph1_01" name="sp_ph1_01" required>-<input
												type="number" class="inpform ph sp_ph01" id="sp_ph2_01"
												name="sp_ph2_01" required>-<input type="number"
												class="inpform ph sp_ph01" id="sp_ph3_01" name="sp_ph3_01"
												required> <span class="sp_ph_01_reg sp_reg"
												id="sp_ph_01_reg">올바른 휴대폰 번호를 작성해주세요</span>
										</div>
										<div class="birth">
											<h3>생년월일</h3>
											<!-- 사이즈 만지기?? 이거 안됨  -->
											<div class="birth_wrap">
												<div class="">
													<input type="number" class="inpform bi_y sp_bi01" id="sp_bi_y_01" name="sp_bi_y_01" placeholder="1999" equired>
													<span>년</span>
												</div>
												<div>
													<div class="inp_slct bi">
														<select name="sp_bi_m_01" class="sp_bi_m_01 sp_bi01"
															id="sp_bi_m_01" required>
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
													<span>월</span>
												</div>
												<div>
													<div class="inp_slct bi">
														<select name="sp_bi_d_01" class="sp_bi_d_01 sp_bi01"
															id="sp_bi_d_01" required>
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
													<span>일</span>
												</div>	
											</div>
											 <span class="sp_bi_01_reg sp_reg" id="sp_bi_01_reg">올바른
												생년월일 작성해주세요</span>
										</div>
									</div>
									<div class="a14down" id="a14down">
										<div class="name">
											<h3>
												이름<span>(법정대리인)</span>
											</h3>
											<input type="text" class="inpform na" id="sp_name_02"
												name="sp_name_02  maxlength=5"> <span
												class="sp_name_02_reg sp_reg" id="sp_name_02_reg">2 ~
												5 글자의 한글로 작성해주세요</span>
										</div>
										<div class="phone">
											<h3>
												휴대폰 번호<span>(법정대리인)</span>
											</h3>
											<input type="number" class="inpform ph sp_ph02"
												id="sp_ph1_02" name="sp_ph1_02">-<input
												type="number" class="inpform ph sp_ph02" id="sp_ph2_02"
												name="sp_ph2_02">-<input type="number"
												class="inpform ph sp_ph02" id="sp_ph3_02" name="sp_ph3_02">
											<span class="sp_ph_02_reg sp_reg" id="sp_ph_02_reg">올바른
												휴대폰 번호를 작성해주세요</span>
										</div>
										<div class="birth">
											<h3>
												생년월일<span>(법정대리인)</span>
											</h3>
											<div class="birth_wrap">
												<div class="">
													<input type="number" class="inpform bi_y" id="sp_bi_y_02"
														name="sp_bi_y_02" placeholder="1999"> <span>년</span>
												</div>
												<div>
													<div class="inp_slct bi">
														<select name="sp_bi_m_02" id="sp_bi_m_02">
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
													<span>월</span>
												</div>
												<div>
													<div class="inp_slct bi">
														<select name="sp_bi_d_02" id="sp_bi_d_02">
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
													<span>일</span>
												</div>
											</div>
											<span class="sp_bi_02_reg sp_reg" id="sp_bi_02_reg">올바른
												생년월일 작성해주세요</span>
										</div>
										<div class="name">
											<h3>
												기부자명<span>(본인)</span>
											</h3>
											<input type="text" class="inpform na" id="sp_yname"
												name="sp_yname"  maxlength=5> <span class="sp_yname_reg sp_reg"
												id="sp_yname_reg">2 ~ 5 글자의 한글로 작성해주세요</span>
										</div>
										<div class="birth">
											<h3>
												생년월일<span>(본인)</span>
											</h3>
											<div class="birth_wrap">
												<div class="">
													<input type="number" class="inpform bi_y" id="sp_ybi_y" name="sp_ybi_y" placeholder="2008">
													<span>년</span>
												</div>
												<div>
													<div class="inp_slct bi">
														<select name="sp_ybi_m" id="sp_ybi_m">
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
													<span>월</span>
												</div>
												<div>
												<div class="inp_slct bi">
													<select name="sp_ybi_d" id="sp_ybi_d">
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
												<span>일</span>
											</div>
											<span class="sp_ybi_reg sp_reg" id="sp_ybi_reg">올바른 생년월일 작성해주세요</span>
										</div>
									</div>
								</div>
								<div class="spp_category2_1 spp_category">
									<h2 class="spp_category1_title"></h2>
									<!-- 수평선 -->
									<div class="sp_email">
										<h3>이메일</h3>
										<input type="text" class="inpform sp_email_inp"
											placeholder="example123@email.com" name="sp_email"
											id="sp_email"  maxlength=30 required> <span
											class="sp_email_reg sp_reg" id="sp_email_reg">올바른 이메일을
											작성해주세요</span>
									</div>

									<div class="sp_address">
										<div>
											<h3 class="ad_h3">우편번호</h3>
											<input type="text" id="sp_postcode" name="sp_postcode"
												class="inpform sp_address_inp sp_address_inp1"  maxlength=5 required>
											<button class="btn_m btn_default" id="sp_search"
												class="inpform sp_address_inp" type="button">우편번호
												찾기</button>
										</div>
										<div>
											<h3 class="ad_h3">도로명 주소</h3>
											<input type="text" id="sp_address1" name="sp_address1"
												class="inpform sp_address_inp sp_address_inp2"  maxlength=100 required>
										</div>
										<div>
											<h3>상세 주소</h3>
											<input type="text" id="sp_address2" name="sp_address2"
												class="inpform sp_address_inp sp_address_inp2"  maxlength=100 required>
										</div>
									</div>
								</div>
								<div class="spp_category4 spp_category">
									<h2 class="spp_category1_title">약관 동의</h2>
									<!-- 수평선 -->
									
									<div class="terms">
										<h3>개인정보 수집 및 이용 약관 (선택)</h3>
										<div class="box">
											<ul>
												<li> 개인정보 수집•이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 기부신청 및 이력 확인, 기부자 서비스 등 기부관련 업무에 제한을 받을 수 있습니다.</li>
												<li>가. 항목 : (필수) 성명, 생년월일, 연락처, 주소, 기부금 결재정보(카드번호, 계좌은행, 계좌번호, 예금주) (선택) 이메일</li>
                                            	<li>나. 수집•이용 목적 : 모금회에서 처리하는 기부관련 업무(기부신청, 기부내역확인, 확인서 발급, 기부자서비스 등)</li>
                                            	<li>다. 보유기간 : 마지막 기부시점 이후 5년</li>
											</ul>
										</div>
										 <div class="rd_group">
											<div class="inp_rd">
												<input type="radio" id="sp_terms01_1" name="sp_terms01" value="Y" checked> <label for="sp_terms01_1">동의합니다</label>
											</div>
											<div class="inp_rd">
												<input type="radio" id="sp_terms01_2" name="sp_terms01" value="N"> <label for="sp_terms01_2">동의하지
													않습니다</label>
											</div>
										</div>
									</div>
									
									
									<div class="terms">
										<h3>개인정보 제3자 제공 약관 (선택)</h3>
										<div class="box">
											<ul>
												<li>개인정보 제3자 제공•이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 기부금 결제 등에 제한을 받을 수 있습니다.</li>
												<li>가. 제공받는 곳 : 금융결제원, 이니시스, 해당은행, 국세청</li>
                                            	<li>나. 항목 : (CMS)은행명, 계좌번호, 예금주, 생년월일 (카드정보)카드번호, 유효기간, 소유주, 생년월일 (연말정산 간소화 서비스 이용)기부내역의 소득공제 확인</li>
                                            	<li>다. 제공목적 : 기부금결재, 기부금 소득공제 근거자료</li>
                                            	<li>라. 제공기간 : 기부금 결재 중단시 까지, 기부금 입금일 기준으로 소득공제가 실시되는 기간</li>
											</ul>
										</div>
										 <div class="rd_group">
											<div class="inp_rd">
												<input type="radio" id="sp_terms02_1" name="sp_terms02"	value="Y" checked> <label for="sp_terms02_1">동의합니다</label>
											</div>
											<div class="inp_rd">
												<input type="radio" id="sp_terms02_2" name="sp_terms02"	value="N"> <label for="sp_terms02_2">동의하지 않습니다</label>
											</div>
										</div>
									</div>
								</div>
								<div class="spp_category5 spp_category">
									<h2 class="spp_category1_title">회원 여부 확인</h2>
									
									<dl class="member_chk">
										<dt>저희 사이트의 회원 이십니까?</dt>
										<dd>
											<div class="rd_group">
												<div class="inp_rd">
													<input type="radio" id="id_ck_rd1" class="sp_mb_ck"
														name="sp_idcheck" value="Y"> <label for="id_ck_rd1">예</label>
												</div>
												<div class="inp_rd">
													<input type="radio" id="id_ck_rd2" class="sp_mb_ck"
														name="sp_idcheck" value="N" checked> <label
														for="id_ck_rd2">아니요</label>
												</div>
											</div>
		                                  <div class="sp_id_ck" id="sp_id_ck">
												<h3>ID 입력</h3>
												<input type="text" id="sp_id_ck_inp" class="inpform sp_id_ck_inp" name="sp_mb_id" maxlength=20>
											</div>
										</dd>
									</dl>
								</div>
								<div class="spp_category6 spp_category">
									<button class="btn_m btn_line" id="sp_send">다음단계</button>
								</div>
							</form>
						</div>
					</div>
					<!-- 끝 -->
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
<jsp:include page="/layout/jsp/modal.jsp"></jsp:include>	
 <jsp:include page="/layout/jsp/modal.jsp"></jsp:include> 	
	<script>
	 $(function () {
         //14세 미만 이상여부
         $('.sp_age14_ck').on('click', function () {
             var chkValue = $(this).val();
             console.log(chkValue);
             if (chkValue=='N')  {
                 $('#a14down').css('display', 'none');
                 $('#a14up').css('display', 'block');
                 
                 $("#sp_name_01").prop('required',true);
                 $("#sp_ph1_01").prop('required',true);
                 $("#sp_ph2_01").prop('required',true);
                 $("#sp_ph3_01").prop('required',true);
                 $("#sp_bi_y_01").prop('required',true);
                 $("#sp_bi_m_01").prop('required',true);
                 $("#sp_bi_d_01").prop('required',true);
                 
                  $("#sp_name_02").prop('required',false);
                 $("#sp_ph1_02").prop('required',false);
                 $("#sp_ph2_02").prop('required',false);
                 $("#sp_ph3_02").prop('required',false);
                 $("#sp_bi_y_02").prop('required',false);
                 $("#sp_bi_m_02").prop('required',false);
                 $("#sp_bi_d_02").prop('required',false); 
                 $("#sp_yname").prop('required',false); 
                 $("#sp_ybi_y").prop('required',false); 
                 $("#sp_ybi_m").prop('required',false); 
                 $("#sp_ybi_d").prop('required',false);   
                 
             }else if (chkValue=='Y')  {
            	 $('#a14up').css('display', 'none');
                 $('#a14down').css('display', 'block');
                 
                 $("#sp_name_01").prop('required',false);
                 $("#sp_ph1_01").prop('required',false);
                 $("#sp_ph2_01").prop('required',false);
                 $("#sp_ph3_01").prop('required',false);
                 $("#sp_bi_y_01").prop('required',false);
                 $("#sp_bi_m_01").prop('required',false);
                 $("#sp_bi_d_01").prop('required',false);
                 
                  $("#sp_name_02").prop('required',true);
                 $("#sp_ph1_02").prop('required',true);
                 $("#sp_ph2_02").prop('required',true);
                 $("#sp_ph3_02").prop('required',true);
                 $("#sp_bi_y_02").prop('required',true);
                 $("#sp_bi_m_02").prop('required',true);
                 $("#sp_bi_d_02").prop('required',true); 
                 $("#sp_yname").prop('required',true); 
                 $("#sp_ybi_y").prop('required',true); 
                 $("#sp_ybi_m").prop('required',true); 
                 $("#sp_ybi_d").prop('required',true);   
             }
         });
//아이디 있고 없고 여부
		 $('.sp_mb_ck').on('click', function () {
             var ckVal_mb = $(this).val();
             console.log(ckVal_mb);
             if (ckVal_mb=='N')  {
            	 $('#sp_id_ck').css('display', 'none');
            	 $('#sp_id_ck_inp').prop('required',false);
             }else if(ckVal_mb=='Y'){
            	 $('#sp_id_ck').css('display', 'block');
            	 $("#sp_id_ck_inp").prop('required',true);
             }
		 })

			$('.btn_pay_set').on('click', function() {
				
				var sp_amount_cho = $(this).val();
				console.log(sp_amount_cho);
				if (sp_amount_cho == '5000') {
					//alert('5000');
					$('#inp_pay').val('');
					$('#inp_pay').val('5000');

				} else if (sp_amount_cho == '10000') {
					$('#inp_pay').val('');
					$('#inp_pay').val('10000');
				} else if (sp_amount_cho == '20000') {
					$('#inp_pay').val('');
					$('#inp_pay').val('20000');
				} else if (sp_amount_cho == '30000') {
					$('#inp_pay').val('');
					$('#inp_pay').val('30000');
				} else if (sp_amount_cho == '50000') {
					$('#inp_pay').val('');
					$('#inp_pay').val('50000');
				} else if (sp_amount_cho == '100000') {
					$('#inp_pay').val('');
					$('#inp_pay').val('100000');
				} else if (sp_amount_cho == '') {
					$('#inp_pay').val('');
					$('#inp_pay').focus();
				}
			})
         
          document.getElementById("sp_search").onclick = function () {
                new daum.Postcode({
                    oncomplete: function (data) {
                        let roadAddr = data.roadAddress; // 도로명 주소 변수
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sp_postcode').value = data.zonecode;
                        document.getElementById("sp_address1").value = roadAddr;
                    }
                }).open();
            }
            
		 let nameReg = /^[가-힣]{3,5}$/;  
		 let ph1Reg = /^01[0-9]$/; 
		 let ph2Reg = /^[0-9]{3,4}$/; 
		 let ph3Reg = /^[0-9]{4}$/; 
		 let emailReg = /^[A-Za-z0-9_]+@[a-z]+[.][a-z]{2,3}$/; 

           //1.기부금액
		  $("#inp_pay").focusout(function(){
			    let val= $(this).val();
			    if(val < 100 || val > 50000000) {
			        alert("100~50,000,000 범위로 입력해 주십시오.");
			        $(this).val('');
			    }
			}); 
		 
             //성인
		  $("#sp_name_01").focusout(function(){
			  if (!(nameReg.test($(this).val()))) {
				  $("#sp_name_01_reg").css('display', 'inline-block');
				  $(this).val('');
					return false;
				}
			  $("#sp_name_01_reg").css('display', 'none');
		  });
		  
		  $(".sp_ph01").focusout(function(){
			  if (!(ph1Reg.test($("#sp_ph1_01").val()))) {
				  $("#sp_ph_01_reg").css('display', 'inline-block');
					return false;
				}
			  if (!(ph2Reg.test($("#sp_ph2_01").val()))) {
				  $("#sp_ph_01_reg").css('display', 'inline-block');
					return false;
				}
			  if (!(ph3Reg.test($("#sp_ph3_01").val()))) {
				  $("#sp_ph_01_reg").css('display', 'inline-block');
					return false;
				} 
			  $("#sp_ph_01_reg").css('display', 'none');
		  });
	
		  $("#sp_bi_y_01").focusout(function(){
			    let val= $(this).val();

			    if(val < 1900 || val > 2021) {
			    	//$("#sp_bi_01_reg").css('display', 'inline-block');
			        $(this).val('');
			    }
			    //$("#sp_bi_01_reg").css('display', 'none');
			}); 
		  //청소년
		   $("#sp_name_02").focusout(function(){
			  if (!(nameReg.test($(this).val()))) {
				  $("#sp_name_02_reg").css('display', 'inline-block');
				  $(this).val('');
					return false;
				}
			  $("#sp_name_02_reg").css('display', 'none');
		  });
		   $(".sp_ph02").focusout(function(){
				  if (!(ph1Reg.test($("#sp_ph1_02").val()))) {
					  $("#sp_ph_02_reg").css('display', 'inline-block');
						return false;
					}
				  if (!(ph2Reg.test($("#sp_ph2_02").val()))) {
					  $("#sp_ph_02_reg").css('display', 'inline-block');
						return false;
					}
				  if (!(ph3Reg.test($("#sp_ph3_02").val()))) {
					  $("#sp_ph_02_reg").css('display', 'inline-block');
						return false;
					} 
				  $("#sp_ph_02_reg").css('display', 'none');
			  });
		   
		   $("#sp_bi_y_02").focusout(function(){
			    let val= $(this).val();

			    if(val < 1900 || val > 2021) {
			    	//$("#sp_bi_02_reg").css('display', 'inline-block');
			        $(this).val('');
			    }
			   // $("#sp_bi_02_reg").css('display', 'none');
			}); 
		   $("#sp_yname").focusout(function(){
				  if (!(nameReg.test($(this).val()))) {
					  $("#sp_yname_reg").css('display', 'inline-block');
					  $(this).val('');
						return false;
					}
				  $("#sp_yname_reg").css('display', 'none');
			  });
			  
		   
		   $("#sp_ybi_y").focusout(function(){
			    let val= $(this).val();

			    if(val < 2007 || val > 2021) {
			    	//$("#sp_ybi_reg").css('display', 'inline-block');
			        $(this).val('');
			    }
			   // $("#sp_ybi_reg").css('display', 'none');
			}); 
      
		  //공통
		  $("#sp_email").focusout(function(){
			  if (!(emailReg.test($(this).val()))) {
				  $("#sp_email_reg").css('display', 'inline-block');
					return false;
				}
			  $("#sp_email_reg").css('display', 'none');
		  });
      
         
     })

	</script>
</body>
</html>