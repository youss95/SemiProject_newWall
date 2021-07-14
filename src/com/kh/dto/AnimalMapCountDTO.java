package com.kh.dto;

public class AnimalMapCountDTO {

	private int totalCount;
	private int todayCount;
	private int dogCount;
	private int catCount;
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
	public int getDogCount() {
		return dogCount;
	}
	public void setDogCount(int dogCount) {
		this.dogCount = dogCount;
	}
	public int getCatCount() {
		return catCount;
	}
	public void setCatCount(int catCount) {
		this.catCount = catCount;
	}
	public AnimalMapCountDTO(int totalCount, int todayCount, int dogCount, int catCount) {
		super();
		this.totalCount = totalCount;
		this.todayCount = todayCount;
		this.dogCount = dogCount;
		this.catCount = catCount;
	}
	public AnimalMapCountDTO() {
		super();
	}
	
	
}
