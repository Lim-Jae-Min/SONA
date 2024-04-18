package com.sona.music.member.dto;

import java.sql.Date;

public class MemberDTO {
	
	private String USER_ID;
	private String USER_PASS;
	private String USER_NAME;
	private String USER_EMAIL;
	private String USER_PHONE;
	private int USER_ACCOUNTNUMBER;
	private String USER_TYPE;
	private int USER_DELETE;
	private Date USER_REG_DATE;
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_PASS() {
		return USER_PASS;
	}
	public void setUSER_PASS(String uSER_PASS) {
		USER_PASS = uSER_PASS;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}
	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}
	public String getUSER_PHONE() {
		return USER_PHONE;
	}
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}
	public int getUSER_ACCOUNTNUMBER() {
		return USER_ACCOUNTNUMBER;
	}
	public void setUSER_ACCOUNTNUMBER(int uSER_ACCOUNTNUMBER) {
		USER_ACCOUNTNUMBER = uSER_ACCOUNTNUMBER;
	}
	public String getUSER_TYPE() {
		return USER_TYPE;
	}
	public void setUSER_TYPE(String uSER_TYPE) {
		USER_TYPE = uSER_TYPE;
	}
	public int getUSER_DELETE() {
		return USER_DELETE;
	}
	public void setUSER_DELETE(int uSER_DELETE) {
		USER_DELETE = uSER_DELETE;
	}
	public Date getUSER_REG_DATE() {
		return USER_REG_DATE;
	}
	public void setUSER_REG_DATE(Date uSER_REG_DATE) {
		USER_REG_DATE = uSER_REG_DATE;
	}

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private int user_phone;
	private int user_accountnumber;
	private String user_delete;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
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
	public int getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}
	public int getUser_accountnumber() {
		return user_accountnumber;
	}
	public void setUser_accountnumber(int user_accountnumber) {
		this.user_accountnumber = user_accountnumber;
	}
	public String getUser_delete() {
		return user_delete;
	}
	public void setUser_delete(String user_delete) {
		this.user_delete = user_delete;
	}
	
	

}
