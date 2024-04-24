package com.sona.music.member.service;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public MemberDTO login(String id, String pw) {
		logger.info("여긴 서비스 ");
		logger.info("id : {} | pw : {}", id, pw);
		return memberDAO.login(id,pw);
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
		dto.setUser_accountnumber(accountnumber);
		dto.setUser_type(usertype);
		dto.setUser_name(name);
		
		int row = memberDAO.join(dto);
		
		
		
		logger.info("row : "+ row);
		return row;
	}

	public Map<String, Object> classreview(int currPage, int pagePerCnt, String user_id) {
		
		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<MemberDTO> list = memberDAO.list(user_id,pagePerCnt,start);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", memberDAO.allCount(pagePerCnt));
		
		for (MemberDTO r : list) {
			logger.info(r.getClass_name()+"");
			logger.info(r.getClass_reg_date() + "");
			logger.info(r.getCount()+"");
			logger.info(r.getScore()+"");
			logger.info(r.getIndex_order()+"");
		}
		
		return result;
	}

	public Map<String, Object> classreview2(int currPage, int pagePerCnt, String user_id) {

		int start = (currPage-1)*pagePerCnt;
		
		Map<String, Object> result = new HashMap<String, Object>();
		List<ReviewDTO> list = memberDAO.list2(user_id,pagePerCnt,start);
		logger.info("list size: "+list.size());
		result.put("list", list);
		result.put("currPage",currPage);
		result.put("totalPages", memberDAO.allCount(pagePerCnt));
		for (ReviewDTO r : list) {

//			logger.info(r.getREVIEW_TITLE()+"");
//			logger.info(r.getRATER_ID()+"");
//			logger.info(r.getSCORE()+"");
//			logger.info(r.getREVIEW_REG_DATE()+"");
//			logger.info(r.getIndex_order()+"");

		}
		
		return result;
	}


	public MemberDTO userdetail(String user_id) {
		logger.info("서비스");
		MemberDTO detail = memberDAO.detail(user_id);
		logger.info("회원 정보: "+ detail);
		return memberDAO.detail(user_id);
	}

	

	

	
}
