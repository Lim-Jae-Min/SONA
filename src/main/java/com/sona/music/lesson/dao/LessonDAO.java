package com.sona.music.lesson.dao;

import java.util.List;

import com.sona.music.lesson.dto.LessonDTO;

public interface LessonDAO {

	List<LessonDTO> recommendListCall(int pagePerCnt, int start);

}
