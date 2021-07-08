package com.kh.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dao.MemberDAO;
import com.kh.dto.MemberDTO;
import com.kh.dto.tempMemberDTO;
import com.kh.utils.DateUtils;


@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		HttpSession session = request.getSession();

		MemberDAO dao = MemberDAO.getInstance();
		try {
			if(url.contentEquals("/terms.mem")) { 
				//----------------------------------------------------------------------------------------- 회원가입 약관으로
				response.sendRedirect("member/agreeTerms.jsp");
			}else if(url.contentEquals("/signup.mem")) { 
				//----------------------------------------------------------------------------------------- 회원가입 페이지로
				response.sendRedirect("member/signup.jsp");
			}else if(url.contentEquals("/singupProc.mem")) { 
				//----------------------------------------------------------------------------------------- 회원가입 요청 처리
				String user_id = request.getParameter("user_id");
				String user_password = request.getParameter("user_password");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				
				Date birthDay = DateUtils.stringToDate(request.getParameter("birthday"), "yyyyMMdd");
				
				String contact = request.getParameter("contact");
				char status = request.getParameter("status").charAt(0);
				String postCode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				int result = dao.insert(new MemberDTO(user_id,user_password,email,name,birthDay,contact,status,postCode,address1,address2));
				// 축하페이지가 따로 있다면 : response.sendRedirect("축하페이지");
				response.sendRedirect("index.jsp");
			}else if(url.contentEquals("/myPage.mem")) {
				//----------------------------------------------------------------------------------------- 마이페이지 처리
				//마이페이지 진입 시 마다 가장 최신 DB정보를 세션에 갱신
				String user_id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				MemberDTO dto = dao.selectMemberById(user_id);
				request.getSession().setAttribute("loginInfo", dto);
				response.sendRedirect("member/myPage.jsp");
			}else if(url.contentEquals("/modifyProc.mem")) {
				//----------------------------------------------------------------------------------------- 회원 정보 수정 처리
				
			}else if(url.contentEquals("/memberOut.mem")) { 
				//----------------------------------------------------------------------------------------- 회원탈퇴 페이지로
				response.sendRedirect("member/memberOut.jsp");
			}else if(url.contentEquals("/memberOutProc.mem")) {
				//----------------------------------------------------------------------------------------- 회원탈퇴 요청 처리
				int result = dao.delete(((MemberDTO)session.getAttribute("loginInfo")).getUser_id());
				// 탈퇴 안내 페이지가 있다면 response.sendRedirect("탈퇴 안내페이지");
				session.invalidate();
				response.sendRedirect("index.jsp");
			}else if(url.contentEquals("/loginProc.mem")) {
				//----------------------------------------------------------------------------------------- 로그인 요청 처리
				String user_id = request.getParameter("user_id");
				String user_password = request.getParameter("user_password");
				System.out.println(user_id);
				if(dao.isLoginOk(user_id, user_password)) {
					MemberDTO dto = dao.selectMemberById(user_id);
					request.getSession().setAttribute("loginInfo", dto);
					System.out.println(dto);
				}
				response.sendRedirect("index.jsp");
			}else if(url.contentEquals("/logoutProc.mem")){
				//----------------------------------------------------------------------------------------- 로그아웃 요청 처리
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
