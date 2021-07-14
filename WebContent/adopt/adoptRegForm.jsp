<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<jsp:include page="../layout/jsp/commonModal.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adopt/adoption.css">
</head>
<body>
<div class="wrap">
<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
	<div class="container">
		<div class="contents">
			<section class="adoptRegForm">
				<div class="banner" style="background: url(${pageContext.request.contextPath}/resources/images/bannerImg.png) 50% 50% no-repeat;background-size: cover;"></div>
				<div class="title">
					<h2>입양 신청</h2>
					<p>평생 책임질 준비 되셨나요?<br>상처받은 아이들에게 입양은 <em>마지막 기회</em>이자 <em>유일한 희망</em>입니다.</p>
				</div>
				<div class="notice">
					<p>다음의 경우에는 입양이 어렵습니다.</p>
					<ul>
						<li>가정으로 입양이 아닌 경우 (ex)공장, 회사, 군부대, 농장, 식당 등)</li>
						<li>5마리 이상의 동물을 한꺼번에 키우고 있는 경우.(상담후 입양이 가능 할 수 있습니다.)</li>
						<li>미취학 아동의 자녀가 3명 이상이거나 5세 이하의 아이가 2명 이상인 경우.</li>
						<li>가족 구성원 전체의 동의를 얻지 않은 경우나 미성년자의 입양신청</li>
						<li>외국으로 입양을 원하거나 한국에 거주하는 외국인.(상담후 입양이 가능 할 수 있습니다.)</li>
						<li>가족구성원 중 동물에 대한 알레르기나 우울증 등의 질환으로 치료를 받고있는 경우.(상담후 입양이 가능 할 수 있습니다.)</li>
						<li>70세 이상 혼자 거주하고 있는 경우</li>
					</ul>
				</div>
				<form action="${pageContext.request.contextPath}/adoptReg.apt" method="post" id="adoptReg">
					<h3>개인 정보</h3>
					<div class="persnal_info">
						<dl>
							<dt>1. 성명</dt>
							<dd><input type="text" class="inpform" name="p_name" id="p_name" placeholder="이름을 입력해주세요."></dd>
						</dl>
						<dl>
							<dt>2. 연락처</dt>
							<dd><input type="text" class="inpform" name="p_phone01" id="p_phone01" placeholder="연락처를 입력해주세요. (ex 01012345678)"></dd>
						</dl>
						<dl>
							<dt>3. 대체 연락처</dt>
							<dd><input type="text" class="inpform" name="p_phone02" id="p_phone02" placeholder="대체 연락처를 입력해주세요. (ex 01012345678)">
							</dd>
						</dl>
						<dl>
							<dt>4. 이메일주소</dt>
							<dd><input type="text" class="inpform" name="p_email" id="p_email" placeholder="이메일주소를 입력해주세요. (ex example@naver.com)"></dd>
						</dl>
						<dl>
							<dt>5. 성별</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="female" name="p_gender" value="여">
										<label for="female">여</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="male" name="p_gender" value="남">
										<label for="male">남</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>6. 나이</dt>
							<dd><input type="text" class="inpform" name="p_age" id="p_age" placeholder="나이를 입력해주세요. (숫자만 입력해주세요.)"></dd>
						</dl>
						<dl>
							<dt>7. 집주소</dt>
							<dd><input type="text" class="inpform" name="p_address" id="p_address" placeholder="집주소를 입력해주세요."></dd>
						</dl>
						<dl>
							<dt>8. 결혼 여부</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="p_mstatus01" name="p_mstatus" value="미혼">
										<label for="p_mstatus01">미혼</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="p_mstatus02" name="p_mstatus" value="기혼">
										<label for="p_mstatus02">기혼</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>9. 개인정보 수집 및 이용에 대한 동의</dt>
							<dd>
								<div class="terms">
									<div class="box">
										<ol>
											<li>수집하는 개인정보의 항목: 성명, 주소, 이메일, 휴대전화번호</li>
											<li>개인정보의 수집,이용 목적: 본 서명의 목적에 맞는 NEW-WAL의 캠페인에 활용하고, 추후 전개되는 바에 대한 소식을 전달하기 위함</li>
											<li>개인정보의 보유 및 이용기간: 5년(관계법령에서 정한 일정한 기간)</li>
										</ol>
									</div>
									<p>뉴월은 법률에서 정하는 경우를 제외하고는 귀하의 동의 없어 개인정보을 제3자에게 제공하지 않습니다.</p>
									<div class="chk_group">
										<label class="inp_chk">
											<input type="checkbox" id="p_arg" name="p_arg" value="Y">
											<span class="chkmark"></span>
											개인정보 이용에 동의합니다.
										</label>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<h3>입양 질문</h3>
					<div class="adoption_qa">
						<dl>
							<dt>1. 입양을 희망하는 아이를 적어주세요.</dt>
							<dd><input type="text" class="inpform" name="pet_name" id="pet_name" placeholder="내용을 입력해주세요." value="${pet_name}"></dd>
						</dl>
						<dl>
							<dt>2. 입양하기를 희망하는 아이가 없을 경우 앞으로 입양하고자 하는 아이에 대하여 간단히 설명하여 주시기 바랍니다.</dt>
							<dd><textarea class="txtareaform" name="alternative" id="alternative" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>3. 입양을 결정하시기 까지 얼마나 오랜 시간을 고민하셨나요?</dt>
							<dd><textarea class="txtareaform" name="time_to_worry" id="time_to_worry" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>4. 입양을 원하시는 가장 큰 이유는 무엇인가요?</dt>
							<dd><textarea class="txtareaform" name="reason" id="reason" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>5. 가족 구성원은 몇 명인가요? 구성원을 소개해주세요.</dt>
							<dd><textarea class="txtareaform" name="family_member" id="family_member" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>6. 입양결정에 가족 모두 동의하십니까?</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="family_arg01" name="family_arg" value="동의">
										<label for="family_arg01">동의</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="family_arg02" name="family_arg" value="일부동의">
										<label for="family_arg02">일부동의</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="family_arg03" name="family_arg" value="반대">
										<label for="family_arg03">반대</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>7. 키우고 계신 반려동물이 있나요? 있다면 소개해주세요.</dt>
							<dd><textarea class="txtareaform" name="pet" id="pet" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>8. 키우던 반려동물을 개인 사정으로 포기한 경험이 있으신가요? 이유는 무었인가요?</dt>
							<dd>
								<textarea class="txtareaform" name="experience" id="experience" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea>
							</dd>
						</dl>
						<dl>
							<dt>9. 주거의 형태는?</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="housing_type01" name="housing_type" value="단독주택">
										<label for="housing_type01">단독주택</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="housing_type02" name="housing_type" value="공동주택">
										<label for="housing_type02">공동주택</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="housing_type03" name="housing_type" value="아파트">
										<label for="housing_type03">아파트</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>10. 임대한 주택의 경우 집주인의 동의를 얻으셨나요?</dt>
							<dd>
								<textarea class="txtareaform" name="host_consent" id="host_consent" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea>
							</dd>
						</dl>
						<dl>
							<dt>11. 소음이나 위생 등으로 인한 이웃과의 마찰로 입양동물의 양육이 불가능해질 경우 어떻게 하실건가요?</dt>
							<dd><textarea class="txtareaform" name="impossible_situation" id="impossible_situation" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea></dd>
						</dl>
						<dl>
							<dt>12. 이사 또는 해외로 이주 시 반려동물의 거취문제에 대해 어떻게 생각하십니까?</dt>
							<dd>
								<textarea class="txtareaform" name="lodging_problem" id="lodging_problem" cols="30" rows="5" placeholder="내용을 입력해주세요."></textarea>
							</dd>
						</dl>
						<dl>
							<dt>13. 입양 시에, 유기동물의 구조와 치료, 보호비로 사용되는 일정금액의 맞음비 7만원을 납부해주셔야 합니다. (임시보호의 경우 제외) 동의하십니까?</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="payment_arg01" name="payment_arg" value="Y" checked>
										<label for="payment_arg01">네</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="payment_arg02" name="payment_arg" value="N">
										<label for="payment_arg02">아니요</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>14. 입양하신 동물은 NEW-WAL의 중성화수술 시행 방침에 따라, 반드시 중성화 수술을 해주셔야 합니다. 이에 동의하십니까?</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="neutered_arg01" name="neutered_arg" value="Y" checked>
										<label for="neutered_arg01">네</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="neutered_arg02" name="neutered_arg" value="N">
										<label for="neutered_arg02">아니요</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>15. 입양 후 모니터링을 위한 전화연락이나 방문에 동의하십니까?</dt>
							<dd>
								<div class="rd_group">
									<div class="inp_rd">
										<input type="radio" id="visit_agr01" name="visit_agr" value="Y" checked>
										<label for="visit_agr01">네</label>
									</div>
									<div class="inp_rd">
										<input type="radio" id="visit_agr02" name="visit_agr" value="N">
										<label for="visit_agr02">아니요</label>
									</div>
								</div>
							</dd>
						</dl>
						<dl>
							<dt>16. 입양동의</dt>
							<dd>
								<div class="terms">
									<div class="box">
										<ol>
											<li>본인(이하 '입양인'이라 합니다.)은 동물권행둥 NEW-WAL (이하 '단체'라 합니다.)를 통하여 반려동물(이하 '입양동물'이라
												합니다.)을 입양함에 있어 입양동물이 자연사하는 시점까지 책임 있는 보호자로서 입양동물에게 최적의 환경과 보살핌을 제공할
												것이며 최선을 다하여 입양동물을 보호할 의무가 있습니다.</li>
											<li>입양인은 입양인이나 혹은 가족을 포함한 제 3자의 고의 또는 과실로 인하여 입양동물에 대한 학대행위가 발생하거나 입양동물이
												양도, 매매, 유기, 유실된 경우에는 단체로부터의 어떠한 민, 형사상의 처벌에도 이의를 제기하지 않고 따르는데 동의합니다.
												입양인은 입양동물이 양도, 매매, 유기, 유실된 경우에 그 즉시로 단체에 통지할 의무를 지니며 입양동물을 되찾기 위한
												노력에 최선을 다하여 협조할 의무가 있습니다.</li>
											<li>입양인은 입양동물에게 양질의 사료와 깨끗한 물을 공급하고, 적합하고 적절한 운동, 질병에 대한 예방접종, 정기 건강검진을
												시행하는 등, 꼭 필요한 복지를 제공할 의무가 있습니다.</li>
											<li>만일 입양동물이 질병에 걸렸을 때 입양인은 신속하게 필요한 수의학적 치료를 받게 하고 성실하게 그 치료에 임할 것이며 만일
												입양동물의 완치가 불가능하고 그 고통이 극심한 경우에는 이를 단체에 통지하고 단체와의 협의 하에 대안을 강구하여야 하며
												임의로 처리해서는 안 됩니다. 입양인은 입양동물이 자연사한 경우에도 즉시 이 사실을 단체에 통지할 의무가 있습니다.
											</li>
											<li>입양인은 상시 입양동물에게 입양인의 연락처가 기재된 이름표를 반드시 착용시켜야 하며 만일 입양인의 연락처가 변경되거나
												주거지의 변동사항이 있을 시에는 즉시 단체에 이에 대한 정보를 통지할 의무가 있습니다.</li>
											<li>입양인은 입양 후 단체에서 시행하는 입양동물의 모니터링을 위한 전화 또는 방문에 응할 것이며 단체가 입양동물의 면회나
												사진을 요구할 시 언제든지 이에 협조할 의무가 있습니다.</li>
											<li>입양인은 단체의 입양동물 중성화수술 방침에 동의하며, 입양 전에 미리 중성화수술이 시행될 수 없는 경우에는 입양동물의
												건강상태가 양호하고 그 연령이 수술하기에 적합한 조건이 갖추어지는 즉시로 중성화수술을 시행하고 이에 대한 사실을 즉시
												단체에 통지하며 중성화수술 전이라 할지라도 그 어떠한 경우에도 입양동물을 교배하지 않을 의무가 있습니다.</li>
											<li>입양인은 개인적인 사유로 파양을 하는 경우에는, 반드시 단체에게 통보해야 하며 임의대로 재입양할 수 없습니다. 또한,
												단체에게 입양비 반환을 청구할 수 없습니다.</li>
											<li>입양인은 입양 후에도, 만일 단체에서 입양인이 입양동물을 돌볼 여건과 환경이 적합하지 않다고 판단하여 입양동물의 반환을
												요구하는 경우에는 이에 이의를 제기하지 않고 적극 협조할 의무가 있습니다.</li>
											<li>수집하는 개인정보의 항목: 성명, 주소, 이메일, 휴대전화번호</li>
											<li>개인정보의 수집,이용 목적: 본 서명의 목적에 맞는 NEW-WAL의 캠페인에 활용하고, 추후 전개되는 바에 대한 소식을 전달하기
												위함</li>
											<li>개인정보의 보유 및 이용기간: 5년(관계법령에서 정한 일정한 기간)</li>
										</ol>
									</div>
									<p>입양인은 이하에 서명함으로써 상기의 조항에 동의하며, 입양인이 상기의 조항을 위반 시에는 단체의 어떠한 처벌조치에도 이의를 제기함이 없이
										따를 것을 서약합니다.</p>
									<div class="chk_group">
										<label class="inp_chk">
											<input type="checkbox" id="adopt_arg" name="adopt_arg" value="Y">
											<span class="chkmark"></span>위의 유의사항을 확인하였으며, 이에 동의합니다.
										</label>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="btn_wrap">
						<input type="hidden" name="user_id" value="">
						<input type="hidden" name="code_seq" value="${code_seq}">
						<button type="button" class="btn_m btn_primary" id="btn_adoptRegi">입양 신청하기</button>
					</div>
				</form>
			</section>
		</div>
	</div>
