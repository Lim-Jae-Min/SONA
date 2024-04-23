package com.sona.music.point.dao;

import com.sona.music.lesson.dto.LessonDTO;

public interface PointDAO {

	int getHavePoint(String chargePointLoginId);

	void joinCreatePoint(String joinId);

	int pointChange(String id, Integer amount, String pointType);


	LessonDTO paymentGetLesson(Integer cLASS_IDX);

	int lessonPayApyHistory(Integer classIdx, String id, String applyState);

//	String getPhotoName(String user_id);

}
