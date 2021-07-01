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

	public int animalInfoReg(AnimalDTO adto) throws Exception{
		String sql = "insert into animal values('AM'|| LPAD(animal_photos.nextval, 5, 0), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";

		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, adto.getAn_name());
			pstat.setString(2, adto.getAn_category());
			pstat.setString(3, adto.getAn_gender());
			pstat.setString(4, adto.getAn_kind());
			pstat.setInt(5, adto.getAn_age());
			pstat.setInt(6, adto.getAn_weight());
			pstat.setString(7, adto.getAn_character());
			pstat.setDate(8, adto.getAn_date());
			pstat.setString(9, adto.getAn_status());
			pstat.setString(10, adto.getAn_contents());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	

}
