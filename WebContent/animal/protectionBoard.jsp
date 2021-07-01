<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/protectionBoard.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<div class="wrap">
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
			<img src="../resources/images/img05.jpeg"/>
				<section class="protectBoard">
				
				 <div class="cont">
    <div class="row">
        <div class="card shadow-soft">
            <img src="../resources/images/img01.jpeg">
            <div class="card-body">
                <h4>동물이름</h4>
                <p class="fontC">
                    고양이<br>
                    암컷<br>
                    8/2/색
                </p>
                        </div>
        </div>
        <div class="card shadow-soft">
            <img src="../resources/images/img02.jpeg">
            <div class="card-body">
                동물이름
            </div>
        </div>
        <div class="card shadow-soft">
            <img src="../resources/images/img02.jpeg">
            <div class="card-body">
                동물이름
            </div>
        </div>
      
    </div>
</div>
				</section>
			</div>
		</div>

<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0476da8a7dcd0ed6d9041728ce41a41&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
</body>
</html>