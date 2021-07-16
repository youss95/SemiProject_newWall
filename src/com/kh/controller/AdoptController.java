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
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.config.FileConfig;
import com.kh.config.PageConfig;
import com.kh.dao.AdoptionDAO;
import com.kh.dao.FileDAO;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.MemberDTO;
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
	
	private String XSSFilter(String target) {

		if(target != null) {
			target = target.replaceAll("<", "&lt;");
			target = target.replaceAll(">", "&gt;");
			target = target.replaceAll("&", "&amp;");
		}
		return target;

	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String url = requestURI.substring(ctxPath.length());
		AdoptionDAO adoptdao = AdoptionDAO.getInstance();
		HttpSession session = request.getSession();

		try {
			if(url.contentEquals("/adoptList.apt")) {
				System.out.println("입양 동물 리스트");

				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String loadchk = request.getParameter("loadchk");
				String category = request.getParameter("category");
				String gender = request.getParameter("gender");
				String weight = request.getParameter("weight");
				String age = request.getParameter("age");
				String character = request.getParameter("character");
				String name = request.getParameter("an_name");
				int endNum = cpage * PageConfig.ADOPT_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.ADOPT_RECORD_COUNT_PER_PAGE - 1);
				
				AnimalDTO filter = new AnimalDTO(name, category, gender, age, weight, character);
				
				System.out.println("loadchk : " + loadchk);
				System.out.println("name : " + filter.getAn_name());
				System.out.println("category : " + filter.getAn_category());
				System.out.println("gender : " + filter.getAn_gender());
				System.out.println("age : " + filter.getAn_age_range());
				System.out.println("weight : " + filter.getAn_weight_range());
				System.out.println("character : " + filter.getAn_character());
				System.out.println("==============");
			
				
				
				List<AnimalDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, filter);
				if(loadchk == null) { //검색조건없이 초기로드
					System.out.println("초기로드");
					list = adoptdao.getPageList(startNum, endNum);
				}else{ // 검색 값이 있을 경우
					System.out.println("검색");

					list = adoptdao.getPageList(startNum, endNum, filter);
				}
				
				request.setAttribute("list", list);
				request.setAttribute("navi", pageNavi);
//				request.setAttribute("h_category", category);
//				request.setAttribute("h_gender", gender);
//				request.setAttribute("h_weight", weight);
//				request.setAttribute("h_age", age);
//				request.setAttribute("h_character", character);
				request.setAttribute("an_name", name);
				request.getRequestDispatcher("adopt/adoptList.jsp").forward(request, response);
			}else if(url.contentEquals("/adoptDetail.apt")) {
				System.out.println("상세");
				
				String code_seq = request.getParameter("code_seq");
				
				AnimalDTO info = adoptdao.getAnimalInfo(code_seq);
				List<AnimalFilesDTO> files = adoptdao.getAnimalFiles(code_seq);
				int status = adoptdao.getAnimalAdoptionStatus(code_seq);
				
				request.setAttribute("info", info);
				request.setAttribute("files", files);
				request.setAttribute("status", status);
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
				
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				
				if(session_chk == null && user_id == null) { 
					user_id = "비회원";
				}else {
					user_id = (session_chk).getUser_id();
				}

				String code_seq = request.getParameter("code_seq");
				String p_name = XSSFilter(request.getParameter("p_name"));
				String p_phone01 = XSSFilter(request.getParameter("p_phone01"));
				String p_phone02 = XSSFilter(request.getParameter("p_phone02"));
				String p_email = XSSFilter(request.getParameter("p_email"));
				String p_gender = request.getParameter("p_gender");
				String p_age = XSSFilter(request.getParameter("p_age"));
				String p_address = XSSFilter(request.getParameter("p_address"));
				String p_mstatus = request.getParameter("p_mstatus");
				String p_arg = request.getParameter("p_arg");
				String q01_aname = XSSFilter(request.getParameter("pet_name"));
				String q02_alternative = XSSFilter(request.getParameter("alternative"));
				String q03_time_to_worry = XSSFilter(request.getParameter("time_to_worry"));
				String q04_reason = XSSFilter(request.getParameter("reason"));
				String q05_family_member = XSSFilter(request.getParameter("family_member"));
				String q06_family_arg = request.getParameter("family_arg");
				String q07_pet = XSSFilter(request.getParameter("pet"));
				String q08_experience = XSSFilter(request.getParameter("experience"));
				String q09_housing_type = request.getParameter("housing_type");
				String q10_host_consent = XSSFilter(request.getParameter("host_consent"));
				String q11_impossible_situation = XSSFilter(request.getParameter("impossible_situation"));
				String q12_lodging_problem = XSSFilter(request.getParameter("lodging_problem"));
				String q13_payment_arg = request.getParameter("payment_arg");
				String q14_neutered_arg = request.getParameter("neutered_arg");
				String q15_visit_agr = request.getParameter("visit_agr");
				String q16_adopt_arg = request.getParameter("adopt_arg");
				
				AdoptionDTO dto = new AdoptionDTO(0, code_seq, null, user_id, p_name, p_phone01, p_phone02, p_email, p_gender, p_age, p_address, p_mstatus, p_arg,"신청중",q01_aname, q02_alternative, q03_time_to_worry, q04_reason, q05_family_member, q06_family_arg, q07_pet, q08_experience, q09_housing_type, q10_host_consent, q11_impossible_situation, q12_lodging_problem, q13_payment_arg, q14_neutered_arg, q15_visit_agr, q16_adopt_arg);
				
				int result = adoptdao.insertRegForm(dto);
				
				request.setAttribute("code_seq", code_seq);
				request.getRequestDispatcher("/adoptDetail.apt").forward(request, response);	
				
			}else if(url.contentEquals("/reviewWrite.apt")) {
				System.out.println("입양후기 작성");
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				
				if(session_chk == null && user_id == null) { 
					user_id = "비회원";
				}else {
					user_id = ((MemberDTO)session.getAttribute("loginInfo")).getUser_id();
				}
				
				String filesPath = request.getServletContext().getRealPath("/upload/review");
				File filesFolder = new File(filesPath);
				if(!filesFolder.exists()) filesFolder.mkdir();

				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());

				String review_title = XSSFilter(multi.getParameter("title"));
				String review_writer = user_id;
				String review_introduce = XSSFilter(multi.getParameter("introduce"));
				String review_thumbnail = multi.getFilesystemName("thumbnail");
				review_thumbnail = Normalizer.normalize(review_thumbnail, Form.NFC);
				String review_contents = multi.getParameter("contents");

				ReviewDTO dto = new ReviewDTO(0, review_title, review_writer, review_introduce,review_thumbnail, review_contents, null, 0, 0);
				int result = adoptdao.insertReview(dto);

				response.sendRedirect(ctxPath+"/reviewList.apt?cpage=1");	
				
			}else if(url.contentEquals("/reviewList.apt")) {
				
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				int adopt_chk = 0;
				if(session_chk != null) { 
					String user_id = session_chk.getUser_id();
					adopt_chk = adoptdao.getAdoptionRecord(user_id);
				}
				
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String category = request.getParameter("category");
				String contents = request.getParameter("inp_contents");

				int endNum = cpage * PageConfig.REVIEW_RECORD_COUNT_PER_PAGE;
				int startNum = endNum - (PageConfig.REVIEW_RECORD_COUNT_PER_PAGE - 1);
				
				System.out.println("category : " + category);
				System.out.println("inp_contents : " + contents);
				List<ReviewDTO> list;
				List<String> pageNavi = adoptdao.getPageNavi(cpage, category, contents);
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
				request.setAttribute("adopt_chk", adopt_chk);

				request.getRequestDispatcher("adopt/reviewList.jsp").forward(request, response);
				
			}else if(url.contentEquals("/reviewDetail.apt")) {
				System.out.println("리뷰 상세페이지");
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				if(session_chk != null) { 
					user_id = (session_chk).getUser_id();
				}
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				adoptdao.viewCount(review_seq);
				ReviewDTO review = adoptdao.getReviewContents(review_seq);
				
				request.setAttribute("rv", review);
				request.getRequestDispatcher("adopt/reviewDetail.jsp").forward(request, response);	
				
			}else if(url.contentEquals("/reviewLike.apt")) {

				response.setContentType("text/html;charset=utf-8");
				
				int rv_seq = Integer.parseInt(request.getParameter("rv_seq"));
				Gson g = new Gson();
				
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");

				if(session_chk != null) {  // 로그인 되어있을 경우
					user_id = (session_chk).getUser_id();
					
					String rstxt = null;
					ArrayList<String> val = new ArrayList<String>();
					int chk = adoptdao.reviewLikeChk(rv_seq, user_id);// 같은글에 눌러져있으면 delete 없으면 insert
					int num = 0;
					if(chk > 0) { 
						int rs = adoptdao.deleteReviewtLike(rv_seq, user_id);
						rstxt = "delete";
						System.out.println("삭제완료 : " + rs);
					}else {
						int rs = adoptdao.inserReviewtLike(rv_seq, user_id);
						rstxt = "insert";						
						System.out.println("등록완료 : " + rs);
					}
					int cnt = adoptdao.getReviewLikeCount(rv_seq);
					int rsv = adoptdao.updateReviewtLike(rv_seq,cnt);
					
					
					val.add(String.valueOf(cnt));
					val.add(rstxt);
					String result = g.toJson(val);
					response.getWriter().append(result);
					System.out.println(result);
				}else {
					int info = 0;
					String result = g.toJson(info);
					response.getWriter().append(result);
				}
				
			}else if(url.contentEquals("/likeStatus.apt")) {
				response.setContentType("text/html;charset=utf-8");
				
				int rv_seq = Integer.parseInt(request.getParameter("rv_seq"));
				Gson g = new Gson();
				
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				ArrayList<Integer> val = new ArrayList<Integer>();
				int cnt = 0;
				if(session_chk != null) {  // 로그인 되어있을 경우
					user_id = (session_chk).getUser_id();
					int chk = adoptdao.reviewLikeChk(rv_seq, user_id);// 눌렀던 글이면 불들어오게
					if(chk > 0) {cnt = chk;}
				}
				int num = adoptdao.getReviewLikeCount(rv_seq);
				val.add(cnt);
				val.add(num);
				String result = g.toJson(val);
				response.getWriter().append(result);
				
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
				
				response.sendRedirect(ctxPath+"/reviewList.apt?cpage=1");	
				
			}else if(url.contentEquals("/reviewModifyView.apt")) {
				int review_seq = Integer.parseInt(request.getParameter("review_seq"));
				ReviewDTO review = adoptdao.getReviewContents(review_seq);
				
				request.setAttribute("rv", review);
				request.getRequestDispatcher("adopt/reviewModify.jsp").forward(request, response);	

			}else if(url.contentEquals("/reviewModify.apt")) {
				
				String user_id = null;
				MemberDTO session_chk = (MemberDTO)session.getAttribute("loginInfo");
				if(session_chk != null) { 
					user_id = (session_chk).getUser_id();
				}
				
				System.out.println("리뷰수정 ");
				String filesPath = request.getServletContext().getRealPath("/upload/review");
				MultipartRequest multi = new MultipartRequest(request, filesPath, FileConfig.uploadmaxSize, "utf8", new DefaultFileRenamePolicy());				
				int review_seq = Integer.parseInt(multi.getParameter("review_seq"));
				String review_title = multi.getParameter("title");
				String review_writer = user_id;
				String review_introduce = multi.getParameter("introduce");
				String review_thumbnail = multi.getFilesystemName("thumbnail");
				if (review_thumbnail != null) {review_thumbnail = Normalizer.normalize(review_thumbnail, Form.NFC);}
				String review_contents = multi.getParameter("contents");
				String deleteImg = multi.getParameter("deleteImg");
				
				File targetFile = new File(filesPath + "/"+ deleteImg); // 썸네일 이미지 삭제
				boolean result3 = targetFile.delete();

				ReviewDTO dto = new ReviewDTO(review_seq, review_title, review_writer, review_introduce,review_thumbnail, review_contents, null, 0, 0);
				int result = adoptdao.modifyReview(dto);
				
				response.sendRedirect(ctxPath+"/reviewList.apt?cpage=1");
				
			}else if(url.contentEquals("/uploadImg.apt")) {

				response.setCharacterEncoding("utf8");
				response.setContentType("text/html;charset=utf8");

				String realPath = request.getServletContext().getRealPath("upload/editor");
				File filesPath = new File(realPath);
				System.out.println(realPath);

				if(!filesPath.exists()) {filesPath.mkdir();}
				MultipartRequest multi = new MultipartRequest(request, realPath, FileConfig.uploadmaxSize, "utf-8", new DefaultFileRenamePolicy());

				String sysName = multi.getFilesystemName("file");
				System.out.println("sysName : "+ sysName);
				sysName = Normalizer.normalize(sysName, Form.NFC);

				String returnPath = "/upload/editor/" + sysName;

				System.out.println("returnPath : " + returnPath);
				response.getWriter().append(returnPath);

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
