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

import com.google.gson.Gson;
import com.kh.config.PageConfig;
import com.kh.config.Script;
import com.kh.dao.AnimalDAO;
import com.kh.dto.AnimalMapCountDTO;
import com.kh.dto.LostAnimalDTO;
import com.kh.dto.ProtectBoardDTO;
import com.kh.dto.ProtectDetailDTO;
import com.kh.dto.ProtectReplyDTO;
import com.kh.dto.ProtectionDTO;
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
	AnimalDAO dao = AnimalDAO.getInstance();
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
					String lostWriter = multi.getParameter("lostWriter");
					
					Enumeration files = multi.getFileNames();
					String str = (String)files.nextElement();
					String lostFileRealName = multi.getFilesystemName(str); //실제에 서버에 업로드가된 네임
					
					LostAnimalDTO dto = new LostAnimalDTO();
					dto.setLostName(lostName);
					dto.setLostAge(lostAge);
					dto.setLostKind(lostKind);
					dto.setLostGender(lostGender);
					dto.setLostDate(lostDate);
					dto.setLostContent(lostContent);
					dto.setLostCategory(lostCategory);
					dto.setLostAddr(lostAddr);
					dto.setLostWriter(lostWriter);
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
				String lostWriter = request.getParameter("lostWriter");
				List<LostAnimalDTO> list = dao.showMap();
				AnimalMapCountDTO dto = new AnimalMapCountDTO();
				int today = dao.todayCount();
				int total = dao.totalCount();
				int dogCount = dao.dogCount();
				int catCount = dao.catCount();
				System.out.println("오늘" +today);
				System.out.println("총" +total);
				System.out.println("개"+dogCount);
				dto.setTodayCount(today);
				dto.setTotalCount(total);
				dto.setDogCount(dogCount);
				dto.setCatCount(catCount);
				request.setAttribute("counts", dto);
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
					String protectWriter = multi.getParameter("protectWriter");
					
					
					Enumeration files = multi.getFileNames();
					String str = (String)files.nextElement();
					String protectImage1 = multi.getFilesystemName(str);
					
					
					String str2 = (String)files.nextElement();
					String protectImage2 = multi.getFilesystemName(str2);
					
					
					  ProtectionDTO dto = new
					  ProtectionDTO(protectName,protectKind,protectFindDate,protectAddr,
					  protectContent, protectGender,protectImage1,protectImage2);
					 
					System.out.println(dto.toString());
					int result = dao.protectWrite(dto,protectWriter);
					
					  if(result >0) { response.setCharacterEncoding("UTF-8");
					  response.setContentType("text/html; charset=UTF-8"); PrintWriter out =
					  response.getWriter();
					  
					  out.print("<script>"); out.print("alert('성공');");
					  out.print("window.location.href='protectList.lost?page=1';");
					  out.print("</script>"); out.flush(); }
					 
				}catch(Exception e) {
					e.printStackTrace();
				}
			} else if(url.equals("/protectList.lost")) {
				//Gson g = new Gson();
				int page = Integer.parseInt(request.getParameter("page"));
				System.out.println(page);
				int count = PageConfig.PROTECT_COUNT_PER_PAGE;
				List<ProtectBoardDTO> list = AnimalDAO.getList(page,count);
				
				System.out.println(list.toString());
				
					request.setAttribute("protectList", list);
					
					
					
					 RequestDispatcher dis =
					 request.getRequestDispatcher("animal/protectionBoard.jsp");
					 dis.forward(request, response);
					 
					 
				
			}else if(url.equals("/protectListIndex.lost")) {
				//Gson g = new Gson();
				Gson g = new Gson();
				int page = Integer.parseInt(request.getParameter("page"));
				int count = PageConfig.PROTECT_COUNT_PER_PAGE;
				System.out.println(page);
				List<ProtectBoardDTO> list = AnimalDAO.getList(page,count);
				String result = g.toJson(list);
				System.out.println("result" + result);
				response.setContentType("text/html; charset=UTF-8");
				
				response.getWriter().append(result);
				System.out.println(list.toString());
			}else if(url.equals("/proList.lost")) {
				Gson g = new Gson();
				int page = Integer.parseInt(request.getParameter("page"));
				int count = PageConfig.PROTECT_COUNT_PER_PAGE;
				System.out.println(page);
				List<ProtectBoardDTO> list = AnimalDAO.getList(page,count);
				String result = g.toJson(list);
				System.out.println("result" + result);
				response.setContentType("text/html; charset=UTF-8");
				
				response.getWriter().append(result);
				System.out.println(list.toString());
			}else if(url.equals("/protectDetail.lost")) {
				int protectNo = Integer.parseInt(request.getParameter("protectNo"));
				int page = Integer.parseInt(request.getParameter("page"));
				int result = dao.getViewCount(protectNo);
				int boardCount = dao.getAllReplyCount(protectNo);
				System.out.println("boardcount"+boardCount);
				List<ProtectReplyDTO> list = dao.getReplyList(protectNo,page);
				int lastPage = (int)Math.ceil(boardCount/10.0);
				int nowGrp = (int)(Math.ceil((double)page/10));
				int startNum = ((nowGrp-1) * 10) +1 ;
				int lastNum = (nowGrp * 10);
				int endPage = lastNum > lastPage ? lastPage : lastNum;
				System.out.println(lastPage);
				if(result>0) {
					ProtectDetailDTO dto = dao.getDetail(protectNo);
					System.out.println("dto:" + dto.toString());
					request.setAttribute("lastPage", lastPage);
					request.setAttribute("replyList", list);
					request.setAttribute("protectDetail", dto);
					request.setAttribute("lastNum", endPage);
					request.setAttribute("startNum", startNum);
					RequestDispatcher dis = request.getRequestDispatcher("animal/protectDetail.jsp");
					dis.forward(request, response);
				}else {
					Script.back(response, "조회수 실패");
				}
			}else if(url.equals("/comment.lost")) {
				Gson g = new Gson();
				String protectWriter = request.getParameter("protectWriter");
				
				
				int boardNo = Integer.parseInt(request.getParameter("boardNo"));
				String replyCon = request.getParameter("replyCon");
				
				ProtectReplyDTO dto = new ProtectReplyDTO();
				dto.setProtectWriter(protectWriter);
				dto.setBoardNo(boardNo);
				dto.setReplyCon(replyCon);
				System.out.println(dto.toString());
			
				int result = dao.addReply(dto);
				dto = dao.findById(boardNo);
				String data = g.toJson(dto);
				if(result==1) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					response.getWriter().append(data);
				
				}
				
					//댓글 삭제
			}else if(url.equals("/replyDel.lost")) {
				
				int replyNo = Integer.parseInt(request.getParameter("replyNo"));
				System.out.println("몇번"+replyNo);
				int result = dao.replyDel(replyNo);
				System.out.println(result);
				if(result==1) {
					response.getWriter().append(result+"");
				}		
				//로스트 맵 목록
			}else if(url.equals("/lostMapList.lost")) {
				int page = Integer.parseInt(request.getParameter("page"));
				int count = PageConfig.LOST_COUNT_PER_PAGE;
				System.out.println("page" + page);
				List<LostAnimalDTO> list = dao.mapList(page,count);
				int boardCount = dao.getAllCount();
				System.out.println(boardCount);
				int lastPage = (int)Math.ceil(boardCount/6.0);
				System.out.println("last"+lastPage);
				double currentPercent = (double)(page-1)/(lastPage-1)*100.0;
				
				System.out.println(currentPercent);
				System.out.println("맵"+list.toString());
				request.setAttribute("lastPage", lastPage);
				request.setAttribute("mapList", list);
				request.setAttribute("currentPercent", currentPercent);
				RequestDispatcher dis = request.getRequestDispatcher("animal/lostMapList.jsp");
				dis.forward(request, response);
				
			}else if(url.equals("/protectUpdateForm.lost")) {
				int protectNo = Integer.parseInt(request.getParameter("protectNo"));
				ProtectDetailDTO dto = dao.getDetail(protectNo);
				request.setAttribute("protectNo", protectNo);
				request.setAttribute("protectDetail", dto);
				RequestDispatcher dis = request.getRequestDispatcher("animal/protectUpdateForm.jsp");
				dis.forward(request, response);
			}else if(url.equals("/protectUpdate.lost")) {
				
				String directory = request.getServletContext().getRealPath("/upload/lostAnimal");
				System.out.println(directory);
				int maxSize = 1024*1024*100;
				
				String encoding = "UTF-8";
				try {
					MultipartRequest multi =
							new MultipartRequest(request, directory, maxSize, encoding,
									new DefaultFileRenamePolicy());
					
					int protectNo = Integer.parseInt(multi.getParameter("protectNo"));
					System.out.println(protectNo);
					String protectName = multi.getParameter("protectName");
					System.out.println(protectName);
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
					
					
					  ProtectionDTO dto = new
					  ProtectionDTO(protectName,protectKind,protectFindDate,protectAddr,
					  protectContent, protectGender,protectImage1,protectImage2);
					 
					System.out.println(dto.toString());
					int result = dao.protectUpdate(dto,protectNo);
					System.out.println();
					  if(result >0) { response.setCharacterEncoding("UTF-8");
					
					  response.sendRedirect("protectDetail.lost?page=1&protectNo="+protectNo);
					
				 }
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				}else if(url.equals("/protectDelete.lost")) {
				int protectNo = Integer.parseInt(request.getParameter("protectNo"));
				int result = AnimalDAO.protectDelete(protectNo);
				if(result>0) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.print("<script>");
					out.print("alert('삭제 성공');");
					out.print("window.location.href='protectList.lost?page=1';"); 
					out.print("</script>");
					out.flush();
				}
			}else if(url.equals("/lostDelete.lost")) {
				int lostNo = Integer.parseInt(request.getParameter("lostNo"));
				int result = dao.lostDelete(lostNo);
				if(result>0) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.print("<script>");
					out.print("alert('삭제 성공');");
					out.print("window.location.href='lostMapList.lost?page=1';"); 
					out.print("</script>");
					out.flush();
				}
			}else if(url.equals("/lostUpdateForm.lost")) {
				int lostNo = Integer.parseInt(request.getParameter("lostNo"));
				LostAnimalDTO dto = dao.lostList(lostNo);
				request.setAttribute("lostNo", lostNo);
				request.setAttribute("lostDetail", dto);
				RequestDispatcher dis = request.getRequestDispatcher("animal/lostAnimalUpdateForm.jsp");
				dis.forward(request, response);
			}else if(url.equals("/lostUpdate.lost")) {
				String directory = request.getServletContext().getRealPath("/upload/lostAnimal");
				System.out.println(directory);
				int maxSize = 1024*1024*100;
				
				String encoding = "UTF-8";
				try {
					MultipartRequest multi =
							new MultipartRequest(request, directory, maxSize, encoding,
									new DefaultFileRenamePolicy());
					
					int lostNo = Integer.parseInt(multi.getParameter("lostNo"));
					
					String lostName = multi.getParameter("lostName");
					System.out.println(lostName);
					String lostCategory = multi.getParameter("lostCategory");
					int lostAge = Integer.parseInt(multi.getParameter("lostAge"));
					String lostKind = multi.getParameter("lostKind");
					String lostGender = multi.getParameter("lostGender");
					String lostAddr = multi.getParameter("addResult");
					String lostDate = multi.getParameter("lostDate");
					String lostContent = multi.getParameter("lostContent");
					String lostWriter = multi.getParameter("lostWriter");
					
					Enumeration files = multi.getFileNames();
					String str = (String)files.nextElement();
					String lostFileRealName = multi.getFilesystemName(str); //실제에 서버에 업로드가된 네임
					
					LostAnimalDTO dto = new LostAnimalDTO();
					dto.setLostName(lostName);
					dto.setLostAge(lostAge);
					dto.setLostKind(lostKind);
					dto.setLostGender(lostGender);
					dto.setLostDate(lostDate);
					dto.setLostContent(lostContent);
					dto.setLostCategory(lostCategory);
					dto.setLostAddr(lostAddr);
					dto.setLostWriter(lostWriter);
					dto.setFileRealName(lostFileRealName);
					 
					System.out.println(dto.toString());
					int result = dao.lostUpdate(dto,lostNo);
					System.out.println();
					  if(result >0) { response.setCharacterEncoding("UTF-8");
					
					  response.sendRedirect("lostMapList.lost?page=1");
					
				 }
					
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
		
	

		

