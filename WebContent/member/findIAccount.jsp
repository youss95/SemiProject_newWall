<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<style>
* {
	box-sizing: border-box;
}

#mem_idpw_con .su_banner img {
	opacity: 0.9;
}

#mem_idpw_con .id_find_m_con {
	overflow: hidden;
}

#mem_idpw_con .id_find_m_con dd {
	float: left;
}

#mem_idpw_con .id_find_m_con dt {
	float: left;
	width: 200px;
	line-height: 50px;
}

#mem_idpw_con .btn_id_find {
	text-align: center;
}

#mem_idpw_con .pw_change_btn_con {
	text-align: center;
}

#mem_idpw_con .su_persnal_info .su_btn_detail {
	margin-left: 10px;
	height: 50px;
	width: 250px;
	background-color: #FCDADA;
	color: #3D7EA6;
	border: 1px solid #FFF0F0;
	font-size: 17px;
	font-weight: 600;
}

#mem_idpw_con .su_persnal_info .btn_pw_change {
	margin-left: 10px;
	height: 40px;
	width: 260px;
	background-color: #FCDADA;
	color: #3D7EA6;
	border: 1px solid #FFF0F0;
	font-size: 15px;
	font-weight: 600;
}

#mem_idpw_con .su_persnal_info .mem_id_success {
	/* display: none; */
	
}

#mem_idpw_con .su_persnal_info .mem_pw_success {
	/* display: none; */
	
}

#mem_idpw_con .su_persnal_info .su_npw_sub {
	line-height: 40px;
}

#mem_idpw_con .su_title h2 {
	font-size: 36px;
	font-weight: 600;
	margin-bottom: 15px;
}

#mem_idpw_con .su_title h2::after {
	display: block;
	width: 100%;
	height: 8px;
	background-color: #FFA5A5;
	/* 안되네 나중에 다시 */
}

#mem_idpw_con .su_title {
	text-align: center;
	margin-top: 20px;
	padding-bottom: 10px;
	/* border-bottom: #FFF0F0 solid 2px; */
}

#mem_idpw_con .su_persnal_info input {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#mem_idpw_con .su_persnal_info select {
	border: 1px solid #FCDADA;
	color: #5C969E;
}

#mem_idpw_con .su_persnal_info dl {
	margin: 40px;
	/* width: 500px; */
}

#mem_idpw_con .su_persnal_info .su_ti {
	/*  margin: 10px;
            width: 500px; */
	font-size: 17px;
	font-weight: 600;
	margin-bottom: 10px;
	padding-bottom: 10px;
	/*  border-bottom: 2px solid #FFA5A5;   */
}

#mem_idpw_con .su_persnal_info .su_ti_o {
	/*  margin: 10px;
            width: 500px; */
	font-size: 20px;
	font-weight: 600;
	margin-bottom: 30px;
	padding-bottom: 10px;
	border-bottom: 2px solid #FFA5A5;
}

#mem_idpw_con .su_persnal_info .su_s_ip {
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
}

#mem_idpw_con .su_persnal_info .su_s_ip_dis {
	width: 200px;
	margin-bottom: 10px;
	margin-top: 10px;
	background: #FFF0F0;
	text-align: center;
}

#mem_idpw_con .btn_wrap .su_btn_detail_big {
	margin-left: 10px;
	width: 250px;
	height: 60px;
	/* background-color: #FCDADA;
            color: #3D7EA6;
            border: 1px solid #FCDADA; */
	font-size: 20px;
	font-weight: 600;
}

#mem_idpw_con .btn_wrap {
	text-align: center;
}

