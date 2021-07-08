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
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded">
					<div class="title_area">
						<h2>동물 정보 리스트</h2>
					</div>
					<div class="contents animal_list">
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th>번호</th>
									<th>동물코드</th>
									<th>이름</th>
									<th>종류</th>
									<th>입양상태</th>
									<th>등록일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_wrap">
							<a href="animalInfoReg.jsp" class="btn_m btn_default btn_style01">동물 정보 등록</a>
						</div>
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