<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>
<style>

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/protectDetail.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
	 <div class="container" style="padding-bottom:120px;">
		<div class="contents">
			<section class="protectDetail">
				<div class="protectRow">
					<div class="protectInfo">
						<img
							src="${pageContext.request.contextPath}/upload/lostAnimal/${protectDetail.protectFileRealName1}" />
					</div>
					<div class="protectInfo">
						<div id="status">작성일: ${protectDetail.createDate}
							&nbsp;&nbsp; 조회수:${protectDetail.protectViewCount}</div>
							<!--동물이름과 후원버튼   -->
						<div id="animalName">${protectDetail.protectName} <span style="color: violet; margin-left:55px; font-size:20px;"><a href="${pageContext.request.contextPath}/directInput.sp?protect_no=${protectDetail.protectNo}&protect_name=${protectDetail.protectName}">후원&nbsp;<i class="fas fa-hand-holding-heart"></i></a></span>    </div>

						<ul class="list-info">
							<li>
								<div class="animal-kind">
									품종<span class="info-detail">${protectDetail.protectKind}</span>
								</div>
								<div class="animal-kind">
									성별<span class="info-detail"> <c:choose>
											<c:when test="${protectDetail.protectGender=='F'}">암컷</c:when>
											<c:otherwise>수컷</c:otherwise>
										</c:choose>
									</span>
								</div>
								<div class="animal-kind">
									임시보호 기간<span class="info-date">${protectDetail.protectDate}일째</span>
								</div>
								<div class="animal-kind">
									작성자<span class="info-detail">${protectDetail.protectWriter}
									</span>
								</div>
							</li>
						</ul>
						<div>설명</div>
						<div id="textContent">${protectDetail.protectContent }</div>

					</div>
				</div>
				<!--댓글  -->

				<div class="">
					<div class="replytitle">댓글</div>
					<div class="panel-body">
						<textarea id="content" id="reply__write__form" class="txtareaform"
							placeholder="write a comment..." rows="2"></textarea>
						<br>
						<button id="btnSub" class="btn_m btn_primary">댓글숨기기</button>
						<button id="btnWrite" class="btn_m btn_primary">댓글쓰기</button>




						<div class="clearfix"></div>
						<hr>
						<!-- 댓글 리스트 시작-->

						<ul id="reply__list" class="media-list">
	<c:forEach var="replyList" items="${replyList}">
							<!-- 댓글 아이템 -->
						<li id="reply-${replyList.replyNo}" class="media">
									<div class="media-body">
										<strong class="text-success">${replyList.protectWriter}</strong>
										 <span class="m-2">
										<c:if test="${sessionScope.loginInfo.user_id == replyList.protectWriter }">
											<i onclick="deleteReply(${replyList.replyNo})" class="fas fa-trash-alt" style="cursor:pointer"></i>
										</c:if>
									</span>
										<p class="commentArea">${replyList.replyCon}</p>
										<input type="hidden" value="${replyList.replyNo}"/>
										
										<div class="chang"></div>
									
									
									</div>
								</li>
								</c:forEach>
						</ul>
						<hr>
					
						<!-- 댓글 리스트 끝-->
					</div>
				</div>
<c:set var="startNum" value="${param.page-(param.page-1)%5}"></c:set>


<nav aria-label="Page navigation example ">
  <ul class="pagination mt-4 justify-content-center align-items-center">
  <c:choose>
  <c:when test="${param.page<=1}">
   <li class="page-item  "><a class="page-link"     onclick="alert('이전 페이지가 없습니다.');">Previous</a></li>
    </c:when>
    <c:otherwise>
     <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${param.protectNo}&page=${startNum-1}">Previous</a></li>
     </c:otherwise>
    </c:choose>
    <c:forEach var="i" begin="${starNum}" end="${lastPage-1}" step="1">
    <li class="page-item"><a class="page-link" href="">${i+1}</a></li>
   </c:forEach>
   
   <c:choose>
   
   	<c:when test="${param.page >= lastPage }">
   		<li class="page-item  "><a class="page-link"     onclick="alert('마지막 페이지 입니다.');">Next</a></li>
   	</c:when>
   	<c:otherwise>
   	 <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${param.protectNo}&page=${startNum+1}">Next</a></li>
   	</c:otherwise>
    </c:choose>
  </ul>
  
</nav>
			</section>
		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
 <jsp:include page="/layout/jsp/modal.jsp"></jsp:include> 

	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/protectDetail.js"></script> 
	<script>
	let btnEvent = document.querySelector('#btnSub')
	let btnEvent2 = document.querySelector('#btnWrite')
	let textWrite = document.querySelector('#content')
	let loginBtn = document.querySelector('#loginLogin')
	//댓글 보이기, 숨기기
		btnEvent.addEventListener('click',function(){
		let target = document.querySelector('#reply__list');
		let targetHtml = btnEvent.innerText;
		console.log(targetHtml)
			btnEvent.innerText= (target.style.display == 'none') ? '댓글숨기기' : '댓글보이기';
		target.style.display= (target.style.display == 'none') ? 'block' : 'none';
		console.log(target.style.display)
		})
		//댓글추가
		btnEvent2.addEventListener('click',function(){
			let data={
					"protectWriter":"${sessionScope.loginInfo.user_id}", 
					"boardNo":${protectDetail.protectNo}, 
					"replyCon":$('#content').val()
					}
			$.ajax({
			url:"${pageContext.request.contextPath}/comment.lost",
			type:"post",
			data:data,
			dataType:"json"		
		}).done(function(result){
			alert("댓글 작성 완료!")
			addReply(result)
			$('#content').val('');		
		});
			})
			//로그인 체크
			textWrite.onfocus = function(){
			<c:if test="${sessionScope.loginInfo==null}">
		
		loginBtn.click();
			
			</c:if>
		}
	function deleteReply(id){
		
		$.ajax({
			type :"post",
			url :"${pageContext.request.contextPath}/replyDel.lost?replyNo="+id,
			dataType : "json"
		}).done(function(resp){ 
			
			
			$("#reply-"+id).remove();
		})
	}
	 	
	</script>
	
</body>
</html>