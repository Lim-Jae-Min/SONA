package com.sona.music.mypage.dto;

import java.sql.Date;

public class MyPageDTO {
	private String USER_ID;
	private String USER_PASS;
	private String USER_NAME;
	private String USER_EMAIL;
	private String USER_PHONE;
	private String USER_ACCOUNTNUMBER;
	private String USER_TYPE;
	private boolean USER_DELETE;
	private Date USER_REG_DATE;
	private String APPLYFORM_INST;
	private String APPLYFORM_LOCATION;
	private String APPLYFORM_DAYS;
	private String APPLYFORM_STYLE;
	private boolean HAVE_INST;


	
	/*
    ㆍ희망악기 피아노 반주

    ㆍ희망지역 서울특별시 금천구

    ㆍ희망요일

     월요일 화요일

    ㆍ희망 강의스타일

     체계적인 글로벌한

    ㆍ개인악기 유무 무
	*/
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
	public String getUSER_ACCOUNTNUMBER() {
		return USER_ACCOUNTNUMBER;
	}
	public void setUSER_ACCOUNTNUMBER(String uSER_ACCOUNTNUMBER) {
		USER_ACCOUNTNUMBER = uSER_ACCOUNTNUMBER;
	}
	public String getUSER_TYPE() {
		return USER_TYPE;
	}
	public void setUSER_TYPE(String uSER_TYPE) {
		USER_TYPE = uSER_TYPE;
	}
	public boolean isUSER_DELETE() {
		return USER_DELETE;
	}
	public void setUSER_DELETE(boolean uSER_DELETE) {
		USER_DELETE = uSER_DELETE;
	}
	public Date getUSER_REG_DATE() {
		return USER_REG_DATE;
	}
	public void setUSER_REG_DATE(Date uSER_REG_DATE) {
		USER_REG_DATE = uSER_REG_DATE;
	}
	public String getAPPLYFORM_INST() {
		return APPLYFORM_INST;
	}
	public void setAPPLYFORM_INST(String aPPLYFORM_INST) {
		APPLYFORM_INST = aPPLYFORM_INST;
	}
	public String getAPPLYFORM_LOCATION() {
		return APPLYFORM_LOCATION;
	}
	public void setAPPLYFORM_LOCATION(String aPPLYFORM_LOCATION) {
		APPLYFORM_LOCATION = aPPLYFORM_LOCATION;
	}
	public String getAPPLYFORM_DAYS() {
		return APPLYFORM_DAYS;
	}
	public void setAPPLYFORM_DAYS(String aPPLYFORM_DAYS) {
		APPLYFORM_DAYS = aPPLYFORM_DAYS;
	}
	public String getAPPLYFORM_STYLE() {
		return APPLYFORM_STYLE;
	}
	public void setAPPLYFORM_STYLE(String aPPLYFORM_STYLE) {
		APPLYFORM_STYLE = aPPLYFORM_STYLE;
	}
	public boolean isHAVE_INST() {
		return HAVE_INST;
	}
	public void setHAVE_INST(boolean hAVE_INST) {
		HAVE_INST = hAVE_INST;
	}

}
