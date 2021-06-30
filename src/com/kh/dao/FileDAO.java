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

import com.kh.dto.AnimalFilesDTO;

public class FileDAO {
	private static FileDAO instance;

	public synchronized static FileDAO getInstance() { // 싱글톤 패턴
		if(instance == null) {
			instance = new FileDAO();
		}
		return instance;
	}

	private FileDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int fileUpload(AnimalFilesDTO fdto) throws Exception {
		String sql = "insert into animal_files values(files_seq.nextval, ?, ?, sysdate, ?)";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, fdto.getOri_name());
			pstat.setString(2, fdto.getSys_name());
			pstat.setString(3, fdto.getCode_seq());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}



	public  AnimalFilesDTO getFile(String parent) throws Exception{
		String sql = "select * from animal_files where code_seq = ?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, parent);

			try(
					ResultSet rs = pstat.executeQuery();
					){
				if(rs.next()) {
					AnimalFilesDTO dto = new AnimalFilesDTO();

					dto.setAnfile_seq(rs.getInt("anfile_seq"));
					dto.setOri_name(rs.getNString("ori_name"));
					dto.setSys_name(rs.getNString("sys_name"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setCode_seq(parent);

					return dto;
				}
				return null;
			}
		}
	}


	public  List<AnimalFilesDTO> selectAll(String parent) throws Exception{
		String sql = "select * from animal_files where code_seq = ?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);

				){
			pstat.setString(1, parent);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				List<AnimalFilesDTO> list = new ArrayList<AnimalFilesDTO>();
				while(rs.next()) {
					int seq = rs.getInt("anfile_seq");
					String oriName = rs.getNString("ori_name");
					String sysName = rs.getNString("sys_name");
					Date reg_date = rs.getDate("reg_date");

					list.add(new AnimalFilesDTO(seq, oriName, sysName, reg_date, parent));
				}
				return list;
			}

		}

	}
	
	
	public int delete(int seq) throws Exception{
		String sql = "delete from files where seq = ?";
		try( 
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			con.commit();
			
			return result;
			
		}
	}
	
	public String getSysName(int seq) throws Exception{
		String sql = "select sysname from files where seq = ?";
		try( 
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getNString("sysname");
			}
			
		}
		
	}

}
