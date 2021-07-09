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


public class AdminDAO {

	private static AdminDAO instance;

	public synchronized static AdminDAO getInstance() {
		if(instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private AdminDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// adoption
	public List<AdoptionDTO> getAdoptionList() throws Exception{
		String sql = "select * from adoption";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<AdoptionDTO> list = new ArrayList<>();
			while(rs.next()) {
				AdoptionDTO dto = new AdoptionDTO();

				dto.setP_name(rs.getNString("p_name"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setCode_seq(rs.getNString("code_seq"));
				dto.setAdopt_seq(rs.getInt("adopt_seq"));
				dto.setQ01_aname(rs.getNString("q01_aname"));
				dto.setUser_id(rs.getNString("user_id"));

				list.add(dto);
			}
			return list;
		}
	}

	// adoption
	public String getAnimalCode() throws Exception{
		String sql = "select 'AM'|| LPAD(code_seq.nextval,5,0) from dual";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			rs.next();
			return rs.getString(1);

		}
	}

	// adoption
	public int animalInfoReg(AnimalDTO adto) throws Exception{
		String sql = "insert into animal values(?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, sysdate, ?)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, adto.getCode_seq());
			pstat.setString(2, adto.getAn_name());
			pstat.setString(3, adto.getAn_category());
			pstat.setString(4, adto.getAn_gender());
			pstat.setString(5, adto.getAn_kind());
			pstat.setInt(6, adto.getAn_age());
			pstat.setInt(7, adto.getAn_weight());
			pstat.setString(8, adto.getAn_character());
			pstat.setDate(9, adto.getAn_date());
			pstat.setString(10, adto.getAn_status());
			pstat.setString(11, adto.getAn_photo());
			pstat.setString(12, adto.getAn_contents());
			pstat.setString(13, adto.getAn_neutering());

			int result = pstat.executeUpdate();
			return result;
		}
	}

	// adoption
	public int getRecordCount() throws Exception{

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

	// adoption
	public List<String> getPageNavi(int currentPage) throws Exception{ 
		int recordTotalCount = this.getRecordCount(); 
		int recordCountPerPage = PageConfig.ANIMAL_RECORD_COUNT_PER_PAGE; 
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

	public List<AnimalDTO> getPageList(int startNum, int endNum) throws Exception{
		String sql = "select * from (select row_number() over(order by code_seq desc) row_number, code_seq, an_name, an_category, an_kind, an_status, an_date from animal) where row_number between ? and ?";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);

			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<AnimalDTO> list = new ArrayList<>();
				while(rs.next()) {
					AnimalDTO dto = new AnimalDTO();
					
					dto.setCode_seq(rs.getNString("code_seq"));
					dto.setAn_name(rs.getNString("an_name"));
					dto.setAn_category(rs.getNString("an_category"));
					dto.setAn_kind(rs.getNString("an_kind"));
					dto.setAn_status(rs.getNString("an_status"));
					dto.setAn_date(rs.getDate("an_date"));

					list.add(dto);
				}
				return list;
			}
		}
	}
	
	

	// adoption
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
				if(rs.next()) {
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
					dto.setAn_status(rs.getNString("an_status"));
					dto.setAn_photo(rs.getNString("an_photo"));
					dto.setAn_contents(rs.getNString("an_contents"));
					dto.setAn_reg_date(rs.getDate("an_reg_date"));
					dto.setAn_neutering(rs.getNString("an_neutering"));
					return dto;
				}
				
				return null;
				
			}

		}

	}
	


}
