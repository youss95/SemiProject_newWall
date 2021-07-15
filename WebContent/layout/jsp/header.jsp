<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
	<h1 class="logo">
		<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/resources/images/login_logo6.png"></a>
	</h1>
	<div class="gnb">
		<ul class="clear">
		<c:if test="${sessionScope.loginInfo.user_id != 'admin' }">
			<li class="has"><a href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양하기</a>
				<ul class="s_menu clear adopt">
					<li><a
						href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양하기</a></li>
					<li><a href="${pageContext.request.contextPath}/reviewList.apt?cpage=1">입양 후기</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/sponsor.sp">후원하기</a></li>
			<li class="has"><a href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종/보호</a>
				<ul class="s_menu clear help">
					<li><a
						href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종
							Map</a></li>
					<li><a
						href="${pageContext.request.contextPath}/protectList.lost?page=1">임시보호</a></li>
				</ul></li>
			<li class="has"><a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1">뉴스레터</a>
				<ul class="s_menu clear news">
					<li><a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1">소식</a></li>
					<li><a href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
				</ul></li>
				</c:if>
				
				<c:if test="${sessionScope.loginInfo.user_id eq 'admin' }">
				<li class="has"><a href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양하기</a>
				<ul class="s_menu clear adopt">
					<li><a
						href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양하기</a></li>
					<li><a href="${pageContext.request.contextPath}/reviewList.apt?cpage=1">입양 후기</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/sponsor.sp">후원하기</a></li>
			<li class="has"><a href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종/보호</a>
				<ul class="s_menu clear help">
					<li><a
						href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종
							Map</a></li>
					<li><a
						href="${pageContext.request.contextPath}/protectList.lost?page=1">임시보호</a></li>
				</ul></li>
			<li class="has"><a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1">뉴스레터</a>
				<ul class="s_menu clear news">
					<li><a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1">소식</a></li>
					<li><a href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
				</ul></li>
				<li><a href="${pageContext.request.contextPath}/memberManage.adm">관리자 페이지</a></li>
				</c:if>
			<!-- <li><a href="#">봉사활동</a></li> 보류 -->
		</ul>
	</div>
	
	<div class="utils">
		<ul class="clear">
			<c:choose>
				<c:when test="${loginInfo != null }">
					<li><a href="${pageContext.request.contextPath}/myPage.mem" >${loginInfo.name}님 뉴하!</a>
					<li><a href="${pageContext.request.contextPath}/logoutProc.mem">로그아웃</a>
				</c:when>
				<c:otherwise>
					<li><a id="loginLogin" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/terms.mem">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- <li><a href="#">마이페이지</a></li> -->
			<!-- <li><a href="#">로그아웃</a></li> -->
		</ul>
	</div>
	<div class="s_menu_bg"></div>
</header>
