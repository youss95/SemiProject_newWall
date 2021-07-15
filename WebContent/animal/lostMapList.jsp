<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <style>
  body{
  background-color:#f3f7f9}
  .card{float:left;margin:10px;}
 .lostList li,ul {
        list-style: none;
        padding: 0;
      
      }
      .ucontainer {
    
        display: flex;
        gap: 1em;
        min-height: 100vh;
        flex-wrap: wrap;
        justify-content: flex-start;
      }
      .wrapper {
    
        overflow: hidden;
        width: 300px;
        height:500px;
        margin-left:25px;
      }
      .lostList{
      margin:0 auto;
      }
       #body {
        height: 100%;
        width: 1024px;
        margin: 0 auto;
      }
      .ucontainer li{
      color:#0075d8;
     font-weight: 600;
     font-size:20px;
      }
  .progress{height:40px; border-radius:30px;}
  </style>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostList">
				<div id="body">
				<div class="wrap">
				<h2 style="font-size:29px;color:#9d9d9d">실종 동물</h2><br><br>
				 <ul class="ucontainer">
				 <c:forEach var="maplist" items="${mapList}">
				   <li class="wrapper"><img style="width:100%;height:200px;" src="${pageContext.request.contextPath}/upload/lostAnimal/${maplist.fileRealName}" /><p>
				   <c:if test="${sessionScope.loginInfo.user_id eq maplist.lostWriter}">
  	<a href="${pageContext.request.contextPath}/lostDelete.lost?lostNo=${maplist.lostNo}"><i class="fas fa-backspace"></i></a>&nbsp;&nbsp;&nbsp;
  	<a href="${pageContext.request.contextPath}/lostUpdateForm.lost?lostNo=${maplist.lostNo}"><i class="fas fa-edit"></i></a>
  	</c:if>
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
  	</p>
  	<div>장소: ${maplist.lostAddr}</div>
   <div>아이디: ${maplist.lostAddr}</div>
    <div class="card-text">기타내용:${maplist.lostContent}</div>
  	</li>
				   </c:forEach>
				 </ul>
				</div>
				


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
	<c:when test="${lastPage <param.page}">
		<li class="page-item  "><a class="page-link"     onclick="alert('다음 페이지가 없습니다.');">&gt</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/lostMapList.lost?page=${param.page+1}">&gt</a></li>
	</c:otherwise>
	</c:choose>
	</ul>



	<!-- 진행바 -->

				</section>
				</div>
				</div>
<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<%@ include file="../layout/jsp/modal.jsp"%>
</body>
</html>