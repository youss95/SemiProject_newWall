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
						<h2>입양 신청 리스트</h2>
					</div>
					<div class="contents">
						<table class="table table-hover text-center adoption_list">
							<thead>
								<tr>
									<th>순서</th>
									<th>신청코드</th>
									<th>동물이름</th>
									<th>신청자</th>
									<th>신청일자</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
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
		$(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/adoptRegList.adm",
				type: "get",
				dataType: "json"
			}).done(function(resp){
				let tbody = $('.adoption_list tbody');
				
				if(resp.length == 0){
					tbody.append("<tr class=nodata><td colspan=5>신청자 내역이 존재하지 않습니다.");
				}else{					
					for(let i=0; i<resp.length; i++){
					 	let tr = $("<tr>");
						tr.append("<td>" + resp[i].adopt_seq);
						tr.append("<td>" + resp[i].code_seq);
						tr.append("<td>" + resp[i].an_name);
						tr.append("<td>" + resp[i].user_id);
						tr.append("<td>" + resp[i].reg_date);
						tbody.append(tr);
					} 
				}
			})
		})
	</script>
</body>

</html>