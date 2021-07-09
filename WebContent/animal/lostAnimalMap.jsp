<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<style>
#map{
margin-top:100px;
}
</style>
<%@ include file="../layout/jsp/commonModal.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/lostAnimalMap.css">
</head>
<body>

<%@ include file="../layout/jsp/header.jsp" %>
<div class="container">
			<div class="contents">
				<section class="lostSection">
				<div id="countTitle">NewWal's 유기동물 통계</div>
				<div id="lost">
				<div class="counts" style="display:inline-block;">Today</div><div id="countss" style="display:inline-block;">Total</div>
				<br>
				<div style="display:inline-block;"><span class="mari">${counts.todayCount}</span>&nbsp;마리</div>
				<div id="rightMari" style="display:inline-block;"><span class="mari" >${counts.totalCount}</span>&nbsp;마리</div>
				</div>
				<div class="map_wrap">
				<div id="map"
					style="width: 90%; height: 80%; position: relative; overflow: hidden;"></div>

				<div class="hAddr">
					
				

					<input type="text" class="inpform" placeholder="지도에 주소로 검색..." id="resultAdd">
					<a href="${pageContext.request.contextPath}/lostMapList.lost" class="btn_m btn_light">목록</a>
					
					<a href="#" class="btn_m btn_light">임시보호</a>
					<a href="${pageContext.request.contextPath}/animal/lostAnimalForm.jsp" class="btn_m btn_light">글쓰기</a>
				</div>

				<button type="button" id="searchBtn">
					<i class="fas fa-search"></i>
				</button>
				
			</div>
				
				
				</section>
			</div>
		</div>

<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<%@ include file="../layout/jsp/modal.jsp"%>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0476da8a7dcd0ed6d9041728ce41a41&libraries=services"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
	<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
function writeAdd(){

}
var listData = [  /* */]; 

<c:forEach var="map" items="${mapList}">
listData.push( ["${map.lostAddr}", '<img class="ooh" src="${pageContext.request.contextPath}/upload/lostAnimal/${map.fileRealName}">',"${map.lostName}","${map.lostAge}","${map.lostKind}","${map.lostDate}"] )
</c:forEach>

console.log(listData)
// 맵을 넣을 div 
var mapContainer = document.getElementById('map'); var mapOption = { center: new daum.maps.LatLng(37.566826, 126.9786567), level: 8 }; 
// 맵 표시 
var map = new daum.maps.Map(mapContainer, mapOption); 
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다 
var mapTypeControl = new kakao.maps.MapTypeControl();
 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
 // 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다 
 var zoomControl = new kakao.maps.ZoomControl(); map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT); 
 // 주소 -> 좌표 변환 라이브러리 
 var geocoder = new daum.maps.services.Geocoder(); 
 // foreach loop
  listData.forEach(function(addr, index) {
       geocoder.addressSearch(addr[0], function(result, status) { 
           if (status === daum.maps.services.Status.OK) { 
               var coords = new daum.maps.LatLng(result[0].y, result[0].x); 
               var marker = new daum.maps.Marker({ 
                   position: coords,
                    clickable: true 
                }); 
 // 마커를 지도에 표시합니다. 
 marker.setMap(map); 
 // 인포윈도우를 생성합니다 
 var infowindow = new kakao.maps.InfoWindow({ content: '<div class="add" style="width:300px;height:310px;padding:0px 0;">' + addr[1] + '<br> 이름: ' + addr[2] +'<br> 나이: '+addr[3] +'<br> 품종: '+addr[4]+'<br> 실종 날짜: '+addr[5]+'<br>상세보기<a href=""><i class="fas fa-arrow-alt-circle-right"></i></a></div>', removable : true });
  // 마커에 클릭이벤트를 등록합니다
   kakao.maps.event.addListener(marker, 'click', function() { 
      // 마커 위에 인포윈도우를 표시합니다 
      infowindow.open(map, marker);
       });
        } 
        }); 
        }); 
        </script>
</body>
</html>
  