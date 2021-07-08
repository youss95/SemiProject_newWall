<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
	<h1 class="logo">
		<a href="index.jsp">LOGO IMG</a>
	</h1>
	<div class="gnb">
		<ul class="clear">
			<li class="has"><a href="#">입양하기</a>
				<ul class="s_menu clear adopt">
					<li><a
						href="${pageContext.request.contextPath}/adoptList.apt?cpage=1">입양하기</a></li>
					<li><a href="#">입양 후기</a></li>
				</ul></li>
			<li><a href="${pageContext.request.contextPath}/sponsor.sp">후원하기</a></li>
			<li class="has"><a href="#">실종/보호</a>
				<ul class="s_menu clear help">
					<li><a
						href="${pageContext.request.contextPath}/lostAnimalMap.lost">실종
							Map</a></li>
					<li><a
						href="${pageContext.request.contextPath}/protectList.lost?page=1">임시보호</a></li>
				</ul></li>
			<li class="has"><a href="#">뉴스레터</a>
				<ul class="s_menu clear news">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">소식</a></li>
				</ul></li>
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
					<li><a href="#" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
					<li><a href="${pageContext.request.contextPath}/terms.mem">회원가입</a></li>
				</c:otherwise>
			</c:choose>
			
			<!-- <li><a href="#">마이페이지</a></li> -->
			<!-- <li><a href="#">로그아웃</a></li> -->
		</ul>
	</div>
	<div class="s_menu_bg"></div>
</header>