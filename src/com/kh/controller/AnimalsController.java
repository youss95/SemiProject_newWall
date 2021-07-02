package com.kh.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.config.Script;
import com.kh.dao.AnimalDao;
import com.kh.dto.LostAnimalDto;
import com.kh.dto.ProtectionDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("*.lost")
public class AnimalsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request,response);
	}
	AnimalDao dao = AnimalDao.getInstance();
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		System.out.println(requestURI);
		System.out.println(ctxPath);
		System.out.println(url);
		try {
			
			if(url.equals("/lostAnimal.lost")) {
				String directory = request.getServletContext().getRealPath("/upload/lostAnimal");
				System.out.println(directory);
				int maxSize = 1024*1024*100;
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String encoding = "UTF-8";
				try {
					MultipartRequest multi =
							new MultipartRequest(request, directory, maxSize, encoding,
									new DefaultFileRenamePolicy());
					String lostName = multi.getParameter("lostName");
					int lostAge = Integer.parseInt(multi.getParameter("lostAge"));
					String lostKind = multi.getParameter("lostKind");
					String lostGender = multi.getParameter("lostGender");
					String lostDate = multi.getParameter("lostDate");
					String lostContent = multi.getParameter("lostContent");
					String lostAddr = multi.getParameter("addResult");
					String lostCategory = multi.getParameter("lostCategory");
					
					Enumeration files = multi.getFileNames();
					String str = (String)files.nextElement();
					String lostFileRealName = multi.getFilesystemName(str); //실제에 서버에 업로드가된 네임
					
					LostAnimalDto dto = new LostAnimalDto();
					dto.setLostName(lostName);
					dto.setLostAge(lostAge);
					dto.setLostKind(lostKind);
					dto.setLostGender(lostGender);
					dto.setLostDate(lostDate);
					dto.setLostContent(lostContent);
					dto.setLostCategory(lostCategory);
					dto.setLostAddr(lostAddr);
					dto.setFileRealName(lostFileRealName);
					System.out.println(dto.toString());
					int result = dao.LostAnimalFormWrite(dto);
					if(result>0) {
						response.setCharacterEncoding("UTF-8");
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();

						out.print("<script>");
						out.print("alert('성공');");
						out.print("window.location.href='lostAnimalMap.lost';"); 
						out.print("</script>");
						out.flush();
					}else {
						Script.back(response, "실패");
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
			} else if(url.equals("/lostAnimalMap.lost")) {
				List<LostAnimalDto> list = dao.showMap();
				System.out.println(list.toString());
				if(list != null) {
					request.setAttribute("mapList", list);
					RequestDispatcher dis = request.getRequestDispatcher("animal/lostAnimalMap.jsp");
					dis.forward(request, response);
				}
			} else if(url.equals("/protectBoard.lost")) {
				String directory = request.getServletContext().getRealPath("/upload/lostAnimal");
				System.out.println(directory);
				int maxSize = 1024*1024*100;
				
				String encoding = "UTF-8";
				try {
					MultipartRequest multi =
							new MultipartRequest(request, directory, maxSize, encoding,
									new DefaultFileRenamePolicy());
					
				
					String protectName = multi.getParameter("protectName");
					String protectKind = multi.getParameter("protectKind");
					String protectGender = multi.getParameter("protectGender");
					String protectAddr = multi.getParameter("addResult");
					String protectFindDate = multi.getParameter("protectFindDate");
					String protectContent = multi.getParameter("protectContent");
					
					
					
					Enumeration files = multi.getFileNames();
					String str = (String)files.nextElement();
					String protectImage1 = multi.getFilesystemName(str);
					
					
					String str2 = (String)files.nextElement();
					String protectImage2 = multi.getFilesystemName(str2);
					
					
					  ProtectionDto dto = new
					  ProtectionDto(protectName,protectKind,protectFindDate,protectAddr,
					  protectContent, protectGender,protectImage1,protectImage2);
					 
					System.out.println(dto.toString());
					int result = dao.protectWrite(dto);
					
					  if(result >0) { response.setCharacterEncoding("UTF-8");
					  response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
					  response.getWriter();
					  
					  out.print("<script>"); out.print("alert('성공');");
					  out.print("window.location.href='protectList.lost';");
					  out.print("</script>"); out.flush(); }
					 
				}catch(Exception e) {
					e.printStackTrace();
				}
			} else if(url.equals("protectList.lost")) {
				System.out.println("ㅇㅇ");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
