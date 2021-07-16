<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴월</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
<jsp:include page="layout/jsp/commonModal.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper-bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.fullPage.js"></script>
<style>
.protect:after{display:block;content:'';width:100%;height:100%;position:absolute;top:0;left:0;background:url(${pageContext.request.contextPath}/resources/images/main/img_ptbg.jpg) 50% 50% no-repeat;background-size:cover;z-index:-1;opacity:.1;}
.review:after{display:block;content:'';width:100%;height:100%;position:absolute;top:0;left:0;background:url(${pageContext.request.contextPath}/resources/images/main/img03.jpeg) 50% 50% no-repeat;background-size:cover;z-index:-1;opacity:.1;}
</style>
</head>

<body>
<header>
	<h1 class="logo"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/login_logo6.png"></a></h1>
	<button type="button" class="btn_nav">MENU</button>
	<div class="nav">
		<div class="rnb">
			<div class="menu">
				<ul>
					<li class="has">
						<a href="#">입양</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양동물</a></li>
							<li><a href="${pageContext.request.contextPath}/reviewList.apt?cpage=1">입양후기</a></li>
						</ul>
					</li>
					<li><a href="${pageContext.request.contextPath}/sponsor.sp">후원</a></li>
					<li class="has">
						<a href="#">실종/보호</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종</a></li>
							<li><a href="${pageContext.request.contextPath}/protectList.lost?page=1">임시보호</a></li>
						</ul>
					</li>
					<%-- <li><a href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종/보호</a></li> --%>
					<li class="has">
						<a href="#">뉴스레터</a>
						<ul class="submenu">
							<li><a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1">뉴스</a></li>
							<li><a href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</header>

<div id="fullpage">
	<div class="section main_visual active" id="section0">
		<div class="txt_box">
