<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<jsp:include page="../layout/jsp/commonModal.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/fontawesome.min.css">

<script>
 $(function(){
	 $('#nrp_contents').on('keyup', function() {	 
         if($(this).val().length > 100) {
             $(this).val($(this).val().substring(0, 150));
         }
     });    	

	 
	$("#modiReply").on("click",function(){
		if($(this).text()=="수정") {
			$(this).text("확인");
			$(this).siblings(".nrp_contents").attr("contenteditable","true");
			$(this).siblings(".nrp_contents").focus();
		}
		$("#modiReply").on("click",function(){
			 $("#hiddenCon").val($(this).siblings(".nrp_contents").text());
			 $("#replyFrm").attr("action", "${pageContext.request.contextPath}/modifyReply.necmt");
	         $("#replyFrm").submit();
		})
	}) 
	
	
	
	$(".delReply").on("click",function(){
        if(confirm("정말 삭제하시겠습니까?")){    
           $("#replyFrm").attr("action", "${pageContext.request.contextPath}/nedelete.necmt");
          
           $("#replyFrm").submit();
        }
	})
 
 
 })

</script>

</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/header.jsp"></jsp:include>
		<div class="container">
			<div class="contents">
				<section class="notice_list">
					<div class="title">
						<h2>뉴스</h2>
						<p>다양한 활동과 소식을 담은 뉴스레터를 보내드립니다.</p>
					</div>
					<div class="news_wrap">
						<div class="news_view_wrap">
							<div class="title">${newsView.news_title}</div>
							<div class="info">
								<dl>
									<dt>글쓴이</dt>
									<dd>${newsView.news_writer}</dd>
								</dl>
								<dl>
									<dt>작성일</dt>
									<dd>${newsView.news_reg_date}</dd>
								</dl>
								<dl>
									<dt>조회수</dt>
									<dd>${newsView.news_view}</dd>
								</dl>
							</div>
							<div class="cont">${newsView.news_contents}</div>
						</div>
						<div class="news_bt_wrap">
							<a href="${pageContext.request.contextPath}/newsBoard.news?cpage=1" class="btn_s btn_light">목록</a> 
							<%--<c:if test="${login.user_id == admin_id} || ${login.user_id == newsView.news_writer}"> --%>
<%-- 							<a href="${pageContext.request.contextPath}/newsModify.news?news_seq=${newsView.news_seq}" class="btn_s btn_primary" id="newsmodify">수정</a>  --%>
<%-- 							<a href="${pageContext.request.contextPath}/newsDelete.news?news_seq=${newsView.news_seq}" class="btn_s btn_default" id="newsdelete">삭제</a> --%>
							<%--</c:if> --%>
						</div>
					</div>
					<c:if test="${loginInfo.user_id != null}">
					<form action="${pageContext.request.contextPath}/newsWrite.necmt" method="post" class="news_contents"> 
					<input type="hidden" value="${loginInfo.user_id}" name="user_id">
						<div id="nrp-comments" class="nrp-comments">
							<div class="comments-row">
								<textarea id="nrp_contents" class="txtareaform" name="nrp_contents"
									placeholder="댓글을 입력해주세요" rows="3"></textarea>
								<input type="hidden" value="${newsView.news_seq}" name=parent>
								<button class="writeBtn" type="submit">
									<i class="far fa-edit"></i>등록
								</button>
							</div>
						</div>
					</form>
					</c:if>
					<form id="replyFrm" class="replyFrm">
						<div class="reply-container">
							<c:forEach var="i" items="${necmtlist}">
								<div class="reply">
									<div class="nrp_writer">${i.nrp_writer}</div>
									<div class="nrp_contents">${i.nrp_contents}<input type="hidden" id="hiddenCon" class="hiddenCon" name="hiddenCon" value="${i.nrp_contents}"></div>
									<div class="nrp_reg_date">${i.nrp_reg_date}</div>
									<c:if test="${i.nrp_writer == loginInfo.user_id }">
									<button class="btn_s btn_default delReply" id="delReply" type="button">삭제</button>
									<button class="btn_s btn_primary modiReply" id="modiReply" type="button">수정</button>
									</c:if>
									<input type="hidden" name="nrp_seq" value="${i.nrp_seq}"> 
									<input type="hidden" name="nrp_parent" value="${i.nrp_parent}">
								</div>
							</c:forEach>
						</div>
					</form>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/jsp/footer.jsp"></jsp:include>
	<jsp:include page="../layout/jsp/modal.jsp"></jsp:include>
</body>
</html>