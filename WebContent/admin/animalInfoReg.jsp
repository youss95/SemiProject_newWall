<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">	
</head>

<body>
	<div class="wrap">
		<nav>
			<div class="lnb">
				<h1><a href="#">LOGO</a></h1>
				<ul class="slide_menu">
					<li class="depth1">
						<a href="#">회원관리<i class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">회원 명단 보기</a></li>
							<li class="depth2"><a href="#">회원관리</a></li>
						</ul>
					</li>
					<li class="depth1">
						<a href="#">게시판 관리<i class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">회원작성 글</a></li>
							<li class="depth2"><a href="#">뉴스</a></li>
							<li class="depth2"><a href="#">공지사항</a></li>
						</ul>
					</li>
					<li class="depth1">
						<a href="#">입양<i class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">입양 신청 리스트</a></li>
							<li class="depth2"><a href="#">입양 신청 상태 관리</a></li>
						</ul>
					</li>
					<li class="depth1">
						<a href="#">후원<i class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">후원금 관리</a></li>
						</ul>
					</li>
					<li class="depth1">
						<a href="#">동물 정보<i class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">동물 정보 관리</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded">
					<div class="title_area">
						<h2>동물 등록</h2>
					</div>
					<div class="contents">
						<form action="${pageContext.request.contextPath}/animalInfoReg.adm" method="post" enctype="multipart/form-data">
							<input type="text" name="anName" class="inpform" placeholder="이름을 입력해주세요.">
							<div class="inp_slct">
								<select name="anCategory">
									<option>종류</option>
									<option>개</option>
									<option>고양이</option>
									<option>기타</option>
								</select>
							</div>
							<div class="inp_slct">
								<select name="anGender">
									<option>ALL</option>
									<option>암컷</option>
									<option>수컷</option>
								</select>
							</div>
							<input type="text" name="anKind" class="inpform" placeholder="품종을 입력해주세요.">
							<input type="text" name="anAge" class="inpform" placeholder="나이를 입력해주세요.">
							<input type="text" name="anWeight" class="inpform" placeholder="무게를 입력해주세요.(단위 : kg)">
							<div class="inp_slct">
								<select name="anCharacter">
									<option>성격</option>
									<option>얌전</option>
									<option>보통</option>
									<option>활발</option>
									<option>매우활발</option>
								</select>
							</div>
							<input type="text" name="anDate" class="inpform" placeholder="구조날짜를 입력해주세요. (ex: YYYYMMDD)">
							<div class="inp_slct">
								<select name="anStatus" >
									<option value="">입양 유무</option>
									<option >Y</option>
									<option >N</option>
								</select>
							</div>
							<input type="file" name="anPhoto" id="anPhoto">
							<input type="hidden" name="anPhoto01_name" id="fileName01" onchange="chageLangSelect()">
							<input type="file" name="anPhoto02">
							<input type="hidden" name="anPhoto02_name" id="fileName02">
							<input type="file" name="anPhoto03">
							<input type="hidden" name="anPhoto03_name" id="fileName03">
							<textarea name="anContnets" class="txtareaform" placeholder="구조 내용을 입력해주세요."></textarea>
							<li><button class="btn_m btn_line">정보 등록</button></li>
						</form>
					</div>
				</section>
				
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script>
	function chageSelectedValue(){
				let fName = document.getElementById('anPhoto01').value;
				console.log(fName);
	}
	
	
	/* 	$(function(){
			$("#anFile01").on("change", function(){
			})
			
		}) */
	</script>
</body>

</html>