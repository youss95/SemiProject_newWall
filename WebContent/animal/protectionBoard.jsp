<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴월</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animal/protectionBoard.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
.container{padding-top:60px;}
#boardDetailprotect{margin-top:10px;}
.img {	margin-top:60px;
        position: relative;
        background-image: url(${pageContext.request.contextPath}/resources/images/img07.jpeg);
        height: 350px;
        background-size: cover;
        width:100%;
         background-position: 0;
      }

      .img-cover {
        position: absolute;
        height: 100%;
        width: 100%;
        background-color: rgba(0, 0, 0, 0.6);
        z-index: 1;
      }

      .img .content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 3rem;
        color: white;
        z-index: 2;
        text-align: center;
      }
	.gosp{
	font-size:20px;
	
	}
</style>
</head>
<body>
<div class="wrap">
<%@ include file="../layout/jsp/header.jsp" %>
	<div class="img">
      <div class="content">
      
       <div>임시보호 동물</div>

       
       <div class="gosp">
       <span ><b>New-Wal</b>에서는 개인이 보호 중인 동물의 복지와 입양을<br> 활성화 하기 위해 노력합니다.</span><br><br>
      <c:if test="${sessionScope.loginInfo != null }"></c:if>
       <a href="${pageContext.request.contextPath}/animal/protectionForm.jsp" id="detailWrite">글쓰기&nbsp;&nbsp;&nbsp;<i class="fas fa-pen"></i></a>
     
       </div>
      </div>
      <div class="img-cover"></div>
    </div>
<div class="container">
			<div class="contents">
			
		
				<section class="protectBoard">
				
<span style="color:#9d9d9d;font-size:28px;">임시보호 동물</span>


				 <div class="cont">
     <div class="row">
    <c:forEach var="p" items="${protectList}">
        <div class="card shadow-soft" style="padding:0px;">
            <img src="${pageContext.request.contextPath}/upload/lostAnimal/${p.protectFileRealName1}">
            <div class="card-body">
                <h4>${p.protectName }</h4>
                <p class="fontC">
                    구조장소:${p.protectAddr}<br>
                    성별: 
                     <c:if test="${p.protectGender == 'F' }">
    암컷
    </c:if>
     <c:if test="${p.protectGender == 'M' }">
   수컷
    </c:if><br>
                작성자:${p.protectWriter}
                </p>
                <div id="boardDetailprotect">
               <a  href="${pageContext.request.contextPath}/protectDetail.lost?protectNo=${p.protectNo}&page=1" >자세히보기<i class="fas fa-angle-double-right"></i></a>
               </div>
                        </div>
        </div>
        </c:forEach>
        
      
    </div> 
    <div id="loading">
    
    </div>
</div>
<%-- <a href="${pageContext.request.contextPath}/animal/protectionForm.jsp" class="btn_m btn_light" style="float:right;">글쓰기</a> --%>
				</section>
			</div>
		</div>

<footer class="footer">
		<p>Copyright &copy; Kh semi project by group 2</p>
	</footer>
	</div>
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<%@ include file="../layout/jsp/modal.jsp"%>
	<script src="${pageContext.request.contextPath}/resources/js/animal/animalLostForm.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/animal/imagePreview.js"></script>	
	<script src="${pageContext.request.contextPath}/resources/js/animal/pageLoading.js"></script>  
	<script>
	let loginBtn = document.querySelector('#loginLogin')
	
	
	$('#detailWrite').click(function(e){
		
		 <c:if test="${sessionScope.loginInfo.user_id == null }">
		 e.preventDefault();
		 Swal.fire({
			  icon: 'error',
			  title: '로그인이 필요합니다.',
			  text: '로그인 페이지로 이동합니다.',
			 
			}).then((result)=>{
				loginBtn.click();
				
			})
	
	
		  </c:if>
	})
	</script>
</body>
</html>