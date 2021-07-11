package com.kh.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.sfile")
public class FileController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf8;");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		// Context Path :

		String url = requestURI.substring(ctxPath.length());
		System.out.println("요청URL :" + url);
		
		if(url.contentEquals("/download.sfile")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			//1번 - 하드디스크에 있는 파일의 내용을 램으로 복사한다.
			
			String sysName = request.getParameter("sysname");
			String oriName = request.getParameter("oriname");
			
			String filesPath = request.getServletContext().getRealPath("files");
			
			File targetFile = new File(filesPath +"/"+sysName);
			
			try(
					FileInputStream fis = new FileInputStream(targetFile);
					DataInputStream dis = new DataInputStream(fis);
					DataOutputStream dos = new DataOutputStream(response.getOutputStream());
					
					){
				
				byte[] fileContents = new byte[(int)targetFile.length()];
				
				dis.readFully(fileContents);			
				
				//2번 - 램에 로딩된 내용을 클라이언트에 전송한다.
				
				oriName = new String(oriName.getBytes("utf-8"),"iso-8859-1");
				
				response.reset(); // response 객체의 기본동작을 다 제거
				response.setContentType("application/octet-stream"); //브라우저에게 보냄
				response.setHeader("content-disposition", "attachment; filename = \""+oriName+"\""); //브라우저 이렇게 해라 라고 명령하는문 ,attachment = 보낸것은 첨부파일이고 다운로드하라는 지침
				
				
				dos.write(fileContents);
				dos.flush(); //파일다운로드는 ajax도 아닌데 비동기 통신으로 된다.
				
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
