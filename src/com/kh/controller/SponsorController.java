package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dao.SponsorDAO;
import com.kh.dto.SponsorDTO;



@WebServlet("*.sp")
public class SponsorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset =utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println("cmd"+ cmd);
		
		try {
		SponsorDAO dao = SponsorDAO.getInstance();
		
		if(cmd.contentEquals("/sponsor.sp")) {
			System.out.println("후원 인포에서 클릭");
			System.out.println("컴퍼니 인풋 창 전환");
			response.sendRedirect("sponsor/sponsorInfo.jsp");
			
		}else if(cmd.contentEquals("/comInput.sp")) {
			System.out.println("후원 인포에서 클릭");
			System.out.println("컴퍼니 인풋 창 전환");
			response.sendRedirect("sponsor/sponsorComInput.jsp");
			
		}else if(cmd.contains("/PaymentCheck.sp")) {
			System.out.println("결제입력정보 담고 보이는 창으로 전환");
			
			int sp_amount = Integer.parseInt(request.getParameter("sp_amount")) ;
			System.out.println("sp_amount"+sp_amount);
			String sp_agecheck = request.getParameter("sp_agecheck");
			System.out.println("sp_agecheck"+sp_agecheck);
			//14up
			String sp_name_01 = request.getParameter("sp_name_01");
			System.out.println("sp_name_01"+sp_name_01);
			
			String ph1_01 = request.getParameter("sp_ph1_01");
			String ph2_01 = request.getParameter("sp_ph2_01");
			String ph3_01 = request.getParameter("sp_ph3_01");
			String sp_phone01 = ph1_01+ph2_01+ph3_01;
			System.out.println("sp_phone01"+sp_phone01);
			
			String bi_y_01 = request.getParameter("sp_bi_y_01");
			String bi_m_01 = request.getParameter("sp_bi_m_01");
			String bi_d_01 = request.getParameter("sp_bi_d_01");
			String sp_birth_01 = bi_y_01+bi_m_01+bi_d_01;
			System.out.println("sp_birth_01"+sp_birth_01);
			
			//14down
			String sp_name_02 = request.getParameter("sp_name_02");
			System.out.println("sp_name_02 : "+sp_name_02);
			
			String ph1_02 = request.getParameter("sp_ph1_02");
			String ph2_02 = request.getParameter("sp_ph2_02");
			String ph3_02 = request.getParameter("sp_ph3_02");
			String sp_phone_02 = ph1_02+ph2_02+ph3_02;
			System.out.println("sp_phone_02 : "+sp_phone_02);
			
			String bi_y_02 = request.getParameter("sp_bi_y_02");
			String bi_m_02 = request.getParameter("sp_bi_m_02");
			String bi_d_02= request.getParameter("sp_bi_d_02");
			String sp_birth_02 = bi_y_02+bi_m_02+bi_d_02;
			System.out.println("sp_birth_02 : "+sp_birth_02);
			
			
			String sp_yname = request.getParameter("sp_yname");
			System.out.println("sp_yname : "+sp_yname);
			
			String ybi_y = request.getParameter("sp_ybi_y");
			String ybi_m = request.getParameter("sp_ybi_m");
			String ybi_d = request.getParameter("sp_ybi_d");
			String sp_ybirth = ybi_y+ybi_m+ybi_d;
			System.out.println("sp_ybirth : "+sp_ybirth);
			
//공통
			String sp_email = request.getParameter("sp_email");
			System.out.println("sp_email"+sp_email);
			String sp_postcode = request.getParameter("sp_postcode");
			String sp_address1 = request.getParameter("sp_address1");
			String sp_address2 = request.getParameter("sp_address2");
			System.out.println("주소 : "+sp_postcode+":"+sp_address1+":"+sp_address2);
			
			String sp_category = request.getParameter("sp_category");
			System.out.println("sp_category : "+sp_category);
			String sp_terms01 = request.getParameter("sp_terms01");
			String sp_terms02 = request.getParameter("sp_terms02");
			System.out.println("sp_terms0 : "+sp_terms01+"sp_terms02 : "+sp_terms02);
			
			String sp_idcheck = request.getParameter("sp_idcheck");
			String sp_mb_id = request.getParameter("sp_mb_id");
			System.out.println("sp_idcheck : "+sp_idcheck+"sp_mb_id : "+sp_mb_id);
			
			if(sp_agecheck.contentEquals("N")) {
//				System.out.println("1"+sp_amount);
//				System.out.println("1"+sp_agecheck);
//				System.out.println("1"+sp_name_01);
//				System.out.println("1"+sp_phone01);
//				System.out.println("1"+sp_birth_01);
//				
//				System.out.println("3"+sp_email+":"+sp_category+":"+sp_terms01+":"+sp_terms02);
//				System.out.println("4"+sp_idcheck+":"+sp_mb_id);
//				
				
//				SP_DTO dto = new  SP_DTO(0, sp_amount, sp_category, sp_agecheck,
//						sp_name_01, sp_phone01, sp_birth_01, String sponsor_yname,
//						String sponsor_ybirth, sp_email, String sponsor_postcode, String sponsor_address1,
//						String sponsor_address2, String sponsor_apply_num, sp_terms01, sp_terms02,
//						sp_mb_id, Date sponsor_date)
						//아이디 널인거 짜로 빼줘야 널오류 안날듯
				
			}else if(sp_agecheck.contentEquals("Y")) {
//				System.out.println("2"+sp_amount);
//				System.out.println("2"+sp_agecheck);
//				System.out.println("2"+sp_name_02);
//				System.out.println("2"+sp_phone_02);
//				System.out.println("2"+sp_birth_02);
//				
//				System.out.println("2_1"+sp_yname);
//				System.out.println("2_1"+sp_ybirth);
//				
//				System.out.println("3"+sp_email+":"+sp_category+":"+sp_terms01+":"+sp_terms02);
//				System.out.println("4"+sp_idcheck+":"+sp_mb_id);
			} 
			
	

			SponsorDTO dto = new SponsorDTO(sp_amount, sp_agecheck,sp_name_02, sp_phone_02, sp_birth_02, sp_yname, sp_ybirth, sp_email, sp_terms01, sp_terms02, sp_mb_id);
			
			//dao.sp_inp(dto);
			
			request.getSession().setAttribute("sponsor", dto);
			
			
			//여기서 이제 값넘겨서 페이먼트 체크에서 띄우고 그값으로 결제 성공하면 마무리 
			
			//request.setAttribute("result", result);
			//request.getRequestDispatcher("sponsor/sp_paymentCheck.jsp").forward(request, response);
			response.sendRedirect("sponsor/sponsorPayment.jsp");
		}
		}catch(Exception e) {
			e.printStackTrace();
//			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
