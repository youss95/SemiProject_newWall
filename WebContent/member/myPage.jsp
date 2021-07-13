<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/login/myPage.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
* {
	box-sizing: border-box;
}

#sp_com_input .su_banner img {
	opacity: 0.9;
}

#sp_com_input .su_title h2 {
	font-size: 36px;
	font-weight: 600;
	margin-bottom: 15px;
}

#sp_com_input .su_title h2::after {
	display: block;
	width: 100%;
	height: 8px;
	background-color: #FFA5A5;
	/* 안되네 나중에 다시 */
}

#sp_com_input .su_title {
	text-align: center;
	margin-top: 20px;
	padding-bottom: 10px;
	/* border-bottom: #FFF0F0 solid 2px; */
}

#sp_com_input .su_persnal_info input {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#sp_com_input .su_persnal_info select {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#sp_com_input .su_persnal_info dl {
	margin: 40px;
	/* width: 500px; */
}

#sp_com_input .su_persnal_info .su_ti {
	/*  margin: 10px;
            width: 500px; */
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 2px solid #FFA5A5;
}

#sp_com_input .su_persnal_info .su_s_ip {
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_l_ip {
	width: 500px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_btn_detail {
	margin-left: 10px;
	height: 40px;
	background-color: #FCDADA;
	color: #3D7EA6;
	border: 1px solid #FFF0F0;
}

#sp_com_input .btn_wrap .su_btn_detail_big {
	margin-left: 10px;
	width: 250px;
	height: 60px;
	/* background-color: #FCDADA;
            color: #3D7EA6;
            border: 1px solid #FCDADA; */
	font-size: 20px;
	font-weight: 600;
}

#sp_com_input .btn_wrap {
	text-align: center;
}

#sp_com_input .su_persnal_info .su_m_ip {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#sp_com_input .su_persnal_info .su_pw_sub {
	padding-top: 10px;
}

#sp_com_input .su_persnal_info .su_pw_ck {
	margin-left: 10px;
}

#sp_com_input .su_persnal_info .su_birthday_con {
	overflow: hidden;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_birthday {
	float: left;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_address {
	float: left;
}

#sp_com_input .su_persnal_info .su_birthday_con .su_birthday_text {
	margin-left: 10px;
	margin-right: 30px;
}

dd div:not(.sp_address div) {
	display: inline-block;
	line-height: 40px;
}

dd div.inpform {
	border: 1px solid #FCDADA !important;
}
</style>

