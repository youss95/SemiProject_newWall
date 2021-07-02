package com.kh.dto;

import java.sql.Date;

public class ProtectionDTO {

	private int protectNo;
	//private int user_no; 로그인 완성되면 적용
	private String protectName;
	private String protectKind;
	private String protectFindDate;
	private String protectFindAddr;
	
	private String protectContent;
	private String protectGender;
	private String protectFileRealName1;
	private String protectFileRealName2;
	private int protectViewCount;
	private Date protectCreateDate;
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
	public String getProtectFindDate() {
		return protectFindDate;
	}
	public void setProtectFindDate(String protectFindDate) {
		this.protectFindDate = protectFindDate;
	}
	public String getProtectFindAddr() {
		return protectFindAddr;
	}
	public void setProtectFindAddr(String protectFindAddr) {
		this.protectFindAddr = protectFindAddr;
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
	public Date getProtectCreateDate() {
		return protectCreateDate;
	}
	public void setProtectCreateDate(Date protectCreateDate) {
		this.protectCreateDate = protectCreateDate;
	}
	public ProtectionDTO(int protectNo, String protectName, String protectKind, String protectFindDate,
			String protectFindAddr, String protectContent, String protectGender, String protectFileRealName1,
			String protectFileRealName2, int protectViewCount, Date protectCreateDate) {
		super();
		this.protectNo = protectNo;
		this.protectName = protectName;
		this.protectKind = protectKind;
		this.protectFindDate = protectFindDate;
		this.protectFindAddr = protectFindAddr;
		this.protectContent = protectContent;
		this.protectGender = protectGender;
		this.protectFileRealName1 = protectFileRealName1;
		this.protectFileRealName2 = protectFileRealName2;
		this.protectViewCount = protectViewCount;
		this.protectCreateDate = protectCreateDate;
	}
	
	
	
	public ProtectionDTO(String protectName, String protectKind, String protectFindDate, String protectFindAddr,
			String protectContent, String protectGender, String protectFileRealName1, String protectFileRealName2) {
		super();
		this.protectName = protectName;
		this.protectKind = protectKind;
		this.protectFindDate = protectFindDate;
		this.protectFindAddr = protectFindAddr;
		this.protectContent = protectContent;
		this.protectGender = protectGender;
		this.protectFileRealName1 = protectFileRealName1;
		this.protectFileRealName2 = protectFileRealName2;
	}
	public ProtectionDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ProtectionDto [protectNo=" + protectNo + ", protectName=" + protectName + ", protectKind=" + protectKind
				+ ", protectFindDate=" + protectFindDate + ", protectFindAddr=" + protectFindAddr + ", protectContent="
				+ protectContent + ", protectGender=" + protectGender + ", protectFileRealName1=" + protectFileRealName1
				+ ", protectFileRealName2=" + protectFileRealName2 + ", protectViewCount=" + protectViewCount
				+ ", protectCreateDate=" + protectCreateDate + "]";
	}
	
	
	
	
}
