package com.kh.dto;

import java.sql.Date;

public class NoticeFileDTO {
	private int seq;
	private String oriName;
	private String sysName;
	private Date reg_date;
	private String parent;
	
	public NoticeFileDTO() {}

	public NoticeFileDTO(int seq, String oriName, String sysName, Date reg_date, String parent) {
		this.seq = seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.reg_date = reg_date;
		this.parent = parent;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}

	public String getSysName() {
		return sysName;
	}

	public void setSysName(String sysName) {
		this.sysName = sysName;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getParent() {
		return parent;
	}

	public void setParent(String parent) {
		this.parent = parent;
	}

	
	
	

}
