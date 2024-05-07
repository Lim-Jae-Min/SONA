package com.sona.music.lesson.dao;

import java.util.List;
import java.util.Map;

import com.sona.music.lesson.dto.LogDTO;

public interface LogDAO {
	
	LogDTO lessonInfo(int apply_idx);

	List<LogDTO> logProfile(int apply_idx);

	List<LogDTO> lessonLogList(String apply_detail);

	int lessonLogWrite(LogDTO dto);

	int lessonAbsent(LogDTO dto);

	int lessonLogEdit(LogDTO dto);

	int lessonStop(LogDTO dto);

	String reviewCheck(String apply_detail);

	void studentPayback(LogDTO dto);

	void studentCalculate(LogDTO dto);

	void teacherPayment(LogDTO dto);

	void teacherCalculate(LogDTO dto);

	

	

}
