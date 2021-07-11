<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@ include file="../layout/jsp/commonModal.jsp" %>
  <style>
  .card{float:left;margin:10px;}
  .wrap{overflow:hidden;}
  .progress{height:40px; border-radius:30px;}
  </style>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostList">
				<div class="wrap">
				<c:forEach var="maplist" items="${mapList}">
				<div style="width:500px;" class="card">
				
  <h2 class="card-header" style="font-size:20px;"><span style="padding:6px;background-color:orange;border-radius:5px;">실종</span>&nbsp; ${maplist.lostName}</h2>
  <div class="card-body">
    <span style="font-size:15px;" class="card-title">
    <c:if test="${maplist.lostGender == 'F' }">
    암컷
    </c:if>
     <c:if test="${maplist.lostGender == 'M' }">
   수컷
    </c:if>
   /${maplist.lostAge}살/${maplist.lostKind}/
  <c:if test="${maplist.lostCategory == 'dog' }">
    강아지
    </c:if>
    <c:if test="${maplist.lostCategory == 'cat' }">
    고양이
    </c:if> 
   </span>
   <div>장소: ${maplist.lostAddr}</div>
   <div>아이디: ${maplist.lostAddr}</div>
    <p class="card-text">기타내용:${maplist.lostContent}</p>
   <img style="width:150px;height:150px;" src="${pageContext.request.contextPath}/upload/lostAnimal/${maplist.fileRealName}">
  </div>
</div>

</c:forEach>
</div>


<!-- 페이지 네비 -->
<ul class="pagination justify-content-center">
	<c:choose>
	<c:when test="${param.page<=1 }">
<li class="page-item  "><a class="page-link"     onclick="alert('이전 페이지가 없습니다.');">&lt</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/lostMapList.lost?page=${param.page-1}">&lt</a></li>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
	<c:when test="${lastPage <= param.page}">
		<li class="page-item  "><a class="page-link"     onclick="alert('다음 페이지가 없습니다.');">&gt</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/lostMapList.lost?page=${param.page+1}">&gt</a></li>
	</c:otherwise>
	</c:choose>
	</ul>



	<!-- 진행바 -->
<div class="progress col-md-12 m-2">
	
		<div class="progress-bar" style="width: ${currentPercent}%" ></div>
	</div>

				</section>
				</div>
				</div>
<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
</body>
</html>