</head>
<body>
	<div class="modal fade" id="passwordModal" tabindex="-1"
		aria-labelledby="passwordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordModalLabel">Password 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="user-id" class="col-form-label">Old password</label> <input
							type="password" class="form-control" id="oldpw" name="oldpw">
					</div>
					<div id="oldResult" style="color: crimson"></div>
					<div class="form-group">
						<label for="user-password" class="col-form-label">New
							password</label> <input type="password" class="form-control" id="newpw"
							name="user_password">
					</div>
					<div id="newResult" style="color: crimson"></div>
					<div class="form-group">
						<label for="user-password" class="col-form-label">New
							password again</label> <input type="password" class="form-control"
							id="renewpw" name="user_password">
					</div>
					<div id="reNewResult" style="color: crimson"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="changepw"
						class="btn_submit btn_m btn_default">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="memberOutModal" tabindex="-1"
		aria-labelledby="memberOutModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="memberOutModalLabel">회원 탈퇴 확인</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="user-id" class="col-form-label">정말 탈퇴하시겠습니까?</label>
						<div class="text-muted">탈퇴하시려면 [ ${loginInfo.user_id } ] 를
							정확히 입력해주세요.</div>
						<input type="text" class="form-control" id="outID">
					</div>
					<div id="outResult" style="color: crimson"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" id="memberOut"
						class="btn_submit btn_m btn_default">Out</button>
				</div>
			</div>
		</div>
	</div>


	<div class="wrap">
		<%@ include file="../layout/jsp/header.jsp"%>
		<div class="container">
			<div class="contents">
				<section id="sp_com_input">
					<!-- 하이 여기는 서브입니다 -->
					<div class="signup_con">
						<div class="su_banner">
							<img src="..\resources\images\signupmain_1100_400.jpg" alt="">
						</div>
						<div class="su_title">
							<h2>My Page</h2>
							<p>
								동물권행동 NEW-WAL의 회원님 환영합니다.<br> 유기동물 뿐 아닌 모든 생명이 조화로운 세상을 위해
								쉼없이 노력하겠습니다.
							</p>
						</div>

						<form action="" method="post" id="">
							<!-- <h3>개인 정보</h3> -->
							<div class="su_persnal_info">
								<dl>
									<dt class="su_ti su_id">아이디</dt>
									<dd>
										<div class="inpform su_s_ip" itemid="user_id">${loginInfo.user_id }</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">비밀번호</dt>
									<dd>
										<button type="button" class="btn_submit btn_m btn_default"
											data-bs-toggle="modal" data-bs-target="#passwordModal">
											Password 변경</button>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">이름</dt>
									<dd>
										<div class="inpform su_s_ip" itemid="name">${loginInfo.name }</div>
										<div class="control">
											<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
											<i class="fas fa-times"></i>
										</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">이메일주소</dt>
									<dd>
										<div class="inpform su_m_ip" itemid="email">${loginInfo.email }</div>
										<div class="control">
											<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
											<i class="fas fa-times"></i>
										</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti ">생년월일</dt>
									<dd class="su_birthday_con">

										<div class="su_birthday">
											<select class="inpform su_s_ip" id="year" name="" disabled>
											</select>
										</div>
										<span class="su_birthday su_birthday_text">년</span>
										<div class="inp_slct su_s_ip su_birthday">
											<select name="" class="" id="month" required disabled>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</div>
										<span class="su_birthday su_birthday_text">월</span>
										<div class="inp_slct su_s_ip su_birthday">
											<select name="" class=" " id="day" required disabled>
												<option value="01">1</option>
												<option value="02">2</option>
												<option value="03">3</option>
												<option value="04">4</option>
												<option value="05">5</option>
												<option value="06">6</option>
												<option value="07">7</option>
												<option value="08">8</option>
												<option value="09">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
												<option value="31">31</option>
											</select>
										</div>
										<span class="su_birthday su_birthday_text">일</span>
										<div class="control">
											<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
											<i class="fas fa-times"></i>
										</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">연락처</dt>
									<dd>
										<div class="inpform su_m_ip" itemid="contact">${loginInfo.contact }</div>
										<div class="control">
											<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
											<i class="fas fa-times"></i>
										</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">주소</dt>
									<dd>
										<div class="sp_address">
											<div>
												<h3 class="ad_h3 su_address">우편번호</h3>
												<div id="sp_postcode" name="sp_postcode"
													class="inpform  su_s_ip su_address"
													style="display: inline-block;">${loginInfo.postcode }</div>
												<button class="btn_m btn_default su_btn_detail"
													id="sp_search" type="button">우편번호 찾기</button>
											</div>
											<div>
												<h3 class="ad_h3 su_address">도로명 주소</h3>
												<div id="sp_address1" name="sp_address1"
													class="inpform su_address su_l_ip">${loginInfo.address1 }</div>
											</div>
										
											<h3 class="ad_h3 su_address">상세 주소</h3>
											<div id="sp_address2" name="sp_address2"
												class="inpform su_address su_l_ip" itemid="address2" style="display:inline-block">${loginInfo.address2 }</div>
										
											<div class="control" style="display:inline-block">
												<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
												<i class="fas fa-times"></i>
											</div>
										</div>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti">회원탈퇴</dt>
									<dd>
										<button type="button" class="btn_submit btn_m btn_default"
											data-bs-toggle="modal" data-bs-target="#memberOutModal">회원탈퇴</button>
									</dd>
								</dl>
							</div>
						</form>
					</div>
					<!-- 끝 -->
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="/layout/jsp/footer.jsp"></jsp:include>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function() {
			
			let now = new Date(); 
			let year = now.getFullYear();
			for(let i = year ; i >= 1900 ; i--) { $('#year').append('<option value="' + i + '">' + i + '</option>'); }
			
			console.log("${loginInfo.birthday}");
			let birth_yyyy = "${loginInfo.birthday}".substr(0,4);
			let birth_mm = "${loginInfo.birthday}".substr(5,2);
			let birth_dd = "${loginInfo.birthday}".substr(8,2);
			
			console.log(birth_yyyy + " : " + birth_mm + " : " + birth_dd);
			$("#year option[value="+birth_yyyy+"]").attr("selected","true");
			$("#month option[value="+birth_mm+"]").attr("selected","true");
			$("#day option[value="+birth_dd+"]").attr("selected","true");
			
			$("#memberOut").on("click",function(){
				let outID = $("#outID").val();
				if("${loginInfo.user_id}" == outID){
					alert("이용해주셔서 감사했습니다.");
					location.href="memberOutProc.mem";
				}else{
					$("#outID").val("");
					$("#outResult").text("입력값이 정확하지 않습니다.");
				}
			})
			
			$("#changepw").on("click", function() {
				if($("#oldpw").val()==""){
					$("#oldResult").text("이전 패스워드를 입력하세요.")
					return;
				}
				if($("#newpw").val()==""){
					$("#newResult").text("새로운 패스워드를 입력하세요.");
					return
				}
				if($("#renewpw").val()==""){
					$("#reNewResult").text("새로운 패스워드 확인 항목을 입력하세요.");
					return
				}
				
				let result;
				$.ajax({
					url : "${pageContext.request.contextPath}/checkPw.mem",
					data : {
						pw : $("#oldpw").val()
					},
					async : false
				}).done(function(resp) {
					console.log(resp);
					result = resp;
				})
				if (result == "false") {
					$("#oldResult").text("패스워드를 다시 확인하세요.");
					$("#oldpw,#newpw,#renewpw").val("");
					//$("#oldResult,#newResult,#reNewResult").text("");
					return;
				}
				
				let pw = $("#newpw").val();
				let repw = $("#renewpw").val();
				
				if(pw != repw){
					$("#newpw,#renewpw").val("");
					$("#reNewResult,#newResult").text("두 패스워드가 일치하지 않습니다.");
					return;
				}
				
				$.ajax({
					url:"${pageContext.request.contextPath}/changePw.mem",
					data:{newpw: $("#newpw").val()},
				}).done(function(resp){
					alert("변경이 완료되었습니다.")
					$("#passwordModal1").modal("toggle");
				});
			})

			$(".fa-edit:not(.su_birthday_con .fa-edit)").on("click", function() {
				let target = $(this).parent().prev();
				target.attr("contenteditable", "true");
				target.addClass("border border-primary");
				$(this).hide();
				$(this).siblings().show();
				target.focus();
			});
			$(".su_birthday_con .fa-edit").on("click", function() {
				$("#year,#month,#day").removeAttr("disabled");
				$(this).hide();
				$(this).siblings().show();
			});
			$(".fa-times:not(.su_birthday_con .fa-times)").on("click", function() {
				let target = $(this).parent().prev();
				target.attr("contenteditable", "false");
				target.removeClass("border");
				target.removeClass("border-primary");
				$(this).hide();
				$(this).siblings().hide();
				$(this).siblings(".fa-edit").show();
			})
			$(".su_birthday_con .fa-times").on("click",function(){
				$("#year option[value="+birth_yyyy+"]").prop("selected","true");
				$("#month option[value="+birth_mm+"]").prop("selected","true");
				$("#day option[value="+birth_dd+"]").prop("selected","true");
				$("#year,#month,#day").attr("disabled","disabled");
				$(this).hide();
				$(this).siblings().hide();
				$(this).siblings(".fa-edit").show();
			})
			
			$(".fa-check-circle:not(.su_birthday_con .fa-check-circle)").on("click", function() {
				let target = $(this).parent().prev();
				$(this).hide();
				$(this).siblings().hide();
				$(this).siblings(".fa-edit").show();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/modifyProc.mem",
					data : {
						target : target.attr("itemid"),
						value : target.text()
					},
				}).done(function(resp) {
					target.attr("contenteditable", "false");
					target.removeClass("border");
					target.removeClass("border-primary");
				}).fail(function(a, b, c) {
					alert("정보 수정에 실패했습니다.")
				});
			});
			$(".su_birthday_con .fa-check-circle").on("click",function(){
				$(this).hide();
				$(this).siblings().hide();
				$(this).siblings(".fa-edit").show();
				let year = $("#year option:selected").val();
				let month = $("#month option:selected").val();
				let day = $("#day option:selected").val();
				$("#year,#month,#day").attr("disabled","disabled");
				
				$.ajax({
					url : "${pageContext.request.contextPath}/modifyProc.mem",
					data : {
						target : "birthday",
						value : year+month+day
					},
				}).done(function(resp) {
					target.attr("contenteditable", "false");
					target.removeClass("border");
					target.removeClass("border-primary");
				}).fail(function(a, b, c) {
					alert("정보 수정에 실패했습니다.")
				});
			})
			
			$("#sp_search").on("click",function(){
				new daum.Postcode({
					oncomplete : function(data) {
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						document.getElementById('sp_postcode').innerHTML = data.zonecode;
						document.getElementById("sp_address1").innerHTML = roadAddr;
						
						$.ajax({
							url : "${pageContext.request.contextPath}/modifyProc.mem",
							data : {
								target:"postcode",
								value:data.zonecode
							},
						})
						
						$.ajax({
							url : "${pageContext.request.contextPath}/modifyProc.mem",
							data : {
								target:"address1",
								value:roadAddr
							},
						})
					},
				}).open();
			})
			
		})
	</script>
</body>
</html>