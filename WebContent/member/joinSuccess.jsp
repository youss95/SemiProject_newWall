<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<jsp:include page="/layout/jsp/commonModal.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<style>
* {
	box-sizing: border-box;
}

#mem_join_success_con .pay_top {
	width: 100%;
	height: 50px;
	/* background-color: rgb(96, 124, 69); */
}

#mem_join_success_con {
	overflow: hidden;
	height: 800px;
}

#mem_join_success_con .mem_join_con {
	width: 500px;
	padding: 3%;
	background-color: #F7FBFC;
	box-shadow: 5px 5px 5px 5px #D6E6F2;
	float: left;
	margin-left: 27.5%;
	/* 눈대중 가운데 .. */
	margin-top: 150px;
}

#mem_join_success_con .mem_img_con {
	float: left;
	margin-left: 35%;
	/* 눈대중 가운데 .. */
	margin-top: -530px;
}

#mem_join_success_con .mem_join_con .mem_cal {
	width: 30%;
	float: left;
	font-size: 20px;
	margin-top: 5px;
	padding-left: 20px;
}

#mem_join_success_con .mem_join_con .mem_inp_ck {
	width: 60%;
	float: left;
	/* display: none; */
}

#mem_join_success_con .mem_join_con .mem_join_incon {
	width: 100%;
	padding: 3%;
	float: left;
}

#mem_join_success_con .mem_join_con .sp_pay_btncon {
	width: 100%;
	padding: 3%;
	padding-top: 40px;
	float: left;
	text-align: center;
}

#mem_join_success_con .mem_join_con .sp_pay_btncon button {
	width: 60%;
	height: 50px;
	font-size: 20px;
	background-color: #FCDADA;
	color: #254E7C;
	font-weight: 600;
	border: 1px solid #FCDADA;
}

#mem_join_success_con .mem_join_con .mem_join_title {
	width: 100%;
	font-size: 30px;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-top: 10px;
}

#mem_join_success_con .mem_top {
	float: left;
	width: 100%;
}

#mem_join_success_con .mem_top h3 {
	float: left;
	/* width: 100%; */
	font-size: 30px;
	font-weight: 600;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
	margin-left: 35%;

}

#mem_join_success_con .mem_top h3:after {
	background-color: #254E7C;
	opacity: .4;
	display: block;
	width: 100%;
	height: 8px;
	z-index: -1;
	margin-top: -10px;
	content: '';
}


#mem_join_success_con .mem_top p {
	float: left;
	width: 100%;
	font-size: 20px;
	text-align: center;
	padding-bottom: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/layout/jsp/modal.jsp" />
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section id="mem_join_success_con">
					<!-- 하이 여기는 서브입니다 -->
					<div class="mem_top">
						<h3>회원가입이 완료되었습니다!</h3>
						<p>NEW-WAL의 새로운 가족이 되신 것을 진심으로 환영합니다.</p>
						<p>가입 정보를 확인 후 로그인 하시면 더 많은 서비스를 이용 할 수 있습니다.</p>
					</div>

					<div class="mem_join_con">
						<div class="mem_join_incon">
							<h2 class="mem_join_title">
								<img
									src="${pageContext.request.contextPath}/resources/images/login_logo8.png"
									alt="">
							</h2>
						</div>
						<div class="mem_join_incon">
							<h3 class="mem_cal">ID</h3>
							<input type="text" class="inpform mem_inp_ck" value="${user_id}"
								disabled>
						</div>
						<div class="mem_join_incon">
							<h3 class="mem_cal">이름</h3>
							<input type="text" class="inpform mem_inp_ck" value="${name}"
								disabled>
						</div>

						<div class="mem_join_incon sp_pay_btncon">
							<a href="${pageContext.request.contextPath}/index.jsp"><button
									class="btn_m btn_primary btn_home">첫페이지로 가기</button></a>
						</div>
					</div>
					<div class="mem_img_con">
						<img
							src="${pageContext.request.contextPath}/resources/images/login_image4.png"
							alt="">
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

