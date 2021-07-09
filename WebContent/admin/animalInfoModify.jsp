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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
</head>

<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded reg_info">
					<div class="title_area">
						<h2>동물 정보 수정</h2>
					</div>
					<div class="contents">
						<form
							action="${pageContext.request.contextPath}/animalInfoReg.adm"
							method="post" enctype="multipart/form-data" class="form_tbl">
							<dl>
								<dt>이름</dt>
								<dd>
									<input type="text" name="anName" class="inpform" placeholder="이름을 입력해주세요." value="${info.an_name}">
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
									<input type="text" name="anKind" class="inpform" placeholder="품종을 입력해주세요." value="${info.an_kind}">
								</dd>
							</dl>
							<dl>
								<dt>나이</dt>
								<dd>
									<input type="text" name="anAge" class="inpform" placeholder="나이를 입력해주세요." value="${info.an_age}"> 살
								</dd>
							</dl>
							<dl>
								<dt>무게</dt>
								<dd>
									<input type="text" name="anWeight" class="inpform" placeholder="무게를 입력해주세요.(단위 : kg)" value="${info.an_weight}"> kg
								</dd>
							</dl>
							<dl>
								<dt>구조 일자</dt>
								<dd>
									<input type="text" name="anDate" class="inpform" placeholder="구조일자를 입력해주세요. (ex: YYYYMMDD)" value="${info.an_date}">
								</dd>
							</dl>
							<dl>
								<dt>중성화 유무</dt>
								<dd>
									<div class="rd_group an_neutering">
										<div class="inp_rd" >
											<input type="radio" id="rd5" name="anNeutering" checked value="O">
											<label for="rd3">Y</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd6" name="anNeutering" value="X"> 
											<label for="rd4">N</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성격</dt>
								<dd>
									<div class="inp_slct">
										<select name="anCharacter" id="anCharacter" value="${info.an_character}">
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
									사진<span class="s_txt">(최대 3장까지 업로드 가능)</span>
								</dt>
								<dd>
									<div class="file_upload">
										<input type="file" name="anPhoto1"> <input type="file"
											name="anPhoto02"> <input type="file" name="anPhoto03">
									</div>
								</dd>
							</dl>
							<dl>
								<dt>구조 내용</dt>
								<dd>
									<!-- <textarea name="anContnets" class="txtareaform" placeholder="구조 내용을 입력해주세요."></textarea> -->
									<textarea id="summernote" name="anContnets">${info.an_contents}</textarea>
								</dd>
							</dl>
							<div class="btn_wrap">
								<a href="javascript:history.back();" class="btn_m btn_primary">목록</a>
								<button class="btn_m btn_default">정보 수정</button>
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
			
			let an_neutering = ${info.an_neutering};
			console.log(an_neutering);
			
			
			$(".an_neutering input:radio[name='anNeutering']:input[value='" + ${info.an_neutering} + "'']").attr("checked", true);
/* 			anCharacter */
			
			// 라디오박스/셀렉트박스 리퀘스트 벨류에 체크되어있게 작업 !!!!!!!!!!
		})
	</script>
</body>

</html>