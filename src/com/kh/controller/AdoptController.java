package com.kh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kh.config.PageConfig;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;

@WebServlet("*.apt")
public class AdoptController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		
		System.out.println("requestURI" + requestURI);
		System.out.println("ctxPath" + ctxPath);
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		
		try {
			if(url.contentEquals("/adoptList.apt")) {
				System.out.println("입양 동물 리스트");
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				System.out.println("cpage : " + cpage);
				String category = request.getParameter("category");
				String gender = request.getParameter("gender");
				System.out.println("gender : " + gender);
				String weight = request.getParameter("weight");
				System.out.println("weight : "+ weight);
				String age = request.getParameter("age");
				System.out.println("age : "+ age);
				String character = request.getParameter("character");
				String name = request.getParameter("an_name");
				int endNum = cpage * PageConfig.ADOPT_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ADOPT_RECORD_COUNT_PER_PAGE - 1);
				
				AnimalDTO filter = new AnimalDTO(name, category, gender, age, weight, character);
				List<AnimalDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, filter);
				AnimalDTO dto;
				if(category == null || category.contentEquals("")) {
					list = adoptdao.getPageList(startNum, endNum);
				
					System.out.println("검색조건없이 초기로드");
				}else{ // 검색 값이 있을 경우
					System.out.println("검색 하고나서");
					dto = new AnimalDTO(name, category, gender, age, weight, character);
					list = adoptdao.getPageList(startNum, endNum, dto);
				}
				
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				System.out.println("pageNavi : "+ pageNavi);
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
				System.out.println("파일갯수" + files.size());
				
				request.setAttribute("info", info);
				request.setAttribute("files", files);
				request.getRequestDispatcher("adopt/adoptDetail.jsp").forward(request, response);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
