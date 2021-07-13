package com.kh.dto;

import java.sql.Date;


public class LostAnimalDTO {

	private int lostNo;
	private String lostName;
	private int lostAge;
	private String lostKind;
	private String lostCategory;
	private String lostDate;
	private Date createDate;
	private String lostAddr;
	private String fileRealName;
	private String lostContent;
	private String lostGender;
	private String lostWriter;
	public int getLostNo() {
		return lostNo;
	}
	public void setLostNo(int lostNo) {
		this.lostNo = lostNo;
	}
	public String getLostName() {
		return lostName;
	}
	public void setLostName(String lostName) {
		this.lostName = lostName;
	}
	public int getLostAge() {
		return lostAge;
	}
	public void setLostAge(int lostAge) {
		this.lostAge = lostAge;
	}
	public String getLostKind() {
		return lostKind;
	}
	public void setLostKind(String lostKind) {
		this.lostKind = lostKind;
	}
	public String getLostCategory() {
		return lostCategory;
	}
	public void setLostCategory(String lostCategory) {
		this.lostCategory = lostCategory;
	}
	public String getLostDate() {
		return lostDate;
	}
	public void setLostDate(String lostDate) {
		this.lostDate = lostDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getLostAddr() {
		return lostAddr;
	}
	public void setLostAddr(String lostAddr) {
		this.lostAddr = lostAddr;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getLostContent() {
		return lostContent;
	}
	public void setLostContent(String lostContent) {
		this.lostContent = lostContent;
	}
	public String getLostGender() {
		return lostGender;
	}
	public void setLostGender(String lostGender) {
		this.lostGender = lostGender;
	}
	public String getLostWriter() {
		return lostWriter;
	}
	public void setLostWriter(String lostWriter) {
		this.lostWriter = lostWriter;
	}
	public LostAnimalDTO(int lostNo, String lostName, int lostAge, String lostKind, String lostCategory,
			String lostDate, Date createDate, String lostAddr, String fileRealName, String lostContent,
			String lostGender, String lostWriter) {
		super();
		this.lostNo = lostNo;
		this.lostName = lostName;
		this.lostAge = lostAge;
		this.lostKind = lostKind;
		this.lostCategory = lostCategory;
		this.lostDate = lostDate;
		this.createDate = createDate;
		this.lostAddr = lostAddr;
		this.fileRealName = fileRealName;
		this.lostContent = lostContent;
		this.lostGender = lostGender;
		this.lostWriter = lostWriter;
	}
	public LostAnimalDTO() {
		super();
	}
	@Override
	public String toString() {
		return "LostAnimalDTO [lostNo=" + lostNo + ", lostName=" + lostName + ", lostAge=" + lostAge + ", lostKind="
				+ lostKind + ", lostCategory=" + lostCategory + ", lostDate=" + lostDate + ", createDate=" + createDate
				+ ", lostAddr=" + lostAddr + ", fileRealName=" + fileRealName + ", lostContent=" + lostContent
				+ ", lostGender=" + lostGender + ", lostWriter=" + lostWriter + "]";
	}
	
	
	
	
	
	
}
