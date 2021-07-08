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
				<section class="shadow-sm rounded reg_info">
					<div class="title_area">
						<h2>동물 등록</h2>
					</div>
					<div class="contents">
						<form
							action="${pageContext.request.contextPath}/animalInfoReg.adm"
							method="post" enctype="multipart/form-data" class="form_tbl">
							<dl>
								<dt>이름</dt>
								<dd>
									<input type="text" name="anName" class="inpform"
										placeholder="이름을 입력해주세요.">
								</dd>
							</dl>
							<dl>
								<dt>종류</dt>
								<dd>
									<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd1" name="anCategory" checked>
											<label for="rd1">개</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd2" name="anCategory" >
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
											<input type="radio" id="rd3" name="anGender" checked>
											<label for="rd3">암컷</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd4" name="anGender" >
											<label for="rd4">수컷</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>품종</dt>
								<dd>
									<input type="text" name="anKind" class="inpform"
										placeholder="품종을 입력해주세요.">
								</dd>
							</dl>
							<dl>
								<dt>나이</dt>
								<dd>
									<input type="text" name="anAge" class="inpform"
										placeholder="나이를 입력해주세요."> 살
								</dd>
							</dl>
							<dl>
								<dt>무게</dt>
								<dd>
									<input type="text" name="anWeight" class="inpform"
										placeholder="무게를 입력해주세요.(단위 : kg)"> kg
								</dd>
							</dl>
							<dl>
								<dt>성격</dt>
								<dd>
									<div class="inp_slct">
										<select name="anCharacter">
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
								<dt>구조 일자</dt>
								<dd>
									<input type="text" name="anDate" class="inpform"
										placeholder="구조일자를 입력해주세요. (ex: YYYYMMDD)">
								</dd>
							</dl>
							<dl>
								<dt>중성화 유무</dt>
								<dd>
								<div class="rd_group">
										<div class="inp_rd">
											<input type="radio" id="rd5" name="anNeutering" checked>
											<label for="rd3">Y</label>
										</div>
										<div class="inp_rd">
											<input type="radio" id="rd6" name="anNeutering" >
											<label for="rd4">N</label>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>성격</dt>
								<dd>
									<div class="inp_slct">
										<select name="anCharacter">
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
								<dt>
									구조 내용
								</dt>
								<dd>
									<!-- <textarea name="anContnets" class="txtareaform" placeholder="구조 내용을 입력해주세요."></textarea> -->
									  <textarea id="summernote" name="anContnets"></textarea>
								</dd>
							</dl>
							<div class="btn_wrap">
								<button class="btn_m btn_default">정보 등록</button>
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
				  height: 500,
				  minHeight: 500,
				  maxHeight: 500,  
			  });
		})
	</script>
</body>

</html>