<%-- 			<h2><em><b>NEW</b> <img src="${pageContext.request.contextPath}/resources/images/main/logo_none_text.png"> WAL</em>은 <br>사지않고 입양하는 문화를 만듭니다.</h2>
			<p>우리 동물들의 인생에 따뜻한 봄바람을 불어주세요.</p> --%>
			<h2><img src="${pageContext.request.contextPath}/resources/images/main/MainLogo3_.png"><br>사지않고 입양하는 문화를 만듭니다.</h2>
			<p>우리 동물들의 인생에 따뜻한 봄바람을 불어주세요.</p>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide" style="background:url(${pageContext.request.contextPath}/resources/images/main/main_img02.png) 50% 50% no-repeat;background-size:cover;"></div>
				<div class="swiper-slide" style="background:url(${pageContext.request.contextPath}/resources/images/main/main_img03.jpg) 50% 50% no-repeat;background-size:cover;"></div>
				<div class="swiper-slide" style="background:url(${pageContext.request.contextPath}/resources/images/main/main_img04.jpg) 50% 50% no-repeat;background-size:cover;"></div>
				<div class="swiper-slide" style="background:url(${pageContext.request.contextPath}/resources/images/main/main_img05.jpg) 50% 50% no-repeat;background-size:cover;"></div>
				<div class="swiper-slide" style="background:url(${pageContext.request.contextPath}/resources/images/main/main_img06.jpg) 50% 50% no-repeat;background-size:cover;"></div>
			</div>
		</div>
	</div>
	<div class="section" id="section1">
		<div class="title">
			<h2>우리 함께해요</h2>
			<p>인권을 넘어 생명권으로!</p>
		</div>
		<ul class="list">
			<li class="item">
				<a href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">
					<div class="img_wrap" style="background:url(${pageContext.request.contextPath}/resources/images/main/img_adopt.jpg) 50% 50% no-repeat;background-size:cover;"></div>
					<div class="txt">
						<span>ADOPT</span>
						<h3>입양하기</h3>
					</div>
				</a>
			</li>
			<li class="item">
				<a href="${pageContext.request.contextPath}/sponsor.sp">
					<div class="img_wrap" style="background:url(${pageContext.request.contextPath}/resources/images/main/img_sponsor.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
					<div class="txt">
						<span>SPONSOR</span>
						<h3>후원하기</h3>
					</div>
				</a>
			</li>
			<li class="item">
				<a href="${pageContext.request.contextPath}/protectList.lost?page=1">
					<div class="img_wrap" style="background:url(${pageContext.request.contextPath}/resources/images/main/img_lost.jpg) 50% 50% no-repeat;background-size:cover;"></div>
					<div class="txt">
						<span>PROTECT</span>
						<h3>임시보호</h3>
					</div>
				</a>
			</li>
		</ul>
	</div>
	<div class="section news" id="section2">
		<div class="title">
			<h2>뉴스레터</h2>
			<p>뉴월의 다양한 활동과 소식을 담은 뉴스레터를 보내드립니다.</p>
		</div>
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="l_side">
						<div class="img_wrap">
							<a href="${pageContext.request.contextPath}/newsView.news?news_seq=news00001">
								<img src="${pageContext.request.contextPath}/resources/images/main/img_news02.png">
							</a>
						</div>
						<!-- https://www.animals.or.kr/campaign/friend/56725 -->
					</div>
					<div class="r_side">
						<div class="txt">
							<h3>보상 노린 '동물 알박기', 재개발 지역 동물을 고통으로 내몰고 있습니다</h3>
							<p>
								노후한 시설을 정비하고 개선하기 위해 이루어지는 재개발 공사. 사람들에게는 깨끗하고 편리한 주거 환경을 제공하기 위한 과정이지만, 그 이면에는 많은 동물들의 고통과 희생이 뒤따릅니다. 하루 아침에 영역에서 쫓겨나 갈 곳을 잃어버리는 길고양이, 가족이 이사를 가며 버려지는 유기동물, 사람들에게 위험할지 모른다는 이유로 마구잡이식 포획의 대상이 되어버린 떠돌이개 등. 이렇듯 인간의 편의를 위한 재개발 공사로 인해 발생하는 여러 동물 문제 중 하나로 ‘동물 알박기’가 있습니다. 
								<br><br>‘동물 알박기’란 보상금을 위해 공사 예정 지역에 동물을 데려다놓고 사육하는 행태를 뜻합니다. 이러한 이유로 재개발 지역에 방치된 동물들은 어떠한 보살핌도 받지 못한 채 고통스러운 삶을 살아갑니다. 현행법상 축산보상은 영업손실보상을 준용해 휴업손실액, 시설이전비, 가축운반비 등을 보상하는데, 기준마리수 이하인 경우 시설 및 가축 이전비만 지급합니다. 이 때문에 휴업손실액을 보상받기 위해 많은 수의 개들을 데려다놓고 보상금을 받을 때까지 방치하는 ‘동물 알박기’ 행태가 이루어지고 있습니다. 지난해 말 동물자유연대가 구조한 파주시 동패동 뜬장 사육견들 역시 알박기로 이용되던 개들이었습니다. 
							</p>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="l_side">
						<div class="img_wrap">
							<a href="${pageContext.request.contextPath}/newsView.news?news_seq=news00002">
								<img src="${pageContext.request.contextPath}/resources/images/main/img_news03.png">
							</a>
						</div>
						<!-- https://www.animals.or.kr/campaign/friend/56535 -->
					</div>
					<div class="r_side">
						<div class="txt">
							<h3>그 많은 유기동물들은 어떻게 되는 걸까??</h3>
							<p>
								유실·유기동물은 발생은 매년 10만 건이 넘고, 최근 5년간 57만 여건이 발생 했습니다. 동물보호법에 따라 유실·유기동물은 지자체 동물보호센터에 입소하게 됩니다. 그렇다면 지자체에 입소한 동물들은 어떻게 되었을까요? 과연 새로운 가족을 만나 행복한 제2의 삶을 살고 있을까요?<br><br>
								많은 이들의 바람과는 달리 지자체 동물보호센터에 입소하는 동물의 절반 정도는 다시 보호소 밖을 보지 못한 채 죽음을 맞이합니다. 지난 5년간 발생한 유실·유기57만여 건 중 약 절반 정도인 49.3%(자연사 26.9% + 안락사 22.4%)는 보호소 내에서 죽음을 맞이했습니다. 본래 소유자등 에게 돌아간 건은 13.2%였으며, 31%정도만 새로운 가정으로 입양되었습니다
								<br><br>이렇게 보호소 내에서 죽음을 맞이하는 비율(자연사+안락사)은 2016년 47.3%에서 2019년 52.5%로 매년 증가해왔습니다. 2020년에는 46.7%로 감소했지만, 자료가 1월 기준이라는 점을 감안하면 보호중인 건(8.9%)에서 폐사와 안락사가 진행된다면 지난해와 비슷하거나 소폭 낮아진 수준이 될 것으로 예상됩니다.<br>
								입양 비율은 2019년까지 점진적으로 감소하다가, 2020년 30.7%로 소폭 반등했습니다. 입양 건수는 매년 점진적으로 증가해왔습니다
							</p>
						</div>
					</div>
				</div>
				<div class="swiper-slide">
					<div class="l_side">
						<div class="img_wrap">
							<a href="${pageContext.request.contextPath}/newsView.news?news_seq=news00003">
								<img src="${pageContext.request.contextPath}/resources/images/main/img_news04.png">
							</a>
						</div>
						<!-- https://www.animals.or.kr/campaign/cat/56532 -->
					</div>
					<div class="r_side">
						<div class="txt">
							<h3>[사건 그 후] 파주 주택단지 사건은 학대가 아닌 것으로 밝혀졌습니다</h3>
							<p>
								파주 주택단지에 고양이 6마리와 비둘기 1마리, 총 7마리의 동물들이 연달아 사체로 발견된 끔찍한 사건이 있었습니다. 동물자유연대는 제보를 받은 후 동물 학대를 의심하고 파주 경찰서로 고발장을 제출함과 동시에 독극물에 의한 살해인지 확인하기 위해 사체를 인계 받아 농림축산검역본부로 부검을 의뢰했습니다. <br><br>
								다행히도 부검 결과 사체에서 독극물은 발견되지 않았습니다. 고양이에게 치명적인 전염병 바이러스가 검출되면서 고양이들의 사인은 질병에 의한 것으로 판정이 났습니다. 가족 단위, 혹은 함께 공동 생활을 하던 고양이들이었기에 빠르게 전염병이 퍼진 듯 합니다. <br><br>
								처음 사건을 인지하고 고발장을 제출했을 때 이례적으로 파주경찰서에서는 사건대응팀을 따로 꾸려 팀원 전체가 출동해 현장조사를 실시했으며, 독극물 검출을 위해 따로 성분검사까지 의뢰했습니다. 또한 해당 주택단지 관리사무소 역시 주민들에게 동물학대는 범죄라는 내용의 방송을 주기적으로 내보내는 등 동물자유연대와 경찰 조사에 성실히 협조해주셨습니다. 
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>

	<div class="section protect" id="section3">
		<div class="title">
			<h2>유실동물 임시보호</h2>
			<p>보호자들이 임시보호중인 유실동물들 입니다. 도움의 손길을 나눠주세요.</p>
		</div>
		<br>
		<div class="pt_list">
			<div class="item">
				<a href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${p.protectNo}&page=1">
					<div class="img_wrap">
						<img src="${pageContext.request.contextPath}/resources/images/main/img00.jpeg" class="pimg"></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="pgender"><span>성별: </span> </li>
							<li class="pkind"><span>품종 :</span> </li>
							<li class="paddr"><span>발견장소 :</span> </li>
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#">
					<div class="img_wrap">
						<img src="${pageContext.request.contextPath}/resources/images/main/img02.jpeg" class="pimg"></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="pgender"><span>성별: </span> </li>
							<li class="pkind"><span>품종 :</span></li>
							<li class="paddr"><span>발견장소 :</span> </li>
							
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#">
					<div class="img_wrap">
						<img src="${pageContext.request.contextPath}/resources/images/main/img03.jpeg" class="pimg"></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="pgender"><span>성별: </span> </li>
							<li class="pkind"><span>품종 :</span> </li>
							<li class="paddr"><span>발견장소 :</span> </li>
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#">
					<div class="img_wrap">
						<img src="${pageContext.request.contextPath}/resources/images/main/img04.jpeg" class="pimg"></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="pgender"><span>성별: </span> </li>
							<li class="pkind"><span>품종 :</span> </li>
							<li class="paddr"><span>발견장소 :</span> </li>
						</ul>
					</div>
				</a>
			</div> 
			
			
		</div>
	</div>
	<div class="section adopt" id="section4">
		<div class="title">
			<h2>가족이 되어주세요</h2>
			<p>가족을 기다리는 동물들, 사지말고 입양하세요.</p>
		</div>
		<div class="list">
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background-size:cover;"></div>
			</a>
			<%-- <a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img01.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img02.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img03.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img04.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img05.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img06.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a>
			<a href="#">
				<div class="img_bg" style="background:url(${pageContext.request.contextPath}/resources/images/main/img07.jpeg) 50% 50% no-repeat;background-size:cover;"></div>
			</a> --%>
		</div>
	</div>
	<div class="section review" id="section5">
		<div class="title">
			<h2>입양후기를 만나보세요!</h2>
			<p>뉴월을 통해 입양하신 분들은 누구나! 입양후기를 보실 수 있습니다.</p>
		</div>
		<div class="rv_list">
			<div class="item">
				<a href="#" class="linkToPro">
					<div class="img_wrap"><img src=""></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="txt"></li>
							<li class="date"></li>
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#" class="linkToPro">
					<div class="img_wrap"><img src=""></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="txt"></li>
							<li class="date"></li>
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#" class="linkToPro">
					<div class="img_wrap"><img src=""></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="txt"></li>
							<li class="date"></li>
						</ul>
					</div>
				</a>
			</div>
			<div class="item">
				<a href="#" class="linkToPro">
					<div class="img_wrap"><img src=""></div>
					<div class="txt">
						<p class="name"></p>
						<ul class="info">
							<li class="txt"></li>
							<li class="date"></li>
						</ul>
					</div>
				</a>
			</div>
		</div>
	</div>
