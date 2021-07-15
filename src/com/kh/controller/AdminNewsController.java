package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.config.BoardConfig;
import com.kh.config.FileConfig;
import com.kh.dao.NewsCommentsDAO;
import com.kh.dao.NewsDAO;
import com.kh.dao.NoticeFileDAO;
import com.kh.dto.MemberDTO;
import com.kh.dto.NewsCommentsDTO;
import com.kh.dto.NewsDTO;
import com.kh.dto.NoticeFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("*.newsAdm")
public class AdminNewsController extends HttpServlet {
	private String XSSFilter(String target) {
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
			NewsDAO nedao = NewsDAO.getInstance();
			NewsDTO nedto = new NewsDTO();
			NewsCommentsDAO necdao = NewsCommentsDAO.getInstance();
			List<NewsCommentsDTO> necdto = new ArrayList<>();
			NoticeFileDAO fdao = NoticeFileDAO.getInstance();
			HttpSession session = request.getSession();
			
			if(url.contentEquals("/newsInfo.newsAdm")) {
				//관리자 뉴스 리스트
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				
				int endNum = cpage * (BoardConfig.RECORD_COUNT_PER_PAGE - 15);
				int startNum = endNum - ((BoardConfig.RECORD_COUNT_PER_PAGE - 15)-1);
								
				List<NewsDTO> nelist;
				
				nelist = nedao.getPageList(startNum, endNum);
				
				
				List<String> pageNavi = nedao.getPageNavi(cpage, null, null);
				int rowNum = nedao.getRecordCount();
				
				request.setAttribute("newsAll", nelist);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", cpage);
				request.setAttribute("rowNum", rowNum);
				
				request.getRequestDispatcher("adminboard/newsInfo.jsp").forward(request, response);
				
			}else if(url.contentEquals("/write.newsAdm")) {
			//관리자 뉴스 글쓰기
			String seq = nedao.getSeq();
			String writer = null;
			MemberDTO session_chk = (MemberDTO)session.getAttribute("admLoginInfo"); 
			if(session_chk != null) { 
				writer = (session_chk).getName();
			}else {
				response.sendRedirect("adminLogin.jsp");
			}
			
			String filesPath = request.getServletContext().getRealPath("/upload/news");//파일
			
			File filesFolder = new File(filesPath);
			int maxSize = 1024 * 1024 * 100;
			
			if(!filesFolder.exists()) {
				filesFolder.mkdir();
			}
			
			MultipartRequest multi = new MultipartRequest(request, filesPath,maxSize,"utf8", new DefaultFileRenamePolicy());
			
//			Set<String> fileNames = multi.getFileNameSet();
//			for(String fileName : fileNames) {
//				String oriName = multi.getOriginalFileName(fileName);
//				String sysName = multi.getFilesystemName(fileName);
//				
//				if(oriName != null) {
//					fdao.insert(new NewsFileDTO(0,oriName, sysName, null, seq));
//				}
//			}
			
			
			String title = multi.getParameter("news_title");//뉴스 제목
			title = XSSFilter(title);
			
			String subContents = multi.getParameter("news_sub_contents");//뉴스 서브내용
			subContents = XSSFilter(subContents);
			
			String contents = multi.getParameter("news_contents");//뉴스 내용
			
			String photo = multi.getFilesystemName("news_photo");//포토
			photo = Normalizer.normalize(photo, Form.NFC);
			System.out.println(photo);
			
			String oriName = multi.getOriginalFileName("news_photo");
			oriName = Normalizer.normalize(oriName, Form.NFC);
			System.out.println(oriName);
			
			String sysName = multi.getFilesystemName("news_photo");
			sysName = Normalizer.normalize(sysName, Form.NFC);
			System.out.println(sysName);
			
			fdao.insert(new NoticeFileDTO(0,oriName, sysName, null, seq));
					 
			
			int result = nedao.newNews(new NewsDTO(seq,title,subContents,contents,photo,writer,null,0));
			
			response.sendRedirect("newsInfo.newsAdm?cpage=1");
			
		}else if (url.contentEquals("/newsuploadImg.newsAdm")) {
			//관리자 뉴스 썸머노트 이미지 업로드

			String realPath = request.getServletContext().getRealPath("upload/news");
			File filesPath = new File(realPath);
			System.out.println("썸머 : " + realPath);

			if(!filesPath.exists()) {filesPath.mkdir();}
			MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());

			String sysName = multi.getFilesystemName("file");
			sysName = Normalizer.normalize(sysName, Form.NFC);
			System.out.println("썸머 : " + sysName);
			//				sysName = URLEncoder.encode(sysName,"euc-kr");;

			String returnPath = "/upload/news/" + sysName;
			System.out.println("썸머 : " + returnPath);
			
			response.getWriter().append(returnPath);
			
		}else if(url.contentEquals("/newsInfoView.newsAdm")) {
			//관리자 뉴스 보기
			String seq = request.getParameter("news_seq");
			
			nedao.view(seq);
			
			nedto = nedao.detail(seq);
			
			String parent = seq;
			
			
			request.setAttribute("newsView", nedto);
			
			necdto = necdao.commentsAll(parent);
			request.setAttribute("necmtlist", necdto);
			
			request.getRequestDispatcher("adminboard/newsInfoView.jsp").forward(request, response);
			
		}else if(url.contentEquals("/newsDelete.newsAdm")) {
			//뉴스 삭제하기
			String seq = request.getParameter("news_seq");
			
			nedao.delete(seq);
			
			response.sendRedirect("newsInfo.newsAdm?cpage=1");
		
		}else if(url.contentEquals("/newsModify.newsAdm")) {
			//뉴스값 받아서 보내기
			String seq = request.getParameter("news_seq");
			
			nedto = nedao.detail(seq);
			
			List<NoticeFileDTO> flist = fdao.selectBySeq(seq);
							
			request.setAttribute("flist", flist);
			
			request.setAttribute("newsView", nedto);
			
			request.getRequestDispatcher("adminboard/newsInfoModify.jsp").forward(request, response);
		}else if(url.contentEquals("/newsModifyView.newsAdm")) {
			//뉴스 수정한값 받아서 적용
			String filesPath = request.getServletContext().getRealPath("/upload/news");
			
			MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8",
					new DefaultFileRenamePolicy());
			
