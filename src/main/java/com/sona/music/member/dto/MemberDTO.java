package com.sona.music.member.dto;

import java.sql.Date;

public class MemberDTO {
	
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_email;
	private String user_phone;

	private String user_accountnumber;
	private String user_type;
	private int user_delete;
	private Date user_reg_date;

	private String user_bank;
	private String manner;
    private int point;
    private int alarm_count;
    private String review_title;
    private Date class_reg_date;
    private String score;
    private String count;
    private String class_name;
    private String apply_idx;
    private String profile;
    private String index_order;
    private String class_disable;
    private int class_idx;
    
    private String favorite;
    private String block;
    private int allCount;
    
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
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
	public String getUser_accountnumber() {
		return user_accountnumber;
	}
	public void setUser_accountnumber(String user_accountnumber) {
		this.user_accountnumber = user_accountnumber;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public int getUser_delete() {
		return user_delete;
	}
	public void setUser_delete(int user_delete) {
		this.user_delete = user_delete;
	}
	public Date getUser_reg_date() {
		return user_reg_date;
	}
	public void setUser_reg_date(Date user_reg_date) {
		this.user_reg_date = user_reg_date;
	}
	public String getUser_bank() {
		return user_bank;
	}
	public void setUser_bank(String user_bank) {
		this.user_bank = user_bank;
	}
	public String getManner() {
		return manner;
	}
	public void setManner(String manner) {
		this.manner = manner;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getAlarm_count() {
		return alarm_count;
	}
	public void setAlarm_count(int alarm_count) {
		this.alarm_count = alarm_count;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public Date getClass_reg_date() {
		return class_reg_date;
	}
	public void setClass_reg_date(Date class_reg_date) {
		this.class_reg_date = class_reg_date;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getApply_idx() {
		return apply_idx;
	}
	public void setApply_idx(String apply_idx) {
		this.apply_idx = apply_idx;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getIndex_order() {
		return index_order;
	}
	public void setIndex_order(String index_order) {
		this.index_order = index_order;
	}
	public String getClass_disable() {
		return class_disable;
	}
	public void setClass_disable(String class_disable) {
		this.class_disable = class_disable;
	}
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}

	
}
