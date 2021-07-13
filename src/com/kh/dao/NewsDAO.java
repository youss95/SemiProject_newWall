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
import com.kh.dto.NewsDTO;

public class NewsDAO {
	private static NewsDAO instance;

	public synchronized static NewsDAO getInstance() {
		if (instance == null) {
			instance = new NewsDAO();
		}
		return instance;
	}

	private NewsDAO() {
	};

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public String getSeq() throws Exception {
		String sql = "select 'news' || LPAD(news_num.nextval,5,0) from dual";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getString(1);
		}
	}
	
	public int getRecordCount() throws Exception {
		// 게시글 카운트
		String sql = "select count(*) from news_board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}

	private int getRecordCount(String category, String keyword) throws Exception {
		// 게시글 검색시 카운트
		String sql = "select count(*) from news_board where "+category+" like ?";
					
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
	
	public List<NewsDTO> getPageList(int startNum, int endNum) throws Exception {
		// 뉴스 게시글 리스트
		String sql = "select * from (select row_number() over(order by news_seq desc) rnum, news_seq, news_title, news_sub_contents, news_photo, news_writer, news_reg_date, news_view from news_board) where rnum between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NewsDTO> list = new ArrayList<>();
				while (rs.next()) {
					String news_seq = rs.getString("news_seq");
					String news_title = rs.getString("news_title");
					String news_sub_contents = rs.getString("news_sub_contents");
					String news_photo = rs.getString("news_photo");
					String news_writer = rs.getNString("news_writer");
					Date news_reg_date = rs.getDate("news_reg_date");
					int news_view = rs.getInt("news_view");

					NewsDTO dto = new NewsDTO(news_seq, news_title, news_sub_contents, null, news_photo,news_writer, news_reg_date,
							news_view);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public List<NewsDTO> getPageList(int startNum, int endNum, String category, String keyword) throws Exception {
		// 뉴스 게시글 찾기 리스트
		String sql = "select * from (select row_number() over(order by news_seq desc) rnum, news_seq, news_title, news_sub_contents, news_photo, news_writer, news_reg_date, news_view from news_board where "
				+ category + " like ?) where rnum between ? and ?";

		try (Connection con = this.getConnection(); 
			 PreparedStatement pstat = con.prepareStatement(sql);
				) {
			pstat.setString(1, "%" + keyword + "%");
			pstat.setInt(2, startNum);
			pstat.setInt(3, endNum);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NewsDTO> list = new ArrayList<>();
				while (rs.next()) {
					String news_seq = rs.getString("news_seq");
					String news_title = rs.getString("news_title");
					String news_sub_contents = rs.getString("news_sub_contents");
					String news_photo = rs.getString("news_photo");
					String news_writer = rs.getNString("news_writer");
					Date news_reg_date = rs.getDate("news_reg_date");
					int news_view = rs.getInt("news_view");

					NewsDTO dto = new NewsDTO(news_seq, news_title, news_sub_contents,null, news_photo,news_writer, news_reg_date,
							news_view);
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
		int recordCountPerPage = (BoardConfig.RECORD_COUNT_PER_PAGE -15); // 한 페이지 당 보여줄 게시글의 개수
		int naviCountPerPage = BoardConfig.NAVI_COUNT_PER_PAGE; // 내 위치 페이지를 기준으로 시작으로부터 끝까지의 페이지가 총 몇개인지.
		
		int pageTotalCount = 0; 

		if((recordTotalCount % recordCountPerPage) > 0) { 
			pageTotalCount =recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage; 
		}

		if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}else if(currentPage < 1) {
			currentPage = 1;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1; 

		if(endNavi > pageTotalCount) {endNavi = pageTotalCount;} 

		boolean needPrev = true; 
		boolean needNext = true; 

		if(startNavi == 1) {needPrev = false;} 
		if(endNavi == pageTotalCount) {needNext = false;}


		List<String> pageNavi = new ArrayList<String>(); 
		if(needPrev) {pageNavi.add("<");}
		for(int i = startNavi; i<= endNavi; i++) {			
			pageNavi.add(String.valueOf(i));
		}
		if(needNext) {pageNavi.add(">");}

		return pageNavi;
	}
	
	public int newNews(NewsDTO dto) throws Exception {
		//뉴스 새글 작성
		String sql = "insert into news_board values(?,?,?,?,?,?,sysdate,0)";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
					){
			pstat.setString(1, dto.getNews_seq());
			pstat.setString(2, dto.getNews_title());
			pstat.setNString(3, dto.getNews_sub_contents());
			pstat.setNString(4, dto.getNews_contents());
			pstat.setString(5, dto.getNews_photo());
			pstat.setString(6, dto.getNews_writer());
			
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
//	public static void main(String[] args) throws Exception {
//		// 뉴스 임시
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Semi", "Semi");
//
//		Statement stat = con.createStatement();
//		for (int i = 0; i < 144; i++) {
//			stat.addBatch("insert into news_board values(news_num.nextval,'title" + i + "','subcontents" + i + "','contents" + i + "','admin',sysdate,0)");
//		}
//		stat.executeBatch();
//		con.commit();
//		con.close();
//	}
	

	public int view(String seq) throws Exception{
		//조회수
		String sql = "update news_board set news_view = news_view+1 where news_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);				
				){
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public NewsDTO detail(String seq) throws Exception {
		//공지사항 보기
		
		String sql = "select * from news_board where news_seq = ?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, seq);
			try(ResultSet rs = pstat.executeQuery();
					){
				NewsDTO dto = new NewsDTO();
				if(rs.next()) {
					String news_seq = rs.getString("news_seq");
					String news_title = rs.getString("news_title");
					String news_sub_contents = rs.getString("news_sub_contents");
					String news_contents = rs.getString("news_contents");
					String news_photo = rs.getString("news_photo");
					String news_writer = rs.getString("news_writer");
					Date news_reg_date = rs.getDate("news_reg_date");
					int news_view = rs.getInt("news_view");
					
					dto.setNews_seq(news_seq);
					dto.setNews_title(news_title);
					dto.setNews_sub_contents(news_sub_contents);
					dto.setNews_contents(news_contents);
					dto.setNews_photo(news_photo);
					dto.setNews_writer(news_writer);
					dto.setNews_reg_date(news_reg_date);
					dto.setNews_view(news_view);
					
					return dto;					
				}
			}
		}
		return null;
	}
	
	public int delete(String seq) throws Exception {
		//공지사항 삭제
		String sql = "delete from news_board where news_seq = ?";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);	
				){
			pstat.setString(1, seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	public int modify(String seq ,String title, String subcontents, String contents, String photo) throws Exception {
		//게시글 수정
		String sql = "update news_board set news_title=?, news_sub_contents=?, news_contents=?, news_photo=? where news_seq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);	
				){
			pstat.setString(1, title);
			pstat.setString(2, subcontents);
			pstat.setString(3, contents);
			pstat.setNString(4, photo);
			pstat.setString(5, seq);
			
			int result = pstat.executeUpdate();
			return result;
		}
		
	}
	
	
}
