<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<jsp:include page="/layout/jsp/commonModal.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
* {
	box-sizing: border-box;
}

#mem_signup_con .su_banner img {
	opacity: 0.9;
}

#mem_signup_con .su_title h2 {
	font-size: 36px;
	font-weight: 600;
	margin-bottom: 15px;
}

#mem_signup_con .su_title h2::after {
	display: block;
	width: 100%;
	height: 8px;
	background-color: #FFA5A5;
}

#mem_signup_con .su_title {
	text-align: center;
	margin-top: 20px;
	padding-bottom: 10px;
	/* border-bottom: #FFF0F0 solid 2px; */
}

#mem_signup_con .su_persnal_info input {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#mem_signup_con .su_persnal_info select {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#mem_signup_con .su_persnal_info dl {
	margin: 40px;
	/* width: 500px; */
}

#mem_signup_con .su_persnal_info .su_ti {
	/*  margin: 10px;
            width: 500px; */
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 10px;
	padding-bottom: 10px;
	/*  border-bottom: 2px solid #FFA5A5;   */
}

#mem_signup_con .su_persnal_info .su_ti_o {
	/*  margin: 10px;
            width: 500px; */
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 2px solid #FFA5A5;
}

#mem_signup_con .su_persnal_info .su_s_ip {
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#mem_signup_con .su_persnal_info .su_l_ip {
	width: 500px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#mem_signup_con .su_persnal_info .su_btn_detail {
	margin-left: 10px;
	height: 40px;
	background-color: #FCDADA;
	color: #3D7EA6;
	border: 1px solid #FFF0F0;
}

#mem_signup_con .btn_wrap .su_btn_detail_big {
	margin-left: 10px;
	width: 250px;
	height: 60px;
	/* background-color: #FCDADA;
            color: #3D7EA6;
            border: 1px solid #FCDADA; */
	font-size: 20px;
	font-weight: 600;
}

#mem_signup_con .btn_wrap {
	text-align: center;
}

#mem_signup_con .su_persnal_info .su_m_ip {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#mem_signup_con .su_persnal_info .su_sss_ip {
	width: 80px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#mem_signup_con .su_persnal_info .su_pw_sub {
	padding-top: 10px;
}

#mem_signup_con .su_persnal_info .su_pw_ck {
	margin-left: 10px;
}

#mem_signup_con .su_persnal_info .su_birthday_con {
	overflow: hidden;
}

#mem_signup_con .su_persnal_info .su_birthday_con .su_birthday {
	float: left;
}

#mem_signup_con .su_persnal_info .su_birthday_con .su_address {
	float: left;
}

#mem_signup_con .su_persnal_info .su_birthday_con .su_birthday_text {
	margin-left: 10px;
	margin-right: 30px;
	margin-top:22px;
}

#loadingModal div{border:none;color:white;}

