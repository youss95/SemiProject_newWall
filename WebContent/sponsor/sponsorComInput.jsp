<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2조 세미 프로젝트</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
</head>

<style>
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
	font-size: 20px;
	margin-bottom: 20px;
	border-bottom: 2px solid #769FCD;
	padding-bottom: 15px;
}

/* 각 항목 사이 공간 띄우기 */
.sp_com_input .spp_category {
	margin-top: 100px;
	float: left;
	width: 100%;
}

/* 01기부금액 관련 */
.sp_com_input .spp_category1 li {
	width: 100px;
	margin: 1%;
	float: left;
}

.sp_com_input .spp_category1 li:last-child {
	width: 150px;
	margin: 1%;
	float: left;
}

.sp_com_input .spp_category1 li:last-child .inp_pay {
	width: 85%;
	margin-left: 1%;
	/* margin-right: 2%; */
}

.sp_com_input .spp_category1 li:last-child span {
	margin-left: 3%;
	margin-bottom: 2%;
}

.sp_com_input .spp_category1 ul {
	overflow: hidden;
}

.sp_com_input .spp_category1 input {
	width: 150px;
	margin: 1%;
	float: left;
}

.sp_com_input .spp_category1 span {
	margin-top: 20px;
	float: left;
	/* 눈대중으로 맞췄는데 맞는지 헷갈림 */
}

/* 02기부자정보 */
.sp_com_input .spp_category2 .age14 {
	margin-top: 20px;
}

.sp_com_input .spp_category2 .ph {
	width: 70px;
	margin-left: 10px;
	margin-right: 10px;
}

.sp_com_input .spp_category2 .na {
	width: 150px;
	margin-left: 10px;
}

.sp_com_input .spp_category2 .bi {
	width: 30px;
	margin-left: 10px;
	margin-right: 10px;
}

.sp_com_input .spp_category2 .bi_y {
	width: 100px;
	margin-left: 10px;
	margin-right: 10px;
	float: left;
}

.sp_com_input .spp_category2 .phone {
	margin-top: 30px;
}

.sp_com_input .spp_category2 .name {
	margin-top: 30px;
}

.sp_com_input .spp_category2 .birth {
	margin-top: 30px;
}

.sp_com_input .spp_category2 .phone h3 {
	float: left;
	margin-top: 10px;
	margin-right: 30px;
	width: 100px;
}

.sp_com_input .spp_category2 .name h3 {
	float: left;
	margin-top: 10px;
	margin-right: 30px;
	width: 100px;
}

.sp_com_input .spp_category2 .birth h3 {
	float: left;
	margin-top: 10px;
	margin-right: 30px;
	width: 100px;
}

.sp_com_input .spp_category2 .a14down {
	display: none;
}

/* 02_01 기부자정보  */
.sp_com_input .spp_category2_1 .sp_email {
	margin-top: 30px;
	overflow: hidden;
}

.sp_com_input .spp_category2_1 .sp_email h3 {
	float: left;
	margin-top: 10px;
	margin-right: 30px;
	width: 100px;
}

.sp_com_input .spp_category2_1 .sp_email .sp_email_inp {
	float: left;
	width: 200px;
	margin-left: 10px;
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
	margin-top: 10px;
	margin-right: 30px;
	width: 100px;
}

.sp_com_input .spp_category5 .sp_id_ck .sp_id_ck_inp {
	float: left;
	width: 200px;
	margin-left: 10px;
}

/* 후원하기 버튼  */
.sp_com_input .spp_category6 button {
	width: 200px;
	font-size: 20px;
	font-weight: bold;
	/* 가운데 정렬 하고 싶어서 하다가 안되어서 일다 ㄴ 눈대중으로 .. */
	margin-left: 40%;
}

.sp_com_input .spp_category6 {
	margin-bottom: 100px;
}

