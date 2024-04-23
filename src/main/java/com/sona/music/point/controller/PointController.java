package com.sona.music.point.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.sona.music.lesson.dto.LessonDTO;
import com.sona.music.lesson.service.LessonService;
import com.sona.music.point.service.PointService;

@Controller
public class PointController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointService pointService;
	
	@RequestMapping(value = "/chargePoint.go", method = RequestMethod.POST)
	public String chargePointGo(Model model, HttpSession session) {
		String id =(String) session.getAttribute("loginId");
		String page = "redirect:/";
		if(id != null) {
			model.addAttribute(model);
			String chargePointLoginId = (String) session.getAttribute("loginId");
			logger.info(chargePointLoginId);
			int havePoint = pointService.getHavePoint(chargePointLoginId);
			model.addAttribute("havePoint", havePoint);
			page = "myPoint/chargePoint";
			
		}
		return page;
	}
	
	@RequestMapping(value = "/chargePoint.do" , method = RequestMethod.POST)
	public String chagePointDo(HttpSession session,Integer amount, Model model) {
		
		logger.info("충전컨트롤러에서 받은 값 : " +amount);
		String id = (String) session.getAttribute("loginId");
		String page = "redirect:/";
		String pointType = "입금";
		String chargePointLoginId = (String) session.getAttribute("loginId");
		// 포인트 충전을 위한 세션 체크
		if(id != null) {
			int row = pointService.chargePoint(id,amount,pointType);
			logger.info("입금 실패시 뜨는 값" + row);
			if(row == 1) {
				logger.info("입금 성공시 뜨는 값" + row);
				int havePoint = pointService.getHavePoint(chargePointLoginId);
				session.setAttribute("point", havePoint);
				model.addAttribute()
				
				
			}
		}
		return page;
	}
	
	@RequestMapping(value = "/withdrawPoint.go" , method = RequestMethod.POST)
	public String withdrawPointGO(Model model, HttpSession session) {
		
		String page = "redirect:/";
		
		String chargePointLoginId = (String) session.getAttribute("loginId");
		if(chargePointLoginId != null) {
		page = "myPoint/withdrawPoint";
		model.addAttribute(model);
		logger.info(chargePointLoginId);
		int havePoint = pointService.getHavePoint(chargePointLoginId);
		model.addAttribute("havePoint", havePoint);
		session.setAttribute("point", havePoint);
		}
		return page;
	}
	
	@RequestMapping(value = "/withdrawPoint.do" , method = RequestMethod.POST)
	public String withdrawPointDO(HttpSession session,Integer amount) {
		String id = (String) session.getAttribute("loginId");
		String page = "member/login";
		String msg = "결제중 문제가 발생 했습니다.";
		amount = -amount;
		if(id != null) {
		int userPoint = (int) session.getAttribute("point");
		logger.info("출금후 남은 금액" +userPoint);
		int resultPoint = userPoint+amount;
			if(resultPoint>=0) {
				logger.info("충전컨트롤러에서 받은 값 : " +amount);
				page = "redirect:/";
				
				String pointType = "출금";
				logger.info(id);
				// 포인트 충전을 위한 세션 체크
				int row = pointService.withdrawPoint(id,amount,pointType);
				logger.info("출금 성공시 뜨는 값" + row);	
				String chargePointLoginId = (String) session.getAttribute("loginId");
				int havePoint = pointService.getHavePoint(chargePointLoginId);
				session.setAttribute("point", havePoint);
			}else {
				logger.info("포인트 출금에 포인트가 부족할때 뜨는 값 ");
				page = "\"mypoint/withdrawPont\"";
			}
		}
		return page;
	}
	
	@RequestMapping(value = "/lessonPayment.go" , method = RequestMethod.POST)
	public String lessonPaymentGo(Model model,HttpSession session) {
		int userPoint = (int) session.getAttribute("point");
		logger.info(userPoint+"세션에서 가져온 포인트 값");
		int CLASS_IDX = 2;
		//레슨정보를 가져오기
		String chargePointLoginId =(String) session.getAttribute("loginId");
		String page = "member/login";
		if(chargePointLoginId != null) {
		
		int havePoint = pointService.getHavePoint(chargePointLoginId);
		LessonDTO lessonInfo = pointService.paymentGetLesson(CLASS_IDX);
//		String new_filename = pointService.getPhotoName(lessonInfo.getUser_id());
		model.addAttribute("USER_NAME",lessonInfo.getUser_name());
		model.addAttribute("Class_name",lessonInfo.getClass_name());
		model.addAttribute("Class_times",lessonInfo.getClass_times());
		model.addAttribute("Class_price",lessonInfo.getClass_price());
		model.addAttribute("havePoint", havePoint);
		model.addAttribute("T_USER_ID",lessonInfo.getUser_id());
		model.addAttribute("Class_idx",lessonInfo.getClass_idx());
		int remainPoint = havePoint- lessonInfo.getClass_price();
		model.addAttribute("remainPoint",remainPoint);
		page = "myPoint/lessonPayment";
		}
		
		return page;
	}
	
	@RequestMapping(value = "/lessonPayment.do" , method = RequestMethod.POST)
	public String lessonPaymentDo(Model model,HttpSession session,
			String TuserName, Integer classPrice, String TuserId, Integer classIdx ) {
		
		
		String chargePointLoginId =(String) session.getAttribute("loginId");
//		int havePoint = pointService.getHavePoint(chargePointLoginId);
		int havePoint = (int) session.getAttribute("point");
		String pointType = "강의결제";
		String id = (String) session.getAttribute("loginId");
		String msg = "강의 결제에 실패 했습니다.";
		String page = "member/login";
		int row = 0;
		int amount = -classPrice;
		
		
		int resultPoint = havePoint + amount;
		if(id != null) {
			logger.info("강의결제에서 보유포인트 - 강의결제" + resultPoint);
			
			if(resultPoint>0) {
				
				row = pointService.lessonPayment(id,amount,pointType);
				logger.info("강의 결제 성공 1 : " + row);
				msg = "강의 결제에 성공 했습니다.";
				havePoint = pointService.getHavePoint(chargePointLoginId);
				session.setAttribute("point", havePoint);
				page = "redirect:/";				
			}else{
				
				msg = "포인트가 부족합니다 포인트 충전 페이지로 이동 합니다.";
				page = "myPoint/chargePoint";
				logger.info("강의결제 실패");
			}
			if(row == 1) {
				String applyState = "결제완료";
				int appResult = pointService.lessonPayApyHistory(classIdx,id,applyState);
				logger.info("수강 신청 이력에 나오는 값 : "+appResult);
			}
		}

		logger.info("강의 결제에서 받아온 값 :" + TuserName);
		logger.info("강의 결제에서 받아온 값 :" + classPrice);
		logger.info("강의 결제에서 받아온 값 :" +TuserId );
		logger.info("강의 결제에서 받아온 값 :" + classIdx + "번강의");
		model.addAttribute("msg",msg);
		
		
		return page;
	}
	
}
