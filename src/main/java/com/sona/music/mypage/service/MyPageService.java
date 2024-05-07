package com.sona.music.mypage.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.board.dto.QnADTO;
import com.sona.music.member.dto.MemberDTO;
import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.mypage.dao.MyPageDAO;
import com.sona.music.mypage.dto.MyPageDTO;
import com.sona.music.mypage.dto.PhotoDTO;

@Service
public class MyPageService {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageDAO myPageDAO;
	
	public String file_root = "C:/upload/";

	public MyPageDTO getUserInfo(String loginId, Model model) {
		MyPageDTO list = myPageDAO.getUserInfo(loginId);
		logger.info("userInfo list: {} ", list);
		List<PhotoDTO> photos = myPageDAO.UserPhotosLoad(loginId);
		model.addAttribute("photos", photos);
		return myPageDAO.getUserInfo(loginId);
	}

	public boolean confirmPw(String newPassword, String confirmPassword) {
		return newPassword.equals(confirmPassword);	
		
	}
	
	public int updateUserInfo(MultipartFile[] photos, Map<String, String> map, HttpSession session) {
	    // 전달된 데이터를 맵에 추가합니다.
	    logger.info("회원 수정하기~ ", map);
	    logger.info("전달된 데이터: {}", map);
	    MyPageDTO dto = new MyPageDTO();
	    dto.setUser_name(map.get("user_name"));
	    dto.setUser_pass(map.get("user_pass"));
	    dto.setUser_email(map.get("user_email"));
	    dto.setUser_phone(map.get("user_phone"));
	    dto.setUser_accountnumber(map.get("user_accountnumber"));
	    dto.setUser_bank(map.get("user_bank"));

	    PhotoDTO pdto = new PhotoDTO();
	    pdto.setPhoto_category(map.get("photo_category"));

	    // DAO를 통해 업데이트 수행
	    int row = myPageDAO.updateUserInfo(map);
	    logger.info("row 값: "+ row);
	    // 업데이트된 행 수 반환
	    //조건3. 이후 dto에서 저장된 키 값을 받아온다.
	    String loginId = (String) session.getAttribute("loginId");
	    String username = dto.getUser_name();
	    String photoCategory = pdto.getPhoto_category();
	    logger.info("loginId=" + loginId);
	    logger.info("photoCategory=" + photoCategory);
	    logger.info("username=" + username);
	    logger.info("photos=" + photos);


	    if (row > 0 && photos != null) {
	    	logger.info("filesave");
	        fileSave(loginId, photoCategory, username, photos); // 파일 저장
	    }

	    return row;
	}
	
	private void fileSave(String loginId, String photoCategory, String username, MultipartFile[] photos) {
	    for (MultipartFile photo : photos) {
	        // 1. 업로드할 파일명이 있는가?
	    	logger.info("loginId = " + loginId + "photoCategory = " + photoCategory + "username = " + username);
	        String fileName = photo.getOriginalFilename();
	        logger.info("upload file name : " + fileName);
	        if (!fileName.equals("")) {//파일명이 있다면 == 업로드 파일이 있다면
	            // 1. 기존 파일명에서 확장자 추출(high.gif)
	            /* 1-1. split 활용 방법
	            String arr[] = fileName.split("\\.");            
	            String ext = "." + arr[arr.length-1];
	            */
	            //1-2. subString 활용 방법
	            String ext = fileName.substring(fileName.lastIndexOf("."));
	            // 2. 새파일명 생성
	            String newFileName = System.currentTimeMillis() + ext;
	            logger.info(fileName + " -> " + newFileName);
	            //3. 파일 저장
	            try {
	                byte[] bytes = photo.getBytes(); // MultipartFile 로 부터 바이너리 추출
	                Path path = Paths.get(file_root + newFileName);//저장경로지정
	                Files.write(path, bytes);//저장
	                myPageDAO.fileWrite(loginId, fileName, newFileName, username, photoCategory);
	                Thread.sleep(1);//파일명을 위해 강제 휴식 부여
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}

	public int updateApplyForm(Map<String, String> map) {
	    // 전달된 데이터를 맵에 추가합니다.
    	logger.info("회원 수정하기~ ", map);
	    logger.info("전달된 데이터: {}", map);

	    // DAO를 통해 업데이트 수행
	    int row = myPageDAO.updateApplyForm(map);
	    
	    // 업데이트된 행 수 반환
	    return row;
	}




	public Map<String, Object> qnaList(int currPage, int cnt, String loginId, String selectedClass) {
		
		int start = (currPage - 1) * cnt;
		logger.info("start페이지:" + start);
		logger.info("받아온 cnt의 값: " +cnt);
		logger.info(loginId);
		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("list 갯수 : " + loginId + "currPage 갯수 : " + currPage + "totalPages 갯수 : " + cnt);
		List<MyPageDTO> list = null;
		if (selectedClass.equals("전체") && selectedClass != null) {
	        list = myPageDAO.qnaList(loginId, cnt, start);
	        // 전체를 선택했을 때는 전체 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.qnaNotAllCount(cnt, loginId));
	    } else {
	        list = myPageDAO.qnaListFilter(loginId, cnt, start, selectedClass);
	        // 전체가 아닌 특정 강의를 선택했을 때는 해당 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.qnaAllCount(cnt, loginId, selectedClass));
	    }
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		
		return result;
	}



	public List<String> getClassNames(String loginId) {
	        return myPageDAO.getClassNames(loginId);
	}

	public String getPointAmount(String loginId) {
		return myPageDAO.getPointAmount(loginId);
	}

	public Map<String, Object> pointList(int currPage, int pagePerCnt, String loginId) {
		int start = (currPage-1)*pagePerCnt;
		logger.info(loginId);
		Map<String, Object> result = new HashMap<String, Object>();
		
		logger.info("list 갯수 : " + loginId + "currPage 갯수 : " + currPage + "totalPages 갯수 : " + pagePerCnt);
		List<MyPageDTO> list = myPageDAO.pointList(pagePerCnt,start,loginId);
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.pointAllCount(pagePerCnt));				
		
		return result;
	}

	public Map<String, Object> receiveList(int currPage, int pagePerCnt, String loginId) {
		
		int start = (currPage-1)*pagePerCnt;
		logger.info(loginId);
		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("list 갯수 : " + loginId + "currPage 갯수 : " + currPage + "totalPages 갯수 : " + pagePerCnt);
		List<MyPageDTO> list = myPageDAO.receiveList(pagePerCnt,start,loginId);
		
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.receiveAllCount(pagePerCnt));				
		
		return result;
	}

	public Map<String, Object> sendList(int currPage, int pagePerCnt, String loginId) {
		
		int start = (currPage-1)*pagePerCnt;
		logger.info(loginId);
		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("list 갯수 : " + loginId + "currPage 갯수 : " + currPage + "totalPages 갯수 : " + pagePerCnt);
		List<MyPageDTO> list = myPageDAO.sendList(pagePerCnt,start,loginId);
		
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.sendAllCount(pagePerCnt));				
		
		return result;
	}

