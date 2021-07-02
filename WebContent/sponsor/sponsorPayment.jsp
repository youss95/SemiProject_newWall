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


<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
* {
	box-sizing: border-box;
}

.sp_pay_section .pay_top {
	width: 100%;
	height: 50px;
	/* background-color: rgb(96, 124, 69); */
}

.sp_pay_section .sp_pay_con {
	width: 500px;
	/* height: 1000px; */
	padding: 3%;
	margin-top: 100px;
	margin: auto;
	background-color: #F7FBFC;
	box-shadow: 5px 5px 5px 5px #D6E6F2;
	overflow: hidden;
}

.sp_pay_section .sp_pay_con .sp_pay_cal {
	width: 30%;
	float: left;
	/* display: none; */
	/* margin-left: ; */
}

.sp_pay_section .sp_pay_con .sp_inp_ck {
	width: 60%;
	float: left;
	/* display: none; */
}

.sp_pay_section .sp_pay_con .sp_pay_incon {
	width: 100%;
	padding: 3%;
	float: left;
}

.sp_pay_section .sp_pay_con .sp_pay_btncon {
	width: 100%;
	padding: 3%;
	padding-top: 40px;
	float: left;
	text-align: center;
}

.sp_pay_section .sp_pay_con .sp_pay_btncon button {
	width: 50%;
	height: 50px;
	font-size: 20px;
}

.sp_pay_section .sp_pay_con .sp_pay_title {
	width: 100%;
	font-size: 30px;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
</head>
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
				<section class="sp_pay_section">
					<!-- 하이 여기는 서브입니다 -->
					sponsor_amount:${sponsor.sponsor_amount} <br>
					sponsor_agecheck:${sponsor.sponsor_agecheck} <br>
					sponsor_name:${sponsor.sponsor_name} <br>
					sponsor_contact:${sponsor.sponsor_contact} <br>
					sponsor_birth:${sponsor.sponsor_birth} <br>
					sponsor_yname:${sponsor.sponsor_yname} <br>
					sponsor_ybirth:${sponsor.sponsor_ybirth} <br>
					sponsor_email:${sponsor.sponsor_email} <br>
					sponsor_terms01:${sponsor.sponsor_terms01} <br>
					sponsor_terms02:${sponsor.sponsor_terms02} <br>
					sponsor_mb_id:${sponsor.sponsor_mb_id} <br>


					<div class="pay_top"></div>
					<div class="sp_pay_con">
						<div class="sp_pay_incon">
							<h2 class="sp_pay_title">입력 정보 확인</h2>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">기부금액</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_amount}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">14세 미만 여부(확인후 뺄것)</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_agecheck}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">이름</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_name}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">휴대폰 번호</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_contact}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">생년월일</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_birth}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">기부자명</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_yname}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">14세미만 기부자 생년월일</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_ybirth}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">이메일</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_email}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">우편번호</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_postcode}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">도로명 주소</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_address1}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">상세 주소</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_address2}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">후원 분야</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_division}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">개인정보 수집 약관 동의 여부(확인후 뺄것)</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_terms01}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">개인정보 제3자 제공 약관 동의 여부(확인후 뺄것)</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_terms02}" disabled>
						</div>
						<div class="sp_pay_incon">
							<h3 class="sp_pay_cal">회원인 경우 ID</h3>
							<input type="text" class="inpform sp_inp_ck"
								value="${sponsor.sponsor_mb_id}" disabled>
						</div>
						<div class="sp_pay_incon sp_pay_btncon">
							<button class="btn_m btn_primary">결제하기</button>
						</div>


					</div>







					<button id="check_module" type="button">입력정보 확인 후 결제하기</button>

					<script>
						$("#check_module")
								.click(
										function() {
											var IMP = window.IMP; // 생략가능
											IMP.init('imp19780029');
											// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
											// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
											IMP
													.request_pay(
															{
																pg : 'inicis', // version 1.1.0부터 지원.
																/* 
																    'kakao':카카오페이, 
																    html5_inicis':이니시스(웹표준결제)
																        'nice':나이스페이
																        'jtnet':제이티넷
																        'uplus':LG유플러스
																        'danal':다날
																        'payco':페이코
																        'syrup':시럽페이
																        'paypal':페이팔
																 */
																pay_method : 'card',
																/* 
																    'samsung':삼성페이, 
																    'card':신용카드, 
																    'trans':실시간계좌이체,
																    'vbank':가상계좌,
																    'phone':휴대폰소액결제 
																 */
																merchant_uid : 'merchant_'
																		+ new Date()
																				.getTime(),
																/* 
																    merchant_uid에 경우 
																    https://docs.iamport.kr/implementation/payment
																    위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
																    참고하세요. 
																    나중에 포스팅 해볼게요.
																 */
																name : 'NEW-WAL업체 후원',
																//결제창에서 보여질 이름
																amount : '${sponsor.sponsor_amount}',
																//가격 
																buyer_email : 'iamport@siot.do',
																buyer_name : '${sponsor.sponsor_name}',
																buyer_tel : '${sponsor.sponsor_contact}',
																buyer_addr : '서울특별시 강남구 삼성동',
																buyer_postcode : '123-456',
																// m_redirect_url: 'https://www.yourdomain.com/payments/complete'
																m_redirect_url : 'https://www.yourdomain.com/payments/complete'
															/*  
															    모바일 결제시,
															    결제가 끝나고 랜딩되는 URL을 지정 
															    (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
															 */
															},
															function(rsp) {
																console
																		.log(rsp);
																if (rsp.success) {
																	var msg = '결제가 완료되었습니다.';
																	msg += '고유ID : '
																			+ rsp.imp_uid;
																	msg += '상점 거래ID : '
																			+ rsp.merchant_uid;
																	msg += '결제 금액 : '
																			+ rsp.paid_amount;
																	msg += '카드 승인번호 : '
																			+ rsp.apply_num;
																} else {
																	var msg = '결제에 실패하였습니다.';
																	msg += '에러내용 : '
																			+ rsp.error_msg;
																}
																alert(msg);
															});
										});
					</script>
					<!-- 하이 여기는 서브입니다 -->
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
	

	<%-- <script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>  --%>

	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</body>
</html>