package com.sona.music.point.dao;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.member.dto.MemberDTO;

public interface PointDAO {

	int getHavePoint(String chargePointLoginId);

	void joinCreatePoint(String joinId);

	int pointChange(String id, Integer amount, String pointType);


	LessonDTO paymentGetLesson(Integer cLASS_IDX);

	int lessonPayApyHistory(Integer classIdx, String id, String applyState);

	MemberDTO getUserInfo(String chargePointLoginId);

//	String getPhotoName(String user_id);

}