	public Map<String, Object> courseList(int currPage, int pagePerCnt, String loginId) {
		
		int start = (currPage-1)*pagePerCnt;
		logger.info(loginId);
		Map<String, Object> result = new HashMap<String, Object>();
		logger.info("list 갯수 : " + loginId + "currPage 갯수 : " + currPage + "totalPages 갯수 : " + pagePerCnt);
		List<MyPageDTO> list = myPageDAO.courseList(pagePerCnt,start,loginId);
		
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.courseAllCount(pagePerCnt));				
		
		return result;
	}
	

	public Map<String, Object> lessonlist(String user_id, int cnt, int currPage, int state) {
		logger.info("받아온 state 값 : " + state);
		logger.info("받아온 cnt의 값: " +cnt);
		logger.info("받아온 user_id의 값 : " + user_id);
		int start = (currPage-1)*cnt;
		logger.info("start페이지:" + start);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MemberDTO> list;
	    if (state == 0 || state == 1) {
	        // state가 0 또는 1이면 myPageDAO.lessonlist() 호출
	        list = myPageDAO.lessonlist(user_id, cnt, start, state);
	        result.put("allCount", myPageDAO.tLessonAllCountFilter(user_id, state));
	    } else {
	        // 그 외의 경우에는 myPageDAO.lessonlistall() 호출
	        list = myPageDAO.lessonlistall(user_id, cnt, start);
	        result.put("allCount", myPageDAO.tLessonAllCount(user_id));
	    }
		
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.lessonAllCount(cnt, user_id));

		for (MemberDTO r : list) {
			logger.info(r.getClass_idx()+"");
			logger.info(r.getClass_name()+"");
			logger.info(r.getClass_reg_date() + "");
			logger.info(r.getCount()+"");
			logger.info(r.getScore()+"");
			logger.info(r.getIndex_order()+"");
			logger.info(r.getClass_disable()+"");
		}
		
	 return result;
	}

	
	
	public Map<String, Object> favoriteListCall(int currPage, int pagePerCnt, String loginId) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = myPageDAO.favoriteListCall(pagePerCnt, start, loginId);
		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		result.put("list", list);		
		result.put("currPage", currPage);
		result.put("totalPages", myPageDAO.favoriteListCount(pagePerCnt, loginId));
		
		return result;
	}

	public int teacherListDel(List<String> delList, String loginId) {
		int cnt = 0;		
		for (String teacher_id : delList) {
			cnt += myPageDAO.teacherListDel(teacher_id, loginId);
		}				
		return cnt;
	}

	public Map<String, Object> blockListCall(int currPage, int pagePerCnt, String loginId) {
		int start = (currPage-1) * pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<LessonDTO> list = myPageDAO.blockListCall(pagePerCnt, start, loginId);

		logger.info("list : {}", list);
		logger.info("list size : "+list.size());
		result.put("list", list);		
		result.put("currPage", currPage);

		result.put("totalPages", myPageDAO.blockListCount(pagePerCnt, loginId));
		
		return result;
	}
	
	

	public List<String> getClassNames2(String loginId) {
		return  myPageDAO.getClassNames2(loginId);
	}

	
	
	
	public Map<String, Object> studentLessonList(String user_id, int cnt, String selectedClass, int currPage) {
		logger.info("받아온 현재 페이지 값 : " + currPage);
		int start = (currPage-1) * cnt;
		logger.info("start페이지:" + start);
		logger.info("받아온 cnt의 값: " +cnt);
		logger.info("선택한 강의 제목: "+ selectedClass);
		logger.info("받아온 user_id의 값 : " + user_id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MyPageDTO> list;
		 if (selectedClass.equals("전체") && selectedClass != null) {
		        // 선택된 강의 제목이 '전체'인 경우, 필터를 제거한 전체 리스트를 가져옴
		        list = myPageDAO.teacherStudentList(user_id, cnt, start);
		 } else {
		        // 그 외의 경우, 선택된 강의 제목을 기반으로 필터링하여 리스트를 가져옴
		        list = myPageDAO.teacherStudentListFilter(user_id, cnt, start, selectedClass);
		 }
		
		
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.teacherStudentAllCount(cnt, user_id));
		
		for (MyPageDTO r : list) {
			logger.info(r.getClass_name()+"");
			logger.info(r.getStudent_name() + "");
			logger.info(r.getLesson_progress()+"");
			logger.info(r.getEnd_check()+"");
			logger.info(r.getStart_date()+"");
			logger.info(r.getEnd_date()+"");
		}
		
		return result;
	}

	
	
	public Map<String, Object> teacherQnaList(String user_id, int cnt, String selectedClass, int currPage) {
		logger.info("받아온 현재 페이지 값 : " + currPage);
		int start = (currPage-1) * cnt;
		logger.info("start페이지:" + start);
		logger.info("받아온 cnt의 값: " +cnt);
		logger.info("받아온 user_id의 값 : " + user_id);
		logger.info("선택한 강의 제목: "+ selectedClass);
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<MyPageDTO> list;
	    if (selectedClass.equals("전체") && selectedClass != null) {
	        list = myPageDAO.teacherQnaList(user_id, cnt, start);
	        // 전체를 선택했을 때는 전체 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.QnaAllCount(cnt, user_id));
	    } else {
	        list = myPageDAO.teacherQnaListFilter(user_id, cnt, start, selectedClass);
	        // 전체가 아닌 특정 강의를 선택했을 때는 해당 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.QnaAllCountFilter(cnt, user_id, selectedClass));
	    }
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		
		return result;
	}

	public Map<String, Object> teacherPointList(int currPage, int cnt, String user_id) {
		int start = (currPage-1)*cnt;
		logger.info(user_id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MyPageDTO> list = myPageDAO.teacherPointList(cnt,start,user_id);
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.teacherPointAllCount(cnt, user_id));	
		
		for (MyPageDTO r : list) {
			logger.info(r.getPoint_date()+"");
			logger.info(r.getPoint_type() + "");
			logger.info(r.getPoint()+"");
			logger.info(r.getBalance()+"");
		}
		
		
		return result;
	}


	public Map<String, Object> teacherReceiveList(int currPage, int cnt, String user_id, String selectedClass) {
		int start = (currPage-1)*cnt;
		logger.info("(서비스)받아온 user_id: " + user_id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MyPageDTO> list;
		if (selectedClass.equals("전체") && selectedClass != null) {
	        list = myPageDAO.teacherReceiveList(user_id,cnt,start);
	        // 전체를 선택했을 때는 전체 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.teacherReceiveAllCount(cnt, user_id));
	    } else {
	        list = myPageDAO.teacherReceiveListFilter(user_id, cnt, start, selectedClass);
	        // 전체가 아닌 특정 강의를 선택했을 때는 해당 강의의 갯수를 가져옴
	        result.put("totalPages", myPageDAO.teacherReceiveAllCountFilter(cnt, user_id, selectedClass));
	    }
		
		
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);	
		
		for (MyPageDTO r : list) {
			logger.info(r.getReview_idx()+"");
			logger.info(r.getReview_reg_date()+"");
			logger.info(r.getReview_title() + "");
			logger.info(r.getRater_id()+"");
			logger.info(r.getScore()+"");
		}
		
		return result;
	}

	public Map<String, Object> teacherWrittenList(int currPage, int cnt, String user_id) {
		int start = (currPage-1)*cnt;
		logger.info("(서비스)받아온 user_id: " + user_id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<MyPageDTO> list = myPageDAO.teacherWrittenList(user_id,cnt,start);
		logger.info("list size: "+list.size());
		
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", myPageDAO.teacherWrittenAllCount(cnt, user_id));	
		
		return result;
	}



	
}
