<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시글</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">

</head>
<body>
	<div class="wrap">
		<header class="header">
			<h1 class="logo">
				<a href="#">LOGO IMG</a>
			</h1>
			<div class="gnb">
				<ul class="clear">
					<li class="has"><a href="#">입양하기</a>
						<ul class="s_menu clear adopt">
							<li><a href="#">입양하기</a></li>
							<li><a href="#">입양 후기</a></li>
						</ul></li>
					<li><a href="#">후원하기</a></li>
					<li class="has"><a href="#">도움이필요해요</a>
						<ul class="s_menu clear help">
							<li><a href="#">잃어버렸어요</a></li>
							<li><a href="#">보호중이에요</a></li>
						</ul></li>
					<li class="has"><a href="#">뉴스레터</a>
						<ul class="s_menu clear news">
							<li><a
								href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
							<li><a href="#">소식</a></li>
						</ul></li>
					<!-- <li><a href="#">봉사활동</a></li> 보류 -->
				</ul>
			</div>
			<div class="utils">
				<ul class="clear">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
					<!-- <li><a href="#">마이페이지</a></li> -->
					<!-- <li><a href="#">로그아웃</a></li> -->
				</ul>
			</div>
			<div class="s_menu_bg"></div>
		</header>
		<div class="container">
			<div class="contents">
				<section class="">
					<div class="board_wrap">
						<div class="board_title">
							<strong>공지사항</strong>
						</div>
						<div class="board_view_wrap">
							<div class="board_view">
								<div class="title">${noticeView.notice_title}</div>
								<c:forEach var="file" items="${flist}">
									<div class="file">
										<a
											href="download.file?seq=${file.seq}&sysname=${file.sysName}&oriname=${file.oriName}">${file.oriName}</a>
									</div>
								</c:forEach>
								<div class="info">
									<dl>
										<dt>번호</dt>
										<dd>${noticeView.notice_seq}</dd>
									</dl>
									<dl>
										<dt>글쓴이</dt>
										<dd>${noticeView.notice_writer}</dd>
									</dl>
									<dl>
										<dt>작성일</dt>
										<dd>${noticeView.notice_reg_date}</dd>
									</dl>
									<dl>
										<dt>조회수</dt>
										<dd>${noticeView.notice_view}</dd>
									</dl>
								</div>
								<div class="cont">${noticeView.notice_contents}</div>
							</div>
							<div class="bt_wrap">
								<a
									href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1"
									class="btn_s btn_light">목록</a>
								<%--<c:if test="${login.user_id == admin_id}"> --%>
								<a
									href="${pageContext.request.contextPath}/noticeModify.notice?notice_seq=${noticeView.notice_seq}"
									class="btn_s btn_primary" id="modify">수정</a> <a
									href="${pageContext.request.contextPath}/noticeDelete.notice?notice_seq=${noticeView.notice_seq}"
									class="btn_s btn_default" id="delete">삭제</a>
								<%--</c:if> --%>
							</div>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/nowrite.nocmt"
						method="post">
						<div id="ntrp-comments" class="ntrp-comments">
							<div class="comments-row">
								<textarea id="ntrp_contents" name="ntrp_contents"
									placeholder="댓글을 입력해주세요" rows="3"></textarea>
								<input type="hidden" value="${noticeView.notice_seq}"
									name=parent>
								<button class="writeBtn">
									<i class="far fa-edit"></i>등록
								</button>
							</div>
						</div>
					</form>
					<form id="replyFrm" class="replyFrm">
						<div class="reply-container">
							<c:forEach var="i" items="${nocmtlist}">
								<div class="reply">
									<div class="ntrp_writer">${i.ntrp_writer}</div>
									<div class="ntrp_contents">${i.ntrp_contents}</div>
									<div class="ntrp_reg_date">${i.ntrp_reg_date}</div>
									<%-- <c:if test="${i.writer == login.id }"> --%>
									<button class="btn_s btn_default delReply" type="button">삭제</button>
									<button class="btn_s btn_primary modiReply">수정</button>
									<%-- </c:if> --%>
									<input type="hidden" value="${i.ntrp_seq}"> <input
										type="hidden" value="${i.ntrp_parent}">
								</div>
							</c:forEach>
						</div>
					</form>
				</section>
			</div>
		</div>
		<footer class="footer">
			<p>Copyright &copy; Kh semi project by group 2</p>
		</footer>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<!-- 부트스트랩 JS -->
	<%-- 	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
	<script>
	$(".delReply").on("click",function(){
        if(confirm("정말 삭제하시겠습니까?")){    
           $("#replyFrm").attr("action", "${pageContext.request.contextPath}/nodelete.nocmt");
           $(this).next().attr("name","ntrp_seq");
           $(this).next().attr("name","ntrp_parent");
           $("#replyFrm").submit();
        }
})
	</script>
	
</body>
</html>

