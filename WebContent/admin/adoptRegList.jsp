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

<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded adoption_list">
					<div class="title_area">
						<h2>입양 신청 리스트</h2>
					</div>
					<div class="contents">
						<div class="search_box">
							<form action="${pageContext.request.contextPath}/adoptRegList.adm" method="post">
								<div class="inp_slct">
									<select name="ad_status" id="ad_status">
										<option value="">전체</option>
										<option value="신청중">입양 신청중</option>
										<option value="심사중">입양 심사중</option>
										<option value="완료">입양 완료</option>
									</select>
								</div>
								<input type="hidden" value="1" name="cpage">
								<button class="btn_m btn_white" id="sp_search_btn">검색</button>
							</form>
						</div>
						<table class="table table-hover text-center">
							<colgroup>
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>신청번호</th>
									<th>신청코드(동물코드)</th>
									<th>신청자</th>
									<th>신청상태</th>
									<th>신청일자</th>
									<th>정보</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list}">
									<tr>
										<td class="ad_seq">${i.adopt_seq}</td>
										<td>${i.code_seq}</td>
										<td>${i.p_name}</td>
										<td class="ad_sts">${i.ad_status}</td>
										<td>${i.reg_date}</td>
										<td>
											<button type="button" class="btn_s btn_primary btn_view" data-bs-toggle="modal" data-bs-target="#regInfoModal">보기</button>
											<input type="hidden" class="adopt_seq" value="${i.adopt_seq}" >
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="page_nav">
							<c:forEach var="i" items="${navi}" varStatus="s">
								<c:choose>
									<c:when test="${i == '>'}">
										<a
											href="${pageContext.request.contextPath}/adoptRegList.adm?cpage=${navi[s.index-1]+1}&ad_status=${ad_status}">${i}</a>
									</c:when>
									<c:when test="${i == '<'}">
										<a
											href="${pageContext.request.contextPath}/adoptRegList.adm?cpage=${navi[s.index+1]-1}&ad_status=${ad_status}">${i}</a>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/adoptRegList.adm?cpage=${i}&ad_status=${ad_status}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div> 
					</div>
				</section>

			</div>
		</div>
	</div>
<!--  	<div class="modal fade show" id="regInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="display:block;">  -->
 	<div class="modal fade" id="regInfoModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">입양 신청 작성 내역</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h2>신청자 정보</h2>
					<div class="info_tbl">
						<dl>
							<dt>1. 성명</dt>
							<dd class="pname"></dd>
						</dl>
						<dl>
							<dt>2. 연락처</dt>
							<dd class="phone01"></dd>
						</dl>
						<dl>
							<dt>3. 대체 연락처</dt>
							<dd class="phone02"></dd>
						</dl>
						<dl>
							<dt>4. 이메일주소</dt>
							<dd class="email"></dd>
						</dl>
						<dl>
							<dt>5. 성별</dt>
							<dd class="gender"></dd>
						</dl>
						<dl>
							<dt>6. 나이</dt>
							<dd class="age"></dd>
						</dl>
						<dl>
							<dt>7. 집주소</dt>
							<dd class="address"></dd>
						</dl>
						<dl>
							<dt>8. 결혼 여부</dt>
							<dd class="mstatus"></dd>
						</dl>
						<dl>
							<dt>9. 개인정보 제공 동의</dt>
							<dd class="parg"></dd>
						</dl>
					</div>
					<br>
					<h2>입양질문</h2>
					<div class="answer_tbl">
						<dl>
							<dt>1. 입양을 희망하는 아이를 적어주세요.</dt>
							<dd class="qa_01"></dd>
						</dl>
						<dl>
							<dt>2. 입양하기를 희망하는 아이가 없을 경우 앞으로 입양하고자 하는 아이에 대하여 간단히 설명하여 주시기 바랍니다.</dt>
							<dd class="qa_02"></dd>
						</dl>
						<dl>
							<dt>3. 입양을 결정하시기 까지 얼마나 오랜 시간을 고민하셨나요?</dt>
							<dd class="qa_03"></dd>
						</dl>
						<dl>
							<dt>4. 입양을 원하시는 가장 큰 이유는 무엇인가요?</dt>
							<dd class="qa_04"></dd>
						</dl>
						<dl>
							<dt>5. 가족 구성원은 몇 명인가요? 구성원을 소개해주세요.</dt>
							<dd class="qa_05"></dd>
						</dl>
						<dl>
							<dt>6. 입양결정에 가족 모두 동의하십니까?</dt>
							<dd class="qa_06"></dd>
						</dl>
						<dl>
							<dt>7. 키우고 계신 반려동물이 있나요? 있다면 소개해주세요.</dt>
							<dd class="qa_07"></dd>
						</dl>
						<dl>
							<dt>8. 키우던 반려동물을 개인 사정으로 포기한 경험이 있으신가요? 이유는 무었인가요?</dt>
							<dd class="qa_08"></dd>
						</dl>
						<dl>
							<dt>9. 주거의 형태는?</dt>
							<dd class="qa_09"></dd>
						</dl>
						<dl>
							<dt>10. 임대한 주택의 경우 집주인의 동의를 얻으셨나요?</dt>
							<dd class="qa_10"></dd>
						</dl>
						<dl>
							<dt>11. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게 하실건가요?</dt>
							<dd class="qa_11"></dd>
						</dl>
						<dl>
							<dt>12. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하십니까?</dt>
							<dd class="qa_12"></dd>
						</dl>
						<dl>
							<dt>13. 입양 시에, 유기동물의 구조와 치료, 보호비로 사용되는 일정금액의 맞음비 7만원을 납부해주셔야 합니다. (임시보호의 경우 제외) 동의하십니까?</dt>
							<dd class="qa_13"></dd>
						</dl>
						<dl>
							<dt>14. 입양하신 동물은 카라의 중성화수술 시행 방침에 따라, 반드시 중성화 수술을 해주셔야 합니다. 이에 동의하십니까?</dt>
							<dd class="qa_14"></dd>
						</dl>
						<dl>
							<dt>15. 입양 후 모니터링을 위한 전화연락이나 방문에 동의하십니까?</dt>
							<dd class="qa_15"></dd>
						</dl>
						<dl>
							<dt>16. 입양동의</dt>
							<dd class="qa_16"></dd>
						</dl>
					</div>
				</div>
				<input type="hidden" name="status_change" id="status_change">
				<div class="modal-footer">
					<div class="inp_slct">
						<select name="p_ad_status" id="p_ad_status">
							<option value="">전체</option>
							<option value="신청중">신청중</option>
							<option value="심사중">심사중</option>
							<option value="완료">완료</option>
						</select>
					</div>
					<input type="hidden" name="p_seq" id="p_seq">
					<button type="button" class="btn_m btn-dark" data-bs-dismiss="modal">닫기</button>
					<a href="${pageContext.request.contextPath}/adoptRegList.adm?cpage=1" class="btn_m btn_default btn_status">상태 변경</a>
