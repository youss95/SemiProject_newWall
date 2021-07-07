package kh.mvc.dao;

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

import kh.mvc.config.BoardConfig;
import kh.mvc.dto.NewsDTO;

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

	public int getSeq() throws Exception {
		String sql = "select news_num.nextval from dual";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			rs.next();
			return rs.getInt(1);
		}
	}
	
	private int getRecordCount() throws Exception {
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
		String sql = "select * from (select row_number() over(order by news_seq desc) rnum, news_seq, news_title, news_writer, news_reg_date, news_view from news_board) where rnum between ? and ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, startNum);
			pstat.setInt(2, endNum);
			try (ResultSet rs = pstat.executeQuery();) {
				List<NewsDTO> list = new ArrayList<>();
				while (rs.next()) {
					int news_seq = rs.getInt("news_seq");
					String news_title = rs.getString("news_title");
					String news_writer = rs.getNString("news_writer");
					Date news_reg_date = rs.getDate("news_reg_date");
					int news_view = rs.getInt("news_view");

					NewsDTO dto = new NewsDTO(news_seq, news_title, null, news_writer, news_reg_date,
							news_view);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public List<NewsDTO> getPageList(int startNum, int endNum, String category, String keyword) throws Exception {
		// 뉴스 게시글 찾기 리스트
		String sql = "select * from (select row_number() over(order by news_seq desc) rnum, news_seq, news_title, news_writer, news_reg_date, news_view from news_board where "
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
					int news_seq = rs.getInt("news_seq");
					String news_title = rs.getString("news_title");
					String news_writer = rs.getNString("news_writer");
					Date news_reg_date = rs.getDate("news_reg_date");
					int news_view = rs.getInt("news_view");

					NewsDTO dto = new NewsDTO(news_seq, news_title, null, news_writer, news_reg_date,
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
		int endNavi = startNavi + naviCountPerPage - 1; // 네비 마지막 페이지 구하기

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		} // 방어코드 (엔드네비가 토탈보다 큰 에러일 시)

		boolean needPrev = true; // < : 이전페이지
		boolean needNext = true; // > : 다음페이지

		if (startNavi == 1) { // <, > 페이지 버튼 달아주기 1
			needPrev = false;
		} else if (endNavi == pageTotalCount) {
			needNext = false;
		}

		List<String> pageNavi = new ArrayList<String>(); // <, > 페이지 버튼 달아주기 2� 2
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
	
	public int newNews(NewsDTO dto) throws Exception {
		//뉴스 새글 작성
		String sql = "insert into news_board values(?,?,?,?,sysdate,0)";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);
					){
			pstat.setInt(1, dto.getNews_seq());
			pstat.setString(2, dto.getNews_title());
			pstat.setNString(3, dto.getNews_contents());
			pstat.setString(4, dto.getNews_writer());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public static void main(String[] args) throws Exception {
		// 뉴스 임시
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Semi", "Semi");

		Statement stat = con.createStatement();
		for (int i = 0; i < 144; i++) {
			stat.addBatch("insert into news_board values(news_num.nextval,'title" + i + "','contents" + i
					+ "','admin',sysdate,0)");
		}
		stat.executeBatch();
		con.commit();
		con.close();
	}
	
	
}
