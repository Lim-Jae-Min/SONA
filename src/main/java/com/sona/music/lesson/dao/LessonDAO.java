package com.sona.music.lesson.dao;

import java.util.List;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.board.dto.ReviewDTO;
import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.lesson.dto.PhotoDTO;

public interface LessonDAO {

	List<LessonDTO> recommendListCall(int pagePerCnt, int start, String condition, String content, String inst);

	List<LessonDTO> allListCall(int pagePerCnt, int start, String condition, String content, String loca,
			String instCategory, String inst);

	Object recommendListCount(int pagePerCnt, String condition, String content, String inst);

	Object allListCount(int pagePerCnt, String condition, String content, String loca, String instCategory,
			String inst);

	int lessonWrite(LessonDTO dto);

	int videoWrite(int idx, String url);

	void photoWrite(String user_id, String fileName, String newFileName, int idx, String photo_category);

	LessonDTO lessonDetail(int idx);

	String lessonLogoLoad(int idx);

	List<PhotoDTO> lessonPhotosLoad(int idx);

	List<ReviewDTO> lessonReviewList(int idx);

	List<QnADTO> lessonQnAList(int idx);

	LessonDTO applyCheck(int idx, String loginId);

	void leesonApply(int class_idx, String loginId);

	void lessonBlind(int class_idx);

	void lessonUnBlind(int class_idx);

	void lessonDisable(int class_idx);

	void lessonUnDisable(int class_idx);

	int lessonUpdate(LessonDTO dto);

	void videoUpsert(int idx, String new_url);

	void lessonLogoDel(int idx);

	void lessonPhotosDel(int idx);


}
