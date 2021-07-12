package com.kh.dto;

import java.sql.Date;

public class NoCommentsDTO {
	private int ntrp_seq;
	private String ntrp_contents;
	private String ntrp_writer;
	private Date ntrp_reg_date;
	private String ntrp_parent;
	
	public NoCommentsDTO() {}

	public NoCommentsDTO(int ntrp_seq, String ntrp_contents, String ntrp_writer, Date ntrp_reg_date, String ntrp_parent) {
		this.ntrp_seq = ntrp_seq;
		this.ntrp_contents = ntrp_contents;
		this.ntrp_writer = ntrp_writer;
		this.ntrp_reg_date = ntrp_reg_date;
		this.ntrp_parent = ntrp_parent;
	}
	
	public int getNtrp_seq() {
		return ntrp_seq;
	}
	public void setNtrp_seq(int ntrp_seq) {
		this.ntrp_seq = ntrp_seq;
	}
	public String getNtrp_contents() {
		return ntrp_contents;
	}
	public void setNtrp_contents(String ntrp_contents) {
		this.ntrp_contents = ntrp_contents;
	}
	public String getNtrp_writer() {
		return ntrp_writer;
	}
	public void setNtrp_writer(String ntrp_writer) {
		this.ntrp_writer = ntrp_writer;
	}
	public Date getNtrp_reg_date() {
		return ntrp_reg_date;
	}
	public void setNtrp_reg_date(Date ntrp_reg_date) {
		this.ntrp_reg_date = ntrp_reg_date;
	}
	public String getNtrp_parent() {
		return ntrp_parent;
	}
	public void setNtrp_parent(String ntrp_parent) {
		this.ntrp_parent = ntrp_parent;
	}
}
