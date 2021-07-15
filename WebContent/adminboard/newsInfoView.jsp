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
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticecss/css.css">
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
					 $("#replyFrm").attr("action", "${pageContext.request.contextPath}/modifyAdminReply.necmt");
			         $("#replyFrm").submit();
				})
			}) 
			
			
			
			
			
			$(".delReply").on("click",function(){
		        if(confirm("정말 삭제하시겠습니까?")){    
		           $("#replyFrm").attr("action", "${pageContext.request.contextPath}/neAdmindelete.necmt");
		          
		           $("#replyFrm").submit();
		        }
			})
		 
		 
		 })
</script>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded">
				<div class="title_area">
						<h2>뉴스</h2>
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
							<a href="${pageContext.request.contextPath}/newsInfo.newsAdm?cpage=1" class="btn_s btn_light">목록</a> 
							<a href="${pageContext.request.contextPath}/newsModify.newsAdm?news_seq=${newsView.news_seq}" class="btn_s btn_primary" id="newsmodify">수정</a> 
							<a href="${pageContext.request.contextPath}/newsDelete.newsAdm?news_seq=${newsView.news_seq}" class="btn_s btn_default" id="newsdelete">삭제</a>
						</div>
					</div>
					<form action="${pageContext.request.contextPath}/newsAdminWrite.necmt" method="post" class="news_contents">
						<div id="nrp-comments" class="nrp-comments">
							<div class="comments-row">
								<textarea id="nrp_contents" name="nrp_contents" class="txtareaform"
									placeholder="댓글을 입력해주세요" rows="3"></textarea>
								<input type="hidden" value="${newsView.news_seq}" name=parent>
								<input type="hidden" value="${admLoginInfo.name}" name="name">
								<button class="writeBtn" type="submit">
									<i class="far fa-edit"></i>등록
								</button>
							</div>
						</div>
					</form>
					<form id="replyFrm" class="replyFrm" style="margin-left:50px;">
						<div class="reply-container">
							<c:forEach var="i" items="${necmtlist}">
								<div class="reply">
									<div class="nrp_writer">${i.nrp_writer}</div>
									<div class="nrp_contents">${i.nrp_contents}<input type="hidden" id="hiddenCon" class="hiddenCon" name="hiddenCon" value="${i.nrp_contents}"></div>
									<div class="nrp_reg_date">${i.nrp_reg_date}</div>
<%-- 									 <c:if test="${i.writer == login.id }">  --%>
									<button class="btn_s btn_default delReply" id="delReply" type="button">삭제</button>
									<button class="btn_s btn_primary modiReply" id="modiReply" type="button">수정</button>
<%-- 									</c:if>  --%>
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
	
</body>

</html>