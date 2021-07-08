<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostSection">
				<c:forEach var="maplist" items="${mapList}">
				<div class="card">
				
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
<br>
</c:forEach>
				</section>
				</div>
				</div>
<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
</body>
</html>