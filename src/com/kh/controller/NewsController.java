package kh.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kh.mvc.config.BoardConfig;
import kh.mvc.dao.FilesDAO;
import kh.mvc.dao.NewsDAO;
import kh.mvc.dto.FilesDTO;
import kh.mvc.dto.NewsDTO;


@WebServlet("*.news")
public class NewsController extends HttpServlet {
	private String XSSFilter(String target) {//공격막기
		if(target != null) {
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
			FilesDAO fdao = FilesDAO.getInstance();
			
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
				
			}else if(url.contentEquals("/newsWrite.news")) {
				//뉴스 글쓰기로 이동
				response.sendRedirect("newsboard/newsWrite.jsp");
				
			}else if(url.contentEquals("/write.news")) {
				//뉴스 글쓰기 값 받아오기
				int seq = dao.getSeq();
				
				String filesPath = request.getServletContext().getRealPath("files");//파일
				
				File filesFolder = new File(filesPath);
				int maxSize = 1024 * 1024 * 100;
				
				if(!filesFolder.exists()) {
					filesFolder.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, filesPath,maxSize,"utf8", new DefaultFileRenamePolicy());
				
				Enumeration files = multi.getFileNames();
				String str = (String)files.nextElement();
				String lostFileRealName = multi.getFilesystemName(str);
				
				Set<String> fileNames = multi.getFileNameSet();
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					
					if(oriName != null) {
						fdao.insert(new FilesDTO(0,oriName, sysName, null, seq));
					}
				}
				
//				String writer = ((AdminDTO)(request.getSession().getAttribute("login"))).getAdmin_id();//운영자 아이디 로그인완료시 주석취소
				String writer = "admin";
				String title = multi.getParameter("news_title");//뉴스 제목
				title = XSSFilter(title);
				System.out.println(title);
				
				String contents = multi.getParameter("news_contents");//뉴스 내용
				contents = XSSFilter(contents);
				System.out.println(contents);
				
				int result = dao.newNews(new NewsDTO(seq,title,contents,writer,null,0));
				
				response.sendRedirect("newsBoard.news?cpage=1");
				
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
