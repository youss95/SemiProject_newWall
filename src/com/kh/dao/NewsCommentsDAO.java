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

import com.kh.dto.NewsCommentsDTO;

public class NewsCommentsDAO {
	private static NewsCommentsDAO instance;

	public synchronized static NewsCommentsDAO getInstance() {
		if (instance == null) {
			instance = new NewsCommentsDAO();
		}
		return instance;
	}

	private NewsCommentsDAO() {
	};

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insert(NewsCommentsDTO dto) throws Exception {
		String sql = "insert into news_reply values(nrp_num.nextval,?,?,sysdate,?)";
		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, dto.getNrp_writer());
			pstat.setString(2, dto.getNrp_contents());
			pstat.setString(3, dto.getNrp_parent());
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public List<NewsCommentsDTO> commentsAll(String parent) throws Exception {
		String sql = "select * from news_reply where nrp_parent = ? order by nrp_seq desc";
		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, parent);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NewsCommentsDTO> list = new ArrayList<>();
				while (rs.next()) {
					int nrp_seq = rs.getInt("nrp_seq");
					String nrp_contents = rs.getString("nrp_contents");
					String nrp_writer = rs.getString("nrp_writer");
					Date nrp_reg_date = rs.getDate("nrp_reg_date");
					String nrp_parent = rs.getString("nrp_parent");
					
					NewsCommentsDTO dto = new NewsCommentsDTO(nrp_seq,nrp_contents,nrp_writer,nrp_reg_date,nrp_parent);
					list.add(dto);				
				}
				return list;
			}
		}
	}
	
	public int delete(int seq) throws Exception {
		String sql = "delete from news_reply where nrp_seq = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setInt(1, seq);
				int result = pstat.executeUpdate();
				return result;
		}
	}
	
	public int pdelete(String parent) throws Exception {
		String sql = "delete from news_reply where nrp_parent = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setString(1, parent);
				int result = pstat.executeUpdate();
				return result;
		}
	}
	
	public int modify(int seq , String comments) throws Exception {
		String sql = "update news_reply set nrp_contents=? where nrp_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);	
				){
			pstat.setString(1, comments);
			pstat.setInt(2, seq);
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
}
