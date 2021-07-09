package com.kh.dto;

import java.sql.Date;

public class ProtectBoardDTO {
//이름 성별 사진 발견날짜 주소 품종 
	private int protectNo;
	private String protectName;
	private String protectGender;
	private String protectFileRealName1;
	private String protectFileRealName2;
	private String protectAddr;
	private String protectKind;
	private Date protectCreateDate;
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
	public String getProtectAddr() {
		return protectAddr;
	}
	public void setProtectAddr(String protectAddr) {
		this.protectAddr = protectAddr;
	}
	public String getProtectKind() {
		return protectKind;
	}
	public void setProtectKind(String protectKind) {
		this.protectKind = protectKind;
	}
	public Date getProtectCreateDate() {
		return protectCreateDate;
	}
	public void setProtectCreateDate(Date protectCreateDate) {
		this.protectCreateDate = protectCreateDate;
	}
	public String getProtectWriter() {
		return protectWriter;
	}
	public void setProtectWriter(String protectWriter) {
		this.protectWriter = protectWriter;
	}
	public ProtectBoardDTO(int protectNo, String protectName, String protectGender, String protectFileRealName1,
			String protectFileRealName2, String protectAddr, String protectKind, Date protectCreateDate,
			String protectWriter) {
		super();
		this.protectNo = protectNo;
		this.protectName = protectName;
		this.protectGender = protectGender;
		this.protectFileRealName1 = protectFileRealName1;
		this.protectFileRealName2 = protectFileRealName2;
		this.protectAddr = protectAddr;
		this.protectKind = protectKind;
		this.protectCreateDate = protectCreateDate;
		this.protectWriter = protectWriter;
	}
	public ProtectBoardDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ProtectBoardDTO [protectNo=" + protectNo + ", protectName=" + protectName + ", protectGender="
				+ protectGender + ", protectFileRealName1=" + protectFileRealName1 + ", protectFileRealName2="
				+ protectFileRealName2 + ", protectAddr=" + protectAddr + ", protectKind=" + protectKind
				+ ", protectCreateDate=" + protectCreateDate + ", protectWriter=" + protectWriter + "]";
	}
	
	
	
	
}
