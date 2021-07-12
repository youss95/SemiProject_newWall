package com.kh.dto;

import java.sql.Date;

public class NoticeDTO {
	private String notice_seq;
	private String notice_title;
	private String notice_contents;
	private String notice_writer;
	private Date notice_reg_date;
	private int notice_view;
	
	public NoticeDTO() {}

	public NoticeDTO(String notice_seq, String notice_title, String notice_contects, String notice_writer,
			Date notice_reg_date, int notice_view) {
		this.notice_seq = notice_seq;
		this.notice_title = notice_title;
		this.notice_contents = notice_contects;
		this.notice_writer = notice_writer;
		this.notice_reg_date = notice_reg_date;
		this.notice_view = notice_view;
	}

	public String getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(String notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contects) {
		this.notice_contents = notice_contects;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public Date getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
	public int getNotice_view() {
		return notice_view;
	}
	public void setNotice_view(int notice_view) {
		this.notice_view = notice_view;
	}
	
	
}
