package kh.mvc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import kh.mvc.config.FileConfig;
import kh.mvc.dao.FilesDAO;
import kh.mvc.dao.NoCommentsDAO;
import kh.mvc.dao.NoticeDAO;
import kh.mvc.dto.FilesDTO;
import kh.mvc.dto.NoCommentsDTO;
import kh.mvc.dto.NoticeDTO;

@WebServlet("*.notice")
public class NoticeController extends HttpServlet {
	private String XSSFilter(String target) {
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
			NoticeDAO dao = NoticeDAO.getInstance();
			FilesDAO fdao = FilesDAO.getInstance();
			NoticeDTO dto = new NoticeDTO();
			NoCommentsDAO ncdao = NoCommentsDAO.getInstance();
			List<NoCommentsDTO> ncdto = new ArrayList<>();
			
			if(url.contentEquals("/noticeBoard.notice")) {
				//공지사항 리스트
				int cpage = Integer.parseInt(request.getParameter("cpage")); //게시글 네비
				
				int endNum = cpage * BoardConfig.RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (BoardConfig.RECORD_COUNT_PER_PAGE -1);
				
				String category = request.getParameter("category");//카테고리
				String keyword = request.getParameter("keyword");//키워드
				
				List<NoticeDTO> list;
				
				if(keyword == null || keyword.contentEquals("")) {
					list = dao.getPageList(startNum, endNum);
				}else {
					list = dao.getPageList(startNum, endNum,category,keyword);
				}
				
				List<String> pageNavi = dao.getPageNavi(cpage,category,keyword);
				
				request.setAttribute("noticeAll", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("category", category);
				request.setAttribute("keyword", keyword);
				request.getRequestDispatcher("noticeboard/noticeList.jsp").forward(request, response);
			
			}else if(url.contentEquals("/noticeWrite.notice")) {
				//공지사항 글쓰기로 이동
				response.sendRedirect("noticeboard/noticeWrite.jsp");
			
			}else if(url.contentEquals("/write.notice")) {
				//공지사항 글쓰기값 받아오기
				int seq = dao.getSeq(); //공지사항 넘버
				
				String filesPath = request.getServletContext().getRealPath("files");//파일
				
				File filesFolder = new File(filesPath);
				int maxSize = 1024 * 1024 * 100;
				
				if(!filesFolder.exists()) {
					filesFolder.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request,filesPath,maxSize,"utf8",
						new DefaultFileRenamePolicy());
				
				Enumeration files = multi.getFileNames();
	            String str = (String)files.nextElement();
	            String lostFileRealName = multi.getFilesystemName(str);
				
				Set<String> fileNames = multi.getFileNameSet();
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					
					if(oriName != null) {
						fdao.insert(new FilesDTO(0, oriName, sysName, null, seq));
					}
				}
				
//				String writer = ((AdminDTO)(request.getSession().getAttribute("login"))).getAdmin_id();//운영자 아이디 로그인완료시 주석취소
				String writer = "admin";
				String title = multi.getParameter("notice_title");//공지사항 타이틀
				title = XSSFilter(title);
				
				String contents = multi.getParameter("notice_contents");//공지사항 내용
				contents = XSSFilter(contents);
				
				int result = dao.newNotice(new NoticeDTO(seq, title, contents, writer, null, 0));
				
				response.sendRedirect("noticeBoard.notice?cpage=1");
				
			}else if (url.contentEquals("/noticeView.notice")) {
				//공지사항 보기
				int seq = Integer.parseInt(request.getParameter("notice_seq"));
				
				dto = dao.detail(seq);
				
				int parent = seq;
				
				List<FilesDTO> flist = fdao.selectBySeq(seq);
				
				request.setAttribute("noticeView", dto);
				request.setAttribute("flist", flist);
				
				ncdto = ncdao.commentsAll(parent);
				request.setAttribute("nocmtlist", ncdto);
				
				request.getRequestDispatcher("noticeboard/noticeView.jsp").forward(request, response);
				
			}else if (url.contentEquals("/noticeDelete.notice")) {
				//공지사항 삭제하기
				int seq = Integer.parseInt(request.getParameter("notice_seq"));
				System.out.println(seq);
				
				dao.delete(seq);
				
				response.sendRedirect("noticeBoard.notice?cpage=1");
			
			}else if (url.contentEquals("/noticeModify.notice")) {
				// 공지사항 값을 받아서 수정jsp로 보내기
				int seq = Integer.parseInt(request.getParameter("notice_seq"));
				
				dto = dao.detail(seq);
				
				List<FilesDTO> flist = fdao.selectBySeq(seq);
				
				request.setAttribute("noticeView", dto);
				request.setAttribute("flist", flist);
				
				request.getRequestDispatcher("noticeboard/noticeModify.jsp").forward(request, response);
				
			}else if(url.contentEquals("/noticeModifyView.notice")) {
				//공지사항 글 수정
				
				String filesPath = request.getServletContext().getRealPath("files");
				
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8",
						new DefaultFileRenamePolicy());
				
				int seq = Integer.parseInt(multi.getParameter("notice_seq"));
				
				String title = multi.getParameter("notice_title");
				
				String contents = multi.getParameter("notice_contents");
				
				String[] delTargets = multi.getParameterValues("delete");
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
				
				int result = dao.modify(seq, title, contents);
				
				Set<String> fileNames = multi.getFileNameSet();
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);
					
					if(oriName != null) {
						fdao.insert(new FilesDTO(0, oriName, sysName, null, seq));
					}
				}
				
				dto = dao.detail(seq);
				List<FilesDTO> flist = fdao.selectBySeq(seq);
				request.setAttribute("flist", flist);
				response.sendRedirect("noticeView.notice?notice_seq=" + seq);
				
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
