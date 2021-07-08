<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<script>
$(function() {	
	
	$("#file-box").on("click",".delFile",function(){
		$(this).parent().remove();
	})


	let fileCount = 1;
	$("#addFile").on("click", function() {
		let fileLine = $("<div>")
		
		let inputFile = $("<input>");
		inputFile.attr("type", "file");
		inputFile.attr("name","file"+fileCount++);
		
		let btnDel = $("<button>");
		btnDel.addClass("delFile btn_s btn_white");
		btnDel.attr("type","button");
		btnDel.text("-");
		
		fileLine.append(inputFile);
		fileLine.append(btnDel);
		
		$("#file-box").append(fileLine);
	})
})
	
</script>
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
					<li class="has"><a href="#">후원하기</a>
						<ul class="s_menu clear support">
							<li><a href="#">1:1 후원</a></li>
							<li><a href="#">업체 정기 후원</a></li>
							<li><a href="#">임시보호자 지정 후원</a></li>
						</ul></li>
					<li class="has"><a href="#">도움이필요해요</a>
						<ul class="s_menu clear help">
							<li><a href="#">잃어버렸어요</a></li>
							<li><a href="#">보호중이에요</a></li>
						</ul></li>
					<li class="has"><a href="#">뉴스레터</a>
						<ul class="s_menu clear news">
							<li><a href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1">공지사항</a></li>
							<li><a href="news.jsp">소식</a></li>
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
				<section>
					<div class="board_wrap">
						<div class="board_title">
							<strong>공지사항</strong>
						</div>
						<form action="${pageContext.request.contextPath}/write.notice" method="post" enctype="multipart/form-data">
							<div class="board_write_wrap">
								<div class="board_write">
									<div class="title">
										<dl>
											<dt>제목</dt>
											<dd>
												<input type="text" id="title" name="notice_title" placeholder="제목 입력">
											</dd>
										</dl>
									</div>
									<div class="info">
										<dl id="file-box">
											<dt>파일 첨부</dt>
											<button class="btn_s btn_line" id="addFile" type="button">+</button>
										</dl>
										
									</div>
									<div class="cont">
										<textarea placeholder="내용 입력" id="contents" name="notice_contents" maxlength="2048"></textarea>
									</div>
								</div>
								<div class="bt_wrap">
									<button class="btn_m btn_primary" type="submit">등록</button> <button class="btn_m btn_white" type="button" >취소</button>
								</div>
							</div>
						</form>
					</div>
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
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>