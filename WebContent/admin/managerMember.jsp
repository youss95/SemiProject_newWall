<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote-bs4.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    
	<style>
		tbody svg{
			margin-left:3px;
			margin-right:3px;
			cursor:pointer;
		}
		#myTable_paginate a{
		
		}
	</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../layout/jsp/adminHeader.jsp"></jsp:include>
		<div class="main">
			<div class="container">
				<section class="shadow-sm rounded">
					<div class="title_area">
						<h2>회원관리</h2>
					</div>
					<div class="contents news_list">
						<table id="myTable" class="table table-hover text-center">
							<thead>
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>Email</th>
									<th>Contact</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="i" items="${list}" varStatus="vs">
									<tr>
										<td>${i.user_id }</td>
										<td>${i.name }</td>
										<td>${i.email}</td>
										<td>${i.contact}</td>
										<td>
											<i class="fas fa-user-slash" itemref="${i.user_id }" title="add to blacklist"></i>
											<i class="fas fa-ban" itemref="${i.user_id }" title="kickout"></i>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script>
	$(function(){
		function filterGlobal () {
		    $('#example').DataTable().search(
		        $('#global_filter').val(),
		        $('#global_regex').prop('checked'),
		        $('#global_smart').prop('checked')
		    ).draw();
		}
		 
		function filterColumn ( i ) {
		    $('#example').DataTable().column( i ).search(
		        $('#col'+i+'_filter').val(),
		        $('#col'+i+'_regex').prop('checked'),
		        $('#col'+i+'_smart').prop('checked')
		    ).draw();
		}
		$('#myTable').DataTable();
		$('input.global_filter').on('keyup click', function () {filterGlobal();} );
	    $('input.column_filter').on('keyup click', function () {filterColumn( $(this).parents('tr').attr('data-column') );} );
		
		$(".fa-user-slash").on("click",function(){
			let target = $(this).attr("itemref");
			let check = confirm(target + " 멤버를 블랙리스트에 등록하시겠습니까?");
			if(check){
				location.href="${pageContext.request.contextPath}/addBlack.adm?user_id="+target;
			}
		})
		
		$(".fa-ban").on("click",function(){
			let target = $(this).attr("itemref");
			let check = confirm(target + " 멤버를 정말 탈퇴시키시겠습니까?");
			if(check){
				location.href="${pageContext.request.contextPath}/kickout.adm?user_id="+target;
			}
		})
	})
		
	</script>
</body>
</html>