<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<jsp:include page="../layout/jsp/commonModal.jsp"></jsp:include>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min_v4.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min_v4.js"></script> --%>
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="review_write">
					<div class="title">
						<h2>입양 후기</h2>
						<p>뉴월을 통해 입양하신 분들은 누구나! <em>입양후기</em>를 올려주세요.<br> 가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</p>
					</div>
					<form action="${pageContext.request.contextPath}/reviewWrite.apt" method="post" id="reviewWite" enctype="multipart/form-data">
						<div class="view">
							<div class="title">
								<h3>후기 쓰기</h2>
							</div>
							<div class="cont">
								<dl>
									<dt>입양 후기 제목</dt>
									<dd><input type="text" class="inpform" name="title" id="title" placeholder="제목을 입력해주세요."></dd>
								</dl>
								<dl>
									<dt>한마디 소개</dt>
									<dd><input type="text" class="inpform" name="introduce" id="introduce" placeholder="한마디 소개글을 입력해주세요."></dd>
								</dl>
								<dl>
									<dt>썸네일 이미지 등록</dt>
									<dd>
										<input type="file" name="thumbnail" id="thumbnail">
									</dd>
								</dl>
								<dl>
									<dt>후기 내용</dt>
									<dd>
										<textarea id="summernote" name="contents"></textarea>
									</dd>
								</dl>
							</div>
						</div>
						<div class="btn_wrap">
							<a href="${pageContext.request.contextPath}/reviewList.apt?cpage=1" class="btn_m btn_line btn_list">목록으로</a>
							<button type="button" class="btn_m btn_primary btn_regi" id="btn_regi">후기 등록	</button>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
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
							url : '${pageContext.request.contextPath}/uploadImg.adm',
							contentType : false,
							processData : false,
							enctype : 'multipart/form-data',
						}).done(function(resp){
							console.log("resp" + resp);
							$(editor).summernote('insertImage', "${pageContext.request.contextPath}" + resp);
						})
					}
				},
			});	
			
			$("#btn_regi").on("click", function(){
			
				if($("#title").val() == ""){
					alert("제목을 입력해주세요!");
					return false;
				}
				if($("#thumbnail").val() == ""){
					alert("썸네일 이미지를 등록해주세요!");
					return false;
				}
				if($("#introduce").val() == ""){
					alert("한마디 소개를 입력해주세요!");
					return false;
				}
				if($("#summernote").val() == ""){
					alert("후기 내용을 작성해주세요!");
					return false;
				}
				
				$("#reviewWite").submit();
			})
		});	
	</script>
			
</body>
</html>