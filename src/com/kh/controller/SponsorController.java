package com.kh.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.dao.AdoptionDAO;
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
			AdoptionDAO adoptdao = AdoptionDAO.getInstance();

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
				int sp_amount = Integer.parseInt(request.getParameter("sp_amount")) ;//
				System.out.println("sp_amount"+sp_amount);
				String sp_category = request.getParameter("sp_category");//분야이거 강아지 이름이뜨는데 결제족으로 넘어가지를 않음 확인***
				System.out.println("sp_category : "+sp_category);
				String sp_agecheck = request.getParameter("sp_agecheck");//sp_agecheck
				System.out.println("sp_agecheck"+sp_agecheck);
				//14up
				String sp_name_01 = request.getParameter("sp_name_01");//sp_agecheck  N - 본인 
				System.out.println("sp_name_01"+sp_name_01);

				String ph1_01 = request.getParameter("sp_ph1_01");
				String ph2_01 = request.getParameter("sp_ph2_01");
				String ph3_01 = request.getParameter("sp_ph3_01");
				String sp_phone01 = ph1_01+ph2_01+ph3_01; //sp_agecheck   N - 본인 
				System.out.println("sp_phone01"+sp_phone01);

				String bi_y_01 = request.getParameter("sp_bi_y_01");
				String bi_m_01 = request.getParameter("sp_bi_m_01");
				String bi_d_01 = request.getParameter("sp_bi_d_01");
				String sp_birth_01 = bi_y_01+bi_m_01+bi_d_01;//sp_agecheck   N - 본인 
				System.out.println("sp_birth_01"+sp_birth_01);

				//14down
				String sp_name_02 = request.getParameter("sp_name_02");
				System.out.println("sp_name_02 : "+sp_name_02);//sp_agecheck Y - 보호자 

				String ph1_02 = request.getParameter("sp_ph1_02");
				String ph2_02 = request.getParameter("sp_ph2_02");
				String ph3_02 = request.getParameter("sp_ph3_02");
				String sp_phone_02 = ph1_02+ph2_02+ph3_02;//sp_agecheck Y - 보호자
				System.out.println("sp_phone_02 : "+sp_phone_02);

				String bi_y_02 = request.getParameter("sp_bi_y_02");
				String bi_m_02 = request.getParameter("sp_bi_m_02");
				String bi_d_02= request.getParameter("sp_bi_d_02");
				String sp_birth_02 = bi_y_02+bi_m_02+bi_d_02;//sp_agecheck Y - 보호자
				System.out.println("sp_birth_02 : "+sp_birth_02);


				String sp_yname = request.getParameter("sp_yname");
				System.out.println("sp_yname : "+sp_yname); //sp_agecheck Y 후원자 

				String ybi_y = request.getParameter("sp_ybi_y");
				String ybi_m = request.getParameter("sp_ybi_m");
				String ybi_d = request.getParameter("sp_ybi_d");
				String sp_ybirth = ybi_y+ybi_m+ybi_d; //sp_agecheck Y 후원자 
				System.out.println("sp_ybirth : "+sp_ybirth);

				//공통
				String sp_email = request.getParameter("sp_email");//
				System.out.println("sp_email"+sp_email);
				String sp_postcode = request.getParameter("sp_postcode");//
				String sp_address1 = request.getParameter("sp_address1");//
				String sp_address2 = request.getParameter("sp_address2");//
				System.out.println("주소 : "+sp_postcode+":"+sp_address1+":"+sp_address2);

				String sp_terms01 = request.getParameter("sp_terms01");
				String sp_terms02 = request.getParameter("sp_terms02");
				System.out.println("sp_terms0 : "+sp_terms01+"sp_terms02 : "+sp_terms02);

				String sp_idcheck = request.getParameter("sp_idcheck");//유무만체크 있으면나오게
				String sp_mb_id = request.getParameter("sp_mb_id");
				System.out.println("sp_idcheck : "+sp_idcheck+"sp_mb_id : "+sp_mb_id);

				if(sp_agecheck.contentEquals("N")) {
					//성인
					if(sp_idcheck.contentEquals("N")) {
						SponsorDTO dto = new  SponsorDTO(0, sp_amount, sp_category, sp_agecheck,
								sp_name_01, sp_phone01, sp_birth_01, null,
								null, sp_email, sp_postcode, sp_address1,
								sp_address2, null, sp_terms01, sp_terms02,
								null, null);

						request.getSession().setAttribute("sponsor", dto);
						
						request.setAttribute("sp_idcheck", sp_idcheck);
						request.getRequestDispatcher("sponsor/sponsorPayment.jsp").forward(request, response);	
						
						//dao.sp_inp(dto);
						//response.sendRedirect("sponsor/sponsorPayment.jsp");
					}else if(sp_idcheck.contentEquals("Y")) {
						//아이디 널인거 짜로 빼줘야 널오류 안날듯
						SponsorDTO dto = new  SponsorDTO(0, sp_amount, sp_category, sp_agecheck,
								sp_name_01, sp_phone01, sp_birth_01, null,
								null, sp_email, sp_postcode, sp_address1,
								sp_address2, null, sp_terms01, sp_terms02,
								sp_mb_id, null);
						request.getSession().setAttribute("sponsor", dto);
						
						request.setAttribute("sp_idcheck", sp_idcheck);
						request.getRequestDispatcher("sponsor/sponsorPayment.jsp").forward(request, response);	
						
						//dao.sp_inp(dto);
						//response.sendRedirect("sponsor/sponsorPayment.jsp");
					}

				}else if(sp_agecheck.contentEquals("Y")) {
					//청소년
					if(sp_idcheck.contentEquals("N")) {

						SponsorDTO dto = new  SponsorDTO(0, sp_amount, sp_category, sp_agecheck,
								sp_name_02, sp_phone_02, sp_birth_02, sp_yname,
								sp_ybirth, sp_email, sp_postcode, sp_address1,
								sp_address2, null, sp_terms01, sp_terms02,
								null, null);
						request.getSession().setAttribute("sponsor", dto);
						
						request.setAttribute("sp_idcheck", sp_idcheck);
						request.getRequestDispatcher("sponsor/sponsorPayment.jsp").forward(request, response);	
						
						//dao.sp_inp(dto);
						//response.sendRedirect("sponsor/sponsorPayment.jsp");
					}else if(sp_idcheck.contentEquals("Y")) {
						SponsorDTO dto = new  SponsorDTO(0, sp_amount, sp_category, sp_agecheck,
								sp_name_02, sp_phone_02, sp_birth_02, sp_yname,
								sp_ybirth, sp_email, sp_postcode, sp_address1,
								sp_address2, null, sp_terms01, sp_terms02,
								sp_mb_id, null);
						request.getSession().setAttribute("sponsor", dto);
						
						request.setAttribute("sp_idcheck", sp_idcheck);
						request.getRequestDispatcher("sponsor/sponsorPayment.jsp").forward(request, response);	
						
						//dao.sp_inp(dto);
						//response.sendRedirect("sponsor/sponsorPayment.jsp");
					}
				}
			}else if(cmd.contains("/PaymentComplete.sp")) {
				System.out.println("결제완료");
				String apply_num = request.getParameter("apply_num");
				SponsorDTO dto =  (SponsorDTO)request.getSession().getAttribute("sponsor");
				dao.sp_inp(dto,apply_num);
				response.sendRedirect("sponsor/sponsorInfo.jsp");
			}else if(cmd.contains("/oneOnOne.sp")) {
				System.out.println("일대일 페이지로");
				

			}else if(cmd.contains("/guardian.sp")) {
				System.out.println("임보자 페이지로");

			}else if (cmd.contains("/directInput.sp")) {
				System.out.println("일단 일대일다이렉트 시 입력창");
				String code_seq = request.getParameter("code_seq");
				String one_name = adoptdao.getAnimalName(code_seq);
				String p_pname = "일대일 후원_"+code_seq +"_"+ one_name;
				
				request.setAttribute("p_name", p_pname);
				request.getRequestDispatcher("sponsor/sponsorDirectInput.jsp").forward(request, response);	
			}else if (cmd.contains("/protectInput.sp")) {
				System.out.println("일단 임보후원 입력창");
				String protect_no = request.getParameter("protect_no");
				String protect_name = request.getParameter("protect_name");
				String p_pname = "임시보호 후원_"+protect_no +"_"+ protect_name;
				
				request.setAttribute("p_name", p_pname);
				request.getRequestDispatcher("sponsor/sponsorDirectInput.jsp").forward(request, response);	
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
