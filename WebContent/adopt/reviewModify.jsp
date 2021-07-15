<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="review_write modify">
					<div class="title">
						<h2>입양 후기</h2>
						<p>뉴월을 통해 입양하신 분들은 누구나! <em>입양후기</em>를 올려주세요.<br> 가족이 되어 즐겁게 지내시는 모습, 입양 전후 사진, 특이한 버릇, 입양 후 가장 좋은 점 등 입양을 망설이시거나 고민하시는 분들께 좋은 선물이 될 수 있습니다.</p>
					</div>
					<form action="${pageContext.request.contextPath}/reviewModify.apt" method="post" enctype="multipart/form-data" id="modiform">
						<div class="view">
							<div class="title">
								<h3>입양후기 작성</h2>
							</div>
							<div class="cont">
								<dl>
									<dt>입양 후기 제목</dt>
									<dd><input type="text" name="title" class="inpform" value="${rv.review_title}" placeholder="제목을 입력해주세요."></dd>
								</dl>
								<dl>
									<dt>한마디 소개</dt>
									<dd><input type="text" name="introduce" class="inpform" value="${rv.review_introduce}" placeholder="한마디 소개글을 입력해주세요."></dd>
								</dl>
								<dl>
									<dt>썸네일 이미지 등록</dt>
									<dd>
										
										<div class="photo_thumb">
											<p class="f_name">${rv.review_thumbnail}</p>
											<button type="button" id="modi_thumbnail"><i class="fas fa-times"></i></button>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>후기 내용</dt>
									<dd>
										<textarea id="summernote" name="contents">${rv.review_contents}</textarea>
									</dd>
								</dl>
							</div>
						</div>
						<div class="btn_wrap">
							<button type="button" class="btn_m btn_line btn_list" onclick="goBack();">뒤로</button>
							<button type="button" class="btn_m btn_primary btn_modi" id="btn_modi">수정</button>
							<input type="hidden" name="review_seq" value="${rv.review_seq}">
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<jsp:include page="/layout/jsp/modal.jsp"></jsp:include> 
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
							url : '${pageContext.request.contextPath}/uploadImg.apt',
							contentType : false,
							processData : false,
							enctype : 'multipart/form-data',
						}).done(function(resp){
							console.log("resp" + resp);
							$(editor).summernote('insertImage', "${pageContext.request.contextPath}" + resp);
						})
					}
				},
				toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
			});	
		});	
		
		$("#btn_modi").on("click", function () {
			let result = confirm("정말 수정 하시겠습니까?");
			
			if (result) {
				
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
			
				$("#modiform").submit();
			}
		});
		
		$("#modi_thumbnail").on("click", function() {
			let valtxt = $(".f_name").text();
			let inputFile = $("<input>");
			inputFile.attr("type", "file");
			inputFile.attr("name", "thumbnail");
			inputFile.attr("id", "thumbnail");
			$(this).after(inputFile);

			let inphd = $("<input>");
			inphd.attr("type", "hidden");
			inphd.attr("name", "deleteImg");
			inphd.attr("value", valtxt);
			$("#thumbnail").after(inphd);
			
			$(this).siblings('p').remove();
			$(this).remove();
		});
		
		function goBack(){
			window.history.back();
		}
		
	</script>
			
</body>
</html>