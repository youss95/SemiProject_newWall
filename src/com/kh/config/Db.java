package com.kh.config;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Db {
	public static Connection getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			Connection con = ds.getConnection();
			System.out.println("DB 연결성공");
			return con;
			
		} catch(Exception e) {
			System.out.println("연결실패");
			e.printStackTrace();
		}
	
		return null;
	}
}
