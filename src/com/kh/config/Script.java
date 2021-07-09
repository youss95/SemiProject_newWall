package com.kh.config;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Script {
	public static void back(HttpServletResponse response, String msg) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		
		try {
			PrintWriter out = response.getWriter();

			out.print("<script>");
			out.print("alert('" + msg + "');");
			out.print("history.back();"); 
			out.print("</script>");
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void responseData(HttpServletResponse response, String jsonData) {
		PrintWriter out;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			out = response.getWriter();
			out.print(jsonData);
			out.flush();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		}
	
	
	
	
}
