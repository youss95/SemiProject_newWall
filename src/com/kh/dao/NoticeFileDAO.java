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

import com.kh.dto.AnimalFilesDTO;
import com.kh.dto.NoticeFileDTO;

public class NoticeFileDAO {
private static NoticeFileDAO instance;
	
	public synchronized static NoticeFileDAO getInstance() {
		if(instance == null) {
			instance = new NoticeFileDAO();
		}
		return instance;
	}
	
	private NoticeFileDAO() {}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public String getSysName(int seq) throws Exception {
		String sql = "select sysname from files where seq = ?";
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
	
	public int insert(NoticeFileDTO dto) throws Exception{
		String sql = "insert into files values(files_seq.nextval,?,?,sysdate,?)";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			
				pstat.setString(1, dto.getOriName());
				pstat.setString(2, dto.getSysName());
				pstat.setString(3, dto.getParent());
				int result = pstat.executeUpdate();
				return result;
		}
	}
	
	public List<NoticeFileDTO> selectBySeq(String fparent) throws Exception {
		String sql = "select * from files where parent = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);				
				){
			pstat.setString(1, fparent);
			try(ResultSet rs = pstat.executeQuery()
					){
				List<NoticeFileDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String oriName = rs.getString("oriName");
					String sysName = rs.getString("sysName");
					Date reg_date = rs.getDate("reg_date");
					String parent = rs.getString("parent");
					list.add(new NoticeFileDTO(seq,oriName,sysName,reg_date,parent));
					
				}
				return list;
			}
			
		}
		
	}
	
	public int delete(int seq) throws Exception {
		String sql = "delete from files where seq = ?";
	
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
				pstat.setInt(1, seq);
				int result = pstat.executeUpdate();
				return result;			
		}	
	}

}
