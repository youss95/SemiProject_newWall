<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	$(function(){
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
						url : '${pageContext.request.contextPath}/uploadImg.news',
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
	        $('#subcontents').on('keyup', function() {
	            $('#subcontents_cnt').html("("+$(this).val().length+" / 150)");
	 
	            if($(this).val().length > 100) {
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
					<div class="title">
						<h2>뉴스</h2>
						<p>다양한 활동과 소식을 담은 뉴스레터를 보내드립니다.</p>
					</div>
					<div class="board_wrap">
						<form action="${pageContext.request.contextPath}/write.news" method="post" enctype="multipart/form-data">
							<div class="board_write_wrap">
								<div class="newsboard_write">
									<div class="title">
										<dl>
											<dt>제목</dt>
											<dd>
												<input type="text" id="title" name="news_title" placeholder="제목 입력">
											</dd>
										</dl>
									</div>
									<div class="info">
										<dl id="file-box">
											<dt>파일 첨부</dt>
											<input type="file" name="news_photo">
										</dl>
										
									</div>
									<div class="subcont">
										<textarea placeholder="서브 내용 입력" id="subcontents" name="news_sub_contents"></textarea>
										<div id="subcontents_cnt" class="subcontents_cnt">(0/150)</div>
									</div>
									<div class="cont">
										<textarea placeholder="내용 입력" id="summernote" name="news_contents"></textarea>
									</div>
								</div>
								<div class="bt_wrap">
									<button class="btn_m btn_primary" type="submit">등록</button> <button class="btn_m btn_white" type="button" onClick="history.back();">취소</button>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
</body>
</html>