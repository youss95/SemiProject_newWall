package com.kh.dto;

public class AnimalMapCountDTO {

	private int totalCount;
	private int todayCount;
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTodayCount() {
		return todayCount;
	}
	public void setTodayCount(int todayCount) {
		this.todayCount = todayCount;
	}
	public AnimalMapCountDTO() {
		super();
	}
	public AnimalMapCountDTO(int totalCount, int todayCount) {
		super();
		this.totalCount = totalCount;
		this.todayCount = todayCount;
	}
	@Override
	public String toString() {
		return "AnimalMapCountDTO [totalCount=" + totalCount + ", todayCount=" + todayCount + "]";
	}
	
	
}
