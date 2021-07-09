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

import com.kh.dto.NewsFileDTO;


public class NewsFileDAO {
	private static NewsFileDAO instance;
	
	public synchronized static NewsFileDAO getInstance() {
		if(instance == null) {
			instance = new NewsFileDAO();
		}
		return instance;
	}
	
	private NewsFileDAO() {}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public String getSysName(int seq) throws Exception {
		String sql = "select sysname from news_files where seq = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				return rs.getString("sysname");
			}
		}
	}
	
	public int insert(NewsFileDTO dto) throws Exception{
		String sql = "insert into news_files values(nefiles_seq.nextval,?,?,sysdate,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
				pstat.setString(1, dto.getOriName());
				pstat.setString(2, dto.getSysName());
				pstat.setInt(3, dto.getParent());
				int result = pstat.executeUpdate();
				con.commit();
				return result;
		}
	}
	
	public List<NewsFileDTO> selectBySeq(int fparent) throws Exception {
		String sql = "select * from news_files where parent = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);				
				){
			pstat.setInt(1, fparent);
			try(ResultSet rs = pstat.executeQuery()
					){
				List<NewsFileDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String oriName = rs.getString("oriName");
					String sysName = rs.getString("sysName");
					Date reg_date = rs.getDate("reg_date");
					int parent = rs.getInt("parent");
					list.add(new NewsFileDTO(seq,oriName,sysName,reg_date,parent));
					
				}
				return list;
			}
			
		}
		
	}
	
	public int delete(int seq) throws Exception {
		String sql = "delete from news_files where seq = ?";
	
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setInt(1, seq);
				int result = pstat.executeUpdate();
				con.commit();
				return result;			
		}	
	}
}
