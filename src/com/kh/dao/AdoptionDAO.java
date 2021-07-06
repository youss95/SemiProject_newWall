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

	public List<AnimalDTO> getPageList(int startNum, int endNum, AnimalDTO dto) throws Exception{
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
			an_name = "1";
			dto.setAn_name("1");
		}

		String sql = "select * from "
				+ "(select row_number() over(order by code_seq desc) row_number, code_seq, an_name, an_category, an_gender, an_kind, an_age, an_weight, an_character, an_photo, an_neutering from animal "
				+ " where " + an_category + " like '%" + dto.getAn_category() + "%'"
				+ " and " + an_gender + " like '%" + dto.getAn_gender() + "%'"
				+ " and (" + an_weight + " between " + start_weight + " and "+ end_weight + ")"
				+ " and (" + an_age + " between " + start_age + " and "+ end_age + ")"
				+ " and " + an_character + " like '%" + dto.getAn_character() + "%'"
				+ " and "+ an_name + " like '%" + dto.getAn_name() + "%' ) where row_number between ? and ?";

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
				an_name = "1";
				dto.setAn_name("1");
			}

			sql = "select count(*) from animal"
					+ " where " + an_category + " like '%" + dto.getAn_category() + "%'"
					+ " and " + an_gender + " like '%" + dto.getAn_gender() + "%'"
					+ " and (" + an_weight + " between " + start_weight + " and "+ end_weight + ")"
					+ " and (" + an_age + " between " + start_age + " and "+ end_age + ")"
					+ " and " + an_character + " like '%" + dto.getAn_character() + "%'"
					+ " and "+ an_name + " like '%" + dto.getAn_name() + "%'";
			System.out.println(sql);
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


	public List<String> getPageNavi(int currentPage, AnimalDTO dto) throws Exception{ // 페이지 카운트
		int recordTotalCount = this.getRecordCount(dto); // 전체 레코드개수 (원래는 커넥션으로 카운트해서 가져옴)
		int recordCountPerPage = PageConfig.ADOPT_RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = PageConfig.ADOPT_NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작으로부터 끝까지의 페이지가 총 몇개인지.

		int pageTotalCount = 0; // 총 페이지

		if((recordTotalCount % recordCountPerPage) > 0) { // 페이지 갯수가 일의자리가 있는 경우
			pageTotalCount =recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage; // 0 으로 떨어지는 페이지 일 경우
		}

		//방어코드 (현재 위치 페이지가 총 페이지보다 넘치거나 -1 이 될 경우)
		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}
		System.out.println(pageTotalCount + ": total");

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1; // 네비 시작페이지 구하기
		int endNavi = startNavi + naviCountPerPage - 1; // 네비 마지막 페이지 구하기

		if(endNavi > pageTotalCount) {endNavi = pageTotalCount;} // 방어코드 (엔드네비가 토탈보다 큰 에러일 시)

		boolean needPrev = true; // < : 이전페이지
		boolean needNext = true; // > : 다음페이지

		if(startNavi == 1) {needPrev = false;} // <, > 페이지 버튼 달아주기 1
		if(endNavi == pageTotalCount) {needNext = false;}


		List<String> pageNavi = new ArrayList<String>(); // <, > 페이지 버튼 달아주기 2
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));
			System.out.println("String.valueOf(i)" + String.valueOf(i));

		}
		if(needNext) {pageNavi.add(">");}
		System.out.println("startNavi : "+startNavi);
		System.out.println("endNavi : "+endNavi);

		return pageNavi;
	}


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
					dto.setAnfile_seq(rs.getInt("photo_seq"));
					dto.setOri_name(rs.getNString("ori_name"));
					dto.setSys_name(rs.getNString("sys_name"));
					dto.setReg_date(rs.getDate("reg_date"));

					list.add(dto);
				}

				return list;
			}
		}
	}



}
