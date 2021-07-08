<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<style>
	.news_list .list_wrap .item{overflow:hidden;padding:40px;border-top:1px solid #ddd;border-bottom:1px solid #ddd;}
	.news_list .list_wrap .item+.item{border-top:none;}
	.list_wrap .item .img_wrap{width:30%;float:left;height:180px;overflow: hidden;}
	.list_wrap .item .img_wrap img{transition: all .3s ease;}
	.list_wrap .item > a:hover {color:#254E7C;}
	.list_wrap .item > a:hover .img_wrap img{transform:scale(1.03);}
	.list_wrap .item .txt{width:70%;float:left;padding:23px 40px;}
	.list_wrap .item .txt ul li{display:inline-block;color:#999;line-height:11px;font-weight:300;vertical-align: top;font-size:13px;padding-right:15px;margin-right:15px;border-right:1px solid #ddd;}
	.list_wrap .item .txt ul li:last-child{padding-right:0;border-right:0;margin-right:0;}
	.list_wrap .item .txt h2{font-size:20px;font-weight:600;margin:15px 0 20px;overflow:hidden;text-overflow: ellipsis;white-space: nowrap;transition: all .3s ease;}
	.list_wrap .item .txt p{font-weight:300;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 3;-webkit-box-orient: vertical;word-wrap:break-word; line-height: 1.3;max-height: 3.9em;transition: all .3s ease;}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="news_list">
					<div class="list_wrap">
						<div class="item">
							<a href="#">
								<div class="img_wrap">
									<img src="${pageContext.request.contextPath}/resources/images/bannerImg.png">
								</div>
								<div class="txt">
									<ul>
										<li class="date">등록일 : 2021-07-07</li>
										<li class="view">조회수 : 0</li>
									</ul>
									<h2>[카라 동물권 더배움 2021] 온라인 주제강좌 '동물학대와 미디어' 참여자 모집</h2>
									<p>카라 동물권 더배움의 이번 주제는 동물 학대와 미디어입니다. 반드시 처벌해야 하는 동물학대 범죄를 국내외 사례와 프로파일링을 중심으로 분석하고, 오직 인간의 흥미를 위해 학대받는 야생동물의 삶을 살펴봅니다. 또한, 미디어에서 모든 생명이 해를 입지 않기 위한 각 분야의 고민과 경험을 나</p>
								</div>
							</a>
						</div> 
						<div class="item">
							<a href="#">
								<div class="img_wrap">
									<img src="${pageContext.request.contextPath}/resources/images/bannerImg.png">
								</div>
								<div class="txt">
									<ul>
										<li class="date">등록일 : 2021-07-07</li>
										<li class="view">조회수 : 0</li>
									</ul>
									<h2>[카라 동물권 더배움 2021] 온라인 주제강좌 '동물학대와 미디어' 참여자 모집</h2>
									<p>카라 동물권 더배움의 이번 주제는 동물 학대와 미디어입니다. 반드시 처벌해야 하는 동물학대 범죄를 국내외 사례와 프로파일링을 중심으로 분석하고, 오직 인간의 흥미를 위해 학대받는 야생동물의 삶을 살펴봅니다. 또한, 미디어에서 모든 생명이 해를 입지 않기 위한 각 분야의 고민과 경험을 나</p>
								</div>
							</a>
						</div> 
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
</body>
</html>