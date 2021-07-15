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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
<style>
section>.title>h2:after {
	background-color: #254E7C;
	opacity: .4;
}
* {
	box-sizing: border-box;
}
.sp_if .sp_title {
	font-size: 30px;
	font-weight: bold;
	/* margin-top: 60px; */
}
.sp_if .sp_body {
	overflow: hidden;
}
.sp_if .sp_company_title {
	font-size: 23px;
	font-weight: 600;
}
.sp_if .sp_company_bg {
	background-color: #D6E6F2;
	line-height: 50px;
	padding:30px;
	transition-duration: .3s;
}
.sp_if .sp_company .img_wrap{
	position:relative;
	height:450px;
}
.sp_if .sp_company .img_wrap>img{
	position:absolute;top:0;left:0;
}
.sp_if .sp_company .com_img2 {
	
	opacity:0;
	transition-duration: 1s;
}
.sp_if .sp_company:hover .com_img2 {
	opacity:1;
}
.sp_if .sp_company:hover .com_img1 {
	opacity:0;
	transition-duration: 1s;
	/* 바꾸긴했는데 천천히는 안먹음 */
}
.sp_if .sp_company:hover .sp_company_bg {
	background-color: #B9D7EA;
}
.sp_if .sp_company img {
	opacity: 0.9;
}
.sp_if .sp_company {
	cursor: pointer;
}
.sp_if .sp_info02_con {
	overflow:hidden;
	text-align: center;
	width:900px;
	margin:100px auto 0;
}
.sp_if .sp_info02_pic img {
	width: 100px;
	align-content: center;
}
.sp_if .sp_info02_pic h4 {
	width: 300px;
    font-size: 16px;
    font-weight: 300;
    padding: 20px;
    line-height: 1.6;
    word-break: keep-all;
}
.sp_if .sp_info02_pic {
	float: left;
	margin: auto;
}
.sp_if .sp_info02_pic * {
	text-align: center;
}
.sp_info02_pic h3 {
	font-weight: bold;
	margin: 20px 0 10px;
	font-size:18px;
}
.sp_if .sp_info00_pic {
	float:left;
	width:50%;
	padding:100px 50px;
}
.sp_if .sp_info00_pic h3 {
	margin-top: 40px;
	font-size:24px;
	font-weight:300;
	line-height:1.5;
	word-break:keep-all;
}
.sp_if .sp_info00_con {
	width: 100%;
	text-align: center;
	overflow:hidden
}
.sp_if .sp_info01_con {
	width: 100%;
	text-align:center;
}
.sp_if .sp_info00_pic2 {
	margin-top: 25px;
}
.sp_if .sp_info01 {
	line-height: 25px;
	text-align:left;
	display:inline-block;
}
.sp_if .sp_one_one {
	width: 50%;
	padding-right: 0.5%;
	padding-top: 1%;
	float: left;
	cursor: pointer;
}
.sp_if .sp_one_one .sp_img_con {
	overflow: hidden;
}
.sp_if .sp_guardi {
	width: 50%;
	padding-left: 0.5%;
	padding-top: 1%;
	float: left;
	cursor: pointer;
}
.sp_if .sp_guardi .sp_img_con {
	overflow: hidden;
}
.sp_if .sp_one_one:hover .sp_company_bg {
	background-color: #B9D7EA;
}
.sp_if .sp_one_one:hover .com_img1 {
	transform: scale(1.1);
	transition-duration: 1s;
}
.sp_if .sp_guardi:hover .sp_company_bg {
	background-color: #B9D7EA;
}
.sp_if .sp_guardi:hover .com_img1 {
	transform: scale(1.1);
	transition-duration: 1s;
}
</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="../../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section class="sp_if">
					<div class="title">
						<h2>후원신청</h2>
						<p>믿을 수 있는 NEW-WAL과 함께 새로운 세상을 맞이해주세요</p>
					</div>
					<div class="sp_con">
						<div class="sp_body">
							<div class="sp_company" id="sp_company">
								<div class="sp_company_bg">
									<h2 class="sp_company_title">비영리 단체 NEW-WAL에게 후원</h2>
									<h3 class="sp_company_sub">동물과 사람이 함께 행복한 삶을 위해 세상을 바꾸는
										노력을 함께 해주세요</h3>
								</div>
								<div class="img_wrap">
									<img class="com_img1" src="../resources/images/sp_img/sp_company_01_1900_700.jpg" alt=""> 
									<img class="com_img2" src="../resources/images/sp_img/sp_company02_1900_700.png" alt="">
								</div>
							</div>
							<div>
								<div class="sp_one_one">
									<div class="sp_company_bg sp_one_one_bg_m">
										<h2 class="sp_company_title sp_one_one_title">1 : 1 보호소
											유기 동물 후원</h2>
										<h3 class="sp_company_sub sp_one_one_sub">보호소의 동물들에게 특별한 사랑을 나눠주세요</h3>
									</div>
									<div class="sp_img_con">
										<img class="com_img1"
											src="../resources/images/sp_img/sp_company_03_950_700.jpg"
											alt="">
									</div>
								</div>
								<div class="sp_guardi">
									<div class="sp_company_bg sp_guardi_bg_m">
										<h2 class="sp_company_title sp_guardi_title">개인 임시 보호자 선택
											후원</h2>
										<h3 class="sp_company_sub sp_guardi_sub">개인 임시보호자의 부담을 조금만 덜어주세요</h3>
									</div>
									<div class="sp_img_con">
										<img class="com_img1"
											src="../resources/images/sp_img/sp_company_04_950_700.jpg"
											alt="">
									</div>
								</div>
							</div>
							<div class="sp_info00_con">
								<div class="sp_info00_pic">
									<img class="sp_info00_pic1"
										src="../resources/images/sp_img/sp_pr01.png" alt="">
									<h3>동물권행동 NEW-WAL는 2011년 기획재정부 지정기부금단체로 등록되었습니다.</h3>
								</div>
								<div class="sp_info00_pic">
									<img class="sp_info00_pic2"
										src="../resources/images/sp_img/sp_pr02.png" alt="">
									<h3>동물단체 중 유일하게 비영리단체 투명성 평가에서 만점을 받았습니다.<br>(한국가이드스타 2015, 2017, 2020)</h3>
								</div>
							</div>
							<div class="sp_info01_con">
								<p class="sp_info01">
									• NEW-WAL의 모든 후원금은 기부금품모집 등록에 관한 법률을 준수하여 모집하고 사용됩니다.<br>
									• 동물권행동 NEW-WAL는 정부 승인 동물보호 사단 법인으로서의 의무와 책임을 다합니다.<br> •
									매년 정기총회에서 회원의 승인을 받아 연간 활동을 실행하며 보고합니다.<br> • NEW-WAL의
									후원금은 목적사업을 위해서 사용되며 후원금 현황과 사용내역을 매달 홈페이지에 투명하게 공개합니다.<br>
									• 연 1회 법인 회계 감사를 진행하며 회계 법인을 통한 외부감사를 실시합니다.<br>
								</p>
							</div>
							<div class="sp_info02_con">
								<div class="sp_info02_pic">
									<img src="../resources/images/sp_img/sp_news.png" alt="">
									<h3>뉴스레터</h3>
									<h4>이메일을 통해 월 1회 이상 소식지를 보내 드립니다.</h4>
								</div>
								<div class="sp_info02_pic">
									<img src="../resources/images/sp_img/sp_cal.png" alt="">
									<h3>회원만남 행사</h3>
									<h4>회원만남 행사 신규회원·지역별 만남행사, 연말행사 등에 후원자님을 초대합니다.</h4>
								</div>
								<div class="sp_info02_pic">
									<img src="../resources/images/sp_img/sp_rc.png" alt="">
									<h3>기부금영수증 발급</h3>
									<h4>국세청 연말정산 간소화 서비스에서 기부금영수증을 발급받을 수 있습니다.</h4>
								</div>
							</div>
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
	
	<script>
		$(function() {
			$(".sp_company").on("click",function() {
								location.href = "${pageContext.request.contextPath}/comInput.sp";
							})
			$(".sp_one_one").on("click",function() {
								location.href = "${pageContext.request.contextPath}/adoptList.apt?cpage=1";
							})
			$(".sp_guardi").on("click",function() {
								location.href = "${pageContext.request.contextPath}/protectList.lost?page=1";
							}) 
		})
		
		
	</script>
</body>
</html>