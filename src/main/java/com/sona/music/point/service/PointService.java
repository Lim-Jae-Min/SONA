package com.sona.music.point.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
