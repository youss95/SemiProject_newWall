package com.kh.dto;

import java.sql.Date;

public class ProtectDetailDTO {
	private int protectNo;
	private String protectName;
	private String protectKind;
	private String protectContent;
	private String protectGender;
	private String protectFileRealName1;
	private String protectFileRealName2;
	private int protectViewCount;
	private Date createDate;
	private int protectDate;  //보호 하고 있는 일수
	private String protectWriter;
	public int getProtectNo() {
		return protectNo;
	}
	public void setProtectNo(int protectNo) {
		this.protectNo = protectNo;
	}
	public String getProtectName() {
		return protectName;
	}
	public void setProtectName(String protectName) {
		this.protectName = protectName;
	}
	public String getProtectKind() {
		return protectKind;
	}
	public void setProtectKind(String protectKind) {
		this.protectKind = protectKind;
	}
	public String getProtectContent() {
		return protectContent;
	}
	public void setProtectContent(String protectContent) {
		this.protectContent = protectContent;
	}
	public String getProtectGender() {
		return protectGender;
	}
	public void setProtectGender(String protectGender) {
		this.protectGender = protectGender;
	}
	public String getProtectFileRealName1() {
		return protectFileRealName1;
	}
	public void setProtectFileRealName1(String protectFileRealName1) {
		this.protectFileRealName1 = protectFileRealName1;
	}
	public String getProtectFileRealName2() {
		return protectFileRealName2;
	}
	public void setProtectFileRealName2(String protectFileRealName2) {
		this.protectFileRealName2 = protectFileRealName2;
	}
	public int getProtectViewCount() {
		return protectViewCount;
	}
	public void setProtectViewCount(int protectViewCount) {
		this.protectViewCount = protectViewCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getProtectDate() {
		return protectDate;
	}
	public void setProtectDate(int protectDate) {
		this.protectDate = protectDate;
	}
	public String getProtectWriter() {
		return protectWriter;
	}
	public void setProtectWriter(String protectWriter) {
		this.protectWriter = protectWriter;
	}
	public ProtectDetailDTO(int protectNo, String protectName, String protectKind, String protectContent,
			String protectGender, String protectFileRealName1, String protectFileRealName2, int protectViewCount,
			Date createDate, int protectDate, String protectWriter) {
		super();
		this.protectNo = protectNo;
		this.protectName = protectName;
		this.protectKind = protectKind;
		this.protectContent = protectContent;
		this.protectGender = protectGender;
		this.protectFileRealName1 = protectFileRealName1;
		this.protectFileRealName2 = protectFileRealName2;
		this.protectViewCount = protectViewCount;
		this.createDate = createDate;
		this.protectDate = protectDate;
		this.protectWriter = protectWriter;
	}
	public ProtectDetailDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ProtectDetailDTO [protectNo=" + protectNo + ", protectName=" + protectName + ", protectKind="
				+ protectKind + ", protectContent=" + protectContent + ", protectGender=" + protectGender
				+ ", protectFileRealName1=" + protectFileRealName1 + ", protectFileRealName2=" + protectFileRealName2
				+ ", protectViewCount=" + protectViewCount + ", createDate=" + createDate + ", protectDate="
				+ protectDate + ", protectWriter=" + protectWriter + "]";
	}
	
	
	
	
	
	
	
}
