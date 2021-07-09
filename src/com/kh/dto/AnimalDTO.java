package com.kh.dto;

import java.sql.Date;

public class AnimalDTO {
	
	private String code_seq;
	private String an_name;
	private String an_category;
	private String an_gender;
	private String an_kind;
    private int an_age;
    private String an_age_range;
    private int an_weight;
    private String an_weight_range;    
    private String an_character;
    private Date an_date;
    private String an_status;
    private String an_photo;
    private String an_contents;
    private Date an_reg_date;
    private String an_neutering;
    
    public AnimalDTO() {}
    
    public AnimalDTO(String an_name, String an_category, String an_gender, String an_age_range, String an_weight_range, String an_character) {
		super();
		this.an_name = an_name;
		this.an_category = an_category;
		this.an_gender = an_gender;
		this.an_age_range = an_age_range;
		this.an_weight_range = an_weight_range;
		this.an_character = an_character;
	}

	public AnimalDTO(String code_seq, String an_name, String an_category, String an_gender, String an_kind, int an_age,
			int an_weight, String an_character, Date an_date, String an_status, String an_photo, String an_contents,
			Date an_reg_date, String an_neutering) {
		super();
		this.code_seq = code_seq;
		this.an_name = an_name;
		this.an_category = an_category;
		this.an_gender = an_gender;
		this.an_kind = an_kind;
		this.an_age = an_age;
		this.an_weight = an_weight;
		this.an_character = an_character;
		this.an_date = an_date;
		this.an_status = an_status;
		this.an_photo = an_photo;
		this.an_contents = an_contents;
		this.an_reg_date = an_reg_date;
		this.an_neutering = an_neutering;
	}

	public String getCode_seq() {
		return code_seq;
	}

	public void setCode_seq(String code_seq) {
		this.code_seq = code_seq;
	}

	public String getAn_name() {
		return an_name;
	}

	public void setAn_name(String an_name) {
		this.an_name = an_name;
	}

	public String getAn_category() {
		return an_category;
	}

	public void setAn_category(String an_category) {
		this.an_category = an_category;
	}

	public String getAn_gender() {
		return an_gender;
	}

	public void setAn_gender(String an_gender) {
		this.an_gender = an_gender;
	}

	public String getAn_kind() {
		return an_kind;
	}

	public void setAn_kind(String an_kind) {
		this.an_kind = an_kind;
	}

	public int getAn_age() {
		return an_age;
	}

	public void setAn_age(int an_age) {
		this.an_age = an_age;
	}

	public int getAn_weight() {
		return an_weight;
	}

	public void setAn_weight(int an_weight) {
		this.an_weight = an_weight;
	}

	public String getAn_character() {
		return an_character;
	}

	public void setAn_character(String an_character) {
		this.an_character = an_character;
	}

	public Date getAn_date() {
		return an_date;
	}

	public void setAn_date(Date an_date) {
		this.an_date = an_date;
	}

	public String getAn_status() {
		return an_status;
	}

	public void setAn_status(String an_status) {
		this.an_status = an_status;
	}

	public String getAn_photo() {
		return an_photo;
	}

	public void setAn_photo(String an_photo) {
		this.an_photo = an_photo;
	}

	public String getAn_contents() {
		return an_contents;
	}

	public void setAn_contents(String an_contents) {
		this.an_contents = an_contents;
	}

	public Date getAn_reg_date() {
		return an_reg_date;
	}

	public void setAn_reg_date(Date an_reg_date) {
		this.an_reg_date = an_reg_date;
	}

	public String getAn_neutering() {
		return an_neutering;
	}

	public void setAn_neutering(String an_neutering) {
		this.an_neutering = an_neutering;
	}
	
	public String getAn_age_range() {
		return an_age_range;
	}

	public void setAn_age_range(String an_age_range) {
		this.an_age_range = an_age_range;
	}

	public String getAn_weight_range() {
		return an_weight_range;
	}

	public void setAn_weight_range(String an_weight_range) {
		this.an_weight_range = an_weight_range;
	}

}
