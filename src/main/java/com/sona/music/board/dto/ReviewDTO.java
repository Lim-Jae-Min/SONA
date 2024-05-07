package com.sona.music.board.dto;

import java.sql.Date;

public class ReviewDTO {
	
	private int review_idx;
	private int class_idx;
	private String rater_id;
	private String ratee_id;
	private double score;
	private String review_title;
	private String review_content;
	private Date review_reg_date;
	private boolean review_delete;
	private int img_cnt;
	private String study_date;

    private String index_order;

	private String rater_name;
	private String profile_photoname;
	
	private String user_id;
	private String manner_type;
	private double manner_variance;
	
	private String class_name;
	private String class_inst;
	private double class_score;
	private String user_name;
	private String class_location;
	private double manner;
	private String lessonLogo;
	private String apply_detail;
	
	
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
	public boolean isReview_delete() {
		return review_delete;
	}
	public void setReview_delete(boolean review_delete) {
		this.review_delete = review_delete;
	}
	public int getImg_cnt() {
		return img_cnt;
	}
	public void setImg_cnt(int img_cnt) {
		this.img_cnt = img_cnt;
	}
	public String getStudy_date() {
		return study_date;
	}
	public void setStudy_date(String study_date) {
		this.study_date = study_date;
	}
	public String getIndex_order() {
		return index_order;
	}
	public void setIndex_order(String index_order) {
		this.index_order = index_order;
	}
	public String getRater_name() {
		return rater_name;
	}
	public void setRater_name(String rater_name) {
		this.rater_name = rater_name;
	}
	public String getProfile_photoname() {
		return profile_photoname;
	}
	public void setProfile_photoname(String profile_photoname) {
		this.profile_photoname = profile_photoname;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getManner_type() {
		return manner_type;
	}
	public void setManner_type(String manner_type) {
		this.manner_type = manner_type;
	}
	public double getManner_variance() {
		return manner_variance;
	}
	public void setManner_variance(double manner_variance) {
		this.manner_variance = manner_variance;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_inst() {
		return class_inst;
	}
	public void setClass_inst(String class_inst) {
		this.class_inst = class_inst;
	}
	public double getClass_score() {
		return class_score;
	}
	public void setClass_score(double class_score) {
		this.class_score = class_score;
	}
	public String getClass_location() {
		return class_location;
	}
	public void setClass_location(String class_location) {
		this.class_location = class_location;
	}
	public double getManner() {
		return manner;
	}
	public void setManner(double manner) {
		this.manner = manner;
	}
	public String getLessonLogo() {
		return lessonLogo;
	}
	public void setLessonLogo(String lessonLogo) {
		this.lessonLogo = lessonLogo;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getApply_detail() {
		return apply_detail;
	}
	public void setApply_detail(String apply_detail) {
		this.apply_detail = apply_detail;
	}
	
	
	
	

}

