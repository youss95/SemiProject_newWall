package com.kh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kh.config.Db;
import com.kh.dto.LostAnimalDto;

public class AnimalDao {
//싱글톤 
	private static AnimalDao instance;
	
	public synchronized static  AnimalDao getInstance() { //하나의 스레드만 허용
		if(instance == null) {
			instance = new AnimalDao();
		}
		return instance;
	}
	
	private AnimalDao(){}
	
	public int LostAnimalFormWrite(LostAnimalDto dto) throws Exception {
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
			con.commit();
			con.close();
			return result;
		}
		
		
	}
	
}
