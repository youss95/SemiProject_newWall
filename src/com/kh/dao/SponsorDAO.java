package com.kh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
