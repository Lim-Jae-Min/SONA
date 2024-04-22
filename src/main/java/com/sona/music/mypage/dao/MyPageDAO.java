package com.sona.music.mypage.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.mypage.dto.MyPageDTO;

public interface MyPageDAO {


	MyPageDTO getUserInfo(String loginId);


	String editUserInfo(MyPageDTO requestData);

	int updateUserInfo(Map<String, Object> map, String loginId);



}
