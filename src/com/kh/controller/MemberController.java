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
import com.kh.utils.DateUtils;
import com.kh.utils.EncryptUtils;
import com.kh.utils.MailUtils;


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
				//---------------------------------------------------------signUp.jsp페이지 새로생성함----------- 회원가입 페이지로
				response.sendRedirect("member/signUp.jsp");
			}else if(url.contentEquals("/signupProc.mem")) { 
				//----------------------------------------------------------------------------------------- 회원가입 요청 처리
				String user_id = request.getParameter("user_id");
				String user_password = EncryptUtils.getSHA512(request.getParameter("user_password"));
				String email = request.getParameter("email")+"@"+request.getParameter("email2");

				String name = request.getParameter("name");

				String yy = request.getParameter("birthday_yy");
				String MM = request.getParameter("birthday_mm");
				String dd = request.getParameter("birthday_dd");

				Date birthDay = DateUtils.stringToDate(yy+MM+dd, "yyyyMMdd");

				String contact1 = request.getParameter("contact1");
				String contact2 = request.getParameter("contact2");
				String contact3 = request.getParameter("contact3");

				String contact = contact1+contact2+contact3;
				String postCode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");
				
				request.setAttribute("user_id", user_id);
				request.setAttribute("name", name);

				int result = dao.insert(new MemberDTO(user_id,user_password,email,name,birthDay,contact,'N',postCode,address1,address2));
				// 축하페이지가 따로 있다면 : response.sendRedirect("축하페이지"); 이프문 
				if(result>0) {
					request.getRequestDispatcher("member/joinSuccess.jsp").forward(request, response);	
				}else {
					//회원가입 실패시..
					//response.sendRedirect("index.jsp");
				}
			}else if(url.contentEquals("/myPage.mem")) {
				//----------------------------------------------------------------------------------------- 마이페이지 처리
				//마이페이지 진입 시 마다 가장 최신 DB정보를 세션에 갱신
				String user_id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				MemberDTO dto = dao.selectMemberById(user_id);
				request.getSession().setAttribute("loginInfo", dto);
				request.getRequestDispatcher("member/myPage.jsp").forward(request, response);
			}else if(url.contentEquals("/modifyProc.mem")) {
				//----------------------------------------------------------------------------------------- 회원 정보 수정 처리
				String user_id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				String column = request.getParameter("target");
				String value = request.getParameter("value");

				int result = dao.modify(column, value,user_id);
				System.out.println(result);
				response.getWriter().append(value);
			}else if(url.contentEquals("/memberOutProc.mem")) {
				//----------------------------------------------------------------------------------------- 회원탈퇴 요청 처리
				int result = dao.delete(((MemberDTO)session.getAttribute("loginInfo")).getUser_id());
				// 탈퇴 안내 페이지가 있다면 response.sendRedirect("탈퇴 안내페이지");
				session.invalidate();
				response.sendRedirect("index.jsp");
			}else if(url.contentEquals("/loginProc.mem")) {
				//----------------------------------------------------------------------------------------- 로그인 요청 처리
				String user_id = request.getParameter("user_id");
				String user_password = EncryptUtils.getSHA512(request.getParameter("user_password"));
				
				boolean result = dao.isBlackList(user_id);
				if(result) {
					response.getWriter().append("blacklist");
				}else if(dao.isLoginOk(user_id, user_password)) {
					MemberDTO dto = dao.selectMemberById(user_id);
					request.getSession().setAttribute("loginInfo", dto);
					response.getWriter().append("correct");
				}else {
					response.getWriter().append("incorrect");
				}
			}else if(url.contentEquals("/logoutProc.mem")){
				//----------------------------------------------------------------------------------------- 로그아웃 요청 처리
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			}else if(url.contentEquals("/findAccount.mem")){
				response.sendRedirect("member/findIAccount.jsp");
			}else if(url.contentEquals("/checkPw.mem")) {
				String id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				String pw = EncryptUtils.getSHA512(request.getParameter("pw"));
				boolean result = dao.isPwOk(id,pw);
				response.getWriter().append(String.valueOf(result));
			}else if(url.contentEquals("/changePw.mem")) {
				String id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				String pw = EncryptUtils.getSHA512(request.getParameter("newpw"));
				int result = dao.changePw(id,pw);
			}else if(url.contentEquals("/idDuplCheck.mem")) {
				String id = request.getParameter("user_id");
				boolean result = dao.isIdAvailable(id);
				response.getWriter().append(String.valueOf(result));
			}else if(url.contentEquals("/mailAuthReq.mem")) {
				String email = request.getParameter("email");
				String code = MailUtils.generateCertChar();
				MailUtils.sendMail(email, "[뉴월] 이메일 인증번호 안내","이메일 인증 코드는<br>"+code+"<br>입니다. 가입페이지로 돌아가 입력해주세요.");
				System.out.println(email + " : " + code);
				request.getSession().setAttribute("mailAuthCode", code);
				new Thread() {
					public void run() {
						for(int timer = 30000;timer > 0;timer--) {
							try {Thread.sleep(1000);} 
							catch (InterruptedException e) {e.printStackTrace();}
						}
						request.getSession().removeAttribute("mailAuthCode");
					}
				}.start();
			}else if(url.contentEquals("/mailAuthProc.mem")) {
				String code = request.getParameter("code");
				String authCode = (String)request.getSession().getAttribute("mailAuthCode");
				if(authCode.contentEquals(code)) {
					response.getWriter().append("authorized");
				}else if(!authCode.contentEquals(code)) {
					response.getWriter().append("incorrect");
				}else {
					response.getWriter().append("expired");
				}
			}else if(url.contentEquals("/mailReAuthProc.mem")) {
				String id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				String code = request.getParameter("code");
				String email = request.getParameter("email");
				String authCode = (String)request.getSession().getAttribute("mailAuthCode");
				
				if(authCode == null) {
					response.getWriter().append("expired");
				}else if(authCode.contentEquals(code)) {
					response.getWriter().append("authorized");
					dao.changeEmail(id,email);
				}else if(!authCode.contentEquals(code)) {
					response.getWriter().append("incorrect");
				}
			}else if(url.contentEquals("/findID.mem")) {
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				
				String id = dao.findIdByNameEmail(name,email);
				response.getWriter().append(id);
			}else if(url.contentEquals("/findPW.mem")) {
				String id = request.getParameter("id");
				String email = request.getParameter("email");
				
				boolean result = dao.isIdEmailAccepted(id,email);
				String authCode = MailUtils.generateCertChar();
				if(result) {
					MailUtils.sendMail(email, "[뉴월] 임시 패스워드 발급", "발급된 임시 패스워드는 <br>" + authCode + "<br>입니다. 로그인 후 꼭 패스워드를 변경해 주세요.");
					String tempPW = EncryptUtils.getSHA512(authCode);
					dao.resetPW(id, tempPW);
					response.getWriter().append("confirm");
				}else {
					response.getWriter().append("incorrect");
				}
			}else if(url.contentEquals("/requestBlackReason.mem")) {
				String user_id = request.getParameter("user_id");
				String reason = dao.getBlackReason(user_id);
				response.setCharacterEncoding("utf8");
				response.getWriter().append(reason);
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
