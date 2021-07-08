package com.kh.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kh.config.PageConfig;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;

@WebServlet("*.apt")
public class AdoptController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();

		try {
			if(url.contentEquals("/adoptList.apt")) {
				System.out.println("입양 동물 리스트");
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");
				String gender = request.getParameter("gender");
				String weight = request.getParameter("weight");
				String age = request.getParameter("age");
				String character = request.getParameter("character");
				String name = request.getParameter("an_name");
				int endNum = cpage * PageConfig.ADOPT_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ADOPT_RECORD_COUNT_PER_PAGE - 1);
				
				AnimalDTO filter = new AnimalDTO(name, category, gender, age, weight, character);
				List<AnimalDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, filter);
				AnimalDTO dto;
				if(category == null || category.contentEquals("")) { //검색조건없이 초기로드
					list = adoptdao.getPageList(startNum, endNum);
				}else{ // 검색 값이 있을 경우
					dto = new AnimalDTO(name, category, gender, age, weight, character);
					list = adoptdao.getPageList(startNum, endNum, dto);
				}
				
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("h_category", category);
				request.setAttribute("h_gender", gender);
				request.setAttribute("h_weight", weight);
				request.setAttribute("h_age", age);
				request.setAttribute("h_character", character);
				request.setAttribute("an_name", name);
				request.getRequestDispatcher("adopt/adoptList.jsp").forward(request, response);
				
			}else if(url.contentEquals("/adoptDetail.apt")) {
				System.out.println("상세");
				
				String code_seq = request.getParameter("code_seq");
				
				AnimalDTO info = adoptdao.getAnimalInfo(code_seq);
				List<AnimalFilesDTO> files = adoptdao.getAnimalFiles(code_seq);
				
				request.setAttribute("info", info);
				request.setAttribute("files", files);
				request.getRequestDispatcher("adopt/adoptDetail.jsp").forward(request, response);
				
			}else if(url.contentEquals("/adoptRegForm.apt")) { 
				System.out.println("입양신청");		
				String code_seq = request.getParameter("code_seq");
				String p_name = adoptdao.getAnimalName(code_seq);
				
				request.setAttribute("pet_name", p_name);
				request.setAttribute("code_seq", code_seq);
				request.getRequestDispatcher("adopt/adoptRegForm.jsp").forward(request, response);	
				
			}else if(url.contentEquals("/adoptReg.apt")) {
				System.out.println("입양신청버튼 클릭");
				
				String code_seq = request.getParameter("code_seq");
				String user_id = request.getParameter("user_id");
				String p_name = request.getParameter("p_name");
				String p_phone01 = request.getParameter("p_phone01");
				String p_phone02 = request.getParameter("p_phone02");
				String p_email = request.getParameter("p_email");
				String p_gender = request.getParameter("p_gender");
				String p_age = request.getParameter("p_age");
				String p_address = request.getParameter("p_address");
				String p_mstatus = request.getParameter("p_mstatus");
				String p_arg = request.getParameter("p_arg");
				String q01_aname = request.getParameter("pet_name");
				String q02_alternative = request.getParameter("alternative");
				String q03_time_to_worry = request.getParameter("time_to_worry");
				String q04_reason = request.getParameter("reason");
				String q05_family_member = request.getParameter("family_member");
				String q06_family_arg = request.getParameter("family_arg");
				String q07_pet = request.getParameter("pet");
				String q08_experience = request.getParameter("experience");
				String q09_housing_type = request.getParameter("housing_type");
				String q10_host_consent = request.getParameter("host_consent");
				String q11_impossible_situation = request.getParameter("impossible_situation");
				String q12_lodging_problem = request.getParameter("lodging_problem");
				String q13_payment_arg = request.getParameter("payment_arg");
				String q14_neutered_arg = request.getParameter("neutered_arg");
				String q15_visit_agr = request.getParameter("visit_agr");
				String q16_adopt_arg = request.getParameter("adopt_arg");
				
				AdoptionDTO dto = new AdoptionDTO(0, code_seq, null, user_id, p_name, p_phone01, p_phone02, p_email, p_gender, p_age, p_address, p_mstatus, p_arg, q01_aname, q02_alternative, q03_time_to_worry, q04_reason, q05_family_member, q06_family_arg, q07_pet, q08_experience, q09_housing_type, q10_host_consent, q11_impossible_situation, q12_lodging_problem, q13_payment_arg, q14_neutered_arg, q15_visit_agr, q16_adopt_arg);
				
				int result = adoptdao.insertRegForm(dto);
				
				request.setAttribute("code_seq", code_seq);
				request.getRequestDispatcher("/adoptDetail.apt").forward(request, response);	
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
