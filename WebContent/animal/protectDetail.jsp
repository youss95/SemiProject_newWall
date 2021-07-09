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
 <%@ include file="../layout/jsp/commonModal.jsp" %>
</head>
<body>
<%@ include file="../layout/jsp/header.jsp" %>
	 <div class="container">
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
						<div id="animalName">${protectDetail.protectName}</div>

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
									작성자<span class="info-detail">${protectDetail.protectKind}
									</span>
								</div>
							</li>
						</ul>
						<div>설명</div>
						<div id="textContent">${protectDetail.protectContent }는청춘의
							위하여서. 피어나는 위하여 두기 이 끝까지 이것이다. 듣기만 새가 수 천자만홍이 작고 수 원질이 것이다. 뼈 광야에서
							풀이 무한한 이성은 가지에 놀이 청춘은 위하여, 듣는다. 품에 반짝이는 이 품고 그들은 불어 무한한 인도하겠다는
							힘있다. 같이 길지 풀이 별과 타오르고 이상의 있으며, 크고 것이다.보라, 운다. 찾아다녀도, 생명을 두손을 이상
							천지는 아름다우냐? 가슴이 새 산야에 가지에 이상 이성은 위하여, 아니다. 인생에 노년에게서 찾아다녀도, 얼음이 실로
							위하여 스며들어 얼마나 갑 있다.</div>

					</div>
				</div>
				<!--댓글  -->

				<div class="">
					<div class="replytitle">댓글</div>
					<div class="panel-body">
						<textarea id="content" id="reply__write__form" class="txtareaform"
							placeholder="write a comment..." rows="2"></textarea>
						<br>
						<button id="btnSub" class="btn_m btn_primary">댓글보이기</button>
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
										<p class="commentArea">${replyList.replyCon}</p>
										<input type="hidden" value="${replyList.replyNo}"/>
										
										<div class="chang"></div>
									</div>
									 <div class="m-2">
										<c:if test="${sessionScope.loginInfo.user_id == replyList.protectWriter }">
											<i onclick="deleteReply(${replyList.replyNo})" class="fas fa-trash-alt" style="cursor:pointer"></i>
										</c:if>
									</div>
								</li>
								</c:forEach>
						</ul>
						<hr>
					
						<!-- 댓글 리스트 끝-->
					</div>
				</div>

			</section>
		</div>
	</div>

	<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
<%@ include file="../layout/jsp/modal.jsp"%>

	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/protectDetail.js"></script>
	<script>
	let btnEvent = document.querySelector('#btnSub')
	let btnEvent2 = document.querySelector('#btnWrite')
	let textWrite = document.querySelector('#content')
	//댓글 보이기, 숨기기
		btnEvent.addEventListener('click',function(){
		let target = document.querySelector('#reply__list');
		let targetHtml = btnEvent.innerText;
		console.log(targetHtml)
			btnEvent.innerText= (target.style.display == 'none') ? '댓글보이기' : '댓글숨기기';
		target.style.display= (target.style.display == 'none') ? 'block' : 'none';
		console.log(target.style.display)
		})
		//댓글추가
		btnEvent2.addEventListener('click',function(){
		alert('dd')
		
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
		addReply(result)
		$('#content').val('');		
	});
		})
		//로그인 체크
		textWrite.onfocus = function(){
		<c:if test="${sessionScope.loginInfo==null}">
	
	
		</c:if>

	}
	//댓글 삭제
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