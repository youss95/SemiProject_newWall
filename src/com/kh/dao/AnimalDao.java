package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.config.Db;
import com.kh.dto.LostAnimalDto;
import com.kh.dto.ProtectBoardDto;
import com.kh.dto.ProtectionDto;

public class AnimalDao {
//싱글톤 
	private static AnimalDao instance;
	
	public synchronized static  AnimalDao getInstance() { //하나의 스레드만 허용
		if(instance == null) {
			instance = new AnimalDao();
		}
		return instance;
	}
	
	private AnimalDao(){}
	
	public int LostAnimalFormWrite(LostAnimalDto dto) throws Exception {
		String sql ="insert into lost_animal values(lostAnimal_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate)";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql); ){
			pstmt.setString(1,dto.getLostName());
			pstmt.setInt(2, dto.getLostAge());
			pstmt.setString(3, dto.getLostKind());
			pstmt.setString(4, dto.getLostCategory());
			pstmt.setString(5, dto.getLostDate());
			pstmt.setString(6, dto.getLostAddr());
			pstmt.setString(7, dto.getFileRealName());
			pstmt.setString(8, dto.getLostContent());
			pstmt.setString(9, dto.getLostGender());
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
		
		
	}
	
	public List<LostAnimalDto> showMap() throws Exception{
		List<LostAnimalDto> list = new ArrayList<>();
		String sql ="select * from lost_animal";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					LostAnimalDto dto;
					int lostNo = rs.getInt("lost_no");
					String lostName = rs.getString("lost_name");
					int lostAge = rs.getInt("lost_age");
					String lostKind = rs.getString("lost_kind");
					String lostCategory = rs.getString("lost_category");
					String lostDate = rs.getString("lost_date");
					String lostAddr = rs.getString("lost_addr");
					String fileRealName = rs.getString("lost_fileRealName");
					String lostContent = rs.getString("lost_content");
					String lostGender = rs.getString("lost_gender");
					Date createDate = rs.getDate("lost_createDate");
					dto = new LostAnimalDto(lostNo,lostName,lostAge,lostKind,lostCategory,lostDate,createDate,lostAddr,fileRealName,lostContent,lostGender);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	
	public int protectWrite(ProtectionDto dto) throws Exception {
		String sql ="insert into protect_animal values (protect_seq.nextval,?,?,?,?,?,?,?,?,0,sysdate)";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getProtectName());
			pstmt.setString(2, dto.getProtectKind());
			pstmt.setString(3, dto.getProtectFindDate());
			pstmt.setString(4, dto.getProtectFindAddr());
			pstmt.setString(5, dto.getProtectContent());
			pstmt.setString(6, dto.getProtectGender());
			pstmt.setString(7, dto.getProtectFileRealName1());
			pstmt.setString(8, dto.getProtectFileRealName2());
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
			
		}
	}
	
	public List<ProtectBoardDto> getList() throws Exception {
		List<ProtectBoardDto> list = new ArrayList<>();
		String sql = "select * from protect_animal";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					ProtectBoardDto dto;
					int protectNo = rs.getInt("protect_no");
					String protectName = rs.getString("protect_name");
					String protectGender = rs.getString("protect_gender");
					String protectFileRealName1 = rs.getString("protect_fileRealName1");
					String protectFileRealName2 = rs.getString("protect_fileRealName2");
					String protectAddr = rs.getString("protect_findAddr");
					String protectKind = rs.getString("protect_kind");
					Date protectCreateDate = rs.getDate("protect_createDate");
					dto = new ProtectBoardDto(protectNo, protectName,protectGender,protectFileRealName1,protectFileRealName2,protectAddr,protectKind,protectCreateDate);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	
}
