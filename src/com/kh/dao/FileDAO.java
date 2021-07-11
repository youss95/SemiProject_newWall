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
import com.kh.dto.FileDTO;

public class FileDAO {
	private static FileDAO instance;

	public synchronized static FileDAO getInstance() {
		if(instance == null) {
			instance = new FileDAO();
		}
		return instance;
	}

	private FileDAO() {}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// animal
	public int animalImgUpload(AnimalFilesDTO fdto) throws Exception {
		String sql = "insert into animal_photos values(photo_seq.nextval, ?, ?, sysdate, ?)";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, fdto.getOri_name());
			pstat.setString(2, fdto.getSys_name());
			pstat.setString(3, fdto.getCode_seq());

			int result = pstat.executeUpdate();
			return result;
		}
	}
	

	// animal
	public  List<AnimalFilesDTO> getAnimalImgs(String parent) throws Exception{
		String sql = "select * from animal_photos where code_seq = ?";
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
					AnimalFilesDTO dto = new AnimalFilesDTO();

					dto.setPhoto_seq(rs.getInt("photo_seq"));
					dto.setOri_name(rs.getNString("ori_name"));
					dto.setSys_name(rs.getNString("sys_name"));
					dto.setReg_date(rs.getDate("reg_date"));
					dto.setCode_seq(parent);

					list.add(dto);
				}
				return list;
			}
		}
	}

	// animal
	public  List<AnimalFilesDTO> selectAll(String parent) throws Exception{
		String sql = "select * from animal_photos where code_seq = ?";
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
					int seq = rs.getInt("photo_seq");
					String oriName = rs.getNString("ori_name");
					String sysName = rs.getNString("sys_name");
					Date reg_date = rs.getDate("reg_date");

					list.add(new AnimalFilesDTO(seq, oriName, sysName, reg_date, parent));
				}
				return list;
			}

		}

	}
	
	// animal
	public String getSysName(int seq) throws Exception{
		String sql = "select sys_name from animal_photos where photo_seq = ?";
		try( 
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				return rs.getNString("sys_name");
			}
			
		}
		
	}
	
	public int animalImgDelete(int seq) throws Exception{
		String sql = "delete from animal_photos where photo_seq=?";

		try( 
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, seq);
			int result = pstat.executeUpdate();
			
			return result;
			
		}
	}
	
	// animal
	public int animalImgDelete(String code_seq) throws Exception {
		String sql = "delete from animal_photos where code_seq=?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){

			pstat.setString(1, code_seq);
			int result = pstat.executeUpdate();
			return result;
		}
	}
	
	// animal
	public ArrayList<String> getFileSysName(String code_seq) throws Exception {
		String sql = "select sys_name from animal_photos where code_seq=?";
		try (
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, code_seq);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				ArrayList<String> arr = new ArrayList<String>();
				while(rs.next()) {
					arr.add(rs.getNString(1));
				}
				System.out.println("arr" + arr);
				return arr;
			}

		}
	}
	
}
