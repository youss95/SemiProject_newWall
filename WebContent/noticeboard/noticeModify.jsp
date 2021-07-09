<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2조 세미 프로젝트</title>

<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
   integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
   crossorigin="anonymous"></script>
</head>
<body>
   <div class="wrap">
      <%@ include file="../layout/jsp/header.jsp"%>
      <div class="container">
         <div class="contents">
            <section class="">
               <div class="board_wrap">
						<div class="board_title">
							<strong>공지사항</strong>
						</div>
						<form
							action="${pageContext.request.contextPath}/noticeModifyView.notice"
							method="post" enctype="multipart/form-data">
							<div class="board_write_wrap">
								<div class="board_write">
									<div class="title">
										<dl>
											<dt>제목</dt>
											<dd>
												<input type="hidden" id="notice_seq" name="notice_seq" value="${noticeView.notice_seq}">
												<input type="text" id="title" name="notice_title" value="${noticeView.notice_title}">
											</dd>
										</dl>
									</div>
									<div class="info">
										<dl id="file-box">
											<dt>파일 첨부</dt>
											<button class="btn_s btn_line" id="addFile" type="button">+</button>
											<c:forEach var="file" items="${flist}">
												<div>
													<div class="modiFile">${file.oriName}</div>
													<button type="button" class="btn_s btn_white delAttach" seq="${file.seq}">x</button>
												</div>
											</c:forEach>
										</dl>

									</div>
									<div class="cont">
										<textarea id="contents" name="notice_contents"
											maxlength="2048">${noticeView.notice_contents}</textarea>
									</div>
								</div>
								<div class="bt_wrap">
									<button class="btn_m btn_primary" type="submit">등록</button>
									<a href="javascript:history.back()" class="btn_m btn_white" type="button">취소</a>
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
   <%@ include file="../layout/jsp/footer.jsp"%>
   <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<!-- 부트스트랩 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>