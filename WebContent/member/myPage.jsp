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
						<div class="text-muted">
							탈퇴하시려면 [ ${loginInfo.user_id } ] 를 정확히 입력해주세요.
						</div>
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
				<section class="mypage">
					<div class="card">
						<div class="card-header">My Info</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="label">ID</div>
								<div class="value" itemid="user_id">${loginInfo.user_id }</div>
								<div class="control"></div>
							</li>
							<li class="list-group-item">
								<div class="label">Password</div>
								<div class="value" itemid="password">
									<button type="button" class="btn_submit btn_m btn_default"
										data-bs-toggle="modal" data-bs-target="#passwordModal">
										Password 변경</button>
								</div>
								<div class="control"></div>
							</li>
							<li class="list-group-item">
								<div class="label">Email</div>
								<div class="value" itemid="email">${loginInfo.email}</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Name</div>
								<div class="value" itemid="name">${loginInfo.name }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">BirthDay</div>
								<div class="value" itemid="birthday">${loginInfo.formedDate }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Contact</div>
								<div class="value" itemid="contact">${loginInfo.contact}</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Status</div>
								<div class="value" itemid="status">${loginInfo.status }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Postcode</div>
								<div class="value" itemid="postcode">${loginInfo.postcode }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Address1</div>
								<div class="value" itemid="address1">${loginInfo.address1 }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">Address2</div>
								<div class="value" itemid="address2">${loginInfo.address2 }</div>
								<div class="control">
									<i class="far fa-edit"></i> <i class="far fa-check-circle"></i>
									<i class="fas fa-times"></i>
								</div>
							</li>
							<li class="list-group-item">
								<div class="label">MemberOut</div>
								<div class="value">
									<button id="memberOut" class="btn_submit btn_m btn_default" data-bs-target="#memberOutModal" data-bs-toggle="modal">회원탈퇴</button>
								</div>
								<div class="control">
								</div>
							</li>
							<li class="list-group-item justify-content-center"><a
								href="${pageContext.request.contextPath}/index.jsp">
									<button class="btn_submit btn_m btn_default">돌아가기</button>
							</a></li>
						</ul>
					</div>
				</section>
			</div>
		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		$(function() {
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
				
				console.log(pw + " : " + repw)
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

			$(".fa-edit").on("click", function() {
				let target = $(this).parent().prev();
				target.attr("contenteditable", "true");
				target.addClass("border border-primary");
				$(this).hide();
				$(this).siblings().show();
				target.focus();
			})
			$(".fa-times").on("click", function() {
				let target = $(this).parent().prev();
				target.attr("contenteditable", "false");
				target.removeClass("border");
				target.removeClass("border-primary");
				$(this).hide();
				$(this).siblings().hide();
				$(this).siblings(".fa-edit").show();
			})
			$(".fa-check-circle").on("click", function() {
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
		})
	</script>
</body>
</html>