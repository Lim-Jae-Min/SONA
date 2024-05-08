package com.sona.music.lesson.dto;

import java.sql.Date;

public class LogDTO {
	
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String new_filename;
	
	private int apply_idx;
	private int class_idx;
	private String class_name;
	private String start_date;
	private int total_times;
	private int accumulate_times;
	private String apply_detail;
	private int class_price;
	
	private String ch_date;
	private String ch_write_date;
	private String ch_content;
	private String ch_result;
	private int ch_idx;
	
	private String review_idx;
	private String student_id;
	private int point_idx;
	private int point;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	private String teacher_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getCh_date() {
		return ch_date;
	}
	public void setCh_date(String ch_date) {
		this.ch_date = ch_date;
	}
	public String getCh_content() {
		return ch_content;
	}
	public void setCh_content(String ch_content) {
		this.ch_content = ch_content;
	}
	public String getCh_result() {
		return ch_result;
	}
	public void setCh_result(String ch_result) {
		this.ch_result = ch_result;
	}
	public int getApply_idx() {
		return apply_idx;
	}
	public void setApply_idx(int apply_idx) {
		this.apply_idx = apply_idx;
	}
	public int getTotal_times() {
		return total_times;
	}
	public void setTotal_times(int total_times) {
		this.total_times = total_times;
	}
	public int getAccumulate_times() {
		return accumulate_times;
	}
	public void setAccumulate_times(int accumulate_times) {
		this.accumulate_times = accumulate_times;
	}
	public String getCh_write_date() {
		return ch_write_date;
	}
	public void setCh_write_date(String ch_write_date) {
		this.ch_write_date = ch_write_date;
	}
	public int getCh_idx() {
		return ch_idx;
	}
	public void setCh_idx(int ch_idx) {
		this.ch_idx = ch_idx;
	}
	public String getApply_detail() {
		return apply_detail;
	}
	public void setApply_detail(String apply_detail) {
		this.apply_detail = apply_detail;
	}
	public String getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(String review_idx) {
		this.review_idx = review_idx;
	}
	public int getClass_price() {
		return class_price;
	}
	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}
	public int getPoint_idx() {
		return point_idx;
	}
	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
	
}
