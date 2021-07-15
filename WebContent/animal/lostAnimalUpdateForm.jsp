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
					<form action="${pageContext.request.contextPath}/lostUpdate.lost?lostNo=${lostDetail.lostNo}" method="post" enctype="multipart/form-data" >
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
				<div class="inp_slct" style="inline-block; width:100px;">
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
				<span id="lostDates">실종 날짜:</span><input type="date" id="lostDate" name="lostDate" class="inpform toMargin" min="2021-01-01"  value="${lostDetail.lostDate }"   required></div>
				<div id="contentArea">	
				<div id="content">내용</div>
				<textarea class="txtareaform" name="lostContent" id="" cols="30" rows="4" placeholder="내용을 입력해 주세요 (특징, 자세한 외형 등등)">${lostDetail.lostContent }</textarea>
				</div>
				
				

			<div class="map_wrap">
				<div id="map"
					style="width: 60%; height: 60%; position: relative; overflow: hidden;"></div>

				



<div class="hAddr">
					<div id="title" style="display:inline">주소정보 
					</div><div style="display:flex;justify-content:space-between;display:inline-block;">
					
					<input type="text" class="inpform" placeholder="주소를 꼭 다시 입력해 주세요" id="resultAdd">
					<button type="button" id="searchBtn" style="padding:7px;">
					<i class="fas fa-search"></i>
				</button>
				</div>
					선택주소: <div id="centerAddr" style="margin:0px;display:inline;"></div> 
						
				</div>



				
			</div>
			
		<div style="text-align:center;">
				   <div class="upload-img">
                        <img src="${pageContext.request.contextPath}/resources/images/uploadimg.png" alt="" id="imageUploadPreview" />
                   </div>
                   
			<div id="animalImage">
				이미지를 클릭하여 업로드 해주세요! <input type="file" name="animalImage"  id="imageclick"  onChange="imageChoose(this)" style="display:none">
				</div> 
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

	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
	<script>
	//엔터막기
	$('input[type="text"]').keydown(function(event) {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});

	
	/* let add =document.getElementById('centerAddr');
	$(function(){
		add.innerHTML = '${lostDetail.lostAddr}'
	}) */
	$('#imageUploadPreview').on('click',function(){
		$('#imageclick').click();
	})
	
	//카카오맵
	
	const $addFind = document.querySelector('#resultAdd');
	    const $addhid = document.querySelector('#hiddenInput');
	    const $button =document.querySelector('#searchBtn')
	    console.log($addFind.value)
	    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	//검색 주소 찾기
	$button.addEventListener('click',function(e){
	e.preventDefault();

	geocoder.addressSearch($addFind.value, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	  
	 // 인포윈도우로 장소에 대한 설명을 표시합니다
	 
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	})
	});    


	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? `<div>` + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>' + result[0].address.address_name + '</div>';
	            
	            var content =  '<div class="bAddr">' +
                            '<span class="title"></span>' + 
                            detailAddr + 
                        '</div>';


/*-----------------------------------------------------------*/
	                        $addhid.value =  result[0].address.address_name;
	                        
	console.log('지번주소:', result[0].address.address_name)
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);


	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	            
	            var infoDiv = document.getElementById('centerAddr');

	            //alert(result[0].address.address_name+"가 맞습니까?")
	                    infoDiv.innerHTML =result[0].address.address_name;
	              
	             
	        }   
	    });
	});

	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});

	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}

	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');

	
	    }    
	}
	
	
	</script>
</body>
</html>