package com.kh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
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
		
		System.out.println("requestURI" + requestURI);
		System.out.println("ctxPath" + ctxPath);
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		
		try {
			if(url.contentEquals("/animalList.apt")) {
				System.out.println("들어옴");

				List<AnimalDTO> list = adoptdao.getAnimalList();
//				List<AnimalFilesDTO> files = adoptdao.getAnimalImgs();
				request.setAttribute("list", list);
				request.getRequestDispatcher("adopt/adoptList.jsp").forward(request, response);
				
//				각 정보에 맞춰서 이미지 썸네일 나오게 해야함 // 포토 항목에 sysname으로 들어갈것 컬럼 하나 추가 
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
