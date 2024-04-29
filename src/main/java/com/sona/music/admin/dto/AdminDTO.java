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
	
	// faq DTO
	private int faq_idx;
	private String faq_title;
	private String faq_answer;
	private String faq_target;
	private Date faq_reg_date;
	private int faq_views;
	private int faq_delete;
	
	// review DTO
	private int review_idx;
	private int class_idx;
	private String rater_id;
	private String ratee_id;
	private double score;
	private String review_title;
	private String review_content;
	private Date review_reg_date;
	private int review_delete;
	private String user_type;
	
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
	
	// faq 게터 세터
	public int getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
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
	
	
	
	// 리뷰 게터 세터
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getRater_id() {
		return rater_id;
	}
	public void setRater_id(String rater_id) {
		this.rater_id = rater_id;
	}
	public String getRatee_id() {
		return ratee_id;
	}
	public void setRatee_id(String ratee_id) {
		this.ratee_id = ratee_id;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(Date review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	public int getReview_delete() {
		return review_delete;
	}
	public void setReview_delete(int review_delete) {
		this.review_delete = review_delete;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
	
	
	// 리뷰 게터 세터
	
}
