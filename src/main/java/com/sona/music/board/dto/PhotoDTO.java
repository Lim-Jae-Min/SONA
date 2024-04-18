package com.sona.music.board.dto;

public class PhotoDTO {
	
	private int PHOTO_IDX;
	private String USER_ID;
	private String ORI_FILENAME;
	private String NEW_FILENAME;
	private int POST_IDX;
	private String PHOTO_CATEGORY;
	
	public int getPHOTO_IDX() {
		return PHOTO_IDX;
	}
	public void setPHOTO_IDX(int pHOTO_IDX) {
		PHOTO_IDX = pHOTO_IDX;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getORI_FILENAME() {
		return ORI_FILENAME;
	}
	public void setORI_FILENAME(String oRI_FILENAME) {
		ORI_FILENAME = oRI_FILENAME;
	}
	public String getNEW_FILENAME() {
		return NEW_FILENAME;
	}
	public void setNEW_FILENAME(String nEW_FILENAME) {
		NEW_FILENAME = nEW_FILENAME;
	}
	public int getPOST_IDX() {
		return POST_IDX;
	}
	public void setPOST_IDX(int pOST_IDX) {
		POST_IDX = pOST_IDX;
	}
	public String getPHOTO_CATEGORY() {
		return PHOTO_CATEGORY;
	}
	public void setPHOTO_CATEGORY(String pHOTO_CATEGORY) {
		PHOTO_CATEGORY = pHOTO_CATEGORY;
	}
	
	

}