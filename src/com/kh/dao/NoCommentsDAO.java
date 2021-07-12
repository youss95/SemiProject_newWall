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

import com.kh.dto.NoCommentsDTO;

public class NoCommentsDAO {
	private static NoCommentsDAO instance;

	public synchronized static NoCommentsDAO getInstance() {
		if (instance == null) {
			instance = new NoCommentsDAO();
		}
		return instance;
	}

	private NoCommentsDAO() {
	};

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insert(NoCommentsDTO dto) throws Exception {
		String sql = "insert into notice_reply values(ntrp_num.nextval,?,?,sysdate,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getNtrp_writer());
			pstat.setString(2, dto.getNtrp_contents());
			pstat.setString(3, dto.getNtrp_parent());
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public List<NoCommentsDTO> commentsAll(String parent) throws Exception {
		String sql = "select * from notice_reply where ntrp_parent = ? order by ntrp_seq desc";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, parent);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NoCommentsDTO> list = new ArrayList<>();
				while (rs.next()) {
					int ntrp_seq = rs.getInt("ntrp_seq");
					String ntrp_contents = rs.getString("ntrp_contents");
					String ntrp_writer = rs.getString("ntrp_writer");
					Date ntrp_reg_date = rs.getDate("ntrp_reg_date");
					String ntrp_parent = rs.getString("ntrp_parent");
					
					NoCommentsDTO dto = new NoCommentsDTO(ntrp_seq,ntrp_contents,ntrp_writer,ntrp_reg_date,ntrp_parent);
					list.add(dto);				
				}
				return list;
			}
		}
	}
	
	public int delete(int seq) throws Exception {
		String sql = "delete from notice_reply where ntrp_seq = ?";
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
		String sql = "delete from notice_reply where ntrp_parent = ?";
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
		String sql = "update notice_reply set ntrp_contents=? where ntrp_seq = ?";
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
