<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>뉴월 관리자 페이지</title>
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
				<section class="shadow-sm rounded reg_info">
					<div class="title_area">
						<h2>동물 등록</h2>
					</div>
					<div class="contents">
						<form action="${pageContext.request.contextPath}/animalInfoReg.adm" method="post" enctype="multipart/form-data">
							<table class="form_tbl">
								<tr>
									<th>이름</th>
									<td><input type="text" name="anName" class="inpform" placeholder="이름을 입력해주세요."></td>
								</tr>
								<tr>
									<th>종류</th>
									<td>
										<div class="inp_slct">
											<select name="anCategory">
												<option>종류</option>
												<option>개</option>
												<option>고양이</option>
												<option>기타</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>성별</th>
									<td>
										<div class="inp_slct">
											<select name="anGender">
												<option>ALL</option>
												<option>암컷</option>
												<option>수컷</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>품종</th>
									<td><input type="text" name="anKind" class="inpform" placeholder="품종을 입력해주세요."></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" name="anAge" class="inpform" placeholder="나이를 입력해주세요."></td>
								</tr>
								<tr>
									<th>무게</th>
									<td><input type="text" name="anWeight" class="inpform" placeholder="무게를 입력해주세요.(단위 : kg)"></td>
								</tr>
								<tr>
									<th>성격</th>
									<td>
										<div class="inp_slct">
											<select name="anCharacter">
												<option>성격</option>
												<option>얌전</option>
												<option>보통</option>
												<option>활발</option>
												<option>매우활발</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>구조 일자</th>
									<td><input type="text" name="anDate" class="inpform" placeholder="구조일자를 입력해주세요. (ex: YYYYMMDD)"></td>
								</tr>
								<tr>
									<th>중성화 유무</th>
									<td>
										<div class="inp_slct">
											<select name="anNeutering" >
												<option value="">중성화 유무</option>
												<option >Y</option>
												<option >N</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th>사진<span class="s_txt">(최대 3장까지 업로드 가능)</span></th>
									<td>
										<div class="file_upload">
											<input type="file" name="anPhoto1">
											<input type="file" name="anPhoto02">
											<input type="file" name="anPhoto03">
										</div>
									</td>
								</tr>
								<tr>
									<th>구조 내용</th>
									<td><textarea name="anContnets" class="txtareaform" placeholder="구조 내용을 입력해주세요."></textarea></td>
								</tr>
							</table>
							<div class="btn_wrap">
								<button class="btn_m btn_default">정보 등록</button>
							</div>
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
</body>

</html>