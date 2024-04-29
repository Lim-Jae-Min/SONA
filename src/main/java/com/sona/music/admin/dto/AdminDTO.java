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
	
	// report DTO
	private int report_idx;
	private int board_idx;
	private String board_category;
	private String reporter_id;
	private String report_content;
	private Date report_date;
	private String report_state;
	private String review_title;
	private String class_name;
	
	
	// action DTO
	private int action_idx;
	private String action_content;
	private Date action_date;
	private String user_name;
	
	// Suspension DTO
	private int banned_idx;
	private String action_category;
	private Date start_date;
	private Date end_date;

	

	

	
	
	
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
	
	// Report 게터 섹터
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getReporter_id() {
		return reporter_id;
	}
	public void setReporter_id(String reporter_id) {
		this.reporter_id = reporter_id;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	public String getReport_state() {
		return report_state;
	}
	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}
	public int getAction_idx() {
		return action_idx;
	}
	public void setAction_idx(int action_idx) {
		this.action_idx = action_idx;
	}
	public String getAction_content() {
		return action_content;
	}
	public void setAction_content(String action_content) {
		this.action_content = action_content;
	}
	public Date getAction_date() {
		return action_date;
	}
	public void setAction_date(Date action_date) {
		this.action_date = action_date;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	// Suspesion Hisory 게터 섹터
	public int getBanned_idx() {
		return banned_idx;
	}
	public void setBanned_idx(int banned_idx) {
		this.banned_idx = banned_idx;
	}
	public String getAction_category() {
		return action_category;
	}
	public void setAction_category(String action_category) {
		this.action_category = action_category;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
}
