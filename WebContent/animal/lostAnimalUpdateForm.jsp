<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/lostAnimal.css">
<%@ include file="../layout/jsp/commonModal.jsp" %>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostSection">
					<form action="${pageContext.request.contextPath}/lostUpdate.lost?lostNo=${lostDetail.lostNo}" method="post" enctype="multipart/form-data">
				<div id="mainTitle">실종 신고</div>
				<div class="animalInfo">동물 정보</div>
				<div id="lostName">
				<span>동물 이름:</span>
				<input type="text" name="lostName" class="inpform" value=${lostDetail.lostName }>
				<span id="cate">구분: </span>
			
			
				<div class="rd_group" style="display:inline">
				<c:if test="${lostDetail.lostCategory == 'dog'}">
				<div class="inp_rd">
											<input type="radio" id="rd1" name="lostCategory" value="dog" checked>
											<label for="rd1">개</label>
										</div>
				</c:if>
				<c:if test="${lostDetail.lostCategory != 'dog'}">
										<div class="inp_rd">
											<input type="radio" id="rd1" name="lostCategory" value="dog" >
											<label for="rd1">개</label>
										</div>
										</c:if>
										
										<c:if test="${lostDetail.lostCategory != 'cat'}">
										<div class="inp_rd">
											<input type="radio" id="rd2" name="lostCategory" value="cat">
											<label for="rd2">고양이</label>
										</div>
										</c:if>
										<c:if test="${lostDetail.lostCategory == 'cat'}">
										<div class="inp_rd">
											<input type="radio" id="rd2" name="lostCategory" value="cat" checked>
											<label for="rd2">고양이</label>
										</div>
										</c:if>
									</div>
									
				</div>
				<div id="animalDetail">
				<span>나이:</span><input type="text" name="lostAge" class="inpform toMargin" value=${lostDetail.lostAge} required>
				<span class="kindAndDate">품종:</span><input type="text" name="lostKind" class="inpform toMargin" value=${lostDetail.lostKind }>
				<span class="kindAndDate">성별:</span>
				<div class="inp_slct">
										<select name="lostGender" id="lostGender">
											<option value="">선택</option>
											<c:choose>
											<c:when test="${lostDetail.lostGender == 'F' }">
											<option value="F" selected>암컷</option>
											</c:when>
											<c:otherwise>
											<option value="F">암컷</option>
											</c:otherwise>
											</c:choose>
											<c:choose>
											<c:when test="${lostDetail.lostGender == 'M' }">
											<option value="M" selected>숫컷</option>
											</c:when>
											<c:otherwise>
											<option value="M">숫컷</option>
											</c:otherwise>
											</c:choose>
											
										</select>
									</div>
				</div>
				
				
				<div class="animalInfo">기본 정보</div>
				<div id="lostDateId">
				<span id="lostDates">실종 날짜:</span><input type="date" id="lostDate" name="lostDate" class="inpform toMargin" min="2021-01-01" required></div>
				<div id="contentArea">	
				<div id="content">내용</div>
				<textarea class="txtareaform" name="lostContent" id="" cols="30" rows="4" placeholder="내용을 입력해 주세요 (특징, 자세한 외형 등등)">${lostDetail.lostContent }</textarea>
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
				이미지: <input type="file" name="animalImage" onChange="imageChoose(this)" required>
				</div> 
				   <div class="upload-img">
                        <img src="${pageContext.request.contextPath}/project/layout/resources/images/img01.jpeg" alt="" id="imageUploadPreview"  />
                   </div>
			<input type="hidden" name="addResult" id="hiddenInput">	
			<input type="hidden" name="lostWriter" value="${sessionScope.loginInfo.user_id}"> 
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