<!-- 					<button type="button" class="btn_m btn_default btn_status" data-bs-dismiss="modal">상태 변경</button> -->
				</div>
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
		$(function(){
			
			$(".btn_view").on('click', function(){
				console.log($(this).siblings(".adopt_seq").val());
				$.ajax({
					url: "${pageContext.request.contextPath}/adoptRegInfo.adm",
					type: "get",
					dataType: "json",
					data : {
						"adopt_seq" : $(this).siblings(".adopt_seq").val()
					}
				}).done(function(resp){
					$(".pname").text(resp.p_name);
					$(".phone01").text(resp.p_phone01);
					$(".phone02").text(resp.p_phone02);
					$(".email").text(resp.p_email);
					$(".gender").text(resp.p_gender);
					$(".age").text(resp.p_age);
					$(".address").text(resp.p_address);
					$(".mstatus").text(resp.p_mstatus);
					$(".parg").text(resp.p_arg);
					$(".qa_01").text(resp.q01_aname);
					$(".qa_02").text(resp.q02_alternative);
					$(".qa_03").text(resp.q03_time_to_worry);
					$(".qa_04").text(resp.q04_reason);
					$(".qa_05").text(resp.q05_family_member);
					$(".qa_06").text(resp.q06_family_arg);
					$(".qa_07").text(resp.q07_pet);
					$(".qa_08").text(resp.q08_experience);
					$(".qa_09").text(resp.q09_housing_type);
					$(".qa_10").text(resp.q10_host_consent);
					$(".qa_11").text(resp.q11_impossible_situation);
					$(".qa_12").text(resp.q12_lodging_problem);
					$(".qa_13").text(resp.q13_payment_arg);
					$(".qa_14").text(resp.q14_neutered_arg);
					$(".qa_15").text(resp.q15_visit_agr);
					$(".qa_16").text(resp.q16_adopt_arg);
					$(".qa_16").text(resp.ad_status);
					
					$('#p_ad_status option[value=' + resp.ad_status + ']').prop('selected','selected').change();
					$('#p_seq').val(resp.adopt_seq);
					
				})
			})
			
			$(".btn_status").on('click', function(){
				
				let result = confirm("정말 수정 하시겠습니까?");
				
				if (result) {
					$.ajax({
						url: "${pageContext.request.contextPath}/adoptionUpdate.adm",
						type: "get",
						dataType: "json",
						data : {
							"p_ad_status" : $("#p_ad_status").val(),
							"p_seq" : $("#p_seq").val(),
						}
					}).done(function(resp){
	//					console.log(resp[1]);
					})
				}
				
			
			})
			
		})
	</script>
</body>

</html>