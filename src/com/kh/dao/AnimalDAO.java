
package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.config.Db;
import com.kh.dto.LostAnimalDTO;
import com.kh.dto.ProtectBoardDTO;
import com.kh.dto.ProtectDetailDTO;
import com.kh.dto.ProtectionDTO;

public class AnimalDAO {
//싱글톤 
	private static AnimalDAO instance;
	
	public synchronized static  AnimalDAO getInstance() { //하나의 스레드만 허용
		if(instance == null) {
			instance = new AnimalDAO();
		}
		return instance;
	}
	
	private AnimalDAO(){}
	
	public int LostAnimalFormWrite(LostAnimalDTO dto) throws Exception {
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
	
	
	
	public List<LostAnimalDTO> showMap() throws Exception{
		List<LostAnimalDTO> list = new ArrayList<>();
		String sql ="select * from lost_animal";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					LostAnimalDTO dto;
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
					dto = new LostAnimalDTO(lostNo,lostName,lostAge,lostKind,lostCategory,lostDate,createDate,lostAddr,fileRealName,lostContent,lostGender);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	
	//맵 통계
	public int todayCount() throws Exception{
		String sql = "select count(*) todayCount from lost_animal where trunc(to_date(lost_date,'yy/mm/dd')) = trunc(sysdate)";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					int result = rs.getInt("todayCount");
					return result;
				}
			}
			
		}
		return -1;
	}
	//총 통계
	public int totalCount() throws Exception{
		String sql = "select count(*) totalCount from lost_animal";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					int result = rs.getInt("totalCount");
					return result;
				}
			}
		}
		return -1;
	}
	
	public int protectWrite(ProtectionDTO dto) throws Exception {
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
	
	public List<ProtectBoardDTO> getList(int page) throws Exception {
		List<ProtectBoardDTO> list = new ArrayList<>();
		String sql = "select x.* from(select rownum as rnum, A.* from (select * from protect_animal order by protect_no desc) A  where rownum <=?) x where x.rnum >=?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, page*4);
			pstmt.setInt(2, (page-1)*4+1);
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					ProtectBoardDTO dto;
					int protectNo = rs.getInt("protect_no");
					String protectName = rs.getString("protect_name");
					String protectGender = rs.getString("protect_gender");
					String protectFileRealName1 = rs.getString("protect_fileRealName1");
					String protectFileRealName2 = rs.getString("protect_fileRealName2");
					String protectAddr = rs.getString("protect_findAddr");
					String protectKind = rs.getString("protect_kind");
					Date protectCreateDate = rs.getDate("protect_createDate");
					dto = new ProtectBoardDTO(protectNo, protectName,protectGender,protectFileRealName1,protectFileRealName2,protectAddr,protectKind,protectCreateDate);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	//조회수 증가
	public int getViewCount(int protectNo) throws Exception{
		String sql ="update protect_animal set protect_viewCount = protect_viewCount + 1 where protect_no=?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, protectNo);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
	}
	
	//상세글 보기
	public ProtectDetailDTO getDetail(int protectNo) throws Exception{
		String sql = "select protect_no,protect_name,protect_kind,protect_content,protect_gender,protect_fileRealName1,protect_fileRealName2,protect_viewCount,protect_createDate,\r\n"
				+ "(select trunc(sysdate-to_date((select protect_findDate from protect_animal where protect_no=5 ),'yyyy/mm/dd'))from dual) protectDate\r\n"
				+ "from protect_animal where protect_no=?";
		try(Connection con = Db.getCon();PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, protectNo);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					ProtectDetailDTO dto;
					int protect_no = rs.getInt("protect_no");
					String protectName = rs.getString("protect_name");
					String protectKind = rs.getString("protect_kind");
					String protectContent = rs.getString("protect_content");
					String protectGender = rs.getString("protect_gender");
					String protectFileRealName1 = rs.getString("protect_fileRealName1");
					String protectFileRealName2 = rs.getString("protect_fileRealName2");
					int viewCount = rs.getInt("protect_viewCount");
					Date protectCreateDate = rs.getDate("protect_createDate");
					int protectDate = rs.getInt("protectDate");
					dto = new ProtectDetailDTO(protect_no,protectName,protectKind,protectContent,protectGender,protectFileRealName1,protectFileRealName2,viewCount,protectCreateDate,protectDate);
					con.close();
					return dto;
				}
				return null;
			}
		}
	}
	
}
