package com.kh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kh.dto.AdoptionDTO;
import com.kh.dto.AnimalDTO;

public class AdoptionDAO {

	
	private static AdoptionDAO instance;

	public synchronized static AdoptionDAO getInstance() { // 싱글톤 패턴
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
		String sql = "select * from animals";

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
				dto.setAn_contents(rs.getNString("an_contents"));
				dto.setAn_reg_date(rs.getDate("an_reg_date"));

				list.add(dto);
			}
			return list;
		}
	}
	
	
	
}