#mem_idpw_con .su_persnal_info .su_m_ip {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
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
	<jsp:include page="/layout/jsp/modal.jsp"/>

	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section id="mem_idpw_con">
					<!-- 하이 여기는 서브입니다 -->
					<div class="signup_con">
						<div class="su_banner">
							<!-- <img src="../resources/images/id_pw_1100_400.jpg" alt=""> -->
						</div>
						<div class="su_title">
							<h2>아이디 / 비밀번호 찾기</h2>
							<!-- <p>
								동물권행동 NEW-WAL의 회원 가입을 환영합니다.<br> 유기동물 뿐 아닌 모든 생명이 조화로운 세상을
								위해 쉼없이 노력하겠습니다.
							</p> -->
						</div>

						<form action="" method="post" id="">
							<!-- <h3>개인 정보</h3> -->
							<div class="su_persnal_info">
								<div>
									<h3 class="su_ti su_ti_b su_ti_o su_id">&nbsp&nbsp아이디 찾기</h3>
									<dl class="id_find_m_con">
										<dt class="su_ti">이름</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" name=""
												id="nameForID" maxlength=16 required
												placeholder="이름을 입력해주세요.">
											<!-- <button type="button" id="idCheck" class="btn_m btn_light su_btn_detail">중복확인</button>
										<span class="su_pw_ck" id="duplCheckResult"
											>일치여부 확인 메세지 </span> -->
										</dd>
									</dl>
								</div>
								<div>
									<dl class="id_find_m_con">
										<dt class="su_ti su_ti_n">이메일주소</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" name=""
												id="emailForID" placeholder="가입 시 사용한 Email" maxlength=50>
											<!-- <button type="button" id="check" class="btn_m btn_light su_btn_detail">이메일 인증</button> -->
										</dd>
									</dl>
									<dl class="id_find_m_con" id="divIdResultBox"
										style="display: none;">
										<dt class="su_ti su_ti_n">확인 결과</dt>
										<dd>
											<div id="divFindIDResult"
												style="color: dodgerblue; line-height: 60px;"></div>
										</dd>
									</dl>
									<dl>
										<dd class="btn_id_find">
											<button type="button" id="btnFindID"
												class="btn_m btn_light su_btn_detail">일치하는 회원정보 찾기</button>
										</dd>
									</dl>
								</div>

								<div>
									<h3 class="su_ti su_ti_b su_ti_o su_id">&nbsp&nbsp비밀번호 찾기</h3>
									<dl class="id_find_m_con">
										<dt class="su_ti">아이디</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" id="idForPW"
												maxlength=16 placeholder="아이디를 입력해주세요.">
											<!-- <button type="button" id="idCheck" class="btn_m btn_light su_btn_detail">중복확인</button>
										<span class="su_pw_ck" id="duplCheckResult"
											>일치여부 확인 메세지 </span> -->
										</dd>
									</dl>
								</div>
								<div>
									<dl class="id_find_m_con">
										<dt class="su_ti su_ti_n">이메일주소</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" id="emailForPW"
												placeholder="가입 시 사용한 Email" maxlength=50>
										</dd>
									</dl>
									<dl>
										<dd class="btn_id_find">
											<button type="button" id="btnFindPW"
												class="btn_m btn_light su_btn_detail">패스워드 찾기</button>
										</dd>
									</dl>
								</div>
							</div>
						</form>
					</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
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
	

	<script>
	
		$(function(){
			$("#btnFindID").on("click",function() {
				let name = $("#nameForID").val();
				let email = $("#emailForID").val();

				if (name == "" || email == "") {
					alert("이름 또는 이메일 주소를 확인하세요.")
					return false;
				}

				$.ajax({
					url : "${pageContext.request.contextPath}/findID.mem",
					data : {
						name : name,
						email : email
					}
				}).done(function(resp) {
					$("#divIdResultBox").css("display", "block");
					if (resp != "none") {
						$("#divFindIDResult").text(
								"사용자님의 ID는 \"" + resp + "\" 입니다.")
					} else {
						$("#divFindIDResult").text(
								"일치하는 회원 정보가 없습니다.");
					}
				})
			})

			$("#btnFindPW").on("click", function() {
				let id = $("#idForPW").val();
				let email = $("#emailForPW").val();

				if (id == "" || email == "") {
					alert("ID 또는 이메일 주소를 확인하세요.")
					return false;
				}
				$('#loadingModal').modal('show');
				$("#loadingModal").modal({backdrop: 'static', keyboard: false});
				
				$.ajax({
					url:"${pageContext.request.contextPath}/findPW.mem",
					data:{id:id,email:email}
				}).done(function(resp){
					$("#loadingModal").modal("hide");
					$('body').removeClass('modal-open');
					$('.modal-backdrop').remove();
					if(resp=="confirm"){
						alert("이메일 주소로 임시 패스워드가 전송되었습니다.\n로그인 후 꼭 패스워드를 변경해주세요.");
					}else{
						alert("아이디 또는 이메일주소가 일치하지 않습니다.");
					}
					
				}).always(function(){
					
				})

			})
		})
		
	</script>
</body>
</html>

