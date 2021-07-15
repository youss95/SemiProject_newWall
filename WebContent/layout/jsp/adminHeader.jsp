<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav>
	<div class="lnb">
		<h1 class="logo"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/login_logo8.png"></a></h1>
		<ul class="slide_menu">
			<li class="depth1"><a href="#">회원관리<i
					class="fas fa-chevron-right"></i></a>
				<ul>
					<li class="depth2"><a href="${pageContext.request.contextPath}/memberManage.adm">회원 명단 보기</a></li>
				</ul></li>
			<li class="depth1"><a href="#">게시판 관리<i
					class="fas fa-chevron-right"></i></a>
				<ul>

					<li class="depth2"><a  href="${pageContext.request.contextPath}/protectAnimal.adm?page=1">임시보호</a></li>
					<li class="depth2"><a  href="${pageContext.request.contextPath}/lostAnimal.adm?page=1">실종동물</a></li>
					<li class="depth2"><a href="${pageContext.request.contextPath}/newsInfo.newsAdm?cpage=1">뉴스</a></li>
					<li class="depth2"><a href="${pageContext.request.contextPath}/noticeInfo.sumAdm?cpage=1">공지사항</a></li>

				</ul></li>
			<li class="depth1"><a href="#">입양<i
					class="fas fa-chevron-right"></i></a>
				<ul>
					<li class="depth2"><a href="${pageContext.request.contextPath}/adoptRegList.adm?cpage=1">입양 신청 관리</a></li>
<!-- 					<li class="depth2"><a href="#">입양 신청 상태 관리</a></li> -->
				</ul></li>
			<li class="depth1"><a href="#">후원<i
					class="fas fa-chevron-right"></i></a>
				<ul>
					<li class="depth2"><a href="${pageContext.request.contextPath}/spAdminSearch.adm?cpage=1">후원금 관리</a></li>
				</ul></li>
			<li class="depth1"><a href="javascript:;">동물 정보<i class="fas fa-chevron-right"></i></a>
				<ul>
					<li class="depth2"><a href="${pageContext.request.contextPath}/animalInfoList.adm?cpage=1">동물 정보 리스트</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>