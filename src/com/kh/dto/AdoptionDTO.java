package com.kh.dto;

import java.sql.Date;

public class AdoptionDTO {

	private int adopt_seq;
	private String code_seq;
	private Date reg_date;
	private String user_id;
	private String p_name;
	private String p_phone01;
	private String p_phone02;
	private String p_email;
	private String p_gender;
	private String p_age;
	private String p_address;
	private String p_mstatus;
	private String p_arg;
	private String ad_status;
	private String q01_aname;
	private String q02_alternative;
	private String q03_time_to_worry;
	private String q04_reason;
	private String q05_family_member;
	private String q06_family_arg;
	private String q07_pet;
	private String q08_experience;
	private String q09_housing_type;
	private String q10_host_consent;
	private String q11_impossible_situation;
	private String q12_lodging_problem;
	private String q13_payment_arg;
	private String q14_neutered_arg;
	private String q15_visit_agr;
	private String q16_adopt_arg;

	
	public AdoptionDTO() {}
	
	// adoption list
	public AdoptionDTO(String user_id, String p_name, Date reg_date, String code_seq, int adopt_seq, String ad_status) {
		super();
		this.user_id = user_id;
		this.p_name = p_name;
		this.reg_date = reg_date;
		this.code_seq = code_seq;
		this.adopt_seq = adopt_seq;
		this.ad_status = ad_status;
	}


	public AdoptionDTO(int adopt_seq, String code_seq, Date reg_date, String user_id, String p_name, String p_phone01,
			String p_phone02, String p_email, String p_gender, String p_age, String p_address, String p_mstatus,
			String p_arg, String ad_status, String q01_aname, String q02_alternative, String q03_time_to_worry,
			String q04_reason, String q05_family_member, String q06_family_arg, String q07_pet, String q08_experience,
			String q09_housing_type, String q10_host_consent, String q11_impossible_situation,
			String q12_lodging_problem, String q13_payment_arg, String q14_neutered_arg, String q15_visit_agr,
			String q16_adopt_arg) {
		super();
		this.adopt_seq = adopt_seq;
		this.code_seq = code_seq;
		this.reg_date = reg_date;
		this.user_id = user_id;
		this.p_name = p_name;
		this.p_phone01 = p_phone01;
		this.p_phone02 = p_phone02;
		this.p_email = p_email;
		this.p_gender = p_gender;
		this.p_age = p_age;
		this.p_address = p_address;
		this.p_mstatus = p_mstatus;
		this.p_arg = p_arg;
		this.ad_status = ad_status;
		this.q01_aname = q01_aname;
		this.q02_alternative = q02_alternative;
		this.q03_time_to_worry = q03_time_to_worry;
		this.q04_reason = q04_reason;
		this.q05_family_member = q05_family_member;
		this.q06_family_arg = q06_family_arg;
		this.q07_pet = q07_pet;
		this.q08_experience = q08_experience;
		this.q09_housing_type = q09_housing_type;
		this.q10_host_consent = q10_host_consent;
		this.q11_impossible_situation = q11_impossible_situation;
		this.q12_lodging_problem = q12_lodging_problem;
		this.q13_payment_arg = q13_payment_arg;
		this.q14_neutered_arg = q14_neutered_arg;
		this.q15_visit_agr = q15_visit_agr;
		this.q16_adopt_arg = q16_adopt_arg;
	}

	public String getAd_status() {
		return ad_status;
	}

	public void setAd_status(String ad_status) {
		this.ad_status = ad_status;
	}

	public int getAdopt_seq() {
		return adopt_seq;
	}

	public void setAdopt_seq(int adopt_seq) {
		this.adopt_seq = adopt_seq;
	}

	public String getCode_seq() {
		return code_seq;
	}

