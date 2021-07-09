package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.config.FileConfig;
import com.kh.config.PageConfig;
import com.kh.dao.AdminDAO;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dao.SponsorDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.SponsorDTO;
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

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");


		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());

		AdminDAO admindao = AdminDAO.getInstance();
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();

		try {
			if(url.contentEquals("/adoptRegList.adm")) {
				response.setContentType("text/html;charset=utf-8");

				Gson g = new Gson();
				List<AdoptionDTO> list = admindao.getAdoptionList();

				String result = g.toJson(list);
				response.getWriter().append(result);

			}else if(url.contentEquals("/animalInfoReg2.adm")) { 

				System.out.println("동물 정보 등록 컨트롤러.");

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
				String anPhoto = multi.getFilesystemName("anPhoto1");
				String anContnets = multi.getParameter("anContnets");
				String anNeutering = multi.getParameter("anNeutering");

				System.out.println("anPhoto : "+ anPhoto);

				String code_seq = admindao.getAnimalCode();
				AnimalDTO adto = new AnimalDTO(code_seq, anName, anCategory, anGender, anKind, anAge, anWeight, anCharacter, anDate, "N", anPhoto, anContnets, null, anNeutering);

				int result = admindao.animalInfoReg(adto);

				Set<String> fileNames = multi.getFileNameSet(); 
				for(String fileName : fileNames) {

//					System.out.println("파라미터 이름 : " + fileName);
					String oriName = multi.getOriginalFileName(fileName);
					String sysName = multi.getFilesystemName(fileName);

//					System.out.println("file Name : " + fileName);
//					System.out.println("oriName : " + oriName);
//					System.out.println("sysName : " + sysName);

					if(oriName == null) continue;

					fdao.animalImgUpload(new AnimalFilesDTO(0, oriName, sysName, null, code_seq));
				}

				response.sendRedirect("admin/animalInfoReg.jsp");

			}else if(url.contentEquals("/animalInfoReg.adm")) { 

				System.out.println("동물 정보 등록 컨트롤러.");

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
				String anPhoto = multi.getFilesystemName("anPhoto1");
				anPhoto = Normalizer.normalize(anPhoto, Form.NFC);
				String anContnets = multi.getParameter("anContnets");
				String anNeutering = multi.getParameter("anNeutering");

				System.out.println("anPhoto : "+ anPhoto);

				String code_seq = admindao.getAnimalCode();
				AnimalDTO adto = new AnimalDTO(code_seq, anName, anCategory, anGender, anKind, anAge, anWeight, anCharacter, anDate, "N", anPhoto, anContnets, null, anNeutering);

				int result = admindao.animalInfoReg(adto);

				Set<String> fileNames = multi.getFileNameSet(); 
				for(String fileName : fileNames) {
					String oriName = multi.getOriginalFileName(fileName);

					if(oriName == null) continue;
//					oriName = new String(oriName.getBytes("utf-8"), "iso-8859-1");
					oriName = Normalizer.normalize(oriName, Form.NFC);
					String sysName = multi.getFilesystemName(fileName);
					sysName = Normalizer.normalize(sysName, Form.NFC);
//					sysName = new String(sysName.getBytes("utf-8"), "iso-8859-1");
					
					if(!fileName.contentEquals("files")) {
						fdao.animalImgUpload(new AnimalFilesDTO(0, oriName, sysName, null, code_seq));
					}
				}

				response.sendRedirect("admin/animalInfoReg.jsp");

			}else if(url.contentEquals("/uploadImg.adm")) { // summernote ㅇㅣ 
				
				response.setCharacterEncoding("utf8");
				response.setContentType("text/html;charset=utf8");
				
				String realPath = request.getServletContext().getRealPath("upload/editor");
				File filesPath = new File(realPath);
				System.out.println(realPath);
				
				if(!filesPath.exists()) {filesPath.mkdir();}
				MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());
				
				String sysName = multi.getFilesystemName("file");
				sysName = Normalizer.normalize(sysName, Form.NFC);
//				sysName = URLEncoder.encode(sysName,"euc-kr");
				
				System.out.println("산이1 :" + sysName);
				
				
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
				AnimalFilesDTO files = fdao.getAnimalImgs(code_seq);
				
				
				request.setAttribute("info", dto);
				request.setAttribute("files", files);
				
				request.getRequestDispatcher("admin/animalInfoModify.jsp").forward(request, response);
				// 동물정보 수정할때 파일 업로드에 값이 널이면 수정이 안되게 해야함
				// 새로운 사진을 넣을시에는 기존디비(사진3장있었던것들 ) 다 업데이트 해줘야함.
			
			}else if(url.contentEquals("/adSponsorList.adm")) {
				System.out.println("스폰서 후원");
				SponsorDAO sdao =SponsorDAO.getInstance(); 
				List<SponsorDTO> slist = sdao.selectAll();

				request.setAttribute("slist", slist);
				request.getRequestDispatcher("admin/adSponsorList.jsp").forward(request, response);
				
				

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
