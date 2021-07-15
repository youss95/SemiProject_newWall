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
<%-- 			<jsp:include page="../layout/jsp/adminBoardNav.jsp"></jsp:include> --%>
				<section class="shadow-sm rounded">
					<div class="title_area">
						<h2>임시보호 게시판</h2>
					</div>
					<div class="contents animal_list">
						<table class="table table-hover text-center">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="40%">
								<col width="20%">
							
								
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>작성자</th>
									<th>동물정보</th>
									<th>등록일자</th>
							
								
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ap" items="${adProtect}">
								<tr>
										<td><a href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${ap.protectNo}&page=1">${ap.protectNo}</a></td>
										<td>${ap.protectWriter}</td>
										<td>${ap.protectName}/${ap.protectGender}/${ap.protectKind}</td>
										<td>${ap.protectCreateDate}<span style="float:right;padding-right:10px;"><a href="${pageContext.request.contextPath}/paDelete.adm?protectNo=${ap.protectNo}"><i class="fas fa-backspace"></i></a></span> </td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						
<navi aria-label="Page navigation example ">
  <ul class="pagination mt-4 justify-content-center align-items-center">
  <c:choose>
  <c:when test="${param.page<=1}">
   <li class="page-item  "><a class="page-link"     onclick="alert('이전 페이지가 없습니다.');">Previous</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/protectAnimal.adm?page=${param.page-1}">Previous</a></li>
     </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${startNum}" end="${lastNum}" step="1">
    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/protectAnimal.adm?page=${i}">${i}</a></li>
   </c:forEach>
   
   <c:choose>
   
   	<c:when test="${param.page >= lastPage }">
   		<li class="page-item  "><a class="page-link"     onclick="alert('마지막 페이지 입니다.');">Next</a></li>
   	</c:when>
   	<c:otherwise>
   	 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/protectAnimal.adm?page=${param.page+1}">Next</a></li>
   	</c:otherwise>
    </c:choose>
  </ul>
  
</navi>
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