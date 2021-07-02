<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>sponsorInfo</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">

<style>
* {
	box-sizing: border-box;
}

.sp_if .sp_title {
	font-size: 30px;
	font-weight: bold;
	/* margin-top: 60px; */
}

.sp_if .sp_body {
	margin-top: 100px;
	overflow: hidden;
	/* 이거해줘야 각각 플루트 래프트 들어가도 엉키지 않음  */
}

.sp_if .sp_company_title {
	font-size: 23px;
}

.sp_if .sp_company_bg {
	background-color: #D6E6F2;
	height: 100px;
	line-height: 50px;
	padding-left:1%;
}

.sp_if .sp_company .com_img2 {
	 display: none;
}

.sp_if .sp_company img {
	opacity: 0.9;
}

.sp_if .sp_info02_con {
	margin-top: 100px;
	/* margin: auto; */
	/* 이거 밑에 맨트 가운데로 하고싶어서 눈대중으로 한건데 나중에 방법 찾기 */
	margin-left: 9%;
	margin-right: 9%;
	text-align: center;
	float: left;
	width: 100%;
	margin-bottom: 150px;
}

.sp_if .sp_info02_pic img {
	width: 100px;
	align-content: center;
}

.sp_if .sp_info02_pic h4 {
	width: 300px;
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
	margin-bottom: 10px;
}

.sp_if .sp_info00_pic {
	float: left;
}

.sp_if .sp_info00_pic h3 {
	width: 400px;
}

.sp_if .sp_info00_con {
	float: left;
	width: 100%;
	text-align: center;
	margin-top: 100px;
	/* 이거 밑에 맨트 가운데로 하고싶어서 눈대중으로 한건데 나중에 방법 찾기 */
	margin-left: 13%;
	/* margin-right:15%; */
}

.sp_if .sp_info01_con {
	float: left;
	margin-top: 100px;
	width: 100%;
}

.sp_if .sp_info00_pic2 {
	margin-top: 25px;
	margin-bottom: 25px;
}

.sp_if .sp_info01 {
	line-height: 25px;
	/* 이거 밑에 맨트 가운데로 하고싶어서 눈대중으로 한건데 나중에 방법 찾기 */
	margin-left: 20%;
	margin-right: 15%;

	/* margin-top: 100px; */
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
				<section class="sp_if">
					<!-- 하이 여기는 서브입니다 -->
					<div class="sp_con">
						<div class="sp_title_con">
							<h1 class="sp_title">후원하기</h1>
							<h2 class="sp_subtitle">믿을 수 있는 NEW-WAL과 함께 새로운 세상을 맞이해주세요</h2>
						</div>
						<div class="sp_body">
							<div class="sp_company"  id="sp_company">
								<a href="#">
									<div class="sp_company_bg">
										<!-- 기능 만들고 호버하면 설명뒤 색 진해지고 사진 바뀌는 효과 넣기 -->
										<h2 class="sp_company_title"> 비영리 단체 NEW-WAL에게 후원</h2>
										<h3 class="sp_company_sub"> 동물과 사람이 함께 행복한 삶을 위해 세상을 바꾸는
											노력을 함께 해주세요</h3>
									</div> <img class="com_img1"
									src="../resources/images/sp_img/sp_company_01_1900_700.jpg"
									alt=""> <img class="com_img2"
									src="../resources/images/sp_img/sp_company02_1900_700.png" alt="">


								</a>

							</div>
							<!-- <div class="sp_direct">
								<a href="#">
									<div class="sp_direct_bg">
										<h2 class="sp_direct_title">비영리 단체 NEW-WAL에게 후원</h2>
										<h3 class="sp_direct_sub" >동물과 사람이 함께 행복한 삶을 위해 세상을 바꾸는 노력을 함께 해주세요</h3>
									</div>
									<img src="" alt="">
								</a>
								<div class="sp_direct_bg">
									<h2 class="sp_direct_title">비영리 단체 NEW-WAL에게 후원</h2>
									<h3 class="sp_direct_sub" >동물과 사람이 함께 행복한 삶을 위해 세상을 바꾸는 노력을 함께 해주세요</h3>
								</div>
								<img src="" alt="">
							</a>

							</div> -->
							<div class="sp_info00_con">
								<div class="sp_info00_pic">
									<img class="sp_info00_pic1"
										src="../resources/images/sp_img/sp_pr01.png" alt="">
									<h3>동물권행동 NEW-WAL는 2011년 기획재정부 지정기부금단체로 등록되었습니다.</h3>
								</div>
								<div class="sp_info00_pic">
									<img class="sp_info00_pic2"
										src="../resources/images/sp_img/sp_pr02.png" alt="">
									<h3>동물단체 중 유일하게 비영리단체 투명성 평가에서 만점을 받았습니다. (한국가이드스타 2015,
										2017, 2020)</h3>
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
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script>
	$(function(){
		 $(".sp_company").on("click",function(){
			// alert("aa");
			 location.href="${pageContext.request.contextPath}/comInput.sp";
			
			 
		 })
		  // $("#sp_company").hover(function () {

            //     $('.sp_if .sp_company .com_img2').attr('display', 'none')
            //     $('.sp_if .sp_company .com_img1').attr('display', 'block')
            // })
            $('#sp_company').mouseover(function () {
                $('.sp_if .sp_company .com_img2').show();
                $(".sp_if .sp_company .com_img1").hide()
                $('#sp_company .sp_company_bg').css('background-color', '#B9D7EA');
                //서서히 변하는거 찾아보기
            })
            $('#sp_company').mouseout(function () {
                $('.sp_if .sp_company .com_img1').show();
                $(".sp_if .sp_company .com_img2").hide()
                $('#sp_company .sp_company_bg').css('background-color', '#D6E6F2');
            })
		 
	})
	</script>
</body>
</html>