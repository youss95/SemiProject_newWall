package com.kh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dao.AdminDAO;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dao.MainDAO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.ReviewDTO;

@WebServlet("*.main")
public class MainController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");


		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());

		MainDAO dao = MainDAO.getInstance();

		try {
			if(url.contentEquals("/mainAnimals.main")) {
				response.setContentType("text/html;charset=utf-8");
				
				Gson g = new Gson();
				List<AnimalDTO> list = dao.getMainAnimalsImg();
				String result = g.toJson(list);
				response.getWriter().append(result);
			}else if(url.contentEquals("/mainReviews.main")) {

				response.setContentType("text/html;charset=utf-8");
				
				Gson g = new Gson();
				List<ReviewDTO> list = dao.getMainReviews();
				String result = g.toJson(list);
				response.getWriter().append(result);
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
