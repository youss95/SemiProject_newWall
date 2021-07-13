<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
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
</style>
</head>
<body>
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
												id="" maxlength=16 required
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
												id="" placeholder="email ID" maxlength=16>&nbsp&nbsp@&nbsp&nbsp
											<select name="email2" id="emailSuffix"
												class="inpform su_s_ip">
												<option value="@gmail.com">gmail.com</option>
												<option value="@naver.com">naver.com</option>
												<option value="@daum.net">daum.net</option>
												<option value="@nate.com">nate.com</option>
												<option value="">직접입력</option>
											</select>
											<!-- <button type="button" id="check" class="btn_m btn_light su_btn_detail">이메일 인증</button> -->
										</dd>
									</dl>
									<dl>
										<dd class="btn_id_find">
											<button type="button" id="check"
												class="btn_m btn_light su_btn_detail">일치하는 회원정보 찾기</button>
										</dd>
									</dl>
								</div>
								<div class="mem_id_success">
									<!-- 이거는 히든했다가 일치시 등장 없으면 얼럿 ?? -->
									<h3 class="su_ti su_ti_b su_ti_o su_id">&nbsp&nbsp회원정보와
										일치하는 아이디</h3>
									<dl class="id_find_m_con">
										<dt class="su_ti">아이디</dt>
										<dd>
											<input type="text" class="inpform su_s_ip su_s_ip_dis"
												value="disabled" disabled>
										</dd>
									</dl>
								</div>

								<div>
									<h3 class="su_ti su_ti_b su_ti_o su_id">&nbsp&nbsp비밀번호 찾기</h3>
									<dl class="id_find_m_con">
										<dt class="su_ti">아이디</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" name="user_id"
												id="signup_user_id" maxlength=16 required
												placeholder="아이디를 입력해주세요.">
											<!-- <button type="button" id="idCheck" class="btn_m btn_light su_btn_detail">중복확인</button>
										<span class="su_pw_ck" id="duplCheckResult"
											>일치여부 확인 메세지 </span> -->
										</dd>
									</dl>
								</div>
								<div>
									<dl class="id_find_m_con">
										<dt class="su_ti">이름</dt>
										<dd>
											<input type="text" class="inpform su_s_ip" name=""
												id="" maxlength=16 required
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
												id="" placeholder="email ID" maxlength=16>&nbsp&nbsp@&nbsp&nbsp
											<select name="email2" id="emailSuffix"
												class="inpform su_s_ip">
												<option value="@gmail.com">gmail.com</option>
												<option value="@naver.com">naver.com</option>
												<option value="@daum.net">daum.net</option>
												<option value="@nate.com">nate.com</option>
												<option value="">직접입력</option>
											</select>
											<!-- <button type="button" id="check" class="btn_m btn_light su_btn_detail">이메일 인증</button> -->
										</dd>
									</dl>
									<dl>
										<dd class="btn_id_find">
											<button type="button" id="check"
												class="btn_m btn_light su_btn_detail">일치하는 회원정보 칮기</button>
										</dd>
									</dl>
								</div>
								<div class="mem_pw_success">
									<!-- 이거는 히든했다가 일치시 등장 없으면 얼럿 ?? -->
									<h3 class="su_ti su_ti_b su_ti_o su_id">&nbsp&nbsp비밀번호
										변경하기</h3>
									<dl class="id_find_m_con">
										<dt class="su_ti ">비밀번호</dt>
										<dd>
											<input type="password" class="inpform su_m_ip"
												name="user_password" id="user_password" placeholder="비밀번호"
												maxlength=16 required> <span class="su_npw_sub"><br>영문대문자,
												영문소문자, 숫자 포함하여 8-12 글자 ***이거는우리정규식에맞게<br> </span>
										</dd>
									</dl>
									<dl class="id_find_m_con">
										<dt class="su_ti ">비밀번호 확인</dt>
										<dd>
											<input type="password" class="inpform su_m_ip"
												name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인"
												maxlength=16 required> <span class="su_pw_ck">
												일치여부 확인 메세지 </span>
										</dd>
									</dl>
									<dl>
										<dd class="pw_change_btn_con">
											<button type="button" id=""
												class="btn_m btn_light btn_pw_change">새로운 비밀번호로
												변경하기</button>
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
	<script>
		
	</script>
</body>
</html>

