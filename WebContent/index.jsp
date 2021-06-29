<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>2조 세미 프로젝트</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layout/css/member.css">
</head>
<body>
	<div class="wrap">
		<header class="header">
			<h1 class="logo"><a href="#">LOGO IMG</a></h1>
			<div class="gnb">
				<ul class="clear">
					<li class="has">
						<a href="#">입양하기</a>
						<ul class="s_menu clear adopt">
							<li><a href="#">입양하기</a></li>
							<li><a href="#">입양 후기</a></li>
						</ul>
					</li>
					<li class="has">
						<a href="#">후원하기</a>
						<ul class="s_menu clear support">
							<li><a href="#">1:1 후원</a></li>
							<li><a href="#">업체 정기 후원</a></li>
							<li><a href="#">임시보호자 지정 후원</a></li>
						</ul>
					</li>
					<li class="has">
						<a href="#">도움이필요해요</a>
						<ul class="s_menu clear help">
							<li><a href="#">잃어버렸어요</a></li>
							<li><a href="#">보호중이에요</a></li>
						</ul>
					</li>
					<li class="has">
						<a href="#">뉴스레터</a>
						<ul class="s_menu clear news">
							<li><a href="#">공지사항</a></li>
							<li><a href="#">소식</a></li>
						</ul>
					</li>
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
				<section>
					start
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
	<script src="${pageContext.request.contextPath}/layout/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/layout/js/common.js"></script>
</body>
</html>