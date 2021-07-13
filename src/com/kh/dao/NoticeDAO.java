package com.kh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.kh.config.BoardConfig;
import com.kh.dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO instance;

	public synchronized static NoticeDAO getInstance() {
		if (instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	private NoticeDAO() {
	};

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public String getSeq() throws Exception {
		String sql = "select 'notice' || LPAD(notice_num.nextval,5,0) from dual";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getString(1);
		}
	}

	public List<NoticeDTO> getPageList(int startNum, int endNum) throws Exception {
		// 공지사항 게시글 리스트
		String sql = "select * from (select row_number() over(order by notice_seq desc) rnum, notice_seq, notice_title, notice_writer, notice_reg_date, notice_view from notice_board) where rnum between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NoticeDTO> list = new ArrayList<>();
				while (rs.next()) {
					String notice_seq = rs.getString("notice_seq");
					String notice_title = rs.getString("notice_title");
					String notice_writer = rs.getNString("notice_writer");
					Date notice_reg_date = rs.getDate("notice_reg_date");
					int notice_view = rs.getInt("notice_view");

					NoticeDTO dto = new NoticeDTO(notice_seq, notice_title, null, notice_writer, notice_reg_date,
							notice_view);
					list.add(dto);
				}
				return list;
			}
		}
	}

	public List<NoticeDTO> getPageList(int startNum, int endNum, String category, String keyword) throws Exception {
		// 공지사항게시글 찾기 리스트
		String sql = "select * from (select row_number() over(order by notice_seq desc) rnum, notice_seq, notice_title, notice_writer, notice_reg_date, notice_view from notice_board where "
				+ category + " like ?) where rnum between ? and ?";

		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, "%" + keyword + "%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NoticeDTO> list = new ArrayList<>();
				while (rs.next()) {
					String notice_seq = rs.getString("notice_seq");
					String notice_title = rs.getString("notice_title");
					String notice_writer = rs.getNString("notice_writer");
					Date notice_reg_date = rs.getDate("notice_reg_date");
					int notice_view = rs.getInt("notice_view");

					NoticeDTO dto = new NoticeDTO(notice_seq, notice_title, null, notice_writer, notice_reg_date,
							notice_view);
					list.add(dto);
				}
				return list;
			}
		}
	}

	public List<String> getPageNavi(int currentPage, String category, String keyword) throws Exception { // 페이지
		int recordTotalCount = 0;
		// 공지사항 게시글 리스트 페이지

		if (keyword == null || keyword.contentEquals("")) {
			recordTotalCount = this.getRecordCount(); // 전체 레코드개수 (원래는 커넥션으로 카운트해서 가져옴)
		} else {
			recordTotalCount = this.getRecordCount(category, keyword);
		}
		int recordCountPerPage = BoardConfig.RECORD_COUNT_PER_PAGE; // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = BoardConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작으로부터 끝까지의 페이지가 총 몇개인지.

		int pageTotalCount = 0; // 총 페이지

		if ((recordTotalCount % recordCountPerPage) > 0) { // 페이지 갯수가 일의자리가 있는 경우
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage; // 0 으로 떨어지는 페이지 일 경우
		}

		// 방어코드 (현재 위치 페이지가 총 페이지보다 넘치거나 -1 이 될 경우)
		if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		} else if (currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage - 1) / naviCountPerPage * naviCountPerPage + 1;// 네비 시작페이지 구하기
		int endNavi = startNavi + (naviCountPerPage - 1); // 네비 마지막 페이지 구하기

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		} // 방어코드 (엔드네비가 토탈보다 큰 에러일 시)

		boolean needPrev = true; // < : 이전페이지
		boolean needNext = true; // > : 다음페이지

		if (startNavi == 1) { // <, > 페이지 버튼 달아주기 1
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> pageNavi = new ArrayList<String>(); // <, > 페이지 버튼 달아주기 2
		if (needPrev) {
			pageNavi.add("<");
		}
		for (int i = startNavi; i <= endNavi; i++) {
			pageNavi.add(String.valueOf(i));
		}
		if (needNext) {
			pageNavi.add(">");
		}

		return pageNavi;
	}

	public int getRecordCount() throws Exception {
		// 게시글 카운트
		String sql = "select count(*) from notice_board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	private int getRecordCount(String category, String keyword) throws Exception {
		// 게시글 검색시 카운트
		String sql = "select count(*) from notice_board where "+category+" like ?";
					
		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, "%" + keyword + "%");
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	public int view(String seq) throws Exception{
		//조회수
		String sql = "update notice_board set notice_view = notice_view+1 where notice_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);				
				){
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public NoticeDTO detail(String seq) throws Exception {
		//공지사항 보기
		
		String sql = "select * from notice_board where notice_seq = ?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, seq);
			try(ResultSet rs = pstat.executeQuery();
					){
				NoticeDTO dto = new NoticeDTO();
				if(rs.next()) {
					String notice_seq = rs.getString("notice_seq");
					String notice_title = rs.getString("notice_title");
					String notice_contents = rs.getString("notice_contents");
					String notice_writer = rs.getString("notice_writer");
					Date notice_reg_date = rs.getDate("notice_reg_date");
					int notice_view = rs.getInt("notice_view");
					
					dto.setNotice_seq(notice_seq);
					dto.setNotice_title(notice_title);
					dto.setNotice_contents(notice_contents);
					dto.setNotice_writer(notice_writer);
					dto.setNotice_reg_date(notice_reg_date);
					dto.setNotice_view(notice_view);
					
					return dto;					
				}
			}
		}
		return null;
	}
	
	public int delete(String seq) throws Exception {
		//공지사항 삭제
		String sql = "delete from notice_board where notice_seq = ?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);	
				){
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int modify(String seq ,String title, String contents) throws Exception {
		//게시글 수정
		String sql = "update notice_board set notice_title=?, notice_contents=? where notice_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);	
				){
			pstat.setString(1, title);
			pstat.setString(2, contents);
			pstat.setString(3, seq);
			
			int result = pstat.executeUpdate();
			return result;
		}
		
	}

	public int newNotice(NoticeDTO dto) throws Exception {
		// 공지사항 새로운 글 작성
		String sql = "insert into notice_board values(?,?,?,?,sysdate,0)";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getNotice_seq());
			pstat.setString(2, dto.getNotice_title());
			pstat.setString(3, dto.getNotice_contents());
			pstat.setString(4, dto.getNotice_writer());

			int result = pstat.executeUpdate();
			return result;
		}
	}

//	public static void main(String[] args) throws Exception {
//		// 공지글 임시
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Semi", "Semi");
//
//		Statement stat = con.createStatement();
//		for (int i = 0; i < 144; i++) {
//			stat.addBatch("insert into notice_board values(notice_num.nextval,'title" + i + "','contents" + i
//					+ "','admin',sysdate,0)");
//		}
//		stat.executeBatch();
//		con.commit();
//		con.close();
//	}
	
	
}