.loader {
	position: absolute;
	width: 200px;
	height: 200px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.circular {
	animation: rotate 2s linear infinite;
	height: 200px;
	position: relative;
	width: 200px;
}

.path {
	stroke-dasharray: 1, 400;
	stroke-dashoffset: 0;
	stroke: #b6463a;
	animation: dash 1.5s ease-in-out infinite, color 6s ease-in-out infinite;
	stroke-linecap: round;
}
@keyframes rotate {
   100% {
     transform: rotate(360deg);
   }
 }
 @keyframes dash {
   0% {
     stroke-dasharray: 2, 400;
     stroke-dashoffset: 0;
   }
   50% {
     stroke-dasharray: 178, 400;
     stroke-dashoffset: -70;
   }
   100% {
     stroke-dasharray: 178, 400;
     stroke-dashoffset: -248;
   }
 }
 @keyframes color {
   100%,
   0% {
     stroke: red;
   }
   40% {
     stroke: violet;
   }
   66% {
     stroke: green;
   }
   80%,
   90% {
     stroke: yellow;
   }
 }


</style>
</head>
<body>
	<jsp:include page="/layout/jsp/modal.jsp" />
	
	<div class="modal fade" id="loadingModal" tabindex="-1"
		aria-labelledby="loadingModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content" style="background-color:#00000000;">
				<div class="modal-body" style="height:200px;">
					<div class="loader">
						<svg class="circular">
	            <circle class="path" cx="100" cy="100" r="40" fill="none"
								stroke-width="10" stroke-miterlimit="10"></circle></svg>
					</div>
				</div>
				<div class="modal-footer justify-content-center">요청을 처리 중 입니다. 잠시만 기다려주세요.</div>
			</div>
		</div>
	</div>

	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section id="mem_signup_con">
					<div class="su_banner">
						<img src="..\resources\images\signupmain_1100_400.jpg" alt="">
					</div>
					<div class="title">
						<h2>회원 가입</h2>
						<p>동물권행동 NEW-WAL의 회원 가입을 환영합니다.<br> 유기동물 뿐 아닌 모든 생명이 조화로운 세상을
								위해 쉼없이 노력하겠습니다.</p>
					</div>
					<div class="signup_con">

						<form action="${pageContext.request.contextPath}/signupProc.mem" method="post" id="signupForm">
							<!-- <h3>개인 정보</h3> -->
							<div class="su_persnal_info">
								<dl>
									<dt class="su_ti su_ti_b su_ti_o su_id">NEW-WAL</dt>
									<dt class="su_ti">아이디</dt>
									<dd>
										<input type="text" class="inpform su_s_ip" name="user_id"
											id="signup_user_id" maxlength=16 required
											placeholder="이름을 입력해주세요.">
										<button type="button" id="idCheck"
											class="btn_m btn_light su_btn_detail">중복확인</button>
										<span class="su_pw_ck" id="duplCheckResult">
										</span>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti ">비밀번호</dt>
									<dd>
										<input type="password" class="inpform su_m_ip"
											name="user_password" id="user_password" placeholder="비밀번호"
											maxlength=16 required> <span class="su_pw_sub"><br>
										</span>
									</dd>
									<dd>
										<input type="password" class="inpform su_m_ip" name="pwdCheck"
											id="pwdCheck" placeholder="비밀번호 확인" maxlength=16 required>
										<span class="su_pw_ck" id="pwCheckResult">  </span>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti su_ti_b su_ti_o ">회원정보 입력</dt>
									<dt class="su_ti">이름</dt>
									<dd>
										<input type="text" class="inpform su_s_ip" name="name"
											id="name" maxlength=20 required>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti su_ti_n">이메일주소</dt>
									<dd>
										<input type="text" class="inpform su_s_ip" name="email"
											id="email" placeholder="email ID" maxlength=16>@ <input
											type=text id="email2" class="inpform su_s_ip" name="email2">
										<select id="emailSuffix" class="inpform su_s_ip">
											<option value="gmail.com">gmail.com</option>
											<option value="naver.com">naver.com</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="" selected="selected">직접입력</option>
										</select>
										<button type="button" id="mailAuth"
											class="btn_m btn_light su_btn_detail">인증번호 전송</button>

									</dd>
								</dl>
								<dl>
									<dt class="su_ti su_ti_n">생년월일</dt>
									<dd class="su_birthday_con">

										<div class="su_birthday">
											<select class="inpform  su_s_ip" id="birthday_yy"
												name="birthday_yy" required></select>
										</div>
										<span class="su_birthday su_birthday_text">년</span>
										<div class="inp_slct su_s_ip su_birthday">
											<select id="birthday_mm" name="birthday_mm" required>
												<option value="">선택</option>
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
											<select id="birthday_dd" class="inpform" name="birthday_dd"
												required>
												<option value="">선택</option>
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

									</dd>
								</dl>
								<dl>
									<dt class="su_ti  su_ti_n">연락처</dt>
									<dd>
										<select class="inpform su_sss_ip" name="contact1"
											id="contact1">
											<option value="">선택</option>
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="019">019</option>
										</select> - <input type="text" class="inpform su_sss_ip"
											name="contact2" id="contact2" maxlength=4> - <input
											type="text" name="contact3" id="contact3"
											class="inpform su_sss_ip" maxlength=4>
									</dd>
								</dl>
								<dl>
									<dt class="su_ti su_ti_o  su_ti_b">주소</dt>
									<dd>
										<div class="sp_address">
											<div>
												<h3 class="ad_h3 su_address">우편번호</h3>
												<input type="text" " name="postcode" id="postcode"
													class="inpform su_s_ip su_address" maxlength=5 required>
												<button type="button" id="searchAddr"
													class="btn_m btn_default su_btn_detail">우편번호검색</button>
											</div>
											<div>
												<h3 class="ad_h3 su_address">도로명 주소</h3>
												<input type="text" name="address1" id="address1"
													class="inpform su_address su_l_ip" " placeholder="도로명/지번"
													maxlength=100 required>
											</div>
											<div>
												<h3 class="ad_h3 su_address">상세 주소</h3>
												<input type="text" name="address2" id="address2"
													class="inpform su_address su_l_ip" maxlength=100 required>
											</div>
										</div>
									</dd>
								</dl>


							</div>

							<div class="btn_wrap">
								<!-- <input type="hidden" name="" value=""> <input
									type="hidden" name="" value=""> -->
								<button id="join" class="btn_m btn_primary su_btn_detail_big">회원가입하기</button>
							</div>
						</form>
					</div>
					<!-- 끝 -->
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<script>
	$(function() {
		document.getElementById("searchAddr").onclick = function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    let roadAddr = data.roadAddress; // 도로명 주소 변수
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address1").value = roadAddr;
                }
            }).open();
        }
		let now = new Date();
		let year = now.getFullYear();
		for (let i = year; i >= 1900; i--) {
			$('#birthday_yy').append('<option value="' + i + '">' + i + '</option>');
		}

		let emailFlag = false;
		let idFlag = false;
		$("#signup_user_id").on("input", function() {
			idFlag = false;
		})
		
		$("#emailSuffix").on("change",function(){
			$("#email2").val($(this).val());
		})
		
		$("#mailAuth").on("click",function(){
			let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			let email = $("#email").val() + "@" + $("#email2").val();

			if (!emailReg.test(email)) {
				alert("이메일 형식을 다시 확인해주세요.");
				return false;
			}
			$("#mailAuth").attr("disabled","disabled");
			$('#loadingModal').modal('show');
			$("#loadingModal").modal({backdrop: 'static', keyboard: false});
			
			$.ajax({
				url:"${pageContext.request.contextPath}/mailAuthReq.mem",
				data:{email:email}
			}).done(function(resp){
				
				alert("입력한 이메일로 인증번호를 발송했습니다.\n메일을 확인 후 입력해주세요.");
				$("#loadingModal").modal("hide");
				$('body').removeClass('modal-open');
				$('.modal-backdrop').remove();
				
				let authDiv = $("<div>");
				authDiv.attr("style","display:block;");
				
				let authInput = $("<input>");
				authInput.attr("id","inputAuth");
				authInput.attr("type","text");
				authInput.addClass("inpform su_s_ip");
				authInput.attr("placeholder","Authentication Code");
				
				let authBtn = $("<button>");
				authBtn.attr("type","button");
				authBtn.addClass("btn_m btn_light su_btn_detail");
				authBtn.text("인증");
				authBtn.on("click",function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/mailAuthProc.mem",
						data:{code:$("#inputAuth").val()}
					}).done(function(resp){
						if(resp == "authorized"){
							alert("인증되었습니다.");
							$("#email").attr("readonly","readonly");
							$("#email2").attr("readonly","readonly");
							$("#emailSuffix").attr("disabled","disabled");
							emailFlag = true;
							clearInterval(timerId);
							authTimer.remove();
							authBtn.remove();
							authInput.remove();
							$("#mailAuth").remove();
							
							let success = $("<i class='far fa-check-circle fa-2x' style='margin-left:10px;'></i>");
							$("#emailSuffix").after(success);
							
						}else if(resp == "incorrect"){
							alert("잘못된 인증번호 입니다.")
						}else{
							alert("인증번호가 만료되었습니다. 다시 요청하세요.");
							$("#mailAuth").removeAttr("disabled");
						}
					})
				})
				
				let authTimer = $("<span>");
				authTimer.attr("id","timer");
				authTimer.addClass("su_s_ip");
				
				authDiv.append(authInput);
				authDiv.append(authBtn);
				authDiv.append(authTimer);
				$("#mailAuth").after(authDiv);
		
				let distance = 299000;
				let timerId = setInterval(function(){
					let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
					let seconds = Math.floor((distance % (1000 * 60)) / 1000);
					$("#timer").text(minutes + ":"+seconds);
					distance-=1000;
				}, 1000);
			});
		})
		

		$("#signupForm").on("submit",function() {
			let idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
			let user_id = $("#signup_user_id").val();
			if (!idReg.test(user_id)) {
				alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
				return false;
			}
			
			let pwReg = /^[A-Za-z0-9#?!@$%^&*-]{8,}$/;
			let pw = $("#user_password").val();
			let repw = $("#pwdCheck").val();
			
			if(pw != repw){
				alert("패스워드 입력이 일치하지 않습니다.");
				return false;
			}
			
			if (!pwReg.test(pw)) {
				alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
				return false;
			}
			
				

			let emailReg = /^[0-9a-zA-Z_-]*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			let email = $("#email").val() + "@" + $("#email2").val();

			if (!emailReg.test(email)) {
				alert("이메일 형식을 다시 확인해주세요.");
				return false;
			}

			let nameReg = /^[가-힣]{2,4}$/;
			let name = $("#name").val();
			if (!nameReg.test(name)) {
				alert("이름은 한글 2 글자 이상 4글자 미만으로 입력해야 합니다.");
				return false;
			}

			let phoneReg = /^\d{3}\d{3,4}\d{4}$/;
			let phone = $("#contact1 option:selected")
					.val()
					+ $("#contact2").val()
					+ $("#contact3").val();

			if (!phoneReg.test(phone)) {
				alert("핸드폰 번호를 다시 확인해주세요.");
				return false;
			}

			if ($("#birthday_yy option:selected").val() == "년"
					|| $("#birthday_mm option:selected")
							.val() == "월"
					|| $("#birthday_dd option:selected")
							.val() == "일") {
				alert("생년월일을 선택하세요.")
				return false;
			}

			if (!idFlag) {
				alert("ID 중복체크를 진행하세요.")
				return false;
			}
			if(!emailFlag){
				alert("Email 인증을 진행하세요.")
				return false;
			}
			
		})
		

		$("#idCheck").on("click", function() {
			if ($("#signup_user_id").val() == "") {
				alert("ID를 입력하세요.")
				return;
			}

			$.ajax({
				url : "${pageContext.request.contextPath}/idDuplCheck.mem",
				data : {
					user_id : $("#signup_user_id").val()
				}
			}).done(function(resp) {
				if (resp == "true") {
					$("#duplCheckResult").css("color", "dodgerblue");
					$("#duplCheckResult").text("사용 가능한 ID 입니다.");
					idFlag = true;
				} else {
					$("#duplCheckResult").css("color", "crimson");
					$("#duplCheckResult").text("이미 사용중인 ID 입니다.");
				}

			})
		})
	})
	
</script>
</body>
</html>

