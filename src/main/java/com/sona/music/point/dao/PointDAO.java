package com.sona.music.point.dao;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.member.dto.MemberDTO;

public interface PointDAO {

	int getHavePoint(String chargePointLoginId);

	void joinCreatePoint(String joinId);

	int pointChange(String id, Integer amount, String pointType);


	LessonDTO paymentGetLesson(Integer class_idx);

	int lessonPayApyHistory(Integer classIdx, String id, String applyState);

	MemberDTO getUserInfo(String chargePointLoginId);

	String pointGetPhotoName(String chargePointLoginId, String photoCategory);

	int getApplyIdx(int classIdx, String chargePointLoginId);

//	String getPhotoName(String user_id);

}
