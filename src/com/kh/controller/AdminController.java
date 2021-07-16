package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.config.FileConfig;
import com.kh.config.PageConfig;
import com.kh.config.SponsorConfig;
import com.kh.dao.AdminDAO;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.AnimalDAO;
import com.kh.dao.FileDAO;
import com.kh.dao.MemberDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.LostAnimalDTO;
import com.kh.dto.MemberDTO;
import com.kh.dto.ProtectBoardDTO;
import com.kh.dto.SponsorDTO;
import com.kh.utils.EncryptUtils;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



@WebServlet("*.adm")
public class AdminController extends HttpServlet {

	// 날짜가 yyyymmdd 형식으로 입력되었을 경우 Date로 변경하는 메서드
	private Date transformDate(String date){
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyymmdd");

		// Date로 변경하기 위해서는 날짜 형식을 yyyy-mm-dd로 변경해야 한다.
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");

		java.util.Date tempDate = null;

		try {
			// 현재 yyyymmdd로된 날짜 형식으로 java.util.Date객체를 만든다.
			tempDate = beforeFormat.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// java.util.Date를 yyyy-mm-dd 형식으로 변경하여 String로 반환한다.
		String transDate = afterFormat.format(tempDate);

		// 반환된 String 값을 Date로 변경한다.
		Date d = Date.valueOf(transDate);

		return d;
	}


	private List<String> getImgSrc(String str) {
		Pattern nonValidPattern = Pattern
				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<String> result = new ArrayList<String>();
		Matcher matcher = nonValidPattern.matcher(str);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");


		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());

		System.out.println("requestURI : " + requestURI);
		System.out.println("ctxPath : " + ctxPath);
		System.out.println("url : " + url);

		AdminDAO admindao = AdminDAO.getInstance();
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		MemberDAO dao = MemberDAO.getInstance();



		try {
			if(!url.contentEquals("/login.adm")) {
				if(request.getSession().getAttribute("admLoginInfo") == null) {
					response.sendRedirect("admin_error.jsp");
					throw new Exception("잘 못된 접근");
				}
			}

			if(url.contentEquals("/adoptRegList.adm")) {
				System.out.println("입양신청리스트");

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int endNum = cpage * PageConfig.ADOPTION_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ADOPTION_RECORD_COUNT_PER_PAGE - 1);
				String filter = request.getParameter("ad_status");

				List<AdoptionDTO> list;
				List<String> pageNavi = admindao.getAdoptionPageNavi(cpage, filter);

				if(filter == null || filter.contentEquals("")) { //검색조건없이 초기로드
					list = admindao.getAdoptionPageList(startNum, endNum);
				}else{ // 검색 값이 있을 경우
					list = admindao.getAdoptionPageList(startNum, endNum, filter);
				}

				request.setAttribute("ad_status", filter);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", cpage);
				request.getRequestDispatcher("admin/adoptRegList.jsp").forward(request, response);

			}else if(url.contentEquals("/adoptRegInfo.adm")) { 
				response.setContentType("text/html;charset=utf-8");
				int adopt_seq = Integer.parseInt(request.getParameter("adopt_seq"));
				Gson g = new Gson();
				AdoptionDTO info = admindao.getAdoptionInfo(adopt_seq);
				String result = g.toJson(info);
				response.getWriter().append(result);
			}else if(url.contentEquals("/adoptionUpdate.adm")) { 

				response.setContentType("text/html;charset=utf-8");
				int adopt_seq = Integer.parseInt(request.getParameter("p_seq"));
				String ad_status = request.getParameter("p_ad_status");
				Gson g = new Gson();
				ArrayList<String> rs = admindao.statusUpdate(adopt_seq, ad_status);
				String result = g.toJson(rs);				
				response.getWriter().append(result);
			}else if(url.contentEquals("/animalInfoReg.adm")) { 

				System.out.println("동물 정보 등록");
				String filesPath = request.getServletContext().getRealPath("/upload/animalInfo");

				File filesFolder = new File(filesPath);
				if(!filesFolder.exists()) filesFolder.mkdir();

				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());

				String anName = multi.getParameter("anName");
				String anCategory = multi.getParameter("anCategory");
				String anGender = multi.getParameter("anGender");
				String anKind = multi.getParameter("anKind");
				int anAge = Integer.parseInt(multi.getParameter("anAge"));
				int anWeight = Integer.parseInt(multi.getParameter("anWeight"));
				String anCharacter = multi.getParameter("anCharacter");
				Date anDate = transformDate(multi.getParameter("anDate"));
				String thumbImg = multi.getFilesystemName("thumbnail");
				thumbImg = Normalizer.normalize(thumbImg, Form.NFC);
				String anContnets = multi.getParameter("anContnets");
				String anNeutering = multi.getParameter("anNeutering");
				String code_seq = admindao.getAnimalCode();

				Set<String> fileNames = multi.getFileNameSet(); 
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);
					if(oriName == null) continue;
					oriName = Normalizer.normalize(oriName, Form.NFC);
					String sysName = multi.getFilesystemName(fileName);
					sysName = Normalizer.normalize(sysName, Form.NFC);

