package com.kh.dto;

import java.sql.Date;

public class AdoptionDTO {

	private String adopt_qa01;
	private String adopt_qa02;
	private String adopt_qa03;
	private String adopt_qa04;
	private String adopt_qa05;
	private String adopt_qa06;
	private String adopt_qa07;
	private String adopt_qa08;
	private String adopt_qa09;
	private String adopt_qa10;
	private String adopt_qa11;
	private String adopt_qa12;
	private String adopt_qa13;
	private String adopt_qa14;
	private String adopt_qa15;
	private String adopt_qa16;
	private String user_id;
	private Date reg_date;
	private String code_seq;
	private int adopt_seq;
	private String an_name;
	
	public AdoptionDTO() {}
	
	// adopt_regi
	public AdoptionDTO(String user_id, Date reg_date, String code_seq, int adopt_seq, String an_name) {
		super();
		this.user_id = user_id;
		this.reg_date = reg_date;
		this.code_seq = code_seq;
		this.adopt_seq = adopt_seq;
		this.an_name = an_name;
	}

	// adoption
	public AdoptionDTO(String adopt_qa01, String adopt_qa02, String adopt_qa03, String adopt_qa04, String adopt_qa05,
			String adopt_qa06, String adopt_qa07, String adopt_qa08, String adopt_qa09, String adopt_qa10,
			String adopt_qa11, String adopt_qa12, String adopt_qa13, String adopt_qa14, String adopt_qa15,
			String adopt_qa16, String user_id, Date reg_date, String code_seq) {
		super();
		this.adopt_qa01 = adopt_qa01;
		this.adopt_qa02 = adopt_qa02;
		this.adopt_qa03 = adopt_qa03;
		this.adopt_qa04 = adopt_qa04;
		this.adopt_qa05 = adopt_qa05;
		this.adopt_qa06 = adopt_qa06;
		this.adopt_qa07 = adopt_qa07;
		this.adopt_qa08 = adopt_qa08;
		this.adopt_qa09 = adopt_qa09;
		this.adopt_qa10 = adopt_qa10;
		this.adopt_qa11 = adopt_qa11;
		this.adopt_qa12 = adopt_qa12;
		this.adopt_qa13 = adopt_qa13;
		this.adopt_qa14 = adopt_qa14;
		this.adopt_qa15 = adopt_qa15;
		this.adopt_qa16 = adopt_qa16;
		this.user_id = user_id;
		this.reg_date = reg_date;
		this.code_seq = code_seq;
	}
	
	public String getAdopt_qa01() {
		return adopt_qa01;
	}
	public void setAdopt_qa01(String adopt_qa01) {
		this.adopt_qa01 = adopt_qa01;
	}
	public String getAdopt_qa02() {
		return adopt_qa02;
	}
	public void setAdopt_qa02(String adopt_qa02) {
		this.adopt_qa02 = adopt_qa02;
	}
	public String getAdopt_qa03() {
		return adopt_qa03;
	}
	public void setAdopt_qa03(String adopt_qa03) {
		this.adopt_qa03 = adopt_qa03;
	}
	public String getAdopt_qa04() {
		return adopt_qa04;
	}
	public void setAdopt_qa04(String adopt_qa04) {
		this.adopt_qa04 = adopt_qa04;
	}
	public String getAdopt_qa05() {
		return adopt_qa05;
	}
	public void setAdopt_qa05(String adopt_qa05) {
		this.adopt_qa05 = adopt_qa05;
	}
	public String getAdopt_qa06() {
		return adopt_qa06;
	}
	public void setAdopt_qa06(String adopt_qa06) {
		this.adopt_qa06 = adopt_qa06;
	}
	public String getAdopt_qa07() {
		return adopt_qa07;
	}
	public void setAdopt_qa07(String adopt_qa07) {
		this.adopt_qa07 = adopt_qa07;
	}
	public String getAdopt_qa08() {
		return adopt_qa08;
	}
	public void setAdopt_qa08(String adopt_qa08) {
		this.adopt_qa08 = adopt_qa08;
	}
	public String getAdopt_qa09() {
		return adopt_qa09;
	}
	public void setAdopt_qa09(String adopt_qa09) {
		this.adopt_qa09 = adopt_qa09;
	}
	public String getAdopt_qa10() {
		return adopt_qa10;
	}
	public void setAdopt_qa10(String adopt_qa10) {
		this.adopt_qa10 = adopt_qa10;
	}
	public String getAdopt_qa11() {
		return adopt_qa11;
	}
	public void setAdopt_qa11(String adopt_qa11) {
		this.adopt_qa11 = adopt_qa11;
	}
	public String getAdopt_qa12() {
		return adopt_qa12;
	}
	public void setAdopt_qa12(String adopt_qa12) {
		this.adopt_qa12 = adopt_qa12;
	}
	public String getAdopt_qa13() {
		return adopt_qa13;
	}
	public void setAdopt_qa13(String adopt_qa13) {
		this.adopt_qa13 = adopt_qa13;
	}
	public String getAdopt_qa14() {
		return adopt_qa14;
	}
	public void setAdopt_qa14(String adopt_qa14) {
		this.adopt_qa14 = adopt_qa14;
	}
	public String getAdopt_qa15() {
		return adopt_qa15;
	}
	public void setAdopt_qa15(String adopt_qa15) {
		this.adopt_qa15 = adopt_qa15;
	}
	public String getAdopt_qa16() {
		return adopt_qa16;
	}
	public void setAdopt_qa16(String adopt_qa16) {
		this.adopt_qa16 = adopt_qa16;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(String code_seq) {
		this.code_seq = code_seq;
	}
	public int getAdopt_seq() {
		return adopt_seq;
	}
	public void setAdopt_seq(int adopt_seq) {
		this.adopt_seq = adopt_seq;
	}
	public String getAn_name() {
		return an_name;
	}
	public void setAn_name(String an_name) {
		this.an_name = an_name;
	}
	
	
	
	
}
