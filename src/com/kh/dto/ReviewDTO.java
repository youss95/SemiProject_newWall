package com.kh.dto;

import java.sql.Date;

public class ReviewDTO {

	private int review_seq;
	private String review_title;
	private String review_writer;
	private String review_introduce;
	private String review_thumbnail;
	private String review_contents;
	private Date reg_date;
	private int review_view;
	private int review_like;
	
	public ReviewDTO() {}
	
	public ReviewDTO(int review_seq, String review_title, String review_writer, String review_introduce, Date reg_date) {
		super();
		this.review_seq = review_seq;
		this.review_title = review_title;
		this.review_writer = review_writer;
		this.review_introduce = review_introduce;
		this.reg_date = reg_date;
	}
	
	public ReviewDTO(int review_seq, String review_title, String review_writer, String review_introduce,
			String review_thumbnail, String review_contents, Date reg_date, int review_view, int review_like) {
		super();
		this.review_seq = review_seq;
		this.review_title = review_title;
		this.review_writer = review_writer;
		this.review_introduce = review_introduce;
		this.review_thumbnail = review_thumbnail;
		this.review_contents = review_contents;
		this.reg_date = reg_date;
		this.review_view = review_view;
		this.review_like = review_like;
	}
	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public String getReview_introduce() {
		return review_introduce;
	}
	public void setReview_introduce(String review_introduce) {
		this.review_introduce = review_introduce;
	}
	public String getReview_thumbnail() {
		return review_thumbnail;
	}
	public void setReview_thumbnail(String review_thumbnail) {
		this.review_thumbnail = review_thumbnail;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getReview_view() {
		return review_view;
	}
	public void setReview_view(int review_view) {
		this.review_view = review_view;
	}
	public int getReview_like() {
		return review_like;
	}
	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}

	
	
	
}
