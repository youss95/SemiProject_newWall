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

import com.kh.dto.SponsorDTO;





public class SponsorDAO {
	private volatile static SponsorDAO instance;

	public static SponsorDAO getInstance() {
		if(instance == null) {
			synchronized (SponsorDAO.class) {
				if(instance == null)
					instance=new SponsorDAO();
			}
		}
		return instance;
	}
	private SponsorDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int sp_inp(SponsorDTO dto,String apply_num) throws Exception{
		String sql = "insert into sponsor values (sponsor_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSponsor_amount());
			pstat.setString(2, dto.getSponsor_choice());
			pstat.setString(3, dto.getSponsor_agecheck());
			pstat.setString(4, dto.getSponsor_name());
			pstat.setString(5, dto.getSponsor_contact());
			pstat.setString(6, dto.getSponsor_birth());
			pstat.setString(7, dto.getSponsor_yname());
			pstat.setString(8, dto.getSponsor_ybirth());
			pstat.setString(9, dto.getSponsor_email());
			pstat.setString(10, dto.getSponsor_postcode());
			pstat.setString(11, dto.getSponsor_address1());
			pstat.setString(12, dto.getSponsor_address2());
			pstat.setString(13, apply_num);
			pstat.setString(14, dto.getSponsor_terms01());
			pstat.setString(15, dto.getSponsor_terms02());
			pstat.setString(16, dto.getSponsor_mb_id());

			int result = pstat.executeUpdate();
			//con.commit();
			return result;

		}
	}
	public List<SponsorDTO> selectAll() throws Exception {
		String sql = "select * from sponsor order by 1 desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			List<SponsorDTO> list = new ArrayList<>();
			while(rs.next()) {
				int sponsor_seq = rs.getInt("sponsor_seq");
				int sponsor_amount = rs.getInt("sponsor_amount");
				String sponsor_choice = rs.getNString("sponsor_choice");
				String sponsor_agecheck = rs.getNString("sponsor_agecheck");
				String sponsor_name = rs.getNString("sponsor_name");
				String sponsor_contact = rs.getNString("sponsor_contact");
				String sponsor_birth = rs.getNString("sponsor_birth");
				String sponsor_yname = rs.getNString("sponsor_yname");
				String sponsor_ybirth = rs.getNString("sponsor_ybirth");
				String sponsor_email = rs.getNString("sponsor_email");
				String sponsor_postcode = rs.getNString("sponsor_postcode");
				String sponsor_address1 = rs.getNString("sponsor_address1");
				String sponsor_address2 = rs.getNString("sponsor_address2");
				String sponsor_apply_num = rs.getNString("sponsor_apply_num");
				String sponsor_terms01 = rs.getNString("sponsor_terms01");
				String sponsor_terms02 = rs.getNString("sponsor_terms02");
				String sponsor_mb_id = rs.getNString("sponsor_mb_id");
				Date sponsor_date = rs.getDate("sponsor_date");
				
				SponsorDTO dto = new SponsorDTO(sponsor_seq, sponsor_amount, sponsor_choice,  sponsor_agecheck,
				 sponsor_name,  sponsor_contact,  sponsor_birth,  sponsor_yname,
				 sponsor_ybirth,  sponsor_email,  sponsor_postcode,  sponsor_address1,
				 sponsor_address2,  sponsor_apply_num,  sponsor_terms01,  sponsor_terms02,
				 sponsor_mb_id,  sponsor_date);
				list.add(dto);
			}
			return list;
		}
	}

}
