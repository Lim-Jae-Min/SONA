package com.sona.music.board.dto;

import java.sql.Date;

public class ReviewDTO {
	
	private int REVIEW_IDX;
	private int CLASS_IDX;
	private String RATER_ID;
	private String RATEE_ID;
	private double SCORE;
	private String REVIEW_TITLE;
	private String REVIEW_CONTENT;
	private Date REVIEW_REG_DATE;
	private boolean REVIEW_DELETE;
	private int img_cnt;
	private String STUDY_DATE;
	
	private String rater_name;
	private String profile_photoname;
	
	public int getREVIEW_IDX() {
		return REVIEW_IDX;
	}
	public void setREVIEW_IDX(int rEVIEW_IDX) {
		REVIEW_IDX = rEVIEW_IDX;
	}
	public int getCLASS_IDX() {
		return CLASS_IDX;
	}
	public void setCLASS_IDX(int cLASS_IDX) {
		CLASS_IDX = cLASS_IDX;
	}
	public String getRATER_ID() {
		return RATER_ID;
	}
	public void setRATER_ID(String rATER_ID) {
		RATER_ID = rATER_ID;
	}
	public String getRATEE_ID() {
		return RATEE_ID;
	}
	public void setRATEE_ID(String rATEE_ID) {
		RATEE_ID = rATEE_ID;
	}
	public double getSCORE() {
		return SCORE;
	}
	public void setSCORE(double sCORE) {
		SCORE = sCORE;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String rEVIEW_TITLE) {
		REVIEW_TITLE = rEVIEW_TITLE;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public Date getREVIEW_REG_DATE() {
		return REVIEW_REG_DATE;
	}
	public void setREVIEW_REG_DATE(Date rEVIEW_REG_DATE) {
		REVIEW_REG_DATE = rEVIEW_REG_DATE;
	}
	public boolean isREVIEW_DELETE() {
		return REVIEW_DELETE;
	}
	public void setREVIEW_DELETE(boolean rEVIEW_DELETE) {
		REVIEW_DELETE = rEVIEW_DELETE;
	}
	public int getImg_cnt() {
		return img_cnt;
	}
	public void setImg_cnt(int img_cnt) {
		this.img_cnt = img_cnt;
	}
	public String getSTUDY_DATE() {
		return STUDY_DATE;
	}
	public void setSTUDY_DATE(String sTUDY_DATE) {
		STUDY_DATE = sTUDY_DATE;
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
	
	
	

}

