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
							<li class="depth2"><a href="${pageContext.request.contextPath}/adSponsorList.adm">후원금 관리</a></li>
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
						<h2>후원 내역 리스트</h2>
					</div>
					<div class="contents">
						<table class="table table-hover text-center adoption_list">
							<thead>
								<tr>
									<th>순서</th>
									<th>후원금액</th>
									<th>후원대상선택</th>
									<th>14세미만여부</th>
									<th>이름</th>
									<th>연락처</th>
									<th>생년월일</th>
									<th>청소년 후원자 이름</th>
									<th>청소년 후원자 생년월일</th>
									<th>이메일</th>
									<th>우편번호</th>
									<th>도로명 주소</th>
									<th>상세주소</th>
									<th>결제승인번호</th>
									<th>약관1동의 여부</th>
									<th>약관2동의 여부</th>
									<th>회원 시 ID</th>
									<th>후원 일자</th>
								</tr>
							</thead>
							<c:forEach var="si" items="${slist}">
							<tbody>
							<tr>
								    <td>${si.sponsor_seq}</td>
									<td>${si.sponsor_amount}</td>
									<td>${si.sponsor_choice}</td>
									<td>${si.sponsor_agecheck}</td>
									<td>${si.sponsor_name}</td>
									<td>${si.sponsor_contact}</td>
									<td>${si.sponsor_birth}</td>
									<td>${si.sponsor_yname}</td>
									<td>${si.sponsor_ybirth}</td>
									<td>${si.sponsor_email}</td>
									<td>${si.sponsor_postcode}</td>
									<td>${si.sponsor_address1}</td>
									<td>${si.sponsor_address2}</td>
									<td>${si.sponsor_apply_num}</td>
									<td>${si.sponsor_terms01}</td>
									<td>${si.sponsor_terms02}</td>
									<td>${si.sponsor_mb_id}</td>
									<td>${si.sponsor_date}</td>
							</tr>
							</tbody>
							</c:forEach>
						</table>
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
		
	</script>
</body>

</html>