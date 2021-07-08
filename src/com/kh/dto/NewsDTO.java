package com.kh.dto;

import java.sql.Date;

public class NewsDTO {
	private int news_seq;
	private String news_title;
	private String news_contents;
	private String news_writer;
	private Date news_reg_date;
	private int news_view;
	
	public NewsDTO() {}

	public NewsDTO(int news_seq, String news_title, String news_contents, String news_writer, Date news_reg_date,
			int news_view) {
		this.news_seq = news_seq;
		this.news_title = news_title;
		this.news_contents = news_contents;
		this.news_writer = news_writer;
		this.news_reg_date = news_reg_date;
		this.news_view = news_view;
	}
	
	public int getNews_seq() {
		return news_seq;
	}
	public void setNews_seq(int news_seq) {
		this.news_seq = news_seq;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_contents() {
		return news_contents;
	}
	public void setNews_contents(String news_contents) {
		this.news_contents = news_contents;
	}
	public String getNews_writer() {
		return news_writer;
	}
	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}
	public Date getNews_reg_date() {
		return news_reg_date;
	}
	public void setNews_reg_date(Date news_reg_date) {
		this.news_reg_date = news_reg_date;
	}
	public int getNews_view() {
		return news_view;
	}
	public void setNews_view(int news_view) {
		this.news_view = news_view;
	}
	
	
	
}
