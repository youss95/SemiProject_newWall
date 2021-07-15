package com.kh.utils;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {

   public static String generateCertChar() {
      int certCharLength = 6;
      char[] charTbl = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'};
      Random random = new Random(System.currentTimeMillis());
      int tblLength = charTbl.length;
      StringBuffer buf = new StringBuffer();

      for(int i = 0; i < certCharLength; i++) {
         buf.append(charTbl[random.nextInt(tblLength)]);
      }
      return buf.toString();
   }

   public static void sendMail(String email,String title, String contents) throws Exception {
      // 자바 메일 
      String host = "smtp.gmail.com";
      String manager = "initmanager6"; // 관리자 이메일 아이디
      String password = "a#jEexY#bP6W@W@E"; // 관리자 이메일 pw
      String to = email; // 사용자 이메일
      String user = null;

      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.port", 587);
      props.put("mail.smtp.starttls.enable", "true");
      
      Session session = Session.getInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(manager, password);
         }
      });      
   
      MimeMessage msg = new MimeMessage(session);
      msg.setFrom(new InternetAddress(manager));
      msg.setRecipients(Message.RecipientType.TO, to);
      msg.setSubject(title); // 메일 타이틀
      msg.setContent(contents, "text/html;charset=UTF-8");
      Transport.send(msg); // 메일 전송
   }
}