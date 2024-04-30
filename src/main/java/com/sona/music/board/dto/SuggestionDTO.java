package com.sona.music.board.dto;

import java.sql.Date;

public class SuggestionDTO {

	private int sug_idx;
	private int sug_secret;
	private String sug_title;
	private int sug_answer_idx;
	private String user_id;
	private String user_name;
	private Date sug_reg_date;
	
	private int sug_views;
	private String sug_content;
	private String new_filename;
	private String admin_id;
	private Date sug_answer_reg_date;
	private String sug_answer;
	
	
	
	public int getSug_idx() {
		return sug_idx;
	}
	public void setSug_idx(int sug_idx) {
		this.sug_idx = sug_idx;
	}
	public String getSug_title() {
		return sug_title;
	}
	public void setSug_title(String sug_title) {
		this.sug_title = sug_title;
	}
	public int getSug_answer_idx() {
		return sug_answer_idx;
	}
	public void setSug_answer_idx(int sug_answer_idx) {
		this.sug_answer_idx = sug_answer_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getSug_reg_date() {
		return sug_reg_date;
	}
	public void setSug_reg_date(Date sug_reg_date) {
		this.sug_reg_date = sug_reg_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getSug_secret() {
		return sug_secret;
	}
	public void setSug_secret(int sug_secret) {
		this.sug_secret = sug_secret;
	}
	public int getSug_views() {
		return sug_views;
	}
	public void setSug_views(int sug_views) {
		this.sug_views = sug_views;
	}
	public String getSug_content() {
		return sug_content;
	}
	public void setSug_content(String sug_content) {
		this.sug_content = sug_content;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public Date getSug_answer_reg_date() {
		return sug_answer_reg_date;
	}
	public void setSug_answer_reg_date(Date sug_answer_reg_date) {
		this.sug_answer_reg_date = sug_answer_reg_date;
	}
	public String getSug_answer() {
		return sug_answer;
	}
	public void setSug_answer(String sug_answer) {
		this.sug_answer = sug_answer;
	}
	
}