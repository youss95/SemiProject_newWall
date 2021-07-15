
package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.config.Db;
import com.kh.config.PageConfig;
import com.kh.dto.LostAnimalDTO;
import com.kh.dto.ProtectBoardDTO;
import com.kh.dto.ProtectDetailDTO;
import com.kh.dto.ProtectReplyDTO;
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
		String sql ="insert into lost_animal values(lostAnimal_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,?)";
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
			pstmt.setString(10, dto.getLostWriter());
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
					String lostWriter = rs.getString("lost_writer");
					dto = new LostAnimalDTO(lostNo,lostName,lostAge,lostKind,lostCategory,lostDate,createDate,lostAddr,fileRealName,lostContent,lostGender,lostWriter);
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
	
	public int dogCount() throws Exception {
		String sql ="select count(*) from lost_animal where lost_category = 'dog'";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
		
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					int result = rs.getInt(1);
					return result;
				}
			}
		}
		return -1;
	}
	
	public int catCount() throws Exception {
		String sql ="select count(*) from lost_animal where lost_category = 'cat'";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					int result = rs.getInt(1);
					return result;
				}
			}
		}
		return -1;
	}
	
	public int protectWrite(ProtectionDTO dto,String protectWriter) throws Exception {
		String sql ="insert into protect_animal values (protect_seq.nextval,?,?,?,?,?,?,?,?,0,sysdate,?)";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getProtectName());
			pstmt.setString(2, dto.getProtectKind());
			pstmt.setString(3, dto.getProtectFindDate());
			pstmt.setString(4, dto.getProtectFindAddr());
			pstmt.setString(5, dto.getProtectContent());
			pstmt.setString(6, dto.getProtectGender());
			pstmt.setString(7, dto.getProtectFileRealName1());
			pstmt.setString(8, dto.getProtectFileRealName2());
			pstmt.setString(9, protectWriter);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
			
		}
	}
	
	public static List<ProtectBoardDTO> getList(int page,int count) throws Exception {
		List<ProtectBoardDTO> list = new ArrayList<>();
		String sql = "select x.* from(select rownum as rnum, A.* from (select * from protect_animal order by protect_no desc) A  where rownum <=?) x where x.rnum >=?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, page*count);
			pstmt.setInt(2, (page-1)*count+1);
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
					String protectWriter = rs.getString("protect_writer");
					dto = new ProtectBoardDTO(protectNo, protectName,protectGender,protectFileRealName1,protectFileRealName2,protectAddr,protectKind,protectCreateDate,protectWriter);
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
		String sql = "select protect_no,protect_name,protect_kind,protect_content,protect_gender,protect_fileRealName1,protect_fileRealName2,protect_viewCount,protect_createDate,protect_writer,\r\n"
				+ "(select trunc(sysdate-to_date((select protect_findDate from protect_animal where protect_no=? ),'yyyy/mm/dd'))from dual) protectDate\r\n"
				+ "from protect_animal where protect_no=?";
		try(Connection con = Db.getCon();PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, protectNo);
			pstmt.setInt(2, protectNo);
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
					String protectWriter = rs.getString("protect_writer");
					dto = new ProtectDetailDTO(protect_no,protectName,protectKind,protectContent,protectGender,protectFileRealName1,protectFileRealName2,viewCount,protectCreateDate,protectDate,protectWriter);
					con.close();
					return dto;
				}
				return null;
			}
		}
	}
	
	//댓글쓰기
	public int addReply(ProtectReplyDTO dto) throws Exception	{
		String sql = "insert into protect_replys values (protect_replyno.nextval,?,?,?,sysdate)";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1,dto.getReplyCon());
			pstmt.setString(2, dto.getProtectWriter());
			pstmt.setInt(3, dto.getBoardNo());
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
	}
	
	public List<ProtectReplyDTO> getReplyList(int boardNo,int page) throws Exception{
		List<ProtectReplyDTO> list = new ArrayList<ProtectReplyDTO>();
		String sql = "select * from (select row_number() over(order by protect_replyno desc) rnum,protect_replyno, protect_replycon, protect_writer,protect_boardno,protect_replcreateDate from protect_replys where protect_boardno = ?) where rnum between ? and ?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, boardNo);
			pstmt.setInt(2, (page-1)*10+1);
			pstmt.setInt(3, page*10 );
		try(ResultSet rs = pstmt.executeQuery()){
			while(rs.next()) {
				ProtectReplyDTO dto;
				int replyNo = rs.getInt("protect_replyno");
				String replyCon = rs.getString("protect_replycon");
				String protectWriter = rs.getString("protect_writer");
				Date createDate = rs.getDate("protect_replcreateDate");
				dto = new ProtectReplyDTO(replyNo,replyCon,protectWriter,boardNo,createDate);
				list.add(dto);
				
			}
			con.close();
			return list;
		}
		}
	}

	public ProtectReplyDTO findById(int boardNo) throws Exception{
		String sql = "select * from protect_replys where protect_boardno=? order by protect_replyno desc";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, boardNo);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					ProtectReplyDTO dto;
					int replyNo = rs.getInt(1);
					String replyCon = rs.getString(2);
					String protectWriter = rs.getString(3);
					int boardno = rs.getInt(4);
					Date createDate = rs.getDate(5);
					dto = new ProtectReplyDTO(replyNo,replyCon,protectWriter,boardNo,createDate);
					return dto;
				}
			}
		}
		return null;
	}
	
	public int replyDel(int replyNo) throws Exception {
		String sql = "delete from protect_replys where protect_replyno=?";
		try(Connection con =Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, replyNo);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
	}
	//맵 리스트
	public static List<LostAnimalDTO> mapList(int page,int count) throws Exception	{
		List<LostAnimalDTO> list = new ArrayList<>();
		String sql = "select * from (select row_number() over(order by lost_no desc) rnum,lost_no,lost_name,lost_age,lost_kind,lost_category,lost_date,lost_createDate,lost_addr,lost_fileRealName,lost_content, lost_gender, lost_writer from lost_animal) where rnum between ? and ?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, (page-1)*count+1);
			pstmt.setInt(2, page*count );
			try(ResultSet rs = pstmt.executeQuery();){
				while(rs.next()) {
					LostAnimalDTO dto;
					int lostNo = rs.getInt("lost_no");
					String lostName = rs.getString("lost_name");
					int lostAge = rs.getInt("lost_age");
					String lostKind = rs.getString("lost_kind");
					String lostCategory = rs.getString("lost_category");
					String lostDate = rs.getString("lost_date");
					Date createDate = rs.getDate("lost_createDate");
					String lostAddr = rs.getString("lost_addr");
					String fileRealName = rs.getString("lost_fileRealName");
					String lostContent = rs.getString("lost_content");
					String lostGender = rs.getString("lost_gender");
					String lostWriter = rs.getString("lost_writer");
					dto = new LostAnimalDTO(lostNo,lostName,lostAge,lostKind,
							lostCategory,lostDate,createDate,lostAddr,fileRealName,lostContent,lostGender,lostWriter);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	
	
	public int getAllReplyCount(int protectNo) throws Exception {
		String sql="select count(*) from protect_replys where protect_boardno=?";
		try(Connection con =Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, protectNo);
			try(ResultSet rs = pstmt.executeQuery();){
			rs.next();
			return rs.getInt(1);
			}
		}
	}
	
	
	public static int getAllCount() throws Exception {
		String sql="select count(*) from lost_animal";
		try(Connection con = Db.getCon();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	
	public int protectUpdate(ProtectionDTO dto , int protectNo) throws Exception {
		String sql ="update protect_animal set protect_name = ? ,protect_kind=? ,protect_findDate =? ,protect_findAddr=?, protect_content=? , protect_gender =? , protect_fileRealName1 =? , protect_fileRealName2 =? where protect_no =? ";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getProtectName());
			pstmt.setString(2, dto.getProtectKind());
			pstmt.setString(3, dto.getProtectFindDate());
			pstmt.setString(4, dto.getProtectFindAddr());
			pstmt.setString(5, dto.getProtectContent());
			pstmt.setString(6, dto.getProtectGender());
			pstmt.setString(7, dto.getProtectFileRealName1());
			pstmt.setString(8, dto.getProtectFileRealName2());
			pstmt.setInt(9, protectNo);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
			
		}
	}
	
	public static int protectDelete(int protectNo) throws Exception {
		String sql = "delete from protect_animal where protect_no = ?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, protectNo);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
	}
	
	public static int lostDelete(int lostNo) throws Exception {
		String sql = "delete from lost_animal where lost_no = ?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, lostNo);
			int result = pstmt.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			con.close();
			return result;
		}
	}
	
	public LostAnimalDTO lostList(int lostNo) throws Exception{
		String sql = "select * from lost_animal where lost_no=?";
		try(Connection con =Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, lostNo);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					LostAnimalDTO dto;
					int lost_no = rs.getInt(1);
					String lost_name = rs.getString(2);
					int lost_age = rs.getInt(3);
					String lost_kind = rs.getString(4);
					String lost_category = rs.getString(5);
					String lost_date = rs.getString(6);
					String lost_addr = rs.getString(7);
					String lost_fileRealName = rs.getString(8);
					String lost_content = rs.getString(9);
					String lost_gender = rs.getString(10);
					Date lost_createDate = rs.getDate(11);
					String lost_writer = rs.getString(12);
					dto = new LostAnimalDTO(lost_no,lost_name,lost_age,lost_kind,lost_category,
							lost_date,lost_createDate,lost_addr,lost_fileRealName,lost_content,lost_gender,
							lost_writer);
					con.close();
					return dto;
				}
				
			}
		}
		return null;
	}
	
	public int lostUpdate(LostAnimalDTO dto , int lostNo) throws Exception {
		String sql ="update lost_animal set lost_name= ?, lost_age=?, lost_kind=?, lost_category=?, lost_date=?, lost_addr=?, lost_fileRealName=? , lost_content=?, lost_gender=? where lost_no="+lostNo;
		try(Connection con =Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, dto.getLostName());
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
	
}

