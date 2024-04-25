package com.sona.music.mypage.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.mypage.dto.MyPageDTO;

public interface MyPageDAO {



	MyPageDTO getUserInfo(String loginId);


	int updateUserInfo(Map<String, String> map);

	int getTotalQnaCount();


	List<MyPageDTO> qnaList(int pagePerCnt, int start, String loginId);


	int allCount(int pagePerCnt);

	List<String> getClassNames(String loginId);


	String getPointAmount(String loginId);


	List<MyPageDTO> pointList(int pagePerCnt, int start, String loginId);


	List<MyPageDTO> receiveList(int pagePerCnt, int start, String loginId);


	List<MyPageDTO> sendList(int pagePerCnt, int start, String loginId);


	List<MyPageDTO> courseList(int pagePerCnt, int start, String loginId);




}
