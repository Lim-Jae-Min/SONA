package com.sona.music.point.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.member.dto.MemberDTO;
import com.sona.music.point.dao.PointDAO;

@Service
public class PointService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointDAO pointDAO;

	public int getHavePoint(String chargePointLoginId) {
		int havePoint = pointDAO.getHavePoint(chargePointLoginId);
		logger.info(" 포인트 보유 : "+havePoint );
		return havePoint;
	}

	public void joinCreatePoint(String joinId) {
		pointDAO.joinCreatePoint(joinId);
		
	}

	public int chargePoint(String id, Integer amount,String pointType) {
		int row = pointDAO.pointChange(id,amount,pointType);
		
		return row;
	}

	public int withdrawPoint(String id, Integer amount , String pointType) {
		int row = pointDAO.pointChange(id,amount,pointType);
		return row;
	}

	public LessonDTO paymentGetLesson(Integer class_idx) {
		LessonDTO lessonInfo= pointDAO.paymentGetLesson(class_idx);
		String id = lessonInfo.getUser_id();
		int Class_price = lessonInfo.getClass_price();
		String User_name = lessonInfo.getUser_name();
		String Class_name = lessonInfo.getClass_name();
		int Class_times = lessonInfo.getClass_times();
		
		
		logger.info(id + "강의 결제에서 가져온 강의 아이디");
		logger.info(User_name + "강의 결제에서 가져온 강의 아이디");
		logger.info(Class_name + "강의 결제에서 가져온 강의 아이디");
		logger.info(Class_price + "강의 결제에서 가져온 강의 가격");
		logger.info(Class_times + "강의 결제에서 가져온 강의 횟수");
		
		return lessonInfo;
	}

	public int lessonPayment(String id, int amount, String pointType) {
		int row = pointDAO.pointChange(id,amount,pointType);
		
		return row;
	}

	public int lessonPayApyHistory(Integer classIdx, String id, String applyState) {
		int appResult= pointDAO.lessonPayApyHistory(classIdx,id,applyState);
		return appResult;
	}

	public MemberDTO getUserInfo(String chargePointLoginId) {
		
		return pointDAO.getUserInfo(chargePointLoginId);
	}

	public String pointGetPhotoName(String chargePointLoginId) {
		String photoCategory = "userInfo";
		String photoNewFileName = pointDAO.pointGetPhotoName(chargePointLoginId,photoCategory);
		logger.info(photoNewFileName);
		return photoNewFileName;
	}

//	public String getPhotoName(String user_id) {
//		// TODO Auto-generated method stub
//		return pointDAO.getPhotoName(user_id);
//	}
	
}
