package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.kh.dto.MemberDTO;


public class MemberDAO {
	private static MemberDAO instance;
	public synchronized static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	private MemberDAO() {}
	
	
	public boolean isIdAvailable(String id) throws Exception{
		String sql = "select * from member where user_id =?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				return !rs.next();
			}
		}
	}
	
	public boolean isLoginOk(String id, String pw) throws Exception {
		String sql = "select * from member where user_id=? and user_password=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, id);
			pstat.setNString(2, pw);
			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}
	}
	
	public boolean isPwOk(String id, String pw) throws Exception{
		String sql = "select * from member where user_id = ? and user_password=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, id);
			pstat.setNString(2, pw);
			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}
		}
	}
	
	public int changePw(String id, String pw) throws Exception{
		String sql = "update member set user_password=? where user_id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, pw);
			pstat.setNString(2, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	

	public MemberDTO selectMemberById(String pid) throws Exception{
		String sql = "select * from member where user_id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, pid);
			try(ResultSet rs = pstat.executeQuery()){
				rs.next();
				String id = rs.getNString("user_id");
				String pw = rs.getNString("user_password");
				String email = rs.getNString("email");
				String name = rs.getNString("name");
				Date birthDay = rs.getDate("birthday");
				String contact = rs.getNString("contact");
				char status = rs.getNString("status").charAt(0);
				String postcode = rs.getNString("postcode");
				String address1 = rs.getNString("address1");
				String address2 = rs.getNString("address2");
				return new MemberDTO(id,pw,email,name,birthDay,contact,status,postcode,address1,address2);
			}
		}
	}
	
	
	public int delete(String id) throws Exception{
		String sql = "delete from member where user_id = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

	public int insert(MemberDTO dto) throws Exception{
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, dto.getUser_id());
			pstat.setNString(2, dto.getUser_password());
			pstat.setNString(3, dto.getEmail());
			pstat.setNString(4, dto.getName());
			pstat.setDate(5, dto.getBirthday());
			pstat.setNString(6, dto.getContact());
			pstat.setString(7, String.valueOf(dto.getStatus()));
			pstat.setNString(8, dto.getPostcode());
			pstat.setNString(9, dto.getAddress1());
			pstat.setNString(10, dto.getAddress2());
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int modify(String column, String value, String id) throws Exception{
		String sql = "update member set "+column+"=? where user_id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, value);
			pstat.setNString(2, id);
			int result = pstat.executeUpdate();
			return result;
		}
	}

}

















