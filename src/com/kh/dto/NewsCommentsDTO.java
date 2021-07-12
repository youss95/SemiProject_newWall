package com.kh.dto;

import java.sql.Date;

public class NewsCommentsDTO {
	private int nrp_seq;
	private String nrp_contents;
	private String nrp_writer;
	private Date nrp_reg_date;
	private String nrp_parent;
	
	public NewsCommentsDTO() {}

	public NewsCommentsDTO(int nrp_seq, String nrp_contents, String nrp_writer, Date nrp_reg_date, String nrp_parent) {
		this.nrp_seq = nrp_seq;
		this.nrp_contents = nrp_contents;
		this.nrp_writer = nrp_writer;
		this.nrp_reg_date = nrp_reg_date;
		this.nrp_parent = nrp_parent;
	}
	
	public int getNrp_seq() {
		return nrp_seq;
	}
	public void setNrp_seq(int nrp_seq) {
		this.nrp_seq = nrp_seq;
	}
	public String getNrp_contents() {
		return nrp_contents;
	}
	public void setNrp_contents(String nrp_contents) {
		this.nrp_contents = nrp_contents;
	}
	public String getNrp_writer() {
		return nrp_writer;
	}
	public void setNrp_writer(String nrp_writer) {
		this.nrp_writer = nrp_writer;
	}
	public Date getNrp_reg_date() {
		return nrp_reg_date;
	}
	public void setNrp_reg_date(Date nrp_reg_date) {
		this.nrp_reg_date = nrp_reg_date;
	}
	public String getNrp_parent() {
		return nrp_parent;
	}
	public void setNrp_parent(String nrp_parent) {
		this.nrp_parent = nrp_parent;
	}
	
	

}
