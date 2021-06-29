package com.kh.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.dao.AdoptionDAO;
import com.kh.dto.AdoptionDTO;


@WebServlet("*.adm")
public class AdminController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		
		AdoptionDAO adptdao = AdoptionDAO.getInstance();
		
		try {
			if(url.contentEquals("/adoptionList.adm")) {
				response.setContentType("text/html;charset=utf-8");
				
				Gson g = new Gson();
				List<AdoptionDTO> list = adptdao.getAdoptionList();

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
