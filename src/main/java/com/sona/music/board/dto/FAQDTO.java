package com.sona.music.board.dto;

import java.sql.Date;

public class FAQDTO {
	
	private int faq_idx;
	private String admin_id;
	private String faq_title;
	private String faq_answer;
	private String faq_target;
	private Date faq_reg_date;
	private int faq_views;
	private int faq_delete;
	
	
	public int getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_answer() {
		return faq_answer;
	}
	public void setFaq_answer(String faq_answer) {
		this.faq_answer = faq_answer;
	}
	public String getFaq_target() {
		return faq_target;
	}
	public void setFaq_target(String faq_target) {
		this.faq_target = faq_target;
	}
	public Date getFaq_reg_date() {
		return faq_reg_date;
	}
	public void setFaq_reg_date(Date faq_reg_date) {
		this.faq_reg_date = faq_reg_date;
	}
	public int getFaq_views() {
		return faq_views;
	}
	public void setFaq_views(int faq_views) {
		this.faq_views = faq_views;
	}
	public int getFaq_delete() {
		return faq_delete;
	}
	public void setFaq_delete(int faq_delete) {
		this.faq_delete = faq_delete;
	}

}
