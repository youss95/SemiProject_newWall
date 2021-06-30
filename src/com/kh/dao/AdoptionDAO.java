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
	

	
	
	
}
