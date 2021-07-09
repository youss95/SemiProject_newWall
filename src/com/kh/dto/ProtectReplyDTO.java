package com.kh.dto;

import java.sql.Date;

public class ProtectReplyDTO {

	private int replyNo;
	private String replyCon;
	private String protectWriter;
	private int boardNo;
	private Date createDate;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyCon() {
		return replyCon;
	}
	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}
	public String getProtectWriter() {
		return protectWriter;
	}
	public void setProtectWriter(String protectWriter) {
		this.protectWriter = protectWriter;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public ProtectReplyDTO(int replyNo, String replyCon, String protectWriter, int boardNo, Date createDate) {
		super();
		this.replyNo = replyNo;
		this.replyCon = replyCon;
		this.protectWriter = protectWriter;
		this.boardNo = boardNo;
		this.createDate = createDate;
	}
	public ProtectReplyDTO() {
		super();
	}
	@Override
	public String toString() {
		return "ProtectReplyDTO [replyNo=" + replyNo + ", replyCon=" + replyCon + ", protectWriter=" + protectWriter
				+ ", boardNo=" + boardNo + ", createDate=" + createDate + "]";
	}
	
	
	
}
