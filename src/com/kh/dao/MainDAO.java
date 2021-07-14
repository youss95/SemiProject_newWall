package com.kh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kh.dto.AnimalDTO;
import com.kh.dto.AnimalFilesDTO;

public class MainDAO {

	private static MainDAO instance;

	public synchronized static MainDAO getInstance() {
		if(instance == null) {
			instance = new MainDAO();
		}
		return instance;
	}

	private MainDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// animal
	public List<AnimalDTO> getMainAnimalsImg() throws Exception {
		String sql = "select rownum, code_seq, an_photo from animal where rownum between 1 and 8";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			List<AnimalDTO> list = new ArrayList<AnimalDTO>();
			while(rs.next()) {
				AnimalDTO dto = new AnimalDTO();
				dto.setCode_seq(rs.getString("code_seq"));
				dto.setAn_photo(rs.getString("an_photo"));
				list.add(dto);
			}

			return list;
		}
	}
	
}
