package com.sona.music.board.dto;

import java.sql.Date;

public class QnADTO {
	
<<<<<<< HEAD
	private int question_idx;
	private int class_idx;
	private String user_id;
	private String q_title;
	private String q_content;
	private boolean anonymous_status;
	private Date q_reg_date;
	private boolean q_delete;
	private int q_hit;
	private boolean reply_check;
	private String teacher_id;
	private int answer_idx;
	private String a_content;
	private Date a_reg_date;
	public int getQuestion_idx() {
		return question_idx;
	}
	public void setQuestion_idx(int question_idx) {
		this.question_idx = question_idx;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public boolean isAnonymous_status() {
		return anonymous_status;
	}
	public void setAnonymous_status(boolean anonymous_status) {
		this.anonymous_status = anonymous_status;
	}
	public Date getQ_reg_date() {
		return q_reg_date;
	}
	public void setQ_reg_date(Date q_reg_date) {
		this.q_reg_date = q_reg_date;
	}
	public boolean isQ_delete() {
		return q_delete;
	}
	public void setQ_delete(boolean q_delete) {
		this.q_delete = q_delete;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}
	public boolean isReply_check() {
		return reply_check;
	}
	public void setReply_check(boolean reply_check) {
		this.reply_check = reply_check;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public int getAnswer_idx() {
		return answer_idx;
	}
	public void setAnswer_idx(int answer_idx) {
		this.answer_idx = answer_idx;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public Date getA_reg_date() {
		return a_reg_date;
	}
	public void setA_reg_date(Date a_reg_date) {
		this.a_reg_date = a_reg_date;
	}
	

	

}
