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
import com.sona.music.mypage.dto.PhotoDTO;

public interface MyPageDAO {



	MyPageDTO getUserInfo(String loginId);


	int updateUserInfo(Map<String, String> map);

	int getTotalQnaCount();


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


	List<MemberDTO> lessonlistall(String user_id, int cnt, int start);

	@Mapper
	Object lessonAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);
	
	int updateApplyForm(Map<String, String> map);


	int pointAllCount(int pagePerCnt);


	int receiveAllCount(int pagePerCnt);


	int sendAllCount(int pagePerCnt);


	int courseAllCount(int pagePerCnt, String loginId);


	List<MyPageDTO> qnaSelectedList(int pagePerCnt, int start, String loginId, String selectedClass);


	List<String> getClassNames2(String loginId);


	List<MyPageDTO> teacherStudentList(String user_id, int cnt, int start);


	List<MyPageDTO> teacherStudentListFilter(String user_id, int cnt, int start, String selectedClass);


	List<MyPageDTO> teacherQnaListFilter(String user_id, int cnt, int start, String selectedClass);


	List<MyPageDTO> teacherQnaList(String user_id, int cnt, int start);


	@Mapper
	Object teacherStudentAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);

	void fileWrite(String loginId, String fileName, String newFileName, String loginId2, String photoCategory);


	List<PhotoDTO> UserPhotosLoad(String loginId);

	@Mapper
	Object QnaAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);

	@Mapper
	Object QnaAllCountFilter(@Param("cnt") int cnt, @Param("user_id") String user_id, @Param("selectedClass") String selectedClass);

	@Mapper
	Object teacherPointAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);


	List<MyPageDTO> teacherPointList(int cnt, int start, String user_id);


	List<MyPageDTO> teacherReceiveList(String user_id, int cnt, int start);


	List<MyPageDTO> teacherReceiveListFilter(String user_id, int cnt, int start, String selectedClass);

	@Mapper
	Object teacherReceiveAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);

	@Mapper
	Object teacherReceiveAllCountFilter(@Param("cnt") int cnt, @Param("user_id") String user_id, @Param("selectedClass") String selectedClass);


	List<MyPageDTO> teacherWrittenList(String user_id, int cnt, int start);

	@Mapper
	Object teacherWrittenAllCount(@Param("cnt") int cnt, @Param("user_id") String user_id);

	@Mapper
	Object tLessonAllCountFilter(@Param("user_id") String user_id, @Param("state") int state);

	@Mapper
	Object tLessonAllCount(@Param("user_id") String user_id);



	List<MyPageDTO> qnaList(String loginId, int cnt, int start);


	List<MyPageDTO> qnaListFilter(String loginId, int cnt, int start, String selectedClass);


	Object qnaAllCount(int cnt, String loginId, String selectedClass);


	Object qnaNotAllCount(int cnt, String loginId);

	@Mapper
	Object tStudentAllCountFilter(@Param("cnt") int cnt, @Param("user_id") String user_id, @Param("selectedClass") String selectedClass);
	




}
