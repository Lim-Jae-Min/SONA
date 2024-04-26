package com.sona.music.main.dto;

import java.sql.Date;

public class MainDTO {

	String user_id;
	String user_pass;
	String user_name;
	String user_email;
	String user_phone;
	int user_accountnumber;
	String user_type;
	boolean user_delete;
	Date user_reg_date;
	String video_url;
	String applyform_inst;
	String teacher_id;
	double manner_score;
	int class_idx;
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
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
	public String getApplyform_inst() {
		return applyform_inst;
	}
	public void setApplyform_inst(String applyform_inst) {
		this.applyform_inst = applyform_inst;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public double getManner_score() {
		return manner_score;
	}
	public void setManner_score(double manner_score) {
		this.manner_score = manner_score;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	
	
	
	
	
}
