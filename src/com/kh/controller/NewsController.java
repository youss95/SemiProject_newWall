package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.config.BoardConfig;
import com.kh.config.FileConfig;
import com.kh.dao.NewsCommentsDAO;
import com.kh.dao.NewsDAO;
import com.kh.dao.NoticeFileDAO;
import com.kh.dto.NewsCommentsDTO;
import com.kh.dto.NewsDTO;
import com.kh.dto.NoticeFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.news")
public class NewsController extends HttpServlet {
	private String XSSFilter(String target) {// 공격막기
		if (target != null) {
			target = target.replaceAll("<", "&lt;");
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");

		}
		return target;
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8;");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		
		String url = requestURI.substring(ctxPath.length());
		System.out.println("유형 : " + url);
		
		try {
			NewsDAO dao = NewsDAO.getInstance();
			NewsDTO dto = new NewsDTO();
			NoticeFileDAO fdao = NoticeFileDAO.getInstance();
			NewsCommentsDAO nedao = NewsCommentsDAO.getInstance();
			List<NewsCommentsDTO> nedto = new ArrayList<>();
			
			if(url.contentEquals("/newsBoard.news")) {
				//뉴스 리스트
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				
				int endNum = cpage * (BoardConfig.RECORD_COUNT_PER_PAGE - 15);
				int startNum = endNum - ((BoardConfig.RECORD_COUNT_PER_PAGE - 15)-1);
				
				String category = request.getParameter("category");//카테고리
				String keyword = request.getParameter("keyword");//키워드
				
				List<NewsDTO> list;
				
				if(keyword == null || keyword.contentEquals("")) {
					list = dao.getPageList(startNum, endNum);
				}else {
					list = dao.getPageList(startNum, endNum,category,keyword);
				}
				
				List<String> pageNavi = dao.getPageNavi(cpage, category, keyword);
				
				request.setAttribute("newsAll", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("category", category);
				request.setAttribute("keyword", keyword);
				request.getRequestDispatcher("newsboard/newsList.jsp").forward(request, response);
				
//			}else if(url.contentEquals("/newsWrite.news")) {
//				//뉴스 글쓰기로 이동
//				response.sendRedirect("newsboard/newsWrite.jsp");
//				
//			}else if(url.contentEquals("/write.news")) {
//				//뉴스 글쓰기 값 받아오기
//				String seq = dao.getSeq();
//				
//				String filesPath = request.getServletContext().getRealPath("/upload/news");//파일
//				
//				File filesFolder = new File(filesPath);
//				int maxSize = 1024 * 1024 * 100;
//				
//				if(!filesFolder.exists()) {
//					filesFolder.mkdir();
//				}
//				
//				MultipartRequest multi = new MultipartRequest(request, filesPath,maxSize,"utf8", new DefaultFileRenamePolicy());
				
//				Set<String> fileNames = multi.getFileNameSet();
//				for(String fileName : fileNames) {
//					String oriName = multi.getOriginalFileName(fileName);
//					String sysName = multi.getFilesystemName(fileName);
//					
//					if(oriName != null) {
//						fdao.insert(new NewsFileDTO(0,oriName, sysName, null, seq));
//					}
//				}
				
//				String writer = ((AdminDTO)(request.getSession().getAttribute("login"))).getAdmin_id();//운영자 아이디 로그인완료시 주석취소
//				String writer = "admin";
//				String title = multi.getParameter("news_title");//뉴스 제목
//				title = XSSFilter(title);
//				
//				String subContents = multi.getParameter("news_sub_contents");//뉴스 서브내용
//				subContents = XSSFilter(subContents);
//				
//				String contents = multi.getParameter("news_contents");//뉴스 내용
//				
//				String photo = multi.getFilesystemName("news_photo");//포토
//				
//				String oriName = multi.getOriginalFileName("news_photo");
//				String sysName = multi.getFilesystemName("news_photo");
//				
//				fdao.insert(new NoticeFileDTO(0,oriName, sysName, null, seq));
//				
//				System.out.println(photo);
//			 
//				
//				int result = dao.newNews(new NewsDTO(seq,title,subContents,contents,photo,writer,null,0));
//				
//				response.sendRedirect("newsBoard.news?cpage=1");
//				
//			}else if (url.contentEquals("/uploadImg.news")) {
//				//썸머노트 이미지 업로드
//				response.setCharacterEncoding("utf8");
//				response.setContentType("text/html;charset=utf8");
//
//				String realPath = request.getServletContext().getRealPath("upload/news");
//				File filesPath = new File(realPath);
//				System.out.println(realPath);
//
//				if(!filesPath.exists()) {filesPath.mkdir();}
//				MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());
//
//				String sysName = multi.getFilesystemName("file");
//				//				sysName = URLEncoder.encode(sysName,"euc-kr");
//
//				String returnPath = "/upload/news/" + sysName;
//
//				System.out.println("returnPath : " + returnPath);
//				response.getWriter().append(returnPath);
//				
			}else if(url.contentEquals("/newsView.news")) {
				//뉴스 보기
				String seq = request.getParameter("news_seq");
				
				dao.view(seq);
				
				dto = dao.detail(seq);
				
				String parent = seq;
				
				
				request.setAttribute("newsView", dto);
				
				nedto = nedao.commentsAll(parent);
				request.setAttribute("necmtlist", nedto);
				
				request.getRequestDispatcher("newsboard/newsView.jsp").forward(request, response);
				
			}
//			else if(url.contentEquals("/newsDelete.news")) {
//				//뉴스 삭제하기
//				String seq = request.getParameter("news_seq");
//				
//				dao.delete(seq);
//				
//				response.sendRedirect("newsBoard.news?cpage=1");
//			
//			}else if(url.contentEquals("/newsModify.news")) {
//				//뉴스값 받아서 보내기
//				String seq = request.getParameter("news_seq");
//				
//				dto = dao.detail(seq);
//				
//				List<NoticeFileDTO> flist = fdao.selectBySeq(seq);
//								
//				request.setAttribute("flist", flist);
//				
//				request.setAttribute("newsView", dto);
//				
//				request.getRequestDispatcher("newsboard/newsModify.jsp").forward(request, response);
//			}else if(url.contentEquals("/newsModifyView.news")) {
//				//뉴스 수정한값 받아서 적용
//				String filesPath = request.getServletContext().getRealPath("/upload/news");
//				
//				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8",
//						new DefaultFileRenamePolicy());
//				
//				String seq = multi.getParameter("news_seq");
//				
//				String title = multi.getParameter("news_title");
//				title = XSSFilter(title);
//				
//				String subcontents = multi.getParameter("news_sub_contents");
//				subcontents = XSSFilter(subcontents);
//				
//				String contents = multi.getParameter("news_contents");
//				
//				String[] delTargets = multi.getParameterValues("delete");
//				if (delTargets != null) { // 삭제할 항목이 null이 아닌경우
//					for (String target : delTargets) {
//						String sysName = fdao.getSysName(Integer.parseInt(target));
//						File targetFile = new File(filesPath + "/" + sysName);
//						boolean result = targetFile.delete();
//						if (result) {
//							fdao.delete(Integer.parseInt(target));
//						}
//					}
//				}
//												
//				String photo;
//				photo = multi.getFilesystemName("news_photo");//포토
//				
////				String originFile = multi.getFilesystemName("originFile");
//
//				String oriName = multi.getOriginalFileName("news_photo");
//				String sysName = multi.getFilesystemName("news_photo");
//				
//				if(oriName != null) {
//					fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
//				}
//				
//				if(photo == null) {
//					photo = multi.getParameter("originFile");
//					System.out.println(photo);
////					photo = multi.getFilesystemName("originFile");
////					photo = multi.getOriginalFileName("originFile");
//				}
//				
//				
//				int result = dao.modify(seq, title, subcontents, contents, photo);
//				
////				Set<String> fileNames = multi.getFileNameSet();
////				for(String fileName : fileNames) {
////					String oriName = multi.getOriginalFileName(fileName);
////					String sysName = multi.getFilesystemName(fileName);
////					
////					if(oriName != null) {
////						fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
////					}
////				}
//				
//				dto = dao.detail(seq);
//				
//				response.sendRedirect("newsView.news?news_seq=" + seq);
//				
//			}
				
				
		}catch(Exception e)	{
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
