package com.sona.music.admin.dto;

import java.sql.Date;

public class AdminDTO {

	// 어드민 아이디
	private String admin_id;
	private String admin_pass;
	
	//공지사항 dto
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private int notice_views;
	private Date notice_reg_date;
	private int notice_delete;
	
	// 어드민 아이디 게터/ 세터
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
	
	// 공지사항 
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getNotice_views() {
		return notice_views;
	}
	public void setNotice_views(int notice_views) {
		this.notice_views = notice_views;
	}
	public Date getNotice_reg_date() {
		return notice_reg_date;
	}
	public void setNotice_reg_date(Date notice_reg_date) {
		this.notice_reg_date = notice_reg_date;
	}
	public int getNotice_delete() {
		return notice_delete;
	}
	public void setNotice_delete(int notice_delete) {
		this.notice_delete = notice_delete;
	}
	
}
