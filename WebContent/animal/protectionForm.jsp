<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/protectAnimal.css">
<%@ include file="../layout/jsp/commonModal.jsp" %>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostSection">
					<div class="title">
						<h2>임시보호</h2>
						<p>임시 보호자분들이 보호중인 동물들의 위치정보를 알 수 있습니다.</p>
					</div>
					<form action="${pageContext.request.contextPath}/protectBoard.lost?page=1" method="post" enctype="multipart/form-data"  >
				<div class="animalInfo">동물 정보</div>
				<div id="lostName">
				<span>동물 이름:</span>
				<input type="text" name="protectName" class="inpform" required >
				
				</div>
				<div id="animalDetail">
				
				<span class="kindAndDate">품종:</span><input type="text" name="protectKind" class="inpform toMargin">
				<span class="kindAndDate">성별:</span>
				<div class="inp_slct" style="width:100px;">
										<select name="protectGender" id="lostGender" required>
											<option value="">선택</option>
											<option value="F">암컷</option>
											<option value="M">숫컷</option>
										</select>
									</div>
				</div>
				
				
				<div class="animalInfo">기본 정보</div>
				<div id="lostDateId">
				<span id="lostDates">발견 날짜:</span><input type="date" id="lostDate" name="protectFindDate" class="inpform toMargin" min="2021-01-01" required></div>
				<div id="contentArea">	
				<div id="content">내용</div>
				<textarea class="txtareaform" name="protectContent" id="" cols="30" rows="4" placeholder="내용을 입력해 주세요 (특징, 자세한 외형 등등)" required></textarea>
				</div>
				
				

			<div class="map_wrap">
				<div id="map"
					style="width: 60%; height: 60%; position: relative; overflow: hidden;"></div>

				<div class="hAddr">
					<div id="title" style="display:inline">주소정보 
					</div><div style="display:flex;justify-content:space-between;display:inline-block;">
					
					<input type="text" class="inpform" placeholder="지도에 주소로 검색..." id="resultAdd" >
					<button type="button" id="searchBtn" style="padding:7px;">
					<i class="fas fa-search"></i>
				</button>
				</div>
					선택주소: <div id="centerAddr" style="margin:0px;display:inline;"></div> 
						
				</div>

				
			</div>
                  
               
			
			<div class="uploadImage"  style="margin:0 auto;">
			
			<div class="box">     
		 <input type="file" name="protectImage1" id="protectImage1" onChange="imageChoose(this)" style="display:none" required>	
                        <img src="${pageContext.request.contextPath}/resources/images/uploadimg.png" alt="" id="imageUploadPreview"  style="width:300px;height:300px;"/>               
                   </div>			
				 <div class="box"> 
				 <input type="file" name="protectImage2" id="protectImage2" onChange="imageChoose2(this)" style="display:none" required>	           
                        <img src="${pageContext.request.contextPath}/resources/images/uploadimg.png" alt="" id="imageUploadPreview2" style="width:300px;height:300px;" />          
                   </div>             	
                   </div>
                
                   
			<input type="hidden" name="addResult" id="hiddenInput" >	
			<input type="hidden" name="protectWriter" value="${sessionScope.loginInfo.user_id}"> 
			<button id="btn" type="submit" class="btn_m btn_primary" id="subBtn">등록</button>	
			
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
	<script>
	//submit
	

	
	
	//날짜 max 오늘까지
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("lostDate").setAttribute("max", today);
	
	
	
	//이미지 누르면 업로드
	$('#imageUploadPreview').on('click',function(){
		$('#protectImage1').click();
	})
	$('#imageUploadPreview2').on('click',function(){
		$('#protectImage2').click();
	})
	
	$('input[type="text"]').keydown(function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});
	
	</script>
</body>
</html>