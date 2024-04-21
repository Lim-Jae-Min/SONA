package com.sona.music.mypage.dao;


import java.util.Map;

import com.sona.music.mypage.dto.MyPageDTO;

public interface MyPageDAO {


	MyPageDTO getUserInfo(String loginId);

	void updateUserInfo(Map<String, Object> map);

	String editUserInfo(MyPageDTO requestData);

}
