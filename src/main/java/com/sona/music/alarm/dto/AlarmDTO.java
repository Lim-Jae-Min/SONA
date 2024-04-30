package com.sona.music.alarm.dto;

import java.sql.Date;

public class AlarmDTO {
private int alarm_idx;
private String user_id;
private String alarm_title;
private String alarm_content;
private Date alarm_date;
private int alarm_views;
private boolean alarm_delete;

public int getAlarm_idx() {
	return alarm_idx;
}
public void setAlarm_idx(int alarm_idx) {
	this.alarm_idx = alarm_idx;
}
public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
public String getAlarm_title() {
	return alarm_title;
}
public void setAlarm_title(String alarm_title) {
	this.alarm_title = alarm_title;
}
public String getAlarm_content() {
	return alarm_content;
}
public void setAlarm_content(String alarm_content) {
	this.alarm_content = alarm_content;
}
public Date getAlarm_date() {
	return alarm_date;
}
public void setAlarm_date(Date alarm_date) {
	this.alarm_date = alarm_date;
}
public int getAlarm_views() {
	return alarm_views;
}
public void setAlarm_views(int alarm_views) {
	this.alarm_views = alarm_views;
}
public boolean isAlarm_delete() {
	return alarm_delete;
}
public void setAlarm_delete(boolean alarm_delete) {
	this.alarm_delete = alarm_delete;
}

}