					if(!fileName.contentEquals("files") && !fileName.contentEquals("thumbnail")) {
						fdao.animalImgUpload(new AnimalFilesDTO(0, oriName, sysName, null, code_seq));
					}
				}
				AnimalDTO adto = new AnimalDTO(code_seq, anName, anCategory, anGender, anKind, anAge, anWeight, anCharacter, anDate, "N", thumbImg, anContnets, null, anNeutering);
				int result = admindao.animalInfoReg(adto);

				response.sendRedirect(ctxPath + "/animalInfoList.adm?cpage=1");		

			}else if(url.contentEquals("/uploadImg.adm")) {

				response.setCharacterEncoding("utf8");
				response.setContentType("text/html;charset=utf8");

				String realPath = request.getServletContext().getRealPath("upload/editor");
				File filesPath = new File(realPath);
				System.out.println(realPath);

				if(!filesPath.exists()) {filesPath.mkdir();}
				MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());

				String sysName = multi.getFilesystemName("file");
				sysName = Normalizer.normalize(sysName, Form.NFC);

				String returnPath = "/upload/editor/" + sysName;

				System.out.println("returnPath : " + returnPath);
				response.getWriter().append(returnPath);

			}else if(url.contentEquals("/animalInfoList.adm")) { 
				System.out.println("동물 정보 리스트");

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int endNum = cpage * PageConfig.ANIMAL_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ANIMAL_RECORD_COUNT_PER_PAGE - 1);

				List<AnimalDTO> list;
				List<String> pageNavi = admindao.getPageNavi(cpage);
				int rowNum = admindao.getRecordCount();

				list = admindao.getPageList(startNum, endNum);

				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("cpage", cpage);
				request.setAttribute("rowNum", rowNum);
				request.getRequestDispatcher("admin/animalInfoList.jsp").forward(request, response);

			}else if(url.contentEquals("/animalInfoDetail.adm")) { 

				String code_seq = request.getParameter("code_seq");

				AnimalDTO dto = admindao.getAnimalInfo(code_seq);
				List<AnimalFilesDTO> files = fdao.getAnimalImgs(code_seq);

				request.setAttribute("info", dto);
				request.setAttribute("files", files);

				request.getRequestDispatcher("admin/animalInfoModify.jsp").forward(request, response);

			}else if(url.contentEquals("/animalInfoModify.adm")) {
				System.out.println("동물정보수정");

				String filesPath = request.getServletContext().getRealPath("/upload/animalInfo");
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());

				String code_seq = multi.getParameter("code_seq");
				String anName = multi.getParameter("anName");
				String anCategory = multi.getParameter("anCategory");
				String anGender = multi.getParameter("anGender");
				String anKind = multi.getParameter("anKind");
				int anAge = Integer.parseInt(multi.getParameter("anAge"));
				int anWeight = Integer.parseInt(multi.getParameter("anWeight"));
				String anCharacter = multi.getParameter("anCharacter");
				Date anDate = transformDate(multi.getParameter("anDate"));
				String anStatus = multi.getParameter("anStatus");
				String thumbImg = multi.getFilesystemName("thumbnail");

				String deleteImg = multi.getParameter("deleteImg"); // 수정 이전의 원래 썸네일 


				if(thumbImg != null) {thumbImg = Normalizer.normalize(thumbImg, Form.NFC);}
				String anContnets = multi.getParameter("anContnets");
				String anNeutering = multi.getParameter("anNeutering");

				// 파일삭제 
				String[] delTargets = multi.getParameterValues("delete");
				System.out.println("delTargets : " + delTargets);
				if(delTargets != null) {
					System.out.println("파일 삭제 ㅅㅣ작");

					System.out.println("delTargets.length : " + delTargets.length);
					for(String target :delTargets) {
						String sysName = fdao.getSysName(Integer.parseInt(target));
						File targetFile = new File(filesPath + "/"+ sysName); // 지우고자 하는 파일을 찾음
						boolean result = targetFile.delete();
						System.out.println("파일 삭제 여부 : " + result);
						if(result) { fdao.animalImgDelete(Integer.parseInt(target));}
					}
				}

				//파일 업로드
				Set<String> fileNames = multi.getFileNameSet(); 
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);

					if(oriName == null) continue;
					oriName = Normalizer.normalize(oriName, Form.NFC);
					String sysName = multi.getFilesystemName(fileName);
					sysName = Normalizer.normalize(sysName, Form.NFC);

					if(!fileName.contentEquals("files") && !fileName.contentEquals("thumbnail")) {
						fdao.animalImgUpload(new AnimalFilesDTO(0, oriName, sysName, null, code_seq));
					}
				}

				File targetFile = new File(filesPath + "/"+ deleteImg); // 썸네일 이미지 삭제
				targetFile.delete();


				AnimalDTO dto = new AnimalDTO(code_seq, anName, anCategory, anGender, anKind, anAge, anWeight, anCharacter, anDate, anStatus, thumbImg, anContnets, null, anNeutering);
				int result = admindao.animalInfoModify(dto);

				response.sendRedirect(ctxPath + "/animalInfoList.adm?cpage=1");

			}else if(url.contentEquals("/animalInfoDelete.adm")) {

				String code_seq = request.getParameter("code_seq");
				ArrayList<String> delTargets = fdao.getFileSysName(code_seq);
				String contents = admindao.getAnimalContents(code_seq);

				String filesPath = request.getServletContext().getRealPath("/upload/animalInfo");
				String editPath = request.getServletContext().getRealPath("/upload/editor");

				List<String> imgUrl = getImgSrc(contents);
				for(String sysName : imgUrl) { // 에디터 업로드 파일 삭제
					String folder = "/editor/";
					int idx = sysName.indexOf(folder); 
					int length = folder.length();
					sysName = sysName.substring(idx+length);
					File targetFile = new File(editPath + "/"+ sysName);
					boolean result = targetFile.delete();
				}
				if(delTargets != null) { // 첨부파일 삭제
					for(int i=0;i<delTargets.size(); i++) {
						String sysName = delTargets.get(i);
						File targetFile = new File(filesPath + "/"+ sysName);
						boolean result = targetFile.delete();
					}
				}
				String thumbImg = admindao.getImgName(code_seq); // 썸네일 이미지 삭제
				File targetFile = new File(filesPath + "/"+ thumbImg);
				boolean result = targetFile.delete();
				System.out.println("썸네일 모냐 : "+targetFile);
				System.out.println("썸네일 삭제되냐 " + result);

				admindao.animalInfoDelete(code_seq);
				fdao.animalImgDelete(code_seq);

				response.sendRedirect(ctxPath + "/animalInfoList.adm?cpage=1");				

			}
			/*else if(url.contentEquals("/adSponsorList.adm")) {
				System.out.println("스폰서 후원");
				AdminDAO adao =AdminDAO.getInstance(); 

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int endNum = cpage * (SponsorConfig.RECORD_COUNT_PER_PAGE);
				int startNum = endNum - (SponsorConfig.RECORD_COUNT_PER_PAGE - 1);
				List<SponsorDTO> slist = adao.adSponsorGetPageList(startNum, endNum);
				String sp_slct_cho = request.getParameter("sp_slct_cho");
				//System.out.println(sp_slct_cho);
				List<String> navi = adao.adSponsorGetPageNavi(cpage, sp_slct_cho);//
				request.setAttribute("slist", slist);//이건 모든값
				request.setAttribute("navi", navi);//아래1~10 버튼 중 필요만큼
				request.setAttribute("sp_cho", sp_slct_cho);

				request.getRequestDispatcher("admin/adSponsorList.jsp?cpage=1").forward(request, response);

			}*/
			else if(url.contentEquals("/spAdminSearch.adm")) {
				System.out.println("카테고리");

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int endNum = cpage * (SponsorConfig.RECORD_COUNT_PER_PAGE);
				int startNum = endNum - (SponsorConfig.RECORD_COUNT_PER_PAGE - 1);
				String sp_search = request.getParameter("sp_slct_cho");
				System.out.println("검색 : "+ sp_search);
				List<SponsorDTO> slist;
				List<String> navi = admindao.adSponsorGetPageNavi(cpage, sp_search);
				System.out.println("검색 : "+ sp_search);
				if(sp_search == null || sp_search.contentEquals("")) {

					System.out.println("검색 : "+ sp_search);
					slist = admindao.adSponsorGetPageList(startNum, endNum);
				}else {
					System.out.println("검색 : "+ sp_search);
					slist = admindao.adSponsorGetPageList(startNum, endNum, sp_search);
				}
				request.setAttribute("slist", slist);
				request.setAttribute("cpage", cpage);
				request.setAttribute("navi", navi);//아래1~10 버튼 중 필요만큼
				request.setAttribute("sp_cho", sp_search);
				System.out.println(sp_search);
				request.getRequestDispatcher("admin/adSponsorList.jsp").forward(request, response);

			}else if(url.equals("/protectAnimal.adm")) {
				int page = Integer.parseInt(request.getParameter("page"));
				int count = PageConfig.ANIMAL_RECORD_COUNT_PER_PAGE;  //10
				//총 몇개?
				int boardCount = admindao.pTotalCount();
				//게시글 리스트
				List<ProtectBoardDTO> list = AnimalDAO.getList(page, count);
				System.out.println("게시글 리스트"+list);

				int lastPage = (int)Math.ceil(boardCount/10.0); //임시적인 마지막 페이지
				//보여질 페이지 네비 연산
				int nowGrp = (int)(Math.ceil((double)page/10)); 
				int startNum = ((nowGrp-1) * 10) +1 ;
				int lastNum = (nowGrp * 10);
				request.setAttribute("adProtect", list);

				int endPage = lastNum > lastPage ? lastPage : lastNum; //실제 보여질 페이지
				request.setAttribute("lastPage", lastPage);
				request.setAttribute("lastNum", endPage);
				request.setAttribute("startNum", startNum);
				RequestDispatcher dis = request.getRequestDispatcher("admin/userArticles.jsp");
				dis.forward(request, response);
			}else if(url.equals("/paDelete.adm")) {

				int protectNo = Integer.parseInt(request.getParameter("protectNo"));
				int result = AnimalDAO.protectDelete(protectNo);
				if(result>0) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.print("<script>");
					out.print("alert('삭제 성공');");
					out.print("window.location.href='protectAnimal.adm?page=1';"); 
					out.print("</script>");
					out.flush();
				}
			}else if(url.equals("/lostAnimal.adm")) {

				int page = Integer.parseInt(request.getParameter("page"));
				int count = PageConfig.ADMIN_PROTECT_RECORD_COUNT_PER_PAGE;
				List<LostAnimalDTO> list = AnimalDAO.mapList(page,count);
				System.out.println("로스트"+list.toString());
				int boardCount = AnimalDAO.getAllCount();
				System.out.println(boardCount);
				int lastPage = (int)Math.ceil(boardCount/10.0); //임시적인 마지막 페이지
				//보여질 페이지 네비 연산
				int nowGrp = (int)(Math.ceil((double)page/10)); 
				int startNum = ((nowGrp-1) * 10) +1 ;
				int lastNum = (nowGrp * 10);
				request.setAttribute("adProtect", list);

				int endPage = lastNum > lastPage ? lastPage : lastNum; //실제 보여질 페이지
				request.setAttribute("lastPage", lastPage);
				request.setAttribute("lastNum", endPage);
				request.setAttribute("startNum", startNum);

				request.setAttribute("mapList", list);

				RequestDispatcher dis = request.getRequestDispatcher("admin/userLostArticles.jsp");
				dis.forward(request, response);
			}else if(url.equals("/laDelete.adm")) {
				int lostNo = Integer.parseInt(request.getParameter("lostNo"));
				int result = AnimalDAO.lostDelete(lostNo);
				if(result>0) {
					response.setCharacterEncoding("UTF-8");
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();

					out.print("<script>");
					out.print("alert('삭제 성공');");
					out.print("window.location.href='lostAnimal.adm?page=1';"); 
					out.print("</script>");
					out.flush();
				}
			}else if(url.contentEquals("/login.adm")) {
				String user_id = request.getParameter("user_id");
				String user_password = EncryptUtils.getSHA512(request.getParameter("user_password"));

				if(!user_id.contentEquals("admin")) {
					response.sendRedirect("admin/adminLogin.jsp");
				}else if(dao.isLoginOk(user_id, user_password)) {
					MemberDTO dto = dao.selectMemberById(user_id);
					request.getSession().setAttribute("admLoginInfo", dto);
					response.sendRedirect("memberManage.adm");
				}else {
					response.sendRedirect("admin/adminLogin.jsp");
				}
			}else if(url.contentEquals("/memberManage.adm")) {
				List<MemberDTO> list = dao.selectAll();
				
				for(MemberDTO dto : list) {
					boolean result = dao.isBlackList(dto.getUser_id());
					dto.setBlack(result);
				}
				request.setAttribute("list", list);
				request.getRequestDispatcher("admin/managerMember.jsp").forward(request, response);
			}else if(url.contentEquals("/addBlack.adm")) {
				String user_id = request.getParameter("user_id");
				String reason = request.getParameter("reason");
				int result = dao.addBlack(user_id, reason);
				response.sendRedirect("memberManage.adm");
			}else if(url.contentEquals("/kickout.adm")) {
				String id = request.getParameter("user_id");
				int result = dao.delete(id);
				response.sendRedirect("memberManage.adm");
			}else if(url.contentEquals("/restoreBlack.adm")) {
				String user_id = request.getParameter("user_id");
				int result = dao.removeBlackList(user_id);
				response.sendRedirect("memberManage.adm");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("admin_error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