.footer {
	float: left;
}
</style>
<body>
	<div class="wrap">
		<header class="header">
			<h1 class="logo">
				<a href="#">LOGO IMG</a>
			</h1>
			<div class="gnb">
				<ul class="clear">
					<li class="has"><a href="#">입양하기</a>
						<ul class="s_menu clear adopt">
							<li><a href="#">입양하기</a></li>
							<li><a href="#">입양 후기</a></li>
						</ul></li>
					<li><a href="#">후원하기</a></li>
					<li class="has"><a href="#">도움이필요해요</a>
						<ul class="s_menu clear help">
							<li><a href="#">잃어버렸어요</a></li>
							<li><a href="#">보호중이에요</a></li>
						</ul></li>
					<li class="has"><a href="#">뉴스레터</a>
						<ul class="s_menu clear news">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">소식</a></li>
						</ul></li>
					<!-- <li><a href="#">봉사활동</a></li> 보류 -->
				</ul>
			</div>
			<div class="utils">
				<ul class="clear">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<!-- <li><a href="#">마이페이지</a></li> -->
					<!-- <li><a href="#">로그아웃</a></li> -->
				</ul>
			</div>
			<div class="s_menu_bg"></div>
		</header>
		<div class="container">
			<div class="contents">
				<section class="sp_com_input">
					<!-- 하이 여기는 서브입니다 -->
					<div class="spp_con">
						<div class="spp_title_con">
							<h1 class="spp_title">후원신청</h1>
							<h2 class="spp_subtitle">동물권 행동 NEW-WAL을 통해 동물과 사람이 함께사는 삶을
								응원해주세요</h2>
							<!-- 멘트는 나주엥 바꾸던지 하기 -->
						</div>
						<div class="spp_body">

							<form action="${pageContext.request.contextPath}/PaymentCheck.sp"
								method="post" id="joinForm">
								<div class="spp_category1 spp_category">
									<h2 class="spp_category1_title">01.기부금액</h2>
									<!-- 수평선 -->
									<ul>
										<li><button type="button" id="btn_pay5"
												class="btn_m btn_light btn_pay_set" value="5000">5천원</button>
										</li>
										<li><button type="button" id="btn_pay10"
												class="btn_m btn_light btn_pay_set" value="10000">1만원</button></li>
										<li><button type="button" id="btn_pay20"
												class="btn_m btn_light btn_pay_set">2만원</button></li>
										<li><button type="button" id="btn_pay30"
												class="btn_m btn_light btn_pay_set">3만원</button></li>
										<li><button type="button" id="btn_pay50"
												class="btn_m btn_light btn_pay_set">5만원</button></li>
										<li><button type="button" id="btn_pay100"
												class="btn_m btn_light btn_pay_set">10만원</button></li>
										<li><button type="button" id="btn_pay"
												class="btn_m btn_default btn_input btn_pay_set">직접입력</button></li>
										<li><input type="number" id="inp_pay" name="sp_amount"
											class="inpform inp_pay" placeholder="숫자만 입력"> <span>원</span></li>
									</ul>
								</div>
								<div class="spp_category2 spp_category">
									<h2 class="spp_category1_title">02. 기부자 정보</h2>
									<!-- 수평선 -->
									<h3>만 14세 미만입니까?</h3>
									<div class="rd_group age14 selectBox">
										<div class="inp_rd">
											<input type="radio" id="age_ck_rd1" name="sp_agecheck"
												value="Y"> <label for="age_ck_rd1">예</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="age_ck_rd2" name="sp_agecheck"
												value="N" checked> <label for="age_ck_rd2">아니요</label>
										</div>
									</div>
									<div class="a14up" id="a14up">
										<div class="name">
											<h3>이름</h3>
											<input type="text" class="inpform na" name="sp_name_01">
										</div>
										<div class="phone">
											<h3>휴대폰 번호</h3>
											<input type="number" class="inpform ph" name="sp_ph1_01">-<input
												type="number" class="inpform ph" name="sp_ph2_01">-<input
												type="number" class="inpform ph" name="sp_ph3_01">
										</div>
										<div class="birth">
											<h3>생년월일</h3>
											<!-- 사이즈 만지기?? 이거 안됨  -->
											<div class="">
												<input type="number" class="inpform bi_y" name="sp_bi_y_01">
											</div>
											년
											<div class="inp_slct bi">
												<select name="sp_bi_m_01" id="">
													<option value=null>선택</option>
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
											월
											<div class="inp_slct bi">
												<select name="sp_bi_d_01" id="">
													<option value=null>선택</option>
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
											일
										</div>

									</div>
									<div class="a14down" id="a14down">
										<div class="name">
											<h3>
												이름<br>(법정대리인)
											</h3>
											<input type="text" class="inpform na" name="sp_name_02">
										</div>
										<div class="phone">
											<h3>
												휴대폰 번호<br>(법정대리인)
											</h3>
											<input type="number" class="inpform ph" name="sp_ph1_02">-<input
												type="number" class="inpform ph" name="sp_ph2_02">-<input
												type="number" class="inpform ph" name="sp_ph3_02">
										</div>
										<div class="birth">
											<h3>
												생년월일<br>(법정대리인)
											</h3>
											<!-- 사이즈 만지기?? 이거 안됨 셀렉트 -->
											<div class="">
												<input type="number" class="inpform bi_y" name="sp_bi_y_02">
											</div>
											년
											<div class="inp_slct bi">
												<select name="sp_bi_m_02" id="">
													<option value=null>선택</option>
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
											월
											<div class="inp_slct bi">
												<select name="sp_bi_d_02" id="">
													<option value=null>선택</option>
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
											일
										</div>
										<div class="name">
											<h3>
												기부자명<br>(본인)
											</h3>
											<input type="text" class="inpform na" name="sp_yname">
										</div>
										<div class="birth">
											<h3>
												생년월일<br>(본인)
											</h3>
											<!-- 사이즈 만지기?? 이거 안됨 셀렉트 -->
											<div class="">
												<input type="number" class="inpform bi_y" name="sp_ybi_y">
											</div>
											년
											<div class="inp_slct bi">
												<select name="sp_ybi_m" id="">
													<option value=null>선택</option>
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
											월
											<div class="inp_slct bi">
												<select name="sp_ybi_d" id="">
													<option value=null>선택</option>
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
											일
										</div>



									</div>

								</div>
								<div class="spp_category2_1 spp_category">
									<h2 class="spp_category1_title"></h2>
									<!-- 수평선 -->
									<div class="sp_email">
										<h3>이메일</h3>
										<input type="text" class="inpform sp_email_inp"
											placeholder="example123@email.com" name="sp_email">
									</div>

								</div>


								<div class="spp_category3 spp_category">
									<h2 class="spp_category1_title">03. 후원 분야 선택</h2>
									<!-- 수평선 -->
									<div class="inp_slct ca">
										<select name="sp_category" id="">
											<option value="company_동물권 교육 및 연구">동물권 교육 및 연구</option>
											<option value="company_정책사업">정책사업</option>
											<option value="company_동물복지사업">동물복지사업</option>
										</select>
									</div>
								</div>
								<div class="spp_category4 spp_category">
									<h2 class="spp_category1_title">04. 약관 동의</h2>
									<!-- 수평선 -->
									<div class="terms">
										<h3>개인정보 수집 및 이용 약관 (선택)</h3>
										<textarea class="txtareaform" name="" id="" cols="30" rows="4">
                                        개인정보 수집•이용에 대한 동의를 거부할 권리가 있습니다.
                                        그러나 동의를 거부할 경우 기부신청 및 이력 확인, 기부자 서비스 등 기부관련 업무에 제한을 받을 수 있습니다.
                                        가. 항목 : (필수) 성명, 생년월일, 연락처, 주소, 기부금 결재정보(카드번호, 계좌은행, 계좌번호, 예금주) (선택) 이메일
                                        나. 수집•이용 목적 : 모금회에서 처리하는 기부관련 업무(기부신청, 기부내역확인, 확인서 발급, 기부자서비스 등)
                                        다. 보유기간 : 마지막 기부시점 이후 5년
                                    </textarea>
										<div class="rd_group">
											<div class="inp_rd">
												<input type="radio" id="sp_terms01_1" name="sp_terms01"
													value="Y" checked> <label for="sp_terms01_1">동의합니다</label>
											</div>
											<div class="inp_rd">
												<input type="radio" id="sp_terms01_2" name="sp_terms01"
													value="N"> <label for="sp_terms01_2">동의하지
													않습니다</label>
											</div>
										</div>
									</div>
									<div class="terms">
										<textarea class="txtareaform" name="" id="" cols="30" rows="4">
                                        개인정보 제3자 제공•이용에 대한 동의를 거부할 권리가 있습니다.
                                        그러나 동의를 거부할 경우 기부금 결제 등에 제한을 받을 수 있습니다.
                                         가. 제공받는 곳 : 금융결제원, 이니시스, 해당은행, 국세청
                                         나. 항목 : (CMS)은행명, 계좌번호, 예금주, 생년월일
                                        (카드정보)카드번호, 유효기간, 소유주, 생년월일
                                        (연말정산 간소화 서비스 이용)기부내역의 소득공제 확인
                                         다. 제공목적 : 기부금결재, 기부금 소득공제 근거자료
                                         라. 제공기간 : 기부금 결재 중단시 까지, 기부금 입금일 기준으로 소득공제가 실시되는 기간 
                                        </textarea>
										<div class="rd_group">
											<div class="inp_rd">
												<input type="radio" id="sp_terms02_1" name="sp_terms02"
													value="Y" checked> <label for="sp_terms02_1">동의합니다</label>
											</div>
											<div class="inp_rd">
												<input type="radio" id="sp_terms02_2" name="sp_terms02"
													value="N"> <label for="sp_terms02_2">동의하지
													않습니다</label>
											</div>
										</div>
									</div>
								</div>

								<div class="spp_category5 spp_category">
									<h2 class="spp_category1_title">05. 회원 여부 확인</h2>
									<h3>저희 사이트의 회원 이십니까?</h3>
									<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="id_ck_rd1" name="sp_idcheck"
												value="Y"> <label for="id_ck_rd1">예</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="id_ck_rd2" name="sp_idcheck"
												value="N" checked> <label for="id_ck_rd2">아니요</label>
										</div>

									</div>
									<div class="sp_id_ck" id="sp_id_ck">
										<h3>ID</h3>
										<input type="text" class="inpform sp_id_ck_inp"
											name="sp_mb_id">
									</div>
								</div>


								<div class="spp_category6 spp_category">
									<button class="btn_m btn_line">다음단계</button>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script>
	 $(function () {
         //14세 미만 이상여부
         $('#age_ck_rd2').on('click', function () {
             var chkValue = $('input[type=radio][id="age_ck_rd2"]:checked').val();
            // console.log('dddd');
             if (chkValue) {
                 $('#a14down').css('display', 'none');
                 $('#a14up').css('display', 'block');
             }
         });
         $('#age_ck_rd1').on('click', function () {
             var chkValue = $('input[type=radio][id="age_ck_rd1"]:checked').val();
             //console.log('gg');
             if (chkValue) {
                 $('#a14up').css('display', 'none');
                 $('#a14down').css('display', 'block');
             }
         });
//아이디 있고 없고 여부
         $('#id_ck_rd2').on('click', function () {
             var chkValue = $('input[type=radio][id="id_ck_rd2"]:checked').val();
            // console.log('dddd');
             if (chkValue) {
                 $('#sp_id_ck').css('display', 'none');
             }
         });
         $('#id_ck_rd1').on('click', function () {
             var chkValue = $('input[type=radio][id="id_ck_rd1"]:checked').val();
             //console.log('gg');
             if (chkValue) {
                 $('#sp_id_ck').css('display', 'block');
             }
         });
         //약관 동의 벨류값
	
         

         // $('.btn_pay_set').on('click', function () {
         //     if ($(this).val = '5000') {
         //         $('#inp_pay').attr('value', '5000');
         //     } else if ($(this).val = '10000') {
         //         $('#inp_pay').attr('value', '10000');
         //     } else if ((this).id = '#btn_pay20') {
         //         $('#inp_pay').attr('value', '20000');
         //     } else if ((this).id = '#btn_pay30') {
         //         $('#inp_pay').attr('value', '30000');
         //     } else if ((this).id = '#btn_pay50') {
         //         $('#inp_pay').attr('value', '50000');
         //     } else if ((this).id = '#btn_pay10') {
         //         $('#inp_pay').attr('value', '10000');
         //     } else if ((this).id = '#btn_pay') {
         //         $('#inp_pay').attr('value', '');
         //     }
         // })

         //금액 입력하다 버튼누르는것 동작 안됨 위처럼 if문으로 해서 한펑션으로 가능히게 하기****

         $('#btn_pay5').on('click', function () {
             // $('#inp_pay').blur();
             // $('#inp_pay').empty();
             //  $('#inp_pay').val('');
             $('#inp_pay').attr('value', '5000');
         })
         $('#btn_pay10').on('click', function () {
             $('#inp_pay').attr('value', '10000');
         })
         $('#btn_pay20').on('click', function () {
             $('#inp_pay').attr('value', '20000');
         })
         $('#btn_pay30').on('click', function () {
             $('#inp_pay').attr('value', '30000');
         })
         $('#btn_pay50').on('click', function () {
             $('#inp_pay').attr('value', '50000');
         })
         $('#btn_pay100').on('click', function () {
             $('#inp_pay').attr('value', '100000');
         })
         $('#btn_pay').on('click', function () {
             $('#inp_pay').focus();


         })
     })

	</script>
</body>
</html>