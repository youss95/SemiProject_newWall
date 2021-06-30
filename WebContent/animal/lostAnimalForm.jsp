<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/lostAnimal.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostSection">
					<form action="${pageContext.request.contextPath}/lostAnimal.lost" method="post" enctype="multipart/form-data">
				<div id="mainTitle">실종 신고</div>
				<div class="animalInfo">동물 정보</div>
				<div id="lostName">
				<span>동물 이름:</span>
				<input type="text" name="lostName" class="inpform" >
				<span id="cate">구분: </span>
				<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd1" name="lostCategory" value="dog" >
											<label for="rd1">개</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd2" name="lostCategory" value="cat">
											<label for="rd2">고양이</label>
										</div>
									</div>
				</div>
				<div id="animalDetail">
				<span>나이:</span><input type="text" name="lostAge" class="inpform toMargin" >
				<span class="kindAndDate">품종:</span><input type="text" name="lostKind" class="inpform toMargin">
				<span class="kindAndDate">성별:</span>
				<div class="inp_slct">
										<select name="lostGender" id="lostGender">
											<option value="">선택</option>
											<option value="F">암컷</option>
											<option value="M">숫컷</option>
										</select>
									</div>
				</div>
				
				
				<div class="animalInfo">기본 정보</div>
				<div id="lostDateId">
				<span id="lostDates">실종 날짜:</span><input type="date" id="lostDate" name="lostDate" class="inpform toMargin" min="2021-01-01"></div>
				<div id="contentArea">	
				<div id="content">내용</div>
				<textarea class="txtareaform" name="lostContent" id="" cols="30" rows="4" placeholder="내용을 입력해 주세요 (특징, 자세한 외형 등등)"></textarea>
				</div>
				
				

			<div class="map_wrap">
				<div id="map"
					style="width: 60%; height: 60%; position: relative; overflow: hidden;"></div>

				<div class="hAddr">
					<span id="title">주소정보</span>
					<!-- <span id="centerAddr"></span> -->


					<input type="text" class="inpform" placeholder="지도에 주소로 검색..." id="resultAdd">
				</div>

				<button type="button" id="searchBtn">
					<i class="fas fa-search"></i>
				</button>
			</div>
			
			<div id="animalImage">
				이미지: <input type="file" name="animalImage" onChange="imageChoose(this)">
				</div> 
				   <div class="upload-img">
                        <img src="${pageContext.request.contextPath}/project/layout/resources/images/img01.jpeg" alt="" id="imageUploadPreview" />
                   </div>
			<input type="hidden" name="addResult" id="hiddenInput">	
			<button type="submit" class="btn_m btn_primary">등록</button>	
			</form>
				</section>
			</div>
		</div>

<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0476da8a7dcd0ed6d9041728ce41a41&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
</body>
</html>