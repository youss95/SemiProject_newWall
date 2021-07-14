package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kh.config.PageConfig;
import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.ReviewDTO;
//import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class AdoptionDAO {


	private static AdoptionDAO instance;

	public synchronized static AdoptionDAO getInstance() {
		if(instance == null) {
			instance = new AdoptionDAO();
		}
		return instance;
	}

	private AdoptionDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	//adoption
	public List<AnimalDTO> getAnimalList() throws Exception{
		String sql = "select * from animal";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<AnimalDTO> list = new ArrayList<>();
			while(rs.next()) {
				AnimalDTO dto = new AnimalDTO();

				dto.setCode_seq(rs.getNString("code_seq"));
				dto.setAn_name(rs.getNString("an_name"));
				dto.setAn_category(rs.getNString("an_category"));
				dto.setAn_gender(rs.getNString("an_gender"));
				dto.setAn_kind(rs.getNString("an_kind"));
				dto.setAn_age(rs.getInt("an_age"));
				dto.setAn_weight(rs.getInt("an_weight"));
				dto.setAn_character(rs.getNString("an_character"));
				dto.setAn_date(rs.getDate("an_date"));
				dto.setAn_status(rs.getNString("an_status"));
				dto.setAn_photo(rs.getNString("an_photo"));
				dto.setAn_contents(rs.getNString("an_contents"));
				dto.setAn_reg_date(rs.getDate("an_reg_date"));
				dto.setAn_neutering(rs.getNString("an_neutering"));

				list.add(dto);
			}
			return list;
		}
	}

	//adoption
	
	public List<AnimalDTO> getPageList(int startNum, int endNum, AnimalDTO dto) throws Exception{

		String an_category = null;
		String an_gender = null;
		String an_weight = "an_weight";
		String an_age = "an_age";
		String an_character = null;
		int start_age = 0;
		int end_age = 100;
		int start_weight = 0;
		int end_weight = 100;

		if(dto.getAn_category().contentEquals("개") || dto.getAn_category().contentEquals("고양이")) { // 카테고리 검색
			an_category = "an_category"; 
		}else { 
			an_category = "1";
			dto.setAn_category("1");
		}
		if(dto.getAn_gender().contentEquals("암컷") || dto.getAn_gender().contentEquals("수컷")) { // 성별 검색
			an_gender = "an_gender";
		}else {
			an_gender = "1";
			dto.setAn_gender("1");
		}
		if(dto.getAn_weight_range().contentEquals("") || dto.getAn_weight_range() == null) { // 무게 검색
			an_weight = "1";
			dto.setAn_weight(1);
		}else if(dto.getAn_weight_range().contentEquals("small")) {
			start_weight = 1;
			end_weight = 7;
		}else if(dto.getAn_weight_range().contentEquals("middle")) {
			start_weight = 8;
			end_weight = 17;			
		}else if(dto.getAn_weight_range().contentEquals("big")) {
			start_weight = 18;	
		}
		if(dto.getAn_age_range().contentEquals("") || dto.getAn_age_range() == null) { // 나이 검색 
			an_age = "1";
			dto.setAn_age(1);
		}else if(dto.getAn_age_range().contentEquals("puppy")) {
			start_age = 1;
			end_age = 1;
		}else if(dto.getAn_age_range().contentEquals("junior")) {
			start_age = 1;
			end_age = 2;			
		}else if(dto.getAn_age_range().contentEquals("adult")) {
			start_age = 3;
			end_age = 8;	
		}else if(dto.getAn_age_range().contentEquals("senior")) {
			start_age = 9;			
		}
		if(dto.getAn_character().contentEquals("얌전") || dto.getAn_character().contentEquals("보통") || dto.getAn_character().contentEquals("활발") || dto.getAn_character().contentEquals("매우활발")) { // 성격 검색
			an_character = "an_character";
		}else {
			an_character = "1";
			dto.setAn_character("1");
		}

		String sql = "select * from "
				+ "(select row_number() over(order by code_seq desc) row_number, code_seq, an_name, an_category, an_gender, an_kind, an_age, an_weight, an_character, an_photo, an_neutering from animal "
				+ " where " + an_category + " like '%" + dto.getAn_category() + "%'"
				+ " and " + an_gender + " like '%" + dto.getAn_gender() + "%'"
				+ " and (" + an_weight + " between " + start_weight + " and "+ end_weight + ")"
				+ " and (" + an_age + " between " + start_age + " and "+ end_age + ")"
				+ " and " + an_character + " like '%" + dto.getAn_character() + "%'"
				+ " and an_name like '%" + dto.getAn_name() + "%' ) where row_number between ? and ?";

//		System.out.println("1111 : " +sql);

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			System.out.println("2222 : " +sql);
			System.out.println("======여기는 dao 끝 ========");

			try(
					ResultSet rs = pstat.executeQuery();
					){

				List<AnimalDTO> list = new ArrayList<AnimalDTO>();
				while(rs.next()) {
					AnimalDTO adto = new AnimalDTO();
					adto.setCode_seq(rs.getNString("code_seq"));
					adto.setAn_name(rs.getNString("an_name"));
					adto.setAn_category(rs.getNString("an_category"));
					adto.setAn_gender(rs.getNString("an_gender"));
					adto.setAn_kind(rs.getNString("an_kind"));
					adto.setAn_age(rs.getInt("an_age"));
					adto.setAn_weight(rs.getInt("an_weight"));
					adto.setAn_character(rs.getNString("an_character"));
					adto.setAn_photo(rs.getNString("an_photo"));
					adto.setAn_neutering(rs.getNString("an_neutering"));

					list.add(adto);
				}
				return list;
			}

		}

	}
	

	//adoption
	public List<AnimalDTO> getPageList(int startNum, int endNum) throws Exception{

		String sql = "select * from (select row_number() over(order by code_seq desc) row_number, code_seq, an_name, an_category, an_gender, an_kind, an_age, an_weight, an_character, an_date, an_photo, an_neutering from animal) where row_number between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			try(
					ResultSet rs = pstat.executeQuery();
					){

				List<AnimalDTO> list = new ArrayList<AnimalDTO>();
				while(rs.next()) {
					AnimalDTO dto = new AnimalDTO();
					dto.setCode_seq(rs.getNString("code_seq"));
					dto.setAn_name(rs.getNString("an_name"));
					dto.setAn_category(rs.getNString("an_category"));
					dto.setAn_gender(rs.getNString("an_gender"));
					dto.setAn_kind(rs.getNString("an_kind"));
					dto.setAn_age(rs.getInt("an_age"));
					dto.setAn_weight(rs.getInt("an_weight"));
					dto.setAn_character(rs.getNString("an_character"));
					dto.setAn_date(rs.getDate("an_date"));
					dto.setAn_photo(rs.getNString("an_photo"));
					dto.setAn_neutering(rs.getNString("an_neutering"));

					list.add(dto);
				}
				return list;

			}

		}
	}

	//adoption
	private int getRecordCount(AnimalDTO dto) throws Exception{

		String sql = null;

		if((dto.getAn_category() == null || dto.getAn_category().contentEquals(""))) { // 초기로드
			sql = "select count(*) from animal";
		}else {
			String an_category = "an_category";
			String an_gender = "an_gender";
			String an_weight = "an_weight";
			String an_age = "an_age";
			String an_character = "an_character";
			String an_name = "an_name";
			int start_age = 0;
			int end_age = 100;
			int start_weight = 0;
			int end_weight = 100;

			if(dto.getAn_category().contentEquals("all")) { // 카테고리 검색
				an_category = "1";
				dto.setAn_category("1");
			}
			if(dto.getAn_gender().contentEquals("all")) { // 성별 검색
				an_gender = "1";
				dto.setAn_gender("1");
			}
			if(dto.getAn_weight_range().contentEquals("all")) { // 무게 검색
				an_weight = "1";
				dto.setAn_weight(1);
			}else if(dto.getAn_weight_range().contentEquals("small")) {
				start_weight = 1;
				end_weight = 7;
			}else if(dto.getAn_weight_range().contentEquals("middle")) {
				start_weight = 8;
				end_weight = 17;			
			}else if(dto.getAn_weight_range().contentEquals("big")) {
				start_weight = 18;	
			}
			if(dto.getAn_age_range().contentEquals("all")) { // 나이 검색
				an_age = "1";
				dto.setAn_age(1);
			}else if(dto.getAn_age_range().contentEquals("puppy")) {
				start_age = 1;
				end_age = 1;
			}else if(dto.getAn_age_range().contentEquals("junior")) {
				start_age = 1;
				end_age = 2;			
			}else if(dto.getAn_age_range().contentEquals("adult")) {
				start_age = 3;
				end_age = 8;	
			}else if(dto.getAn_age_range().contentEquals("senior")) {
				start_age = 9;			
			}
			if(dto.getAn_character().contentEquals("all")) { // 성격 검색
				an_character = "1";
				dto.setAn_character("1");
			}
			if(dto.getAn_name().contentEquals("") || dto.getAn_name() == null) { // 이름 검색
//				an_name = "1";
//				dto.setAn_name("1");
			}

			sql = "select count(*) from animal"
					+ " where " + an_category + " like '%" + dto.getAn_category() + "%'"
					+ " and " + an_gender + " like '%" + dto.getAn_gender() + "%'"
					+ " and (" + an_weight + " between " + start_weight + " and "+ end_weight + ")"
					+ " and (" + an_age + " between " + start_age + " and "+ end_age + ")"
					+ " and " + an_character + " like '%" + dto.getAn_character() + "%'"
					+ " and "+ an_name + " like '%" + dto.getAn_name() + "%'";
		}
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}

	}

	//adoption
	private int getRecordCount() throws Exception{

		String sql = "select count(*) from animal";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}

	}

	//adoption
	public List<String> getPageNavi(int currentPage, AnimalDTO dto) throws Exception{ 
		int recordTotalCount = this.getRecordCount(dto); 
		int recordCountPerPage = PageConfig.ADOPT_RECORD_COUNT_PER_PAGE; 
		int naviCountPerPage = PageConfig.ADOPT_NAVI_COUNT_PER_PAGE; 

		int pageTotalCount = 0; 

		if((recordTotalCount % recordCountPerPage) > 0) { 
			pageTotalCount =recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage; 
		}

		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1; 

		if(endNavi > pageTotalCount) {endNavi = pageTotalCount;} 

		boolean needPrev = true; 
		boolean needNext = true; 

		if(startNavi == 1) {needPrev = false;} 
		if(endNavi == pageTotalCount) {needNext = false;}


		List<String> pageNavi = new ArrayList<String>(); 
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));
		}
		if(needNext) {pageNavi.add(">");}

		return pageNavi;
	}

	//adoption
	public List<String> getPageNavi(int currentPage) throws Exception{ 
		int recordTotalCount = this.getRecordCount();
		int recordCountPerPage = PageConfig.ADOPT_RECORD_COUNT_PER_PAGE; 
		int naviCountPerPage = PageConfig.ADOPT_NAVI_COUNT_PER_PAGE;

		int pageTotalCount = 0;

		if((recordTotalCount % recordCountPerPage) > 0) { 
			pageTotalCount =recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; 
		int endNavi = startNavi + naviCountPerPage - 1; 

		if(endNavi > pageTotalCount) {endNavi = pageTotalCount;} 

		boolean needPrev = true;
		boolean needNext = true; 

		if(startNavi == 1) {needPrev = false;} 
		if(endNavi == pageTotalCount) {needNext = false;}


		List<String> pageNavi = new ArrayList<String>();
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));

		}
		if(needNext) {pageNavi.add(">");}

		return pageNavi;
	}


	//adoption
	public AnimalDTO getAnimalInfo(String code_seq) throws Exception{
		String sql = "select * from animal where code_seq = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, code_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				AnimalDTO dto = new AnimalDTO();
				dto.setCode_seq(code_seq);
				dto.setAn_name(rs.getNString("an_name"));
				dto.setAn_category(rs.getNString("an_category"));
				dto.setAn_gender(rs.getNString("an_gender"));
				dto.setAn_kind(rs.getNString("an_kind"));
				dto.setAn_age(rs.getInt("an_age"));
				dto.setAn_weight(rs.getInt("an_weight"));
				dto.setAn_character(rs.getNString("an_character"));
				dto.setAn_date(rs.getDate("an_date"));
				dto.setAn_contents(rs.getNString("an_contents"));
				dto.setAn_reg_date(rs.getDate("an_reg_date"));
				dto.setAn_neutering(rs.getNString("an_neutering"));

				return dto;
			}
		}
	}

	//adoption
	public List<AnimalFilesDTO> getAnimalFiles(String code_seq) throws Exception{
		String sql = "select * from animal_photos where code_seq = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, code_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<AnimalFilesDTO> list = new ArrayList<AnimalFilesDTO>();

				while(rs.next()) {					
					AnimalFilesDTO dto = new AnimalFilesDTO();

					dto.setCode_seq(code_seq);
					dto.setPhoto_seq(rs.getInt("photo_seq"));
					dto.setOri_name(rs.getNString("ori_name"));
					dto.setSys_name(rs.getNString("sys_name"));
					dto.setReg_date(rs.getDate("reg_date"));

					list.add(dto);
				}

				return list;
			}
		}
	}

	//adoption
	public String getAnimalName(String code_seq) throws Exception{
		String sql = "select an_name from animal where code_seq = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, code_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getNString("an_name");
			}
		}

	}

	//adoption
	public int insertRegForm(AdoptionDTO dto) throws Exception{
		String sql = "insert into adoption values(adopt_seq.nextval,?, sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getCode_seq());
			pstat.setString(2, dto.getUser_id());
			pstat.setString(3, dto.getP_name());
			pstat.setString(4, dto.getP_phone01());
			pstat.setString(5, dto.getP_phone02());
			pstat.setString(6, dto.getP_email());
			pstat.setString(7, dto.getP_gender());
			pstat.setString(8, dto.getP_age());
			pstat.setString(9, dto.getP_address());
			pstat.setString(10, dto.getP_mstatus());
			pstat.setString(11, dto.getP_arg());
			pstat.setString(12, dto.getQ01_aname());
			pstat.setString(13, dto.getQ02_alternative());
			pstat.setString(14, dto.getQ03_time_to_worry());
			pstat.setString(15, dto.getQ04_reason());
			pstat.setString(16, dto.getQ05_family_member());
			pstat.setString(17, dto.getQ06_family_arg());
			pstat.setString(18, dto.getQ07_pet());
			pstat.setString(19, dto.getQ08_experience());
			pstat.setString(20, dto.getQ09_housing_type());
			pstat.setString(21, dto.getQ10_host_consent());
			pstat.setString(22, dto.getQ11_impossible_situation());
			pstat.setString(23, dto.getQ12_lodging_problem());
			pstat.setString(24, dto.getQ13_payment_arg());
			pstat.setString(25, dto.getQ14_neutered_arg());
			pstat.setString(26, dto.getQ15_visit_agr());
			pstat.setString(27, dto.getQ16_adopt_arg());
			pstat.setString(28, dto.getAd_status());

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// review	
	public int insertReview(ReviewDTO dto) throws Exception{
		String sql = "insert into review values(review_seq.nextval, ?, ?, ?, ?, ?, sysdate, 0, 0)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getReview_title());
			pstat.setString(2, dto.getReview_writer());
			pstat.setString(3, dto.getReview_introduce());
			pstat.setString(4, dto.getReview_thumbnail());
			pstat.setString(5, dto.getReview_contents());

			int result = pstat.executeUpdate();
			return result;
		}
	}

	//review
	public List<ReviewDTO> getAllReview() throws Exception{
		String sql = "select * from review";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<ReviewDTO> list = new ArrayList<ReviewDTO>();

			while(rs.next()) {
				ReviewDTO dto = new ReviewDTO();

				dto.setReview_seq(rs.getInt("review_seq"));
				dto.setReview_title(rs.getString("review_title"));
				dto.setReview_introduce(rs.getString("review_introduce"));
				dto.setReview_thumbnail(rs.getString("review_thumbnail"));
				dto.setReview_contents(rs.getString("review_contents"));
				dto.setReview_writer(rs.getString("review_writer"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setReview_like(rs.getInt("review_like"));
				dto.setReview_view(rs.getInt("review_view"));

				list.add(dto);
			}

			return list;
		}
	}

	//review
	public ReviewDTO getReviewContents(int review_seq) throws Exception{
		String sql = "select * from review where review_seq = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setInt(1, review_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				ReviewDTO dto = new ReviewDTO();

				if(rs.next()) {
					dto.setReview_seq(rs.getInt("review_seq"));
					dto.setReview_title(rs.getString("review_title"));
					dto.setReview_introduce(rs.getString("review_introduce"));
					dto.setReview_thumbnail(rs.getString("review_thumbnail"));
					dto.setReview_contents(rs.getString("review_contents"));
					dto.setReview_writer(rs.getString("review_writer"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setReview_like(rs.getInt("review_like"));
					dto.setReview_view(rs.getInt("review_view"));

					return dto;
				}
				return null;
			}

		}
	}

	public int viewCount(int review_seq) throws Exception{
		String sql = "update review set review_view = review_view+1 where review_seq = ?";
		try(
				Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){			
			pstat.setInt(1, review_seq);

			int result = pstat.executeUpdate();
			return result;
		}
	}

	//review
	public int deleteReview(int review_seq) throws Exception{
		String sql = "delete from review where review_seq = ?";
		try(
				Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){			
			pstat.setInt(1, review_seq);

			int result = pstat.executeUpdate();
			return result;
		}

	}

	// review
	public String getImgName(int review_seq) throws Exception{

		String sql = "select review_thumbnail from review where review_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getString(1);
			}
		}

	}

	// review
	public String getReviewEdit(int review_seq) throws Exception{

		String sql = "select review_contents from review where review_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getString(1);
			}
		}

	}

	public int modifyReview(ReviewDTO dto) throws Exception{
		String sql = null;
		boolean existPhoto = false;
		if(dto.getReview_thumbnail() == null) {
			sql = "update review set review_title=?, review_writer=?, review_introduce=?, review_contents=? where review_seq=?";			
		}else {
			existPhoto = true;
			sql = "update review set review_title=?, review_writer=?, review_introduce=?, review_contents=?, review_thumbnail=? where review_seq=?";
		}

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			if(!existPhoto) {
				pstat.setNString(1, dto.getReview_title());
				pstat.setNString(2, dto.getReview_writer());
				pstat.setNString(3, dto.getReview_introduce());
				pstat.setNString(4, dto.getReview_contents());
				pstat.setInt(5, dto.getReview_seq());
			}else {
				pstat.setNString(1, dto.getReview_title());
				pstat.setNString(2, dto.getReview_writer());
				pstat.setNString(3, dto.getReview_introduce());
				pstat.setNString(4, dto.getReview_contents());
				pstat.setNString(5, dto.getReview_thumbnail());
				pstat.setInt(6, dto.getReview_seq());
			}
			int result = pstat.executeUpdate();
			System.out.println(sql);
			return result;
		}
	}


	// review
	public List<String> getPageNavi(int currentPage, String category, String contents) throws Exception{ 

		int recordTotalCount = this.getReviewRecordCount(category, contents); 


		int recordCountPerPage = PageConfig.REVIEW_RECORD_COUNT_PER_PAGE; 
		int naviCountPerPage = PageConfig.ADOPT_NAVI_COUNT_PER_PAGE; 

		int pageTotalCount = 0; 

		if((recordTotalCount % recordCountPerPage) > 0) { 
			pageTotalCount =recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage; 
		}

		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1; 

		if(endNavi > pageTotalCount) {endNavi = pageTotalCount;} 

		boolean needPrev = true; 
		boolean needNext = true; 

		if(startNavi == 1) {needPrev = false;} 
		if(endNavi == pageTotalCount) {needNext = false;}


		List<String> pageNavi = new ArrayList<String>(); 
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));
		}
		if(needNext) {pageNavi.add(">");}

		return pageNavi;
	}

	//review
	private int getReviewRecordCount(String category, String contents) throws Exception{

		String sql = null;

		if(category == null || category.contentEquals("")) { // 초기로드
			sql = "select count(*) from review";
		}else {
			if(category.contentEquals("title")) {
				sql = "select count(*) from review where review_title like '%"+ contents + "%'";
			}else if(category.contentEquals("writer")) {
				sql = "select count(*) from review where review_writer like '%"+ contents + "%'";
			}else if(category.contentEquals("introduce")) {
				sql = "select count(*) from review where review_introduce like '%"+ contents + "%'";
			}else if(category.contentEquals("contents")) {
				sql = "select count(*) from review where review_contents like '%"+ contents + "%'";
			}
		}

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getInt(1);
		}

	}

	//review
	public List<ReviewDTO> getReviewPageList(int startNum, int endNum) throws Exception{

		String sql = "select * from (select row_number() over(order by review_seq desc) row_number, review_seq, review_writer, review_title, review_introduce, review_contents, review_thumbnail, review_view, review_like, reg_date from review) where row_number between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			try(
					ResultSet rs = pstat.executeQuery();
					){

				List<ReviewDTO> list = new ArrayList<ReviewDTO>();
				while(rs.next()) {

					ReviewDTO dto = new ReviewDTO();
					dto.setReview_seq(rs.getInt("review_seq"));
					dto.setReview_title(rs.getNString("review_title"));
					dto.setReview_writer(rs.getNString("review_writer"));
					dto.setReview_introduce(rs.getNString("review_introduce"));
					dto.setReview_contents(rs.getNString("review_contents"));
					dto.setReview_view(rs.getInt("review_view"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setReview_like(rs.getInt("review_like"));
					dto.setReview_thumbnail(rs.getNString("review_thumbnail"));

					list.add(dto);
				}
				return list;

			}

		}
	}

	//review
	public List<ReviewDTO> getReviewPageList(int startNum, int endNum, String category, String contents) throws Exception{
		String sql = null;

		if((category == null || category.contentEquals(""))) { // 초기로드
			sql = "select count(*) from review";
		}else {
			sql = "select * from  (select row_number() over(order by review_seq desc) row_number, review_seq, review_writer, review_title, review_introduce, review_contents, reg_date, review_thumbnail, review_view, review_like from review where ";
			if(category.contentEquals("title")) {
				sql += "review_title like '%" + contents +"%') where row_number between ? and ?";
			}else if(category.contentEquals("writer")) {
				sql += "review_writer like '%" + contents +"%') where row_number between ? and ?";
			}else if(category.contentEquals("introduce")) {
				sql += "review_introduce like '%" + contents +"%') where row_number between ? and ?";
			}else if(category.contentEquals("contents")) {
				sql += "review_contents like '%" + contents +"%') where row_number between ? and ?";
			}
		}

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			System.out.println("입양 동물 리스트 검색 :  " + sql);
			try(
					ResultSet rs = pstat.executeQuery();
					){

				List<ReviewDTO> list = new ArrayList<ReviewDTO>();
				while(rs.next()) {
					ReviewDTO dto = new ReviewDTO();
					dto.setReview_seq(rs.getInt("review_seq"));
					dto.setReview_title(rs.getNString("review_title"));
					dto.setReview_writer(rs.getNString("review_writer"));
					dto.setReview_introduce(rs.getNString("review_introduce"));
					dto.setReview_contents(rs.getNString("review_contents"));
					dto.setReview_view(rs.getInt("review_view"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setReview_like(rs.getInt("review_like"));
					dto.setReview_thumbnail(rs.getNString("review_thumbnail"));

					list.add(dto);
				}
				return list;
			}

		}

	}

	//adoption
	public int getAdoptionRecord(String user_id) throws Exception{
		String sql = "select count(*) from adoption where user_id = ? and ad_status='완료' ";;

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, user_id);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getInt(1);
			}
		}

	}

	//review
	public int inserReviewtLike(int review_seq, String user_id) throws Exception{
		String sql = "insert into review_like values(?, ?)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			pstat.setString(2, user_id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	//review
	public int reviewLikeChk(int review_seq, String user_id) throws Exception{
		String sql = "select count(*) from review_like where review_seq= ? and user_id = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			pstat.setString(2, user_id);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getInt(1);
			}
		}

	}

	//review
	public int deleteReviewtLike(int review_seq, String user_id) throws Exception{
		String sql = "delete from review_like where review_seq=? and user_id = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			pstat.setString(2, user_id);

			int result = pstat.executeUpdate();
			return result;

		}
	}

	//review
	public int getReviewLikeCount(int review_seq) throws Exception{
		String sql = "select count(*) from review_like where review_seq = ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, review_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getInt(1);
			}
		}

	}

	//review
	public int updateReviewtLike(int review_seq, int num) throws Exception{

		String sql = "update review set review_like=? where review_seq=?";
		System.out.println(sql);
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, num);
			pstat.setInt(2, review_seq);

			int result = pstat.executeUpdate();
			return result;

		}
	}

	//adoption
	public int getAnimalAdoptionStatus(String code_seq) throws Exception{
		String sql = "select count(*) from adoption where code_seq = ? and ad_status='완료'";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, code_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getInt(1);
			}
		}

	}

}
