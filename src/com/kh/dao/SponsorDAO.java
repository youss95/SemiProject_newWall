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

	public int sp_inp(SponsorDTO dto) throws Exception{
		String sql = "insert into sponsor (sponsor_seq, sponsor_amount,sponsor_name, sponsor_contact) values(sponsor_seq.nextval,?,?,?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, dto.getSponsor_amount());
			pstat.setString(2, dto.getSponsor_name());
			pstat.setString(3, dto.getSponsor_contact());

			int result = pstat.executeUpdate();
			con.commit();
			return result;

		}
	}

}
