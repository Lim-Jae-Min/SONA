package com.sona.music.member.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.sona.music.admin.dto.AdminDTO;
import com.sona.music.board.dto.ReviewDTO;
import com.sona.music.member.dao.MemberDAO;
import com.sona.music.member.dto.MemberDTO;

@Service
public class MemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberDAO memberDAO;

	public String findIdEmail(String email) {
		
		
		return  memberDAO.findIdEmail(email);
	}

	public MemberDTO userLogin(String id, String pw) {
		logger.info("여긴 서비스 ");
		logger.info("id : {} | pw : {}", id, pw);
		
		
		
		return memberDAO.userLogin(id,pw);
	}

	public List<String> findId(String email) {

		return memberDAO.findId(email);
	}

	public String findPw(String username, String email) {
		// TODO Auto-generated method stub
		return memberDAO.findPw(username,email);
	}

	public String findPwcheckId(String username) {
		// TODO Auto-generated method stub
		return memberDAO.findPwcheckId(username);
	}

	public String findPwEmail(String email, String username) {
		// TODO Auto-generated method stub
		return memberDAO.findPwEmail(email,username);
	}

	public int changePw(String changePwNeedId, String newPassword) {
		// TODO Auto-generated method stub
		return memberDAO.changePw(changePwNeedId,newPassword);
	}
		
	public Object overlay(String id) {
		return memberDAO.overlay(id);
	}

	public int join(Map<String, String> param) {
		logger.info("회원가입 param 값: " + param);
		
		
		String ori_phone = param.get("user_phone");
		String new_phone = ori_phone.substring(0, 3) + '-' + ori_phone.substring(3, 7) + '-' + ori_phone.substring(7, 11);
		logger.info("new_phone = " + new_phone);
		String email = param.get("user_email");
		String id = param.get("user_id");
		String pw = param.get("user_pass");
		String bank = param.get("user_bank");
		String accountnumber = param.get("user_accountnumber");
		String usertype = param.get("user_type");
		String name = param.get("user_name");
		
		
		MemberDTO dto = new MemberDTO();
		
		dto.setUser_phone(new_phone);
		dto.setUser_email(email);
		dto.setUser_id(id);
		dto.setUser_pass(pw);
		dto.setUser_bank(bank);		
		dto.setUser_accountnumber(Integer.parseInt(accountnumber));
		dto.setUser_type(usertype);
		dto.setUser_name(name);
		
		int row = memberDAO.join(dto);
		
		
		
		logger.info("row : "+ row);
		return row;
	}

	public Map<String, Object> userLessonList(int currPage, int pagePerCnt, String user_id) {
		
		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<MemberDTO> list = memberDAO.userLessonList(user_id,pagePerCnt,start);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", memberDAO.userLessonPageCount(pagePerCnt, user_id));
		result.put("allCount", memberDAO.userLessonAllCount(user_id));

		for (MemberDTO r : list) {
//			logger.info(r.getClass_name()+"");
//			logger.info(r.getClass_reg_date() + "");
//			logger.info(r.getCount()+"");
//			logger.info(r.getScore()+"");
//			logger.info(r.getIndex_order()+"");
		}
		
		return result;
	}

	public Map<String, Object> userReviewList(int currPage, int pagePerCnt, String user_id) {

		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<ReviewDTO> list = memberDAO.userReviewList(user_id,pagePerCnt,start);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", memberDAO.userReviewPageCount(pagePerCnt, user_id));
		result.put("allCount", memberDAO.userReviewAllCount(user_id));
		for (ReviewDTO r : list) {


			logger.info(r.getReview_title()+"");
			logger.info(r.getRater_id()+"");
			logger.info(r.getScore()+"");
			logger.info(r.getReview_reg_date()+"");
			logger.info(r.getIndex_order()+"");

		}
		
		return result;
	}


	public void userdetail(String user_id, String loginId, Model model) {
		logger.info("서비스");
		MemberDTO detail = memberDAO.detail(user_id);
		logger.info("회원 정보: "+ detail);
		model.addAttribute("detail", detail);
		
		MemberDTO myTeacher = memberDAO.myTeacher(user_id, loginId);
		model.addAttribute("myTeacher", myTeacher);
	}

	public AdminDTO adminLogin(String id, String pw) {
		
		return memberDAO.adminLogin(id, pw);
	}

	public Map<String, Object> favorite(String loginId, String teacher_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = memberDAO.unblock(loginId, teacher_id);
		logger.info("숨김 해제한 강사 수 = " + result);
		
		result = memberDAO.favorite(loginId, teacher_id);
		logger.info("즐겨찾기한 강사 수 = " + result);
		
		map.put("result", result);
		
		return map;
	}

	public Map<String, Object> unFavorite(String loginId, String teacher_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = memberDAO.unFavorite(loginId, teacher_id);
		logger.info("즐겨찾기 해제한 강사 수 = " + result);
		
		map.put("result", result);
		
		return map;
	}

	public Map<String, Object> block(String loginId, String teacher_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int result = memberDAO.unFavorite(loginId, teacher_id);
		logger.info("즐겨찾기 해제한 강사 수 = " + result);
		
		result = memberDAO.block(loginId, teacher_id);
		logger.info("숨김 강사 수 = " + result);
		
		map.put("result", result);
		
		return map;
	}

	

	

	
}
