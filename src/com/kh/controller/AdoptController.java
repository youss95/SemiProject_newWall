package com.kh.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.config.FileConfig;
import com.kh.config.PageConfig;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.apt")
public class AdoptController extends HttpServlet {
	
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
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();

		
		try {
			if(url.contentEquals("/adoptList.apt")) {
				System.out.println("입양 동물 리스트");
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");
				String gender = request.getParameter("gender");
				String weight = request.getParameter("weight");
				String age = request.getParameter("age");
				String character = request.getParameter("character");
				String name = request.getParameter("an_name");
				int endNum = cpage * PageConfig.ADOPT_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ADOPT_RECORD_COUNT_PER_PAGE - 1);
				
				AnimalDTO filter = new AnimalDTO(name, category, gender, age, weight, character);
				List<AnimalDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, filter);
				if(category == null || category.contentEquals("")) { //검색조건없이 초기로드
					list = adoptdao.getPageList(startNum, endNum);
				}else{ // 검색 값이 있을 경우
					list = adoptdao.getPageList(startNum, endNum, filter);
				}
				
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("h_category", category);
				request.setAttribute("h_gender", gender);
				request.setAttribute("h_weight", weight);
				request.setAttribute("h_age", age);
				request.setAttribute("h_character", character);
				request.setAttribute("an_name", name);
				request.getRequestDispatcher("adopt/adoptList.jsp").forward(request, response);
				
			}else if(url.contentEquals("/adoptDetail.apt")) {
				System.out.println("상세");
				
				String code_seq = request.getParameter("code_seq");
				
				AnimalDTO info = adoptdao.getAnimalInfo(code_seq);
				List<AnimalFilesDTO> files = adoptdao.getAnimalFiles(code_seq);
				
				request.setAttribute("info", info);
				request.setAttribute("files", files);
				request.getRequestDispatcher("adopt/adoptDetail.jsp").forward(request, response);
				
			}else if(url.contentEquals("/adoptRegForm.apt")) { 
				System.out.println("입양신청");		
				String code_seq = request.getParameter("code_seq");
				String p_name = adoptdao.getAnimalName(code_seq);
				
				request.setAttribute("pet_name", p_name);
				request.setAttribute("code_seq", code_seq);
				request.getRequestDispatcher("adopt/adoptRegForm.jsp").forward(request, response);	
				
			}else if(url.contentEquals("/adoptReg.apt")) {
				System.out.println("입양신청버튼 클릭");
				
				String code_seq = request.getParameter("code_seq");
				String user_id = request.getParameter("user_id");
				String p_name = request.getParameter("p_name");
				String p_phone01 = request.getParameter("p_phone01");
				String p_phone02 = request.getParameter("p_phone02");
				String p_email = request.getParameter("p_email");
				String p_gender = request.getParameter("p_gender");
				String p_age = request.getParameter("p_age");
				String p_address = request.getParameter("p_address");
				String p_mstatus = request.getParameter("p_mstatus");
				String p_arg = request.getParameter("p_arg");
				String q01_aname = request.getParameter("pet_name");
				String q02_alternative = request.getParameter("alternative");
				String q03_time_to_worry = request.getParameter("time_to_worry");
				String q04_reason = request.getParameter("reason");
				String q05_family_member = request.getParameter("family_member");
				String q06_family_arg = request.getParameter("family_arg");
				String q07_pet = request.getParameter("pet");
				String q08_experience = request.getParameter("experience");
				String q09_housing_type = request.getParameter("housing_type");
				String q10_host_consent = request.getParameter("host_consent");
				String q11_impossible_situation = request.getParameter("impossible_situation");
				String q12_lodging_problem = request.getParameter("lodging_problem");
				String q13_payment_arg = request.getParameter("payment_arg");
				String q14_neutered_arg = request.getParameter("neutered_arg");
				String q15_visit_agr = request.getParameter("visit_agr");
				String q16_adopt_arg = request.getParameter("adopt_arg");
				
				AdoptionDTO dto = new AdoptionDTO(0, code_seq, null, user_id, p_name, p_phone01, p_phone02, p_email, p_gender, p_age, p_address, p_mstatus, p_arg, q01_aname, q02_alternative, q03_time_to_worry, q04_reason, q05_family_member, q06_family_arg, q07_pet, q08_experience, q09_housing_type, q10_host_consent, q11_impossible_situation, q12_lodging_problem, q13_payment_arg, q14_neutered_arg, q15_visit_agr, q16_adopt_arg);
				
				int result = adoptdao.insertRegForm(dto);
				
				request.setAttribute("code_seq", code_seq);
				request.getRequestDispatcher("/adoptDetail.apt").forward(request, response);	
				
			}else if(url.contentEquals("/reviewWrite.apt")) {
				System.out.println("입양후기 작성");
				String filesPath = request.getServletContext().getRealPath("/upload/review");

				File filesFolder = new File(filesPath);
				if(!filesFolder.exists()) filesFolder.mkdir();

				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());

				String review_title = multi.getParameter("title");
				String review_writer = "test";
				String review_introduce = multi.getParameter("introduce");
				String review_thumbnail = multi.getFilesystemName("thumbnail");
				review_thumbnail = Normalizer.normalize(review_thumbnail, Form.NFC);
				String review_contents = multi.getParameter("contents");

				ReviewDTO dto = new ReviewDTO(0, review_title, review_writer, review_introduce,review_thumbnail, review_contents, null, 0, 0);
				int result = adoptdao.insertReview(dto);

				response.sendRedirect(ctxPath+"/reviewList.apt");	
				
			}else if(url.contentEquals("/reviewList.apt")) {
				
//				List<ReviewDTO> list = adoptdao.getAllReview();
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");
				String contents = request.getParameter("contents");

				int endNum = cpage * PageConfig.REVIEW_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.REVIEW_RECORD_COUNT_PER_PAGE - 1);
				
				List<ReviewDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, category, contents);
				AnimalDTO dto;
				if(category == null || category.contentEquals("")) { //검색조건없이 초기로드
					list = adoptdao.getReviewPageList(startNum, endNum);
				}else{ // 검색 값이 있을 경우
					list = adoptdao.getReviewPageList(startNum, endNum, category, contents);
				}
				
				request.setAttribute("cpage", cpage);
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
				request.setAttribute("category", category);
				request.setAttribute("contents", contents);

				request.getRequestDispatcher("adopt/reviewList.jsp").forward(request, response);
				
			}else if(url.contentEquals("/reviewDetail.apt")) {
				System.out.println("리뷰 상세페이지");
				
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				
				adoptdao.viewCount(review_seq);
				ReviewDTO review = adoptdao.getReviewContents(review_seq);
				
				request.setAttribute("rv", review);
				request.getRequestDispatcher("adopt/reviewDetail.jsp").forward(request, response);	
				
			}else if(url.contentEquals("/reviewDelete.apt")) {
				System.out.println("리뷰 삭제");
				String filesPath = request.getServletContext().getRealPath("/upload/review");
				String editPath = request.getServletContext().getRealPath("/upload/editor");
				
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));

				String thumbImg = adoptdao.getImgName(review_seq); 
				String contents = adoptdao.getReviewEdit(review_seq); 
				
				File targetFile = new File(filesPath + "/"+ thumbImg); //썸네일 삭제
				boolean chk = targetFile.delete();
				
				List<String> imgUrl = getImgSrc(contents);
				for(String sysName : imgUrl) { // 에디터 업로드 파일 삭제
					String folder = "/editor/";
					int idx = sysName.indexOf(folder); 
					int length = folder.length();
					sysName = sysName.substring(idx+length);
					File editFile = new File(editPath + "/"+ sysName);
					boolean edit_result = editFile.delete();
				}
				int result = adoptdao.deleteReview(review_seq);
				
				response.sendRedirect(ctxPath+"/reviewList.apt");	
				
			}else if(url.contentEquals("/reviewModifyView.apt")) {
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				ReviewDTO review = adoptdao.getReviewContents(review_seq);
				
				request.setAttribute("rv", review);
				request.getRequestDispatcher("adopt/reviewModify.jsp").forward(request, response);	

			}else if(url.contentEquals("/reviewModify.apt")) {
				
				System.out.println("리뷰수정 ");
				String filesPath = request.getServletContext().getRealPath("/upload/review");
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());				
				int review_seq = Integer.parseInt(multi.getParameter("review_seq"));
				String review_title = multi.getParameter("title");
				String review_writer = "test";
				String review_introduce = multi.getParameter("introduce");
				String review_thumbnail = multi.getFilesystemName("thumbnail");
				if (review_thumbnail != null) {review_thumbnail = Normalizer.normalize(review_thumbnail, Form.NFC);}
				String review_contents = multi.getParameter("contents");
				String deleteImg = multi.getParameter("deleteImg");
				
				File targetFile = new File(filesPath + "/"+ deleteImg); // 썸네일 이미지 삭제
				boolean result3 = targetFile.delete();

				ReviewDTO dto = new ReviewDTO(review_seq, review_title, review_writer, review_introduce,review_thumbnail, review_contents, null, 0, 0);
				int result = adoptdao.modifyReview(dto);
				
				response.sendRedirect(ctxPath+"/reviewList.apt");
				
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
