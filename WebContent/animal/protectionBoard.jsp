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
<style>
#boardDetailprotect{margin-top:10px;}
</style>
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
                    구조장소:${p.protectAddr}<br>
                    성별: 
                     <c:if test="${p.protectGender == 'F' }">
    암컷
    </c:if>
     <c:if test="${p.protectGender == 'M' }">
   수컷
    </c:if><br>
                작성자:${p.protectWriter}
                </p>
                <div id="boardDetailprotect">
               <a  href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${p.protectNo}&page=1" >자세히보기<i class="fas fa-angle-double-right"></i></a>
               </div>
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
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<%@ include file="../layout/jsp/modal.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/js/animal/pageLoading.js"></script>  
	
</body>
</html>