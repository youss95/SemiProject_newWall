package com.kh.dto;

import java.sql.Date;

public class SponsorDTO {

	private int sponsor_seq;
	private int sponsor_amount;
	private String sponsor_choice;
	
	private String sponsor_agecheck;
	private String sponsor_name;
	private String sponsor_contact;
	private String sponsor_birth;
	
	private String sponsor_yname;
	private String sponsor_ybirth;
	
	private String sponsor_email;
	private String sponsor_postcode;
	private String sponsor_address1;
	private String sponsor_address2;
	
	private String sponsor_apply_num;
	
	private String sponsor_terms01;
	private String sponsor_terms02;
	private String sponsor_mb_id;
	private Date sponsor_date;
	
	public SponsorDTO() {}

	public SponsorDTO(int sponsor_seq, int sponsor_amount, String sponsor_choice, String sponsor_agecheck,
			String sponsor_name, String sponsor_contact, String sponsor_birth, String sponsor_yname,
			String sponsor_ybirth, String sponsor_email, String sponsor_postcode, String sponsor_address1,
			String sponsor_address2, String sponsor_apply_num, String sponsor_terms01, String sponsor_terms02,
			String sponsor_mb_id, Date sponsor_date) {
		super();
		this.sponsor_seq = sponsor_seq;
		this.sponsor_amount = sponsor_amount;
		this.sponsor_choice = sponsor_choice;
		this.sponsor_agecheck = sponsor_agecheck;
		this.sponsor_name = sponsor_name;
		this.sponsor_contact = sponsor_contact;
		this.sponsor_birth = sponsor_birth;
		this.sponsor_yname = sponsor_yname;
		this.sponsor_ybirth = sponsor_ybirth;
		this.sponsor_email = sponsor_email;
		this.sponsor_postcode = sponsor_postcode;
		this.sponsor_address1 = sponsor_address1;
		this.sponsor_address2 = sponsor_address2;
		this.sponsor_apply_num = sponsor_apply_num;
		this.sponsor_terms01 = sponsor_terms01;
		this.sponsor_terms02 = sponsor_terms02;
		this.sponsor_mb_id = sponsor_mb_id;
		this.sponsor_date = sponsor_date;
	}

	public int getSponsor_seq() {
		return sponsor_seq;
	}

	public void setSponsor_seq(int sponsor_seq) {
		this.sponsor_seq = sponsor_seq;
	}

	public int getSponsor_amount() {
		return sponsor_amount;
	}

	public void setSponsor_amount(int sponsor_amount) {
		this.sponsor_amount = sponsor_amount;
	}

	public String getSponsor_choice() {
		return sponsor_choice;
	}

	public void setSponsor_choice(String sponsor_choice) {
		this.sponsor_choice = sponsor_choice;
	}

	public String getSponsor_agecheck() {
		return sponsor_agecheck;
	}

	public void setSponsor_agecheck(String sponsor_agecheck) {
		this.sponsor_agecheck = sponsor_agecheck;
	}

	public String getSponsor_name() {
		return sponsor_name;
	}

	public void setSponsor_name(String sponsor_name) {
		this.sponsor_name = sponsor_name;
	}

	public String getSponsor_contact() {
		return sponsor_contact;
	}

	public void setSponsor_contact(String sponsor_contact) {
		this.sponsor_contact = sponsor_contact;
	}

	public String getSponsor_birth() {
		return sponsor_birth;
	}

	public void setSponsor_birth(String sponsor_birth) {
		this.sponsor_birth = sponsor_birth;
	}

	public String getSponsor_yname() {
		return sponsor_yname;
	}

	public void setSponsor_yname(String sponsor_yname) {
		this.sponsor_yname = sponsor_yname;
	}

	public String getSponsor_ybirth() {
		return sponsor_ybirth;
	}

	public void setSponsor_ybirth(String sponsor_ybirth) {
		this.sponsor_ybirth = sponsor_ybirth;
	}

	public String getSponsor_email() {
		return sponsor_email;
	}

	public void setSponsor_email(String sponsor_email) {
		this.sponsor_email = sponsor_email;
	}

	public String getSponsor_postcode() {
		return sponsor_postcode;
	}

	public void setSponsor_postcode(String sponsor_postcode) {
		this.sponsor_postcode = sponsor_postcode;
	}

	public String getSponsor_address1() {
		return sponsor_address1;
	}

	public void setSponsor_address1(String sponsor_address1) {
		this.sponsor_address1 = sponsor_address1;
	}

	public String getSponsor_address2() {
		return sponsor_address2;
	}

	public void setSponsor_address2(String sponsor_address2) {
		this.sponsor_address2 = sponsor_address2;
	}

	public String getSponsor_apply_num() {
		return sponsor_apply_num;
	}

	public void setSponsor_apply_num(String sponsor_apply_num) {
		this.sponsor_apply_num = sponsor_apply_num;
	}

	public String getSponsor_terms01() {
		return sponsor_terms01;
	}

	public void setSponsor_terms01(String sponsor_terms01) {
		this.sponsor_terms01 = sponsor_terms01;
	}

	public String getSponsor_terms02() {
		return sponsor_terms02;
	}

	public void setSponsor_terms02(String sponsor_terms02) {
		this.sponsor_terms02 = sponsor_terms02;
	}

	public String getSponsor_mb_id() {
		return sponsor_mb_id;
	}

	public void setSponsor_mb_id(String sponsor_mb_id) {
		this.sponsor_mb_id = sponsor_mb_id;
	}

	public Date getSponsor_date() {
		return sponsor_date;
	}

	public void setSponsor_date(Date sponsor_date) {
		this.sponsor_date = sponsor_date;
	}
	
	
	
	
	
	
	
}
