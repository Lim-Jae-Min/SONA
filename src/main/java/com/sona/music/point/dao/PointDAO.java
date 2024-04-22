package com.sona.music.point.dao;

public interface PointDAO {

	int getHavePoint(String chargePointLoginId);

	void joinCreatePoint(String joinId);

	int pointChange(String id, Integer amount, String pointType);

}
