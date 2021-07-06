package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.config.FileConfig;
import com.kh.dao.AdminDAO;
import com.kh.dao.FileDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
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
		FileDAO fdao = FileDAO.getInstance();

		try {
			if(url.contentEquals("/adoptRegList.adm")) {
				response.setContentType("text/html;charset=utf-8");

				Gson g = new Gson();
				List<AdoptionDTO> list = admindao.getAdoptionList();

				String result = g.toJson(list);
				response.getWriter().append(result);

			}else if(url.contentEquals("/animalInfoReg.adm")) { System.out.println("동물 정보 등록 컨트롤러.");

				String filesPath = request.getServletContext().getRealPath("anfiles");

				File filesFolder = new File(filesPath);
				if(!filesFolder.exists()) filesFolder.mkdir();
				String directory = request.getServletContext().getRealPath("/upload/animalInfo");

				System.out.println("filesPath : " + filesPath);
				System.out.println("directory : " + directory);

				MultipartRequest multi = new MultipartRequest(request, directory, FileConfig.uploadMaxSize, "utf8", new DefaultFileRenamePolicy());

				/*
				Enumeration files = multi.getFileNames();
               String str = (String)files.nextElement();
               String lostFileRealName = multi.getFilesystemName(str); //실제에 서버에 업로드가된 네임
				 */

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

					System.out.println("파라미터 이름 : " + fileName);
					String oriName = multi.getOriginalFileName(fileName);
//					oriName = new String(oriName.getBytes("utf-8"), "iso-8859-1");
					
					String sysName = multi.getFilesystemName(fileName);
//					sysName = new String(oriName.getBytes("utf-8"), "iso-8859-1");

					System.out.println("file Name : " + fileName);
					System.out.println("oriName : " + oriName);
					System.out.println("sysName : " + sysName);

					if(oriName == null) continue;

					fdao.animalImgUpload(new AnimalFilesDTO(0, oriName, sysName, null, code_seq));
				}
				
				response.sendRedirect("admin/animalInfoReg.jsp");

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
