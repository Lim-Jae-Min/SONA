package com.sona.music.point.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.point.dao.PointDAO;

@Service
public class PointService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointDAO pointDAO;

	public int getHavePoint(String chargePointLoginId) {
		int havePoint = pointDAO.getHavePoint(chargePointLoginId);
		logger.info("포인트 충전에서 가져온 포인트 보유 : "+havePoint );
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
		return 0;
	}

	public LessonDTO paymentGetLesson(Integer cLASS_IDX) {
		LessonDTO lessonInfo= pointDAO.paymentGetLesson(cLASS_IDX);
		String id = lessonInfo.getUser_id();
		int Class_price = lessonInfo.getClass_price();
		String User_name = lessonInfo.getUser_name();
		String Class_name = lessonInfo.getClass_name();
		
		
		logger.info(id + "강의 결제에서 가져온 강의 아이디");
		logger.info(User_name + "강의 결제에서 가져온 강의 아이디");
		logger.info(Class_name + "강의 결제에서 가져온 강의 아이디");
		logger.info(Class_price + "강의 결제에서 가져온 강의 가격");
		
		return lessonInfo;
	}
	
}
