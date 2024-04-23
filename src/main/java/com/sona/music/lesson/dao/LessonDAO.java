package com.sona.music.lesson.dao;

import java.util.List;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.board.dto.ReviewDTO;
import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.lesson.dto.PhotoDTO;

public interface LessonDAO {

	List<LessonDTO> recommendListCall(int pagePerCnt, int start, String condition, String content);

	List<LessonDTO> allListCall(int pagePerCnt, int start, String condition, String content, String loca,
			String instCategory, String inst);

	Object recommendListCount(int pagePerCnt, String condition, String content);

	Object allListCount(int pagePerCnt, String condition, String content, String loca, String instCategory,
			String inst);

	int lessonWrite(LessonDTO dto);

	int videoWrite(int idx, String url);

	void photoWrite(String user_id, String fileName, String newFileName, int idx, String photo_category);

	LessonDTO lessonDetail(String class_idx);

	String lessonLogoLoad(String class_idx);

	List<PhotoDTO> lessonPhotosLoad(String class_idx);

	List<ReviewDTO> lessonReviewList(String class_idx);

	List<QnADTO> lessonQnAList(String class_idx);

	LessonDTO applyCheck(String class_idx, String loginId);


}
