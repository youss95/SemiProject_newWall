<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>뉴월 관리자 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

</head>

<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded reg_info">
					<div class="title_area">
						<h2>동물 등록</h2>
					</div>
					<div class="contents">
						<form action="${pageContext.request.contextPath}/animalInfoReg.adm" method="post" enctype="multipart/form-data" class="form_tbl" id="animalInfoReg">
							<dl>
								<dt>이름</dt>
								<dd>
									<input type="text" name="anName" id="anName" class="inpform" placeholder="이름을 입력해주세요.">
								</dd>
							</dl>
							<dl>
								<dt>종류</dt>
								<dd>
									<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd1" name="anCategory" value="개" checked>
											<label for="rd1">개</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd2" name="anCategory" value="고양이"> 
											<label for="rd2">고양이</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성별</dt>
								<dd>
									<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd3" name="anGender" value="암컷" checked>
											<label for="rd3">암컷</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd4" name="anGender" value="수컷"> 
											<label for="rd4">수컷</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>품종</dt>
								<dd>
									<input type="text" name="anKind" id="anKind" class="inpform" placeholder="품종을 입력해주세요.">
								</dd>
							</dl>
							<dl>
								<dt>나이</dt>
								<dd>
									<input type="number" name="anAge" id="anAge" class="inpform" placeholder="나이를 입력해주세요."> 살
								</dd>
							</dl>
							<dl>
								<dt>무게</dt>
								<dd>
									<input type="number" name="anWeight" id="anWeight" class="inpform" placeholder="무게를 입력해주세요.(단위 : kg)"> kg
								</dd>
							</dl>
							<dl>
								<dt>구조 일자</dt>
								<dd>
									<input type="date" id="anDate" class="inpform">
									<input type="hidden" id="anDate_hd" name="anDate">
								</dd>
							</dl>
							<dl>
								<dt>중성화 유무</dt>
								<dd>
									<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd5" name="anNeutering" value="O" checked>
											<label for="rd5">Y</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd6" name="anNeutering" value="X"> <label
												for="rd6">N</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성격</dt>
								<dd>
									<div class="inp_slct">
										<select name="anCharacter" id="anCharacter">
											<option>성격</option>
											<option>얌전</option>
											<option>보통</option>
											<option>활발</option>
											<option>매우활발</option>
										</select>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									사진<span class="s_txt">(사진을 1장 이상 업로드 해주세요.)</span>
								</dt>
								<dd>
									<div class="photo_thumb">
										<strong>썸네일</strong>
										<input type="file" name="thumbnail" id="thumbnail" >
									</div>
									<div class="photo_detail">
										<div id="file-box">
											<strong>상세 사진 추가</strong>
											<button id="addFile" type="button" class="btn_plus"><i class="fas fa-plus"></i></button>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>구조 내용</dt>
								<dd>
									<textarea id="summernote" name="anContnets"></textarea>
								</dd>
							</dl>
							<div class="btn_wrap">
								<a href="javascript:history.back();" class="btn_m btn_line" style="float:left;">목록</a>
								<button class="btn_m btn_default btn_submit">정보 등록</button>
							</div>
						</form>
					</div>
				</section>

			</div>
		</div>
	</div>
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
							console.log("decodeURI" + decodeURI(resp));
							$(editor).summernote('insertImage', "${pageContext.request.contextPath}" + decodeURI(resp));
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
			
			let validChk = $(".btn_submit").on("click", function(){
				
				if($("#anName").val() == ""){
					alert("등록할 이름을 입력해주세요!");
					return false;
				}
				
				if($("#anKind").val() == ""){
					alert("등록할 품종을 입력해주세요!");
					return false;
				}
				
				let age = $("#anAge").val();
	 			let ageRegex = /^[0-9]/;
	 			if($("#anAge").val() == ""){
					alert("나이를 확인해주세요!");
					return false;
				}
	 	/* 		if(!ageRegex.test(age)){
					alert("나이는 숫자만 입력 가능합니다!");
					return false;
	  			} */
	 			
	 			let weight = $("#anWeight").val();
	 			let weightRegex = /^[0-9]/;
	 			if($("#anWeight").val() == ""){
					alert("무게를 확인해주세요!");
					return false;
				}
	 			/* if(!weightRegex.test(weight)){
					alert("무게는 숫자만 입력 가능합니다!");
					weight = 0;
					return false;
					alert('dd');
	  			} */
	 			if($("#anDate").val() == ""){
					alert("구조일자를 입력해주세요!");
					return false;
				}
	 			if($("#anCharacter").val() == "성격"){
					alert("성격을 선택해주세요!");
					return false;
				}
	 			if($("#thumbnail").val() == ""){
					alert("썸네일 이미지를 등록해주세요!");
					return false;
				}
	 			
	 			if($("#file-box input").val() == "" || $("#file-box input").length == 0){
					alert("사진을 한 장 이상 첨부해주세요!");
					return false;
				}
	 			
	 			if($("#summernote").val() == "" ){
					alert("구조내용을 입력해주세요!");
					return false;
				}

				$("#animalInfoReg").submit();
				
			}) 
			
			$('#anDate').on("change", function(){
				let date = $(this).val().replace(/\-/g,'');
				$('#anDate_hd').val(date);
			})
			
			
			
			let fileCount = 1;
			$("#addFile").on("click", function() {
				let fileLine = $("<div>");

				let inputFile = $("<input>");
				inputFile.attr("type", "file");
				inputFile.attr("name", "anPhoto" + fileCount++);

				let btnDelete = $("<button>");
				btnDelete.attr("type", "button");
				btnDelete.addClass("delFile");
				btnDelete.append("<i class='fas fa-times'></i>");

				fileLine.append(inputFile);
				fileLine.append(btnDelete);

				$("#file-box").append(fileLine);
			})

			$("#file-box").on("click", ".delFile", function() {
				$(this).parent().remove();
			});

		})
	</script>
</body>

</html>