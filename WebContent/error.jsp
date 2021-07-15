<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2조 세미 프로젝트</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css" />

<style>
.error_body {
	width: 100%;
	overflow: hidden;
	margin-bottom:300px;
}

.error_con {
	width: 50%;
	overflow: hidden;
	margin: auto;
	margin-top: 50px;
	text-align: center;
}

.error_con .error_404 {
	width: 100%;
	overflow: hidden;
}

.error_con .error_rogo {
	margin-top: 30px;
}

.error_btn_home {
	width: 270px;
	height: 70px;
	font-weight: 600;
	font-size: 25px;
	line-height: 47px;
}

.error_btn_con {
	text-align: center;
	margin-top: -50px;
}
</style>

</head>

<body>
	<div class="error_body">
		<div class="error_con">
			<img class="error_rogo" src="resources/images/login_logo7.png">
			<img class="error_404"
				src="resources/images/NEW-WAL 404_ment(X).png" alt="">
		</div>
		<div class="error_btn_con">
			<a href="index.jsp"
				class="btn_m btn_default error_btn_home">홈으로 돌아가기</a>
		</div>
	</div>


</body>
</html>