<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<style>
.spadmin .detail {
	display: none;
}

/* 이거 섹션밖이라 아이디잡긴했는데 아중에 확인해보기** */
#sponsorModal .sp_category{
text-align: left;
}
#sponsorModal .sp_th_title{
text-align: left;
font-weight: 400; 
}
</style>

<body>
	<div class="wrap">
		<nav>
			<div class="lnb">
				<h1>
					<a href="#">LOGO</a>
				</h1>
				<ul class="slide_menu">
					<li class="depth1"><a href="#">회원관리<i
							class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">회원 명단 보기</a></li>
							<li class="depth2"><a href="#">회원관리</a></li>
						</ul></li>
					<li class="depth1"><a href="#">게시판 관리<i
							class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">회원작성 글</a></li>
							<li class="depth2"><a href="#">뉴스</a></li>
							<li class="depth2"><a href="#">공지사항</a></li>
						</ul></li>
					<li class="depth1"><a href="#">입양<i
							class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">입양 신청 리스트</a></li>
							<li class="depth2"><a href="#">입양 신청 상태 관리</a></li>
						</ul></li>
					<li class="depth1"><a href="#">후원<i
							class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a
								href="${pageContext.request.contextPath}/adSponsorList.adm">후원금
									관리</a></li>
						</ul></li>
					<li class="depth1"><a href="#">동물 정보<i
							class="fas fa-chevron-right"></i></a>
						<ul>
							<li class="depth2"><a href="#">동물 정보 관리</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded spadmin">
					<div class="title_area">
						<h2>후원 내역 리스트</h2>
					</div>
					<div class="contents">
					<div class="inp_slct">
										<select name="sp_qqqqq" id="sp_qqqqq">
											<option value="">전체</option>
											<option value="company_">업체 후원</option>
											<option value="aa">일대일 후원</option>
											<option value="bb">임보자 후원</option>
										</select>
									</div>
						<table class="table table-hover text-center adoption_list">
							<thead>
								<tr>
									<th>순서</th>
									<th>후원금액</th>
									<th>후원분야</th>
									<th class="detail">14세미만여부</th>
									<th>이름</th>
									<th>연락처</th>
									<th class="detail">생년월일</th>
									<th>청소년 후원자 이름</th>
									<th class="detail">청소년 후원자 생년월일</th>
									<th class="detail">이메일</th>
									<th class="detail">우편번호</th>
									<th class="detail">도로명 주소</th>
									<th class="detail">상세주소</th>
									<th class="detail">결제승인번호</th>
									<th class="detail">약관1동의 여부</th>
									<th class="detail">약관2동의 여부</th>
									<th>회원 시 ID</th>
									<th>후원 일자</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="si" items="${slist}">
									<tr class="open_modal">
										<td class="sp_seq">${si.sponsor_seq}</td>
										<td class="sp_amount">${si.sponsor_amount}</td>
										<td  class="sp_choice">${si.sponsor_choice}</td>
										<td class="detail sp_agecheck">${si.sponsor_agecheck}</td>
										<td class="sp_name">${si.sponsor_name}</td>
										<td class="sp_contact">${si.sponsor_contact}</td>
										<td class="detail sp_birth">${si.sponsor_birth}</td>
										<td class="sp_yname">${si.sponsor_yname}</td>
										<td class="detail sp_ybirth">${si.sponsor_ybirth}</td>
										<td class="detail sp_email">${si.sponsor_email}</td>
										<td class="detail sp_postcode">${si.sponsor_postcode}</td>
										<td class="detail sp_address1">${si.sponsor_address1}</td>
										<td class="detail sp_address2">${si.sponsor_address2}</td>
										<td class="detail sp_apply_num">${si.sponsor_apply_num}</td>
										<td class="detail sp_terms01">${si.sponsor_terms01}</td>
										<td class="detail sp_terms02">${si.sponsor_terms02}</td>
										<td class="sp_mb_id">${si.sponsor_mb_id}</td>
										<td class="sp_date">${si.sponsor_date}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>

			</div>
		</div>
	</div>

	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">Launch demo modal</button>
 -->
	<!-- Modal -->
	<div class="modal fade" id="sponsorModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">후원 정보 상세 보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table class="table table-hover text-center adoption_list">
						<tr>
							<th>분류</th>
							<th>내용</th>
						</tr>

						<tr>
							<td class="sp_category sp_th_title">순서</td>
							<td class="sp_category" id="msp_seq"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">후원 금액</td>
							<td class="sp_category" id="msp_amount"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">후원 분야</td>
							<td class="sp_category" id="msp_choice"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">14세 미만 여부</td>
							<td class="sp_category" id="msp_agecheck"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">이름 (본인 혹은 보호자)</td>
							<td class="sp_category" id="msp_name"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">연락처 (본인 혹은 보호자)</td>
							<td class="sp_category" id="msp_contact"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">생년월일 (본인 혹은 보호자)</td>
							<td class="sp_category" id="msp_birth"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">청소년 후원자 이름</td>
							<td class="sp_category" id="msp_yname"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">청소년 후원자 생일</td>
							<td class="sp_category" id="msp_ybirth sp_category"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">이메일</td>
							<td class="sp_category" id="msp_email"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">우편번호</td>
							<td class="sp_category" id="msp_postcode"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">도로명주소</td>
							<td class="sp_category" id="msp_address1"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">상세주소</td>
							<td class="sp_category" id="msp_address2"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">결제 승인 번호</td>
							<td class="sp_category" id="msp_apply_num"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">약관1 동의 여부</td>
							<td class="sp_category" id="msp_terms01"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">약관2 동의 여부</td>
							<td class="sp_category" id="msp_terms02"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">회원 인 경우 ID</td>
							<td class="sp_category" id="msp_mb_id"></td>
						</tr>
						<tr>
							<td class="sp_category sp_th_title">후원 일자</td>
							<td class="sp_category" id="msp_date"></td>
						</tr>
					</table>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary sp_com_btn" 
						data-dismiss="modal">확인 완료</button>
				</div> -->
			</div>
		</div>
	</div>



	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script>
		
	</script>
	<script>
		$(function() {
			$(".open_modal").on('click', function() {
				//alert();
				$("#sponsorModal").modal("show");
				
				$("#msp_seq").html($(this).find(".sp_seq").html());
				$("#msp_amount").html($(this).find(".sp_amount").html());
				$("#msp_choice").html($(this).find(".sp_choice").html());
				$("#msp_agecheck").html($(this).find(".sp_agecheck").html());
				$("#msp_name").html($(this).find(".sp_name").html());
				$("#msp_contact").html($(this).find(".sp_contact").html());
				$("#msp_birth").html($(this).find(".sp_birth").html());
				$("#msp_yname").html($(this).find(".sp_yname").html());
				$("#msp_ybirth").html($(this).find(".sp_ybirth").html());
				$("#msp_email").html($(this).find(".sp_email").html());
				$("#msp_postcode").html($(this).find(".sp_postcode").html());
				$("#msp_address1").html($(this).find(".sp_address1").html());
				$("#msp_address2").html($(this).find(".sp_adderss2").html());
				$("#msp_apply_num").html($(this).find(".sp_apply_num").html());
				$("#msp_terms01").html($(this).find(".sp_terms01").html());
				$("#msp_terms02").html($(this).find(".sp_terms02").html());
				$("#msp_mb_id").html($(this).find(".sp_mb_id").html());
				$("#msp_date").html($(this).find(".sp_date").html());
			})
		})
		
	</script>
</body>

</html>