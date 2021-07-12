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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded reg_info info_modify">
					<div class="title_area">
						<h2>동물 정보 수정</h2>
					</div>
					<div class="contents">
						<form
							action="${pageContext.request.contextPath}/animalInfoModify.adm" method="post" enctype="multipart/form-data" class="form_tbl">
							<dl>
								<dt>동물코드</dt>
								<dd>
									<span>${info.code_seq}</span>
								</dd>
							</dl>
							<dl>
								<dt>이름</dt>
								<dd>
									<input type="text" name="anName" class="inpform" placeholder="이름을 입력해주세요." value="${info.an_name}">
								</dd>
							</dl>
							<dl>
								<dt>종류</dt>
								<dd>
									<div class="rd_group" id="anCategory">
										<div class="inp_rd">
											<input type="radio" id="rd1" name="anCategory" value="개" checked>
											<label for="rd1">개</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd2" name="anCategory" value="고양이"> 
											<label for="rd2">고양이</label>
										</div>
										<input type="hidden" value="${info.an_category}">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성별</dt>
								<dd>
									<div class="rd_group" id="anGender">
										<div class="inp_rd">
											<input type="radio" id="rd3" name="anGender" value="암컷" checked>
											<label for="rd3">암컷</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd4" name="anGender" value="수컷"> 
											<label for="rd4">수컷</label>
										</div>
										<input type="hidden" value="${info.an_gender}">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>품종</dt>
								<dd>
									<input type="text" name="anKind" class="inpform" placeholder="품종을 입력해주세요." value="${info.an_kind}">
								</dd>
							</dl>
							<dl>
								<dt>나이</dt>
								<dd>
									<input type="number" name="anAge" class="inpform" placeholder="나이를 입력해주세요." value="${info.an_age}"> 살
								</dd>
							</dl>
							<dl>
								<dt>무게</dt>
								<dd>
									<input type="number" name="anWeight" class="inpform" placeholder="무게를 입력해주세요.(단위 : kg)" value="${info.an_weight}"> kg
								</dd>
							</dl>
							<dl>
								<dt>구조 일자</dt>
								<dd>
									<input type="date" id="anDate" class="inpform" value="${info.an_date}">
									<input type="hidden" name="anDate" id="anDate_hd">
								</dd>
							</dl>
							<dl>
								<dt>중성화 유무</dt>
								<dd>
									<div class="rd_group" id="anNeutering">
										<div class="inp_rd" >
											<input type="radio" id="rd5" name="anNeutering" checked value="O">
											<label for="rd5">Y</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd6" name="anNeutering" value="X"> 
											<label for="rd6">N</label>
										</div>
									<input type="hidden" value="${info.an_neutering}" >
									</div>
								</dd>
							</dl>
							<dl>
								<dt>입양상태</dt>
								<dd>
									<div class="rd_group" id="anStatus">
										<div class="inp_rd" >
											<input type="radio" id="rd7" name="anStatus" checked value="Y">
											<label for="rd7">Y</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd8" name="anStatus" value="N"> 
											<label for="rd8">N</label>
										</div>
									<input type="hidden" value="${info.an_status}" >
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성격</dt>
								<dd>
									<div class="inp_slct" id="anCharacter">
										<select name="anCharacter">
											<option>성격</option>
											<option value="얌전">얌전</option>
											<option value="보통">보통</option>
											<option value="활발">활발</option>
											<option value="매우활발">매우활발</option>
										</select>
										<input type="hidden" value="${info.an_character}">
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
										<p class="f_name">${info.an_photo }</p>
										<button type="button" id="modi_thumbnail"><i class="fas fa-times"></i></button>
									</div>
									<div class="photo_detail">
										<div id="file-box">
											<strong>상세 사진 추가</strong>
											<button id="addFile" type="button" class="btn_plus"><i class="fas fa-plus"></i></button>
										</div>
										<div id="fileList">
											<c:forEach var="file" items="${files}">
												<div class="oriFile">
													<span>${file.ori_name}</span>
													<button class="delFile delAttach" type="button" seq="${file.photo_seq}"><i class='fas fa-times'></i></button>
												</div>
											</c:forEach>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>구조 내용</dt>
								<dd>
									<textarea id="summernote" name="anContnets">${info.an_contents}</textarea>
								</dd>
							</dl>
							<div class="btn_wrap">
								<a href="javascript:history.back();" class="btn_m btn_line">목록</a>
								<button type="button" id="btn_delete" class="btn_m btn_primary">삭제</button>
								<button class="btn_m btn_default" id="btn_modify">수정</button>
								<input type="hidden" name="code_seq" value="${info.code_seq}">
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
							console.log("resp" + resp);
							$(editor).summernote('insertImage', "${pageContext.request.contextPath}" + resp);
						})
					}
				}
			});	
			
 			let an_category = $("#anCategory input[type=hidden]").val();
 			let an_neutering = $("#anNeutering input[type=hidden]").val();
 			let an_gender = $("#anGender input[type=hidden]").val();
 			let an_character = $("#anCharacter input[type=hidden]").val();
 			let an_status = $("#anStatus input[type=hidden]").val();
 			
	
 			$("#anCategory input:radio[name='anCategory']:input[value='" + an_category + "']").attr("checked", true);
 			$("#anNeutering input:radio[name='anNeutering']:input[value='" + an_neutering + "']").attr("checked", true);
 			$("#anGender input:radio[name='anGender']:input[value='" + an_gender + "']").attr("checked", true);
 			$("#anStatus input:radio[name='anStatus']:input[value='" + an_status + "']").attr("checked", true);
 			$("#anCharacter select option[value='" + an_character + "']").attr("selected", true);
			
			$('#anDate').on("change", function(){
				let date = $(this).val().replace(/\-/g,'');
				$('#anDate_hd').val(date);
			})
			
			$("#btn_delete").on("click", function () {
				let result = confirm("정말 삭제 하시겠습니까?");
				if (result) {
					location.href = "${pageContext.request.contextPath}/animalInfoDelete.adm?code_seq=${info.code_seq}";
				}
			});
			
			
			$('#btn_modify').on('click',function(){
				
				let date = $("#anDate").val().replace(/\-/g,'');
				$('#anDate_hd').val(date);
				
				if($("#anName").val() == ""){
					alert("등록할 이름을 입력해주세요!");
					return false;
				}
				
				if($("#anKind").val() == ""){
					alert("등록할 품종을 입력해주세요!");
					return false;
				}
				
	 			if($("#anAge").val() == ""){
					alert("나이를 입력해주세요!");
					return false;
				}
	 
	 			if($("#anWeight").val() == ""){
					alert("무게를 입력해주세요!");
					return false;
				}
	 
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
				if($(".oriFile").length == 0 && $("#file-box input").val() == "" && $("#file-box input").length != 0){
					alert("사진을 한 장 이상 첨부해주세요!");
					return false;
	 			} 

	 			if($(".oriFile").length == 0 && $("#file-box input").length == 0){
	 				alert("사진을 한 장 이상 첨부해주세요!");
					return false;
	 			} 
	
	 			if($("#summernote").val() == "" ){
					alert("구조내용을 입력해주세요!");
					return false;
				}

				$("#animalInfoReg").submit();
				
			})
			
		$(".delAttach").on("click", function() {
			
			let sysname = $(this).attr("seq");

			let delTarget = $("<input>");
			delTarget.attr("type", "hidden");
			delTarget.attr("name", "delete");
			delTarget.attr("value", sysname);

			$("#fileList").after(delTarget);
			$(this).parent().remove();
	
			
		});

		let fileCount = 1;
		$("#addFile").on("click", function() {
			let fileLine = $("<div>");

			let inputFile = $("<input>");
			inputFile.attr("type", "file");
			inputFile.attr("name", "anPhoto" + fileCount++);

			let btnDelete = $("<button>");
			btnDelete.addClass("delFile");
			btnDelete.attr("type", "button");
			btnDelete.append("<i class='fas fa-times'></i>");

			fileLine.append(inputFile);
			fileLine.append(btnDelete);

			$("#file-box").append(fileLine);
		})

		$("#file-box").on("click", ".delFile", function() {
			$(this).parent().remove();
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
		

		})
	</script>
</body>

</html>