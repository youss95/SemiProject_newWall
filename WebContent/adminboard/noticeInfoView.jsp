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
             $("#replyFrm").attr("action", "${pageContext.request.contextPath}/modifyadminReply.nocmt");
               $("#replyFrm").submit();
         })
      }) 
      
      $(".delReply").on("click",function(){
             if(confirm("정말 삭제하시겠습니까?")){    
              $("#replyFrm").attr("action", "${pageContext.request.contextPath}/noadmindelete.nocmt");
          
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
                  <h2>공지 사항</h2>
               </div>
               <div class="contents">
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
                              <input type="hidden" name="notice_seq" value="${noticeView.notice_seq}">
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
                              href="${pageContext.request.contextPath}/noticeInfo.sumAdm?cpage=1"
                              class="btn_s btn_light">목록</a>
                           <a
                              href="${pageContext.request.contextPath}/noticeInfoModify.sumAdm?notice_seq=${noticeView.notice_seq}"
                              class="btn_s btn_primary" id="modify">수정</a>
                           <a
                              href="${pageContext.request.contextPath}/noticeInfoDelete.sumAdm?notice_seq=${noticeView.notice_seq}"
                              class="btn_s btn_default" id="delete">삭제</a>
   
                  </div>
               <form action="${pageContext.request.contextPath}/noadminwrite.nocmt"
                  method="post">
                  <div id="ntrp-comments" class="ntrp-comments" style="margin-left:100px; margin-top:50px;">
                     <div class="comments-row">
                        <textarea id="ntrp_contents" name="ntrp_contents" class="txtareaform"
                           placeholder="댓글을 입력해주세요" rows="3"></textarea>
                        <input type="hidden" value="${noticeView.notice_seq}" name=parent>
                        <input type="hidden" value="${admLoginInfo.name}" name="name">
                        <button class="writeBtn">
                           <i class="far fa-edit"></i>등록
                        </button>
                        </div>
                        </div>
                  </form>
                  <form id="replyFrm" class="replyFrm" style="margin-left:50px;" >
                     <div class="reply-container">
                        <c:forEach var="i" items="${nocmtlist}">
                           <div class="reply">
                              <div class="ntrp_writer">${i.ntrp_writer}</div>
                              <div class="ntrp_contents" id="recontents">${i.ntrp_contents}<input type="hidden" id="hiddenCon" class="hiddenCon" name="hiddenCon" value="${i.ntrp_contents}"></div>
                              <div class="ntrp_reg_date">${i.ntrp_reg_date}</div> 
                              <%-- <c:if test="${i.writer == login.id }"> --%>
                              <button class="btn_s btn_default delReply" id="delReply" type="button">삭제</button>
                              <button class="btn_s btn_primary modiReply" id="modiReply" type="button">수정</button>
                              <%-- </c:if> --%>
                              <input type="hidden" name="ntrp_seq" value="${i.ntrp_seq}"> 
                              <input type="hidden" name="ntrp_parent" value="${i.ntrp_parent}">
                           </div>
                        </c:forEach>
                     </div>
                  </form>
               </div>
            </section>
         </div>
      </div>
   </div>
   
</body>

</html>