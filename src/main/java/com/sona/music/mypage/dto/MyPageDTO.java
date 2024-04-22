package com.sona.music.mypage.dto;

import java.sql.Date;
import java.util.List;

public class MyPageDTO {
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_email;
	private String user_phone;
	private int user_accountnumber;
	private String user_bank;
	private String user_type;
	private boolean user_delete;
	private Date user_reg_date;
	private String applyform_inst;
	private int inst_category_idx;
	private String applyform_location;
	private List<String> applyformDays; // 데이터베이스의 컬럼명과 일치하도록 수정
	private List<String> applyformStyles;
	private boolean have_inst;
	private String manner;
	private String new_filename;
	private int class_idx;
	private String class_name;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getUser_accountnumber() {
		return user_accountnumber;
	}
	public void setUser_accountnumber(int user_accountnumber) {
		this.user_accountnumber = user_accountnumber;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public boolean isUser_delete() {
		return user_delete;
	}
	public void setUser_delete(boolean user_delete) {
		this.user_delete = user_delete;
	}
	public Date getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	public String getApplyform_inst() {
		return applyform_inst;
	}
	public void setApplyform_inst(String applyform_inst) {
		this.applyform_inst = applyform_inst;
	}
	public int getInst_category_idx() {
		return inst_category_idx;
	}
	public void setInst_category_idx(int inst_category_idx) {
		this.inst_category_idx = inst_category_idx;
	}
	public String getApplyform_location() {
		return applyform_location;
	}
	public void setApplyform_location(String applyform_location) {
		this.applyform_location = applyform_location;
	}
	public List<String> getApplyformDays() {
		return applyformDays;
	}
	public void setApplyformDays(List<String> applyformDays) {
		this.applyformDays = applyformDays;
	}
	public List<String> getApplyformStyles() {
		return applyformStyles;
	}
	public void setApplyformStyles(List<String> applyformStyles) {
		this.applyformStyles = applyformStyles;
	}
	public boolean isHave_inst() {
		return have_inst;
	}
	public void setHave_inst(boolean have_inst) {
		this.have_inst = have_inst;
	}
	public String getManner() {
		return manner;
	}
	public void setManner(String manner) {
		this.manner = manner;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}




	
	

}