			String seq = multi.getParameter("news_seq");
			
			String title = multi.getParameter("news_title");
			title = XSSFilter(title);
			
			String subcontents = multi.getParameter("news_sub_contents");
			subcontents = XSSFilter(subcontents);
			
			String contents = multi.getParameter("news_contents");
			
			String[] delTargets = multi.getParameterValues("delete");
			if (delTargets != null) { // 삭제할 항목이 null이 아닌경우
				for (String target : delTargets) {
					String sysName = fdao.getSysName(Integer.parseInt(target));
					sysName = Normalizer.normalize(sysName, Form.NFC);
					File targetFile = new File(filesPath + "/" + sysName);
					boolean result = targetFile.delete();
					if (result) {
						fdao.delete(Integer.parseInt(target));
					}
				}
			}
											
			String photo;
			photo = multi.getFilesystemName("news_photo");//포토
			
			
			System.out.println(photo);
			
//			String originFile = multi.getFilesystemName("originFile");
			
			String oriName = multi.getOriginalFileName("news_photo");
			String sysName = multi.getFilesystemName("news_photo");
			
			if(photo == null) {
				photo = multi.getParameter("originFile");
				System.out.println(photo);
//				photo = multi.getFilesystemName("originFile");
//				photo = multi.getOriginalFileName("originFile");
			}else if (photo != null) {
				photo = Normalizer.normalize(photo, Form.NFC);
				oriName = Normalizer.normalize(oriName, Form.NFC);
				sysName = Normalizer.normalize(sysName, Form.NFC);
			}
						
			if(oriName != null) {
				fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
			}
			
			
			
			
			int result = nedao.modify(seq, title, subcontents, contents, photo);
			
//			Set<String> fileNames = multi.getFileNameSet();
//			for(String fileName : fileNames) {
//				String oriName = multi.getOriginalFileName(fileName);
//				String sysName = multi.getFilesystemName(fileName);
//				
//				if(oriName != null) {
//					fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
//				}
//			}
			
			nedto = nedao.detail(seq);
			
			response.sendRedirect("newsInfoView.newsAdm?news_seq=" + seq);
			
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
