package com.kh.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.dao.NewsCommentsDAO;
import com.kh.dto.MemberDTO;
import com.kh.dto.NewsCommentsDTO;



@WebServlet("*.necmt")
public class NewsCommenstController extends HttpServlet {
	private String XSSFilter(String target) {
		if (target != null) {
			target = target.replaceAll("<", "&lt;");
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");

		}
		return target;
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8;");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String url = requestURI.substring(ctxPath.length());
		System.out.println("유형 : " + url);

		
		try {
			NewsCommentsDTO dto = new NewsCommentsDTO();
			NewsCommentsDAO dao = NewsCommentsDAO.getInstance();
			HttpSession session = request.getSession();
			
			if (url.contentEquals("/newsWrite.necmt")) {
				System.out.println(request.getParameter("user_id"));
				String writer = request.getParameter("user_id");
				System.out.println(writer);

				String comments = request.getParameter("nrp_contents");
				comments = XSSFilter(comments);		
				
				String parent = request.getParameter("parent");
								
				dto = new NewsCommentsDTO(0,writer,comments,null,parent);
				dao.insert(dto);
				
				List<NewsCommentsDTO> list = dao.commentsAll(parent);
								
				request.setAttribute("necmtlist", list);
				response.sendRedirect("newsView.news?news_seq="+parent);
				
			}else if (url.contentEquals("/newsAdminWrite.necmt")) {
				
				String writer = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("admLoginInfo");
				if(session_chk != null) { 
					writer = (session_chk).getName();
				}else{
					response.sendRedirect("admin/adminLogin.jsp");
					return;
				}

				String comments = request.getParameter("nrp_contents");
				comments = XSSFilter(comments);		
				
				String parent = request.getParameter("parent");
								
				dto = new NewsCommentsDTO(0,writer,comments,null,parent);
				dao.insert(dto);
				
				List<NewsCommentsDTO> list = dao.commentsAll(parent);
								
				request.setAttribute("necmtlist", list);
				response.sendRedirect("newsInfoView.newsAdm?news_seq="+parent);
				
			}else if(url.contentEquals("/nedelete.necmt")){
				int seq = Integer.parseInt(request.getParameter("nrp_seq"));
				
				String parent = request.getParameter("nrp_parent");
				
				int result = dao.delete(seq);
				
				response.sendRedirect("newsView.news?news_seq="+parent);
			
			}else if(url.contentEquals("/neAdmindelete.necmt")){
				int seq = Integer.parseInt(request.getParameter("nrp_seq"));
				
				String parent = request.getParameter("nrp_parent");
				
				int result = dao.delete(seq);
				
				response.sendRedirect("newsInfoView.newsAdm?news_seq="+parent);
			
			}else if(url.contentEquals("/modifyReply.necmt")){
				int seq = Integer.parseInt(request.getParameter("nrp_seq"));
				
				String comments = request.getParameter("hiddenCon");
				comments = XSSFilter(comments);
				
				String parent = request.getParameter("nrp_parent");
				
				dao.modify(seq, comments);
				
				response.sendRedirect("newsView.news?news_seq="+parent);
			}else if(url.contentEquals("/modifyAdminReply.necmt")){
				int seq = Integer.parseInt(request.getParameter("nrp_seq"));
				
				String comments = request.getParameter("hiddenCon");
				comments = XSSFilter(comments);
				
				String parent = request.getParameter("nrp_parent");
				
				dao.modify(seq, comments);
				
				response.sendRedirect("newsInfoView.newsAdm?news_seq="+parent);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
