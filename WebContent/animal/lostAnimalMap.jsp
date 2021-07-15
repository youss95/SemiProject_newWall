<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
#map {
	margin-top: 100px;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animal/lostAnimalMap.css">
</head>
<body>

	<%@ include file="../layout/jsp/header.jsp"%>
	<div class="container">
		<div class="contents">
			<section class="lostSection">
				<div class="title">
					<h2>NewWal's 유기동물 통계</h2>
					<p>실종된 동물들을 지도를 통해 확인해 보세요.</p>
				</div>
				<div id="lost">
					<div class="">
						<div class="counts">Today</div>
						<div class="counts">
							<i class="fas fa-dog"></i>
						</div>
						<div class="counts">
							<i class="fas fa-cat"></i>
						</div>
						<div id="countss">Total</div>
					</div>
					<div>
						<div>
							<span class="mari" data-rate="${counts.todayCount}">0</span>&nbsp;마리
						</div>
						<div id="dogMari">
							<span class="mari" data-rate="${counts.dogCount}">0</span>&nbsp;마리
						</div>
						<div id="catMari">
							<span class="mari" data-rate="${counts.catCount}">0</span>&nbsp;마리
						</div>
						<div id="rightMari">
							<span class="mari" data-rate="${counts.totalCount}">${counts.totalCount}</span>&nbsp;마리
						</div>
					</div>
				</div>
				<div class="hAddr">
						<a
							href="${pageContext.request.contextPath}/lostMapList.lost?page=1"
							class="btn_m btn_light">목록</a> <a
							href="${pageContext.request.contextPath}/protectList.lost?page=1"
							class="btn_m btn_light">임시보호</a> <a
							href="${pageContext.request.contextPath}/animal/lostAnimalForm.jsp"
							class="btn_m btn_light" id="writeMap">글쓰기</a> <input type="text"
							class="inpform" placeholder="지도에 주소로 검색..." id="resultAdd">
						<button type="button" id="searchBtn">
							<i class="fas fa-search"></i>
						</button>
					</div>
				<div class="map_wrap">
					<div id="map"></div>
				</div>
			</section>
		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<%@ include file="../layout/jsp/modal.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a0476da8a7dcd0ed6d9041728ce41a41&libraries=services"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>

	<script>
	let loginBtn = document.querySelector('#loginLogin')
	
	$('#writeMap').click(function(e){
	
		 <c:if test="${sessionScope.loginInfo.user_id == null }">
		 e.preventDefault();
		 Swal.fire({
			  icon: 'error',
			  title: '로그인이 필요합니다.',
			  text: '로그인 페이지로 이동합니다.',
			 
			}).then((result)=>{
				loginBtn.click();
				
			})
			  </c:if>
	})
	
	
		let numAni = document.querySelectorAll(".mari");
		function changeNum(index) {
			let num = 0;
			let targetNum = numAni[index].getAttribute("data-rate");
			let duration = 200;
			let timer = setInterval(
					function() {
						if (targetNum > 5) {
							duration = 50;
						}
						if (num == targetNum || targetNum == 0) {
							clearInterval(timer);
							if (numAni[3].getAttribute("data-rate") == num) {
								for (let i = 0; i < numAni.length; i++) {
									numAni[i].style.animation = " blink-effect 1s step-end 3";
								}
							}
						} else {
							++num;
							numAni[index].innerHTML = num;
						}
					}, duration);
		}
		for (let i = 0; i < numAni.length; i++) {
			changeNum(i);
		}
		function writeAdd() {
		}
		var listData = [ /* */];
		<c:forEach var="map" items="${mapList}">
		listData
				.push([
						"${map.lostAddr}",
						'<img class="ooh" src="${pageContext.request.contextPath}/upload/lostAnimal/${map.fileRealName}">',
						"${map.lostName}", "${map.lostAge}", "${map.lostKind}",
						"${map.lostDate}", "${map.lostWriter}" ])
		</c:forEach>
		console.log(listData)
		// 맵을 넣을 div 
		var mapContainer = document.getElementById('map');
		var mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567),
			level : 8
		};
		// 맵 표시 
		var map = new daum.maps.Map(mapContainer, mapOption);
		//마커 이미지
		var imageSrc =
	          "${pageContext.request.contextPath}/resources/images/dogImo.gif", // 마커이미지의 주소입니다
	        imageSize = new kakao.maps.Size(44, 49), // 마커이미지의 크기입니다
	        imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	      // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	      var markerImage = new kakao.maps.MarkerImage(
	          imageSrc,
	          imageSize,
	          imageOption
	        )
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다 
		var mapTypeControl = new kakao.maps.MapTypeControl();
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다 
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 주소 -> 좌표 변환 라이브러리 
		var geocoder = new daum.maps.services.Geocoder();
		// foreach loop
		listData
				.forEach(function(addr, index) {
					geocoder
							.addressSearch(
									addr[0],
									function(result, status) {
										if (status === daum.maps.services.Status.OK) {
											var coords = new daum.maps.LatLng(
													result[0].y, result[0].x);
											var marker = new daum.maps.Marker({
												position : coords,
												image:markerImage,
												clickable : true
											});
											// 마커를 지도에 표시합니다. 
											marker.setMap(map);
											// 인포윈도우를 생성합니다 
											var infowindow = new kakao.maps.InfoWindow(
													{
														content : '<div class="add" style="width:300px;height:310px;padding:0px 0;">'
																+ addr[1]
																+ '<br> 이름: '
																+ addr[2]
																+ '<br> 나이: '
																+ addr[3]
																+ '<br> 품종: '
																+ addr[4]
																+ '<br> 실종 날짜: '
																+ addr[5]
																+ '<br>작성자: '
																+ addr[6],
														removable : true
													});
											// 마커에 클릭이벤트를 등록합니다
											kakao.maps.event.addListener(
													marker, 'click',
													function() {
														// 마커 위에 인포윈도우를 표시합니다 
														infowindow.open(map,
																marker);
													});
										}
									});
				});
	</script>
</body>
</html>