</div>

<%@ include file="layout/jsp/modal.jsp"%>
<script>
	$(function(){
		
		$('#fullpage').fullpage({
			navigation: true,
			navigationPosition: 'right',
		});
	
		const mainSwiper = new Swiper('.main_visual .swiper-container', {
			loop: true,
			effect: "fade",
			speed: 1000,
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
		});
	
		const newsSwiper = new Swiper('.news .swiper-container', {
			loop: true,
			// effect: "fade",
			speed: 1000,
			navigation: {
				nextEl: ".swiper-button-next",
				prevEl: ".swiper-button-prev",
			},
			pagination: {
				el: ".swiper-pagination",
				clickable: true,
			},
			autoplay: {
				delay: 2500,
				disableOnInteraction: false,
			},
		});
	
		$('.btn_nav').on('click',function(){
			$(this).toggleClass('on');
			if($(this).hasClass('on')){
				$(this).text('CLOSE');
			}else{
				$(this).text('MENU');
			}
			$('.nav').toggleClass('open');
		});
	
		$(".nav .has").on("click", function(){
			$(this).toggleClass("open");
			$(this).siblings().removeClass('open');
			$(this).children('.submenu').slideToggle();
			$(this).siblings().children('.submenu').slideUp();
		});
		
		// 입양동물
		$.ajax({
			url: "${pageContext.request.contextPath}/mainAnimals.main",
			type: "get",
			dataType: "json",
		}).done(function(resp){
			let lt = $(".adopt .list>a").length;
			console.log(lt);
			for(let i=0;i<lt;i++){
				$(".adopt .list>a").eq(i).attr("href", "${pageContext.request.contextPath}/adoptDetail.apt?code_seq=" + resp[i].code_seq);
					$(".adopt .list>a").eq(i).children('.img_bg').attr("style","background:url(./upload/animalInfo/" + resp[i].an_photo+ ") 50% 50% no-repeat;background-size:cover;");
			}
		})
		
		// 유실동물
		$.ajax({
			url:"${pageContext.request.contextPath}/protectListIndex.lost?page=1",
				type:"GET",
				dataType:"json"
			}).done(function(resp){
 				//console.log(resp) 
				let aniName = document.querySelectorAll(".pt_list .name");
				let aniGender = document.querySelectorAll(".pgender");
				let aniKind = document.querySelectorAll(".pkind");
				let aniAddr = document.querySelectorAll(".paddr");
				let aniImg = document.querySelectorAll(".pimg");
				let linkToPro = document.querySelectorAll(".linkToPro");
				let link = $(".pt_list .item>a");
				 for(let i=0; i<aniName.length; i++){
						link.eq(i).attr("href","${pageContext.request.contextPath}/protectDetail.lost?protectNo="+resp[i].protectNo +"&page=1");
				
					aniName[i].append(resp[i].protectName)
					aniGender[i].append(resp[i].protectGender)
					aniKind[i].append(resp[i].protectKind)
					aniAddr[i].append(resp[i].protectAddr)
					aniImg[i].src = "${pageContext.request.contextPath}/upload/lostAnimal/"+resp[i].protectFileRealName1
			 	}
			}) 
			
		// 입양후기
		$.ajax({
			url: "${pageContext.request.contextPath}/mainReviews.main",
			type: "get",
			dataType: "json",
		}).done(function(resp){
			let lt = $(".review .rv_list .item").length;
			let link = $(".rv_list .item>a");
			let title = $(".rv_list .item .name");
			let txt = $(".rv_list .item .info .txt");
			let date = $(".rv_list .item .info .date");
			let img = $(".rv_list .item .img_wrap img");
			console.log(lt);
			console.log(resp);
 			for(let i=0;i<lt;i++){
 				link.eq(i).attr("href", "${pageContext.request.contextPath}/reviewDetail.apt?review_seq=" + resp[i].review_seq);
 				title.eq(i).text(resp[i].review_title);
 				txt.eq(i).text(resp[i].review_introduce);
 				date.eq(i).text(resp[i].reg_date);
 				img.eq(i).attr("src", "${pageContext.request.contextPath}/upload/review/" + resp[i].review_thumbnail);
 			}
		})
	})
	
</script>
</body>
</html>