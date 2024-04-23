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
	private String MANNER;
    private int POINT;
    private int alarm_count;
    private String REVIEW_TITLE;
    private Date CLASS_REG_DATE;
    private String SCORE;
    private String COUNT;
    private String CLASS_NAME;
    private String APPLY_IDX;
    private String TPHOTO;
	
	
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
	public String getMANNER() {
		return MANNER;
	}
	public void setMANNER(String mANNER) {
		MANNER = mANNER;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String rEVIEW_TITLE) {
		REVIEW_TITLE = rEVIEW_TITLE;
	}
	public Date getCLASS_REG_DATE() {
		return CLASS_REG_DATE;
	}
	public void setCLASS_REG_DATE(Date cLASS_REG_DATE) {
		CLASS_REG_DATE = cLASS_REG_DATE;
	}
	public String getSCORE() {
		return SCORE;
	}
	public void setSCORE(String sCORE) {
		SCORE = sCORE;
	}
	public String getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(String cOUNT) {
		COUNT = cOUNT;
	}
	public String getCLASS_NAME() {
		return CLASS_NAME;
	}
	public void setCLASS_NAME(String cLASS_NAME) {
		CLASS_NAME = cLASS_NAME;
	}
	public String getAPPLY_IDX() {
		return APPLY_IDX;
	}
	public void setAPPLY_IDX(String aPPLY_IDX) {
		APPLY_IDX = aPPLY_IDX;
	}
	public String getTPHOTO() {
		return TPHOTO;
	}
	public void setTPHOTO(String tPHOTO) {
		TPHOTO = tPHOTO;
	}
	public int getAlarm_count() {
		return alarm_count;
	}
	public void setAlarm_count(int alarm_count) {
		this.alarm_count = alarm_count;
	}

	
	

}
