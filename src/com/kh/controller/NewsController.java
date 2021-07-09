package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.config.BoardConfig;
import com.kh.config.FileConfig;
import com.kh.dao.NewsDAO;
import com.kh.dao.NewsFileDAO;
import com.kh.dto.NewsDTO;
import com.kh.dto.NewsFileDTO;
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
			NewsFileDAO fdao = NewsFileDAO.getInstance();
			
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
				
				Set<String> fileNames = multi.getFileNameSet();
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					
					if(oriName != null) {
						fdao.insert(new NewsFileDTO(0,oriName, sysName, null, seq));
					}
				}
				
//				String writer = ((AdminDTO)(request.getSession().getAttribute("login"))).getAdmin_id();//운영자 아이디 로그인완료시 주석취소
				String writer = "admin";
				String title = multi.getParameter("news_title");//뉴스 제목
				title = XSSFilter(title);
				
				String subContents = multi.getParameter("news_sub_contents");//뉴스 서브내용
				subContents = XSSFilter(subContents);
				
				String contents = multi.getParameter("news_contents");//뉴스 내용
				contents = XSSFilter(contents);
				
			
				
				int result = dao.newNews(new NewsDTO(seq,title,subContents,contents,writer,null,0));
				
				response.sendRedirect("newsBoard.news?cpage=1");
				
			}else if(url.contentEquals("/newsView.news")) {
				//뉴스 보기
				int seq = Integer.parseInt(request.getParameter("news_seq"));
				
				dao.view(seq);
				
				dto = dao.detail(seq);
				
				int parent = seq;
				
				List<NewsFileDTO> flist = fdao.selectBySeq(seq);
				
				request.setAttribute("newsView", dto);
				request.setAttribute("flist", flist);
				
//				ncdto = ncdao.commentsAll(parent);
//				request.setAttribute("nocmtlist", ncdto);
				
				request.getRequestDispatcher("newsboard/newsView.jsp").forward(request, response);
				
			}else if(url.contentEquals("/newsDelete.news")) {
				//뉴스 삭제하기
				int seq = Integer.parseInt(request.getParameter("news_seq"));
				System.out.println(seq);
				
				dao.delete(seq);
				
				response.sendRedirect("newsBoard.news?cpage=1");
			
			}else if(url.contentEquals("/newsModify.news")) {
				//뉴스값 받아서 보내기
				int seq = Integer.parseInt(request.getParameter("news_seq"));
				
				dto = dao.detail(seq);
				System.out.println(dto.getNews_sub_contents());
				
				List<NewsFileDTO> flist = fdao.selectBySeq(seq);
								
				request.setAttribute("newsView", dto);
				request.setAttribute("flist", flist);
				
				request.getRequestDispatcher("newsboard/newsModify.jsp").forward(request, response);
			}else if(url.contentEquals("/newsModifyView.news")) {
				//뉴스 수정한값 받아서 적용
				String filesPath = request.getServletContext().getRealPath("files");
				
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8",
						new DefaultFileRenamePolicy());
				
				int seq = Integer.parseInt(multi.getParameter("news_seq"));
				
				String title = multi.getParameter("news_title");
				
				String subcontents = multi.getParameter("news_sub_contents");
				
				String contents = multi.getParameter("news_contents");
				
				String[] delTargets = multi.getParameterValues("delete");
				System.out.println(delTargets);
				if (delTargets != null) { // 삭제할 항목이 null이 아닌경우
					for (String target : delTargets) {
						String sysName = fdao.getSysName(Integer.parseInt(target));
						File targetFile = new File(filesPath + "/" + sysName);
						boolean result = targetFile.delete();
						if (result) {
							fdao.delete(Integer.parseInt(target));
						}
					}
				}
				
				int result = dao.modify(seq, title, subcontents, contents);
				
				Set<String> fileNames = multi.getFileNameSet();
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					
					if(oriName != null) {
						fdao.insert(new NewsFileDTO(0, oriName, sysName, null, seq));
					}
				}
				
				dto = dao.detail(seq);
				List<NewsFileDTO> flist = fdao.selectBySeq(seq);
				request.setAttribute("flist", flist);
				
				response.sendRedirect("newsView.news?news_seq=" + seq);
				
			}
				
				
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
