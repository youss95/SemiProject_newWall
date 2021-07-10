<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">
	
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){				
		$(".delAttach").on("click",function(){
			let seq = $(this).attr("seq");
			console.log(seq)
			$(this).parent().remove();
			
			let delTarget = $("<input>");
			delTarget.attr("type","hidden");
			delTarget.attr("name","delete");
			delTarget.attr("value",seq);
			
			$(".newsboard_write").append(delTarget);
		})
		
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
		
		$('#subcontents').on('keyup', function() {
			$('#subcontents_cnt').html("("+$(this).val().length+" / 150)");
		        if($(this).val().length > 150) {
		            $(this).val($(this).val().substring(0, 150));
		            $('#subcontents_cnt').html("(150 / 150)");
		   	}
		});
	})
</script>


</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="notice_list">
					<div class="board_wrap">
						<div class="board_title">
							<strong>뉴스</strong>
						</div>
						<form action="${pageContext.request.contextPath}/newsModifyView.news" method="post" enctype="multipart/form-data">
							<div class="board_write_wrap">
								<div class="newsboard_write">
									<div class="title">
										<dl>
											<dt>제목</dt>
											<dd>
												<input type="text" id="title" name="news_title" value="${newsView.news_title}">
												<input type="hidden" id="seq" name="news_seq" value="${newsView.news_seq}">
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
									<div class="subcont">
										<textarea placeholder="서브 내용 입력" id="subcontents" name="news_sub_contents">${newsView.news_sub_contents}</textarea>
										<div id="subcontents_cnt" class="subcontents_cnt">(0/150)</div>
									</div>
									<div class="cont">
										<textarea placeholder="내용 입력" id="contents" name="news_contents" maxlength="2048">${newsView.news_contents}</textarea>
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
	</div>
	
	
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<!-- 부트스트랩 JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>