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
	 $('#ntrp_contents').on('keyup', function() {	 
         if($(this).val().length > 100) {
             $(this).val($(this).val().substring(0, 150));
         }
     });    	

	$("#modiReply").on("click",function(){
		if($(this).text()=="수정") {
			$(this).text("확인");
			$(this).siblings(".ntrp_contents").attr("contenteditable","true");
			$(this).siblings(".ntrp_contents").focus();
		}
		$("#modiReply").on("click",function(){
			 $("#hiddenCon").val($(this).siblings(".ntrp_contents").text());
			 $("#replyFrm").attr("action", "${pageContext.request.contextPath}/modifyReply.nocmt");
	         $("#replyFrm").submit();
		})
	}) 
	
	
	
	$(".delReply").on("click",function(){
        if(confirm("정말 삭제하시겠습니까?")){    
           $("#replyFrm").attr("action", "${pageContext.request.contextPath}/nodelete.nocmt");
          
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
						<h2>공지사항</h2>
						<p>새로운 소식과 이야기를 전합니다</p>
					</div>
					<div class="board_wrap">
						<div class="board_view_wrap">
							<div class="board_view">
								<div class="title">${noticeView.notice_title}</div>
								<c:forEach var="file" items="${flist}">
									<div class="file">
										<a
											href="download.file?seq=${file.seq}&sysname=${file.sysName}&oriname=${file.oriName}">${file.oriName}</a>
									</div>
								</c:forEach>
								<div class="info">
									<dl>
										<dt>글쓴이</dt>
										<dd>${noticeView.notice_writer}</dd>
									</dl>
									<dl>
										<dt>작성일</dt>
										<dd>${noticeView.notice_reg_date}</dd>
									</dl>
									<dl>
										<dt>조회수</dt>
										<dd>${noticeView.notice_view}</dd>
									</dl>
								</div>
								<div class="cont">${noticeView.notice_contents}</div>
							</div>
							<div class="bt_wrap">
								<a
									href="${pageContext.request.contextPath}/noticeBoard.notice?cpage=1"
									class="btn_s btn_light">목록</a>
							</div>
						</div>
					</div>
					<c:if test="${loginInfo.user_id != null}">
					<form action="${pageContext.request.contextPath}/nowrite.nocmt"	method="post" >
					<input type="hidden" name="writer" value="${loginInfo.user_id}">
						<div id="ntrp-comments" class="ntrp-comments">
							<div class="comments-row">
								<textarea id="ntrp_contents" name="ntrp_contents" class="txtareaform"
									placeholder="댓글을 입력해주세요" rows="3"></textarea>
								<input type="hidden" value="${noticeView.notice_seq}"
									name=parent>
								<button class="writeBtn">
									<i class="far fa-edit"></i>등록
								</button>
							</div>
						</div>
					</form>
					</c:if>
					<form id="replyFrm" class="replyFrm">
						<div class="reply-container">
							<c:forEach var="i" items="${nocmtlist}">
								<div class="reply">
									<div class="ntrp_writer">${i.ntrp_writer}</div>
									<div class="ntrp_contents">${i.ntrp_contents}<input type="hidden" id="hiddenCon" class="hiddenCon" name="hiddenCon" value="${i.ntrp_contents}"></div>
									<div class="ntrp_reg_date">${i.ntrp_reg_date}</div>
									<c:if test="${i.ntrp_writer == loginInfo.user_id }">
									<button class="btn_s btn_default delReply" id="delReply" type="button">삭제</button>
									<button class="btn_s btn_primary modiReply" id="modiReply" type="button">수정</button>
									</c:if>
									<input type="hidden" name="ntrp_seq" value="${i.ntrp_seq}"> 
									<input type="hidden" name="ntrp_parent" value="${i.ntrp_parent}">
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