package com.sona.music.lesson.dao;

import java.util.List;

import com.sona.music.lesson.dto.LessonDTO;

public interface LessonDAO {

	List<LessonDTO> recommendListCall(int pagePerCnt, int start, String condition, String content);

	List<LessonDTO> allListCall(int pagePerCnt, int start, String condition, String content, String loca,
			String instCategory, String inst);

	Object recommendListCount(int pagePerCnt, String condition, String content);

	Object allListCount(int pagePerCnt, String condition, String content, String loca, String instCategory,
			String inst);

	int lessonWrite(LessonDTO dto);

	int videoWrite(int idx, String url);

}