	public void setCode_seq(String code_seq) {
		this.code_seq = code_seq;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_phone01() {
		return p_phone01;
	}

	public void setP_phone01(String p_phone01) {
		this.p_phone01 = p_phone01;
	}

	public String getP_phone02() {
		return p_phone02;
	}

	public void setP_phone02(String p_phone02) {
		this.p_phone02 = p_phone02;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getP_gender() {
		return p_gender;
	}

	public void setP_gender(String p_gender) {
		this.p_gender = p_gender;
	}

	public String getP_age() {
		return p_age;
	}

	public void setP_age(String p_age) {
		this.p_age = p_age;
	}

	public String getP_address() {
		return p_address;
	}

	public void setP_address(String p_address) {
		this.p_address = p_address;
	}

	public String getP_mstatus() {
		return p_mstatus;
	}

	public void setP_mstatus(String p_mstatus) {
		this.p_mstatus = p_mstatus;
	}

	public String getP_arg() {
		return p_arg;
	}

	public void setP_arg(String p_arg) {
		this.p_arg = p_arg;
	}

	public String getQ01_aname() {
		return q01_aname;
	}

	public void setQ01_aname(String q01_aname) {
		this.q01_aname = q01_aname;
	}

	public String getQ02_alternative() {
		return q02_alternative;
	}

	public void setQ02_alternative(String q02__alternative) {
		this.q02_alternative = q02__alternative;
	}

	public String getQ03_time_to_worry() {
		return q03_time_to_worry;
	}

	public void setQ03_time_to_worry(String q03_time_to_worry) {
		this.q03_time_to_worry = q03_time_to_worry;
	}

	public String getQ04_reason() {
		return q04_reason;
	}

	public void setQ04_reason(String q04_reason) {
		this.q04_reason = q04_reason;
	}

	public String getQ05_family_member() {
		return q05_family_member;
	}

	public void setQ05_family_member(String q05_family_member) {
		this.q05_family_member = q05_family_member;
	}

	public String getQ06_family_arg() {
		return q06_family_arg;
	}

	public void setQ06_family_arg(String q06_family_arg) {
		this.q06_family_arg = q06_family_arg;
	}

	public String getQ07_pet() {
		return q07_pet;
	}

	public void setQ07_pet(String q07_pet) {
		this.q07_pet = q07_pet;
	}

	public String getQ08_experience() {
		return q08_experience;
	}

	public void setQ08_experience(String q08_experience) {
		this.q08_experience = q08_experience;
	}

	public String getQ09_housing_type() {
		return q09_housing_type;
	}

	public void setQ09_housing_type(String q09_housing_type) {
		this.q09_housing_type = q09_housing_type;
	}

	public String getQ10_host_consent() {
		return q10_host_consent;
	}

	public void setQ10_host_consent(String q10_host_consent) {
		this.q10_host_consent = q10_host_consent;
	}

	public String getQ11_impossible_situation() {
		return q11_impossible_situation;
	}

	public void setQ11_impossible_situation(String q11_impossible_situation) {
		this.q11_impossible_situation = q11_impossible_situation;
	}

	public String getQ12_lodging_problem() {
		return q12_lodging_problem;
	}

	public void setQ12_lodging_problem(String q12_lodging_problem) {
		this.q12_lodging_problem = q12_lodging_problem;
	}

	public String getQ13_payment_arg() {
		return q13_payment_arg;
	}

	public void setQ13_payment_arg(String q13_payment_arg) {
		this.q13_payment_arg = q13_payment_arg;
	}

	public String getQ14_neutered_arg() {
		return q14_neutered_arg;
	}

	public void setQ14_neutered_arg(String q14_neutered_arg) {
		this.q14_neutered_arg = q14_neutered_arg;
	}

	public String getQ15_visit_agr() {
		return q15_visit_agr;
	}

	public void setQ15_visit_agr(String q15_visit_agr) {
		this.q15_visit_agr = q15_visit_agr;
	}

	public String getQ16_adopt_arg() {
		return q16_adopt_arg;
	}

	public void setQ16_adopt_arg(String q16_adopt_arg) {
		this.q16_adopt_arg = q16_adopt_arg;
	}

	
}
