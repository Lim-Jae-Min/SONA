package com.sona.music.admin.dto;

import java.sql.Date;

public class AdminDTO {

	// 어드민 아이디
	private String admin_id;
	private String admin_pass;
	
	// adminMain dto
	private int waiting_suggestions;
	private int waiting_report;
	private int user_count;
	private int profit;
	private int amount_student;
	private int amount_teacher;
	private int amount_lesson;
	
	// 회원관리 dto
	private String user_id;
	private String user_name;
	private String user_type;
	private Date user_reg_date;
	private String user_pass;
	private String user_email;
	private String user_phone;
	private int user_accountnumber;
	private String user_bank;
	private int point;
	private String manner;
	private Date banned_start_date;
	private Date banned_end_date;
	private String new_filename;
	
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

	// report DTO
	private int report_idx;
	private int board_idx;
	private String board_category;
	private String reporter_id;
	private String report_content;
	private Date report_date;
	private String report_state;
	private String class_name;
	
	
	// action DTO
	private int action_idx;
	private String action_content;
	private Date action_date;
	
	// Suspension DTO
	private int banned_idx;
	private String action_category;
	private Date start_date;
	private Date end_date;

	// 건의사항 
	private int sug_idx;
	private String sug_title;
	private int sug_views;
	private String sug_content;
	private int sug_secret;
	private Date sug_reg_date;
	private int sug_delete;
	
	private int sug_answer_idx;
	private String sug_answer;
	private Date sug_answer_reg_date;
	private int sug_answerCount;

	

	
	

	
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
	public int getWaiting_suggestions() {
		return waiting_suggestions;
	}
	public int getWaiting_report() {
		return waiting_report;
	}
	public int getUser_count() {
		return user_count;
	}
	public int getProfit() {
		return profit;
	}
	public int getAmount_student() {
		return amount_student;
	}
	public int getAmount_teacher() {
		return amount_teacher;
	}
	public int getAmount_lesson() {
		return amount_lesson;
	}
	public void setWaiting_suggestions(int waiting_suggestions) {
		this.waiting_suggestions = waiting_suggestions;
	}
	public void setWaiting_report(int waiting_report) {
		this.waiting_report = waiting_report;
	}
	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public void setAmount_student(int amount_student) {
		this.amount_student = amount_student;
	}
	public void setAmount_teacher(int amount_teacher) {
		this.amount_teacher = amount_teacher;
	}
	public void setAmount_lesson(int amount_lesson) {
		this.amount_lesson = amount_lesson;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_type() {
		return user_type;
	}
	public Date getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public String getUser_email() {
		return user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public int getUser_accountnumber() {
		return user_accountnumber;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public int getPoint() {
		return point;
	}
	public String getManner() {
		return manner;
	}
	public Date getBanned_start_date() {
		return banned_start_date;
	}
	public Date getBanned_end_date() {
		return banned_end_date;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public void setUser_accountnumber(int user_accountnumber) {
		this.user_accountnumber = user_accountnumber;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public void setManner(String manner) {
		this.manner = manner;
	}
	public void setBanned_start_date(Date banned_start_date) {
		this.banned_start_date = banned_start_date;
	}
	public void setBanned_end_date(Date banned_end_date) {
		this.banned_end_date = banned_end_date;
	}
	public String getNew_filename() {
		return new_filename;
	}
	public void setNew_filename(String new_filename) {
		this.new_filename = new_filename;
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

	
	
	
	
	// 리뷰 게터 세터

	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
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
	
	//건의사항 게터 세터
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
	public int getSug_secret() {
		return sug_secret;
	}
	public void setSug_secret(int sug_secret) {
		this.sug_secret = sug_secret;
	}
	public Date getSug_reg_date() {
		return sug_reg_date;
	}
	public void setSug_reg_date(Date sug_reg_date) {
		this.sug_reg_date = sug_reg_date;
	}
	public int getSug_delete() {
		return sug_delete;
	}
	public void setSug_delete(int sug_delete) {
		this.sug_delete = sug_delete;
	}
	public int getSug_answer_idx() {
		return sug_answer_idx;
	}
	public void setSug_answer_idx(int sug_answer_idx) {
		this.sug_answer_idx = sug_answer_idx;
	}
	public String getSug_answer() {
		return sug_answer;
	}
	public void setSug_answer(String sug_answer) {
		this.sug_answer = sug_answer;
	}
	public Date getSug_answer_reg_date() {
		return sug_answer_reg_date;
	}
	public void setSug_answer_reg_date(Date sug_answer_reg_date) {
		this.sug_answer_reg_date = sug_answer_reg_date;
	}
	public int getSug_answerCount() {
		return sug_answerCount;
	}
	public void setSug_answerCount(int sug_answerCount) {
		this.sug_answerCount = sug_answerCount;
	}
	
}
