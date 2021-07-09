<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/protectionBoard.css">
<%@ include file="../layout/jsp/commonModal.jsp" %>
</head>
<body>
<div class="wrap">
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
			<img src="${pageContext.request.contextPath}/resources/images/img05.jpeg"/>
				<section class="protectBoard">
				
				 <div class="cont">
     <div class="row">
    <c:forEach var="p" items="${protectList}">
        <div class="card shadow-soft">
            <img src="${pageContext.request.contextPath}/upload/lostAnimal/${p.protectFileRealName1}">
            <div class="card-body">
                <h4>${p.protectName }</h4>
                <p class="fontC">
                    고양이${sessionScope.loginInfo.user_id }<br>
                    암컷<br>
                    8/2/색
                </p>
                <a href="/NewWall/protectDetail.lost?protectNo=${p.protectNo}" class="btn_m btn_light">상세</a>
                        </div>
        </div>
        </c:forEach>
        
      
    </div> 
    <div id="loading">
    
    </div>
</div>
<a href="${pageContext.request.contextPath}/animal/protectionForm.jsp" class="btn_m btn_light">글쓰기</a>
				</section>
			</div>
		</div>

<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	</div>
	<%@ include file="../layout/jsp/modal.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/js/animal/pageLoading.js"></script>
</body>
</html>