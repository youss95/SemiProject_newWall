<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴월</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
 <script>
	$(function() {	
		$('#summernote').summernote({
			height : 300,
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files) {
					let editor = this;
					let file = files[0];
					let form = new FormData();
					form.append("file", file);
					console.log(file);
					
					$.ajax({
						data: form,
						type: "post",
						url : '${pageContext.request.contextPath}/uploadImg.notice',
						contentType : false,
						processData : false,
						enctype : 'multipart/form-data',
					}).done(function(resp){
						console.log("URI" + resp);
						$(editor).summernote('insertImage', "${pageContext.request.contextPath}" + resp);
					})
				}
			}
		});	
		
		$(".delAttach").on("click",function(){
			let seq = $(this).attr("seq");
			console.log(seq)
			$(this).parent().remove();
			
			let delTarget = $("<input>");
			delTarget.attr("type","hidden");
			delTarget.attr("name","delete");
			delTarget.attr("value",seq);
			
			$(".board_write").append(delTarget);
		})

		$("#file-box").on("click", ".delFile", function() {
			$(this).parent().remove();
		})

		let fileCount = 1;
		$("#addFile").on("click", function() {
			let fileLine = $("<div>")

			let inputFile = $("<input>");
			inputFile.attr("type", "file");
			inputFile.attr("name", "file" + fileCount++);

			let btnDel = $("<button>");
			btnDel.addClass("delFile btn_s btn_white");
			btnDel.attr("type", "button");
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
      <%@ include file="../layout/jsp/header.jsp"%>
      <div class="container">
         <div class="contents">
            <section class="">
               <div class="board_wrap">
					<div class="title">
						<h2>공지사항</h2>
						<p>새로운 소식과 이야기를 전합니다</p>
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
										<textarea id="summernote" name="notice_contents" >${noticeView.notice_contents}</textarea>
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
</body>
</html>