package kh.mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.mvc.dao.NoCommentsDAO;
import kh.mvc.dto.NoCommentsDTO;

@WebServlet("*.nocmt")
public class NoCommentsController extends HttpServlet {
	private String XSSFilter(String target) {
		if (target != null) {
			target = target.replaceAll("<", "&lt;");
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");

		}
		return target;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8;");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String url = requestURI.substring(ctxPath.length());
		System.out.println("유형 : " + url);

		
		try {
			NoCommentsDTO dto = new NoCommentsDTO();
			NoCommentsDAO dao = NoCommentsDAO.getInstance();
			
			if (url.contentEquals("/nowrite.nocmt")) {
				String writer = "admin";

				String comments = request.getParameter("ntrp_contents");
				comments = XSSFilter(comments);				
				
				int parent = Integer.parseInt(request.getParameter("parent"));
								
				dto = new NoCommentsDTO(0,writer,comments,null,parent);
				dao.insert(dto);
				
				List<NoCommentsDTO> list = dao.commentsAll(parent);
								
				request.setAttribute("nocmtlist", list);
				response.sendRedirect("noticeView.notice?notice_seq="+parent);
				
			}else if(url.contentEquals("/nodelete.nocmt")){
				int seq = Integer.parseInt(request.getParameter("ntrp_seq"));
				System.out.println(seq);
				int parent = Integer.parseInt(request.getParameter("ntrp_parent"));
				System.out.println(parent);
				int result = dao.delete(seq);
				
				request.getRequestDispatcher("noticeView.notice?notice_seq="+parent).forward(request, response);
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
