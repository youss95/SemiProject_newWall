
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
	
	public List<ProtectReplyDTO> getReplyList(int boardNo) throws Exception{
		List<ProtectReplyDTO> list = new ArrayList<ProtectReplyDTO>();
		String sql = "select * from protect_replys where protect_boardno=? order by protect_replyno desc";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, boardNo);
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
	public List<LostAnimalDTO> mapList(int startNum, int endNum) throws Exception	{
		List<LostAnimalDTO> list = new ArrayList<>();
		String sql = "select * from (select row_number() over(order by lost_no desc) rnum,lost_no,lost_name,lost_age,lost_kind,lost_category,lost_date,lost_createDate,lost_addr,lost_fileRealName,lost_content, lost_gender from lost_animal) where rnum between ? and ?";
		try(Connection con = Db.getCon(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
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
					dto = new LostAnimalDTO(lostNo,lostName,lostAge,lostKind,
							lostCategory,lostDate,createDate,lostAddr,fileRealName,lostContent,lostGender);
					list.add(dto);
				}
				con.close();
				return list;
			}
		}
	}
	
	private int getAllCount() throws Exception {
		String sql="select count(*) from board";
		try(Connection con = Db.getCon();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}
	
	//맵 페이지 리스트 네비
	public List<String> mapPageNavi(int page) throws Exception{
		 int recordTotalCount = this.getAllCount(); //전체 레코드의 개수 /DB에서 꺼내온느것
	      int recordCountPerPage = PageConfig.LOST_RECORD_COUNT_PER_PAGE ; //   한페이지당 보여줄 게시글 개수 /개발자가 정하는것
	      int naviCountPerPage = PageConfig.LOST_NAVI_COUNT_PER_PAGE; //페이지의 갯수, 내 위치 페이지를 기준으로 시작부터 끝까지의 페이지가 총 몇개인지. /개발자가 정하는것
	      int pageTotalCount = 0;
	      
	      if(recordTotalCount % recordCountPerPage > 0) {
		      pageTotalCount = recordTotalCount / recordCountPerPage + 1;  //마지막 페이지
		      }else {
		         pageTotalCount = recordTotalCount / recordCountPerPage;
		      }
	      
	      if( page > pageTotalCount) { //다음으로 넘겼을때 마지막 페이지이면
		         page = pageTotalCount;
		      }else if (page < 1 ) {
		         page = 1;
		      }
	      
	      int startNavi = ((page-1)/naviCountPerPage) * naviCountPerPage + 1;
	      int endNavi = startNavi + (naviCountPerPage -1 ); //마지막 페이지 번호
	      if(endNavi > pageTotalCount) {endNavi = pageTotalCount;}
	      
	      boolean needPrev = true;
	      boolean needNext = true;
	      if(startNavi == 1) {needPrev = false;}
	      if(endNavi == pageTotalCount) {needNext = false;}
	      
	      List<String> pageNavi = new ArrayList<>();
	      
	      if(needPrev) {pageNavi.add("<");}
	      for(int i = startNavi ; i<=endNavi;i++) {
	         pageNavi.add(String.valueOf(i));
	      }
	      if(needNext) {pageNavi.add(">");}
	      
	      return pageNavi;
	}
}

