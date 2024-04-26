package com.sona.music.mypage.dao;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.member.dto.MemberDTO;
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

	List<MemberDTO> lessonlist(String user_id, int pagePerCnt, int start, int state);

	List<MyPageDTO> receiveList(int pagePerCnt, int start, String loginId);


	List<MyPageDTO> sendList(int pagePerCnt, int start, String loginId);


	List<MyPageDTO> courseList(int pagePerCnt, int start, String loginId);

	List<LessonDTO> favoriteListCall(int pagePerCnt, int start, String loginId);

	int favoriteListCount(int pagePerCnt, String loginId);

	int teacherListDel(String teacher_id, String loginId);

	List<LessonDTO> blockListCall(int pagePerCnt, int start, String loginId);

	int blockListCount(int pagePerCnt, String loginId);


	List<MemberDTO> lessonlistall(String user_id, int pagePerCnt, int start);

	@Mapper
	Object lessonAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);




}
