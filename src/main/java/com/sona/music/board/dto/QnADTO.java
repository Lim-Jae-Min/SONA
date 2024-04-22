package com.sona.music.board.dto;

import java.sql.Date;

public class QnADTO {
	
	private int QUESTION_IDX;
	private int CLASS_IDX;
	private String USER_ID;
	private String Q_TITLE;
	private String Q_CONTENT;
	private boolean ANONYMOUS_STATUS;
	private Date Q_REG_DATE;
	private boolean Q_DELETE;
	private int Q_HIT;
	private boolean REPLY_CHECK;
	private String TEACHER_ID;
	private int ANSWER_IDX;
	private String A_CONTENT;
	private Date A_REG_DATE;
	
	public int getQUESTION_IDX() {
		return QUESTION_IDX;
	}
	public void setQUESTION_IDX(int qUESTION_IDX) {
		QUESTION_IDX = qUESTION_IDX;
	}
	public int getCLASS_IDX() {
		return CLASS_IDX;
	}
	public void setCLASS_IDX(int cLASS_IDX) {
		CLASS_IDX = cLASS_IDX;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getQ_TITLE() {
		return Q_TITLE;
	}
	public void setQ_TITLE(String q_TITLE) {
		Q_TITLE = q_TITLE;
	}
	public String getQ_CONTENT() {
		return Q_CONTENT;
	}
	public void setQ_CONTENT(String q_CONTENT) {
		Q_CONTENT = q_CONTENT;
	}
	public boolean isANONYMOUS_STATUS() {
		return ANONYMOUS_STATUS;
	}
	public void setANONYMOUS_STATUS(boolean aNONYMOUS_STATUS) {
		ANONYMOUS_STATUS = aNONYMOUS_STATUS;
	}
	public Date getQ_REG_DATE() {
		return Q_REG_DATE;
	}
	public void setQ_REG_DATE(Date q_REG_DATE) {
		Q_REG_DATE = q_REG_DATE;
	}
	public boolean isQ_DELETE() {
		return Q_DELETE;
	}
	public void setQ_DELETE(boolean q_DELETE) {
		Q_DELETE = q_DELETE;
	}
	public int getQ_HIT() {
		return Q_HIT;
	}
	public void setQ_HIT(int q_HIT) {
		Q_HIT = q_HIT;
	}
	public boolean isREPLY_CHECK() {
		return REPLY_CHECK;
	}
	public void setREPLY_CHECK(boolean rEPLY_CHECK) {
		REPLY_CHECK = rEPLY_CHECK;
	}
	public String getTEACHER_ID() {
		return TEACHER_ID;
	}
	public void setTEACHER_ID(String tEACHER_ID) {
		TEACHER_ID = tEACHER_ID;
	}
	public int getANSWER_IDX() {
		return ANSWER_IDX;
	}
	public void setANSWER_IDX(int aNSWER_IDX) {
		ANSWER_IDX = aNSWER_IDX;
	}
	public String getA_CONTENT() {
		return A_CONTENT;
	}
	public void setA_CONTENT(String a_CONTENT) {
		A_CONTENT = a_CONTENT;
	}
	public Date getA_REG_DATE() {
		return A_REG_DATE;
	}
	public void setA_REG_DATE(Date a_REG_DATE) {
		A_REG_DATE = a_REG_DATE;
	}
	
	

}