</div>
<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
<jsp:include page="/layout/jsp/modal.jsp"></jsp:include> 
<script>
	$(function(){
	
		$("#btn_adoptRegi").on("click", function(){
		
			if($("#p_name").val() == ""){
				alert("성명을 입력해주세요!");
				return false;
			}
			
			if($("#p_phone01").val() == ""){
				alert("연락처를 입력해주세요!");
				return false;
			}
			
			let phoneRegex = /010?\d{3,4}?\d{4}$/;
			let phone_val01 = $("#p_phone01").val();
			let phone_val02 = $("#p_phone02").val();
 			if(!phoneRegex.test(phone_val01)){
				alert("올바른 연락처 양식이 아닙니다 :(");
				return false;
			} 
			if(phone_val02 != "" && !phoneRegex.test(phone_val02)){
				alert("올바른 대체 연락처 양식이 아닙니다 :(");
				return false;
			} 
			
			if($("#p_email").val() == ""){
				alert("이메일을 입력해주세요!");
				return false;
			}else{
				let emailRegex = /^[A-Za-z0-9]+@[a-z]+[.][a-z]{3}/;
				let email = $("#p_email").val();
				if(!emailRegex.test(email)){
					alert("올바른 이메일 양식이 아닙니다 :(");
					return false;
				}
			}
			let gender_chk = $("input:radio[name=p_gender]").is(':checked');
			let mstatus_chk = $("input:radio[name=p_mstatus]").is(':checked');
			let p_arg_chk = $("input:checkbox[name=p_arg]").is(':checked');
			let family_arg_chk = $("input:radio[name=family_arg]").is(':checked');
			let housing_type_chk = $("input:radio[name=housing_type]").is(':checked');
			let adopt_arg_chk = $("input:checkbox[name=adopt_arg]").is(':checked');

 			if(!gender_chk){
				alert("성별을 선택해주세요!");
				return false;
			}
 			
 			let age = $("#p_age").val();
 			let ageRegex = /^[0-9]/;
 			if($("#p_age").val() == ""){
				alert("나이를 입력해주세요!");
				return false;
			}
 			if(!ageRegex.test(age)){
				alert("나이는 숫자만 입력 가능합니다!");
				return false;
  			}
 			
 			if($("#p_address").val() == ""){
				alert("집주소를 입력해주세요!");
				return false;
  			}
  		
 			if(!mstatus_chk){
				alert("결혼여부 항목을 선택해주세요!");
				return false;
			} 
 			if(!p_arg_chk){
				alert("개인정보 수집 및 이용 항목을 동의해주세요!");
				return false;
			}
 			if(!family_arg_chk){
				alert("입양질문 6번 가족동의 여부를 확인해주세요.");
				return false;
			} 
 			if(!housing_type_chk){
				alert("입양질문 9번 주거형태를 확인해주세요.");
				return false;
			}
 			if($("#pet_name").val() == "" || $("#alternative").val() == "" || $("#time_to_worry").val() == "" ||
 					$("#reason").val() == "" || $("#family_member").val() == "" || $("#pet").val() == "" || 
 					$("#experience").val() == "" || $("#housing_type").val() == "" || 
 					$("#host_consent").val() == "" || $("#impossible_situation").val() == "" || $("#lodging_problem").val() == "" ){
 				alert("입양 질문을 전부 기입했는지 확인해주세요.");
				return false;
			} 
 			
 			if(!adopt_arg_chk){
				alert("입양 동의 유희사항을 확인해주세요.");
				return false;
			} 
			$("#adoptReg").submit();
			
		}) 
	});
	
</script>
</body>
</html>

