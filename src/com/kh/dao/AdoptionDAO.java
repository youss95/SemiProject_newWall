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
	
	public List<AdoptionDTO> getAdoptionList() throws Exception{
		String sql = "select * from adopt_regi";
		
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<AdoptionDTO> list = new ArrayList<>();
			while(rs.next()) {
				AdoptionDTO dto = new AdoptionDTO();
				
				dto.setAdopt_seq(rs.getInt("adopt_seq"));
				dto.setCode_seq(rs.getNString("code_seq"));
				dto.setUser_id(rs.getNString("user_id"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setAn_name(rs.getNString("an_name"));
				
				list.add(dto);
			}
			return list;
		}
	}
	
	
	
}
