package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.config.BoardConfig;
import com.kh.config.FileConfig;
import com.kh.dao.NoCommentsDAO;
import com.kh.dao.NoticeDAO;
import com.kh.dao.NoticeFileDAO;
import com.kh.dto.MemberDTO;
import com.kh.dto.NoCommentsDTO;
import com.kh.dto.NoticeDTO;
import com.kh.dto.NoticeFileDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.sumAdm")
public class AdminNoticeController extends HttpServlet {
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
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8;");

		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();

		String url = requestURI.substring(ctxPath.length());
		System.out.println("유형 : " + url);

		try {

			NoticeDAO dao = NoticeDAO.getInstance();
			NoticeFileDAO fdao = NoticeFileDAO.getInstance();
			NoticeDTO dto = new NoticeDTO();
			NoCommentsDAO ncdao = NoCommentsDAO.getInstance();
			List<NoCommentsDTO> ncdto = new ArrayList<>();
			HttpSession session = request.getSession();
			

			if(url.contentEquals("/noticeInfo.sumAdm")) {
				//관리자페이지에서 공지사항보기				
				int cpage = Integer.parseInt(request.getParameter("cpage")); //게시글 네비
				
				int endNum = cpage * BoardConfig.RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (BoardConfig.RECORD_COUNT_PER_PAGE -1);
			
				
				List<NoticeDTO> nolist;
				
				nolist = dao.getPageList(startNum, endNum);
				
				
				List<String> pageNavi = dao.getPageNavi(cpage,null,null);
				int rowNum = dao.getRecordCount();
				
				request.setAttribute("noticeAll", nolist);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", cpage);
				request.setAttribute("rowNum", rowNum);
				request.getRequestDispatcher("adminboard/noticeInfo.jsp").forward(request, response);
			
			}else if (url.contentEquals("/noticeWrite.sumAdm")) {
				//관리자페이지 공지사항 글쓰기값 받아오기
				String seq = dao.getSeq(); // 공지사항 넘버
				String writer = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("admLoginInfo");
				if(session_chk != null) { 
					writer = (session_chk).getName();
				}else{
					response.sendRedirect("admin/adminLogin.jsp");
					return;
				}

				String filesPath = request.getServletContext().getRealPath("files");// 파일

				File filesFolder = new File(filesPath);
				int maxSize = 1024 * 1024 * 100;

				if (!filesFolder.exists()) {
					filesFolder.mkdir();
				}

				MultipartRequest multi = new MultipartRequest(request, filesPath, maxSize, "utf8",
						new DefaultFileRenamePolicy());
				
//				String addFile = multi.getFilesystemName("addFile");
//				addFile = Normalizer.normalize(addFile, Form.NFC);

				Set<String> fileNames = multi.getFileNameSet(); 
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					if(oriName == null) continue;
					oriName = Normalizer.normalize(oriName, Form.NFC);
					String sysName = multi.getFilesystemName(fileName);
					sysName = Normalizer.normalize(sysName, Form.NFC);

					if(!fileName.contentEquals("files") && !fileName.contentEquals("addFile")) {
						fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
					}
				}
//				String writer = multi.getParameter("name");//관리자
//				 System.out.println(writer);

				String title = multi.getParameter("notice_title");// 공지사항 타이틀
				title = XSSFilter(title);

				String contents = multi.getParameter("notice_contents");// 공지사항 내용

				dao.newNotice(new NoticeDTO(seq, title, contents, writer, null, 0));

				response.sendRedirect("noticeInfo.sumAdm?cpage=1");

			}else if (url.contentEquals("/uploadImg.sumAdm")) {
				//관리자 페이지 썸머노트 이미지 업로드
				response.setCharacterEncoding("utf8");
				response.setContentType("text/html;charset=utf8");

				String realPath = request.getServletContext().getRealPath("upload/notice");
				File filesPath = new File(realPath);
				System.out.println(realPath);

				if(!filesPath.exists()) {filesPath.mkdir();}
				MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());

				String sysName = multi.getFilesystemName("file");
				//				sysName = URLEncoder.encode(sysName,"euc-kr");
				String returnPath = "/upload/notice/" + sysName;

				System.out.println("returnPath : " + returnPath);
				response.getWriter().append(returnPath);
				
			}else if (url.contentEquals("/noticeInfoView.sumAdm")) {
				//관리자 페이지 공지사항 보기
				String seq = request.getParameter("notice_seq");
				
				dao.view(seq);
				
				dto = dao.detail(seq);
				
				String parent = seq;
				
				List<NoticeFileDTO> flist = fdao.selectBySeq(seq);
				
				request.setAttribute("noticeView", dto);
				request.setAttribute("flist", flist);
				
				ncdto = ncdao.commentsAll(parent);
				request.setAttribute("nocmtlist", ncdto);
				
				request.getRequestDispatcher("adminboard/noticeInfoView.jsp").forward(request, response);
				
			}else if (url.contentEquals("/noticeInfoDelete.sumAdm")) {
				//공지사항 삭제하기
				String seq = request.getParameter("notice_seq");
				
				dao.delete(seq);
				
				String parent = seq;
				
				ncdao.pdelete(parent);
				
				response.sendRedirect("noticeInfo.sumAdm?cpage=1");
			
			}else if (url.contentEquals("/noticeInfoModify.sumAdm")) {
				// 공지사항 값을 받아서 수정jsp로 보내기
				String seq = request.getParameter("notice_seq");
				
				dto = dao.detail(seq);
				
				List<NoticeFileDTO> flist = fdao.selectBySeq(seq);
				
				request.setAttribute("noticeView", dto);
				request.setAttribute("flist", flist);
				
				request.getRequestDispatcher("adminboard/noticeInfoModify.jsp").forward(request, response);
				
			}else if(url.contentEquals("/noticeModifyView.sumAdm")) {
				//관리자 공지사항 글 수정
				
				String filesPath = request.getServletContext().getRealPath("files");
				
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8",
						new DefaultFileRenamePolicy());
				
				String seq = multi.getParameter("notice_seq");
				
				String title = multi.getParameter("notice_title");
				title = XSSFilter(title);
				
				
				String contents = multi.getParameter("notice_contents");
//				contents = XSSFilter(contents);
				
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
					if(oriName == null) continue;
					oriName = Normalizer.normalize(oriName, Form.NFC);
					String sysName = multi.getFilesystemName(fileName);
					sysName = Normalizer.normalize(sysName, Form.NFC);

					if(!fileName.contentEquals("files") && !fileName.contentEquals("addFile")) {
						fdao.insert(new NoticeFileDTO(0, oriName, sysName, null, seq));
					}
				}
				
				dto = dao.detail(seq);
				List<NoticeFileDTO> flist = fdao.selectBySeq(seq);
				request.setAttribute("flist", flist);
				response.sendRedirect("noticeInfoView.sumAdm?notice_seq=" + seq);
				
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
