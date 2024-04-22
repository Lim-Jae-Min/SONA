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

import com.sona.music.point.service.PointService;

@Controller
public class PointController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PointService pointService;
	
	@RequestMapping(value = "/chargePoint.go")
	public String chargePointGo(Model model, HttpSession session) {
		
		
		model.addAttribute(model);
		String chargePointLoginId = (String) session.getAttribute("loginId");
		logger.info(chargePointLoginId);
		int havaPoint = pointService.getHavePoint(chargePointLoginId);
		model.addAttribute("havaPoint", havaPoint);
		return "myPoint/chargePoint";
	}
	
	@RequestMapping(value = "/chargePoint.do" , method = RequestMethod.POST)
	public String chagePointDo(HttpSession session,Integer amount) {
		
		logger.info("충전컨트롤러에서 받은 값 : " +amount);
		String id = (String) session.getAttribute("loginId");
		String pointType = "입금";
		// 포인트 충전을 위한 세션 체크
		if(id != null) {
			int row = pointService.chargePoint(id,amount,pointType);
			logger.info("입금 성공시 뜨는 값" + row);
		}
		return "main";
	}
	
	@RequestMapping(value = "/withdrawPoint.go")
	public String withdrawPointGO(Model model, HttpSession session) {
		
		
		model.addAttribute(model);
		String chargePointLoginId = (String) session.getAttribute("loginId");
		logger.info(chargePointLoginId);
		int havaPoint = pointService.getHavePoint(chargePointLoginId);
		model.addAttribute("havaPoint", havaPoint);
		return "myPoint/withdrawPoint";
	}
	
	@RequestMapping(value = "/withdrawPoint.do" , method = RequestMethod.POST)
	public String withdrawPointDO(HttpSession session,Integer amount) {
		amount = -amount;
		logger.info("충전컨트롤러에서 받은 값 : " +amount);
		

		String pointType = "출금";
		String id = (String) session.getAttribute("loginId");
		logger.info(id);
		// 포인트 충전을 위한 세션 체크
		if(id != null) {
			int row = pointService.withdrawPoint(id,amount,pointType);
			logger.info("출금 성공시 뜨는 값" + row);
		}
		return "main";
	}
	
	@RequestMapping(value = "/lessonPayment.go")
	public String lessonPaymentGo() {

		return "myPoint/lessonPayment";
	}
}
