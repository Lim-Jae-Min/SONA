package com.sona.music.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sona.music.board.service.ReviewService;

@Controller
public class ReviewController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ReviewService reviewService;
	
	@RequestMapping(value="/lessonReviewList")
	public String reviewlist(Model model) {
		logger.info("리뷰 리스트 요청");
		
		
		return "lesson/lessonReviewList";
	}
	
	@RequestMapping(value="/list.ajax")
	@ResponseBody
	public Map<String , Object> listCall(String page, String cnt){
		logger.info("listCall 요청");
		logger.info("페이지당 보여줄 갯수:"+cnt);
		logger.info("요청 페이지: "+page);
		
		int currPage = Integer.parseInt(page);
		int pagePerCnt = 5;
		Map<String, Object>map = reviewService.list(currPage,pagePerCnt);
		
		return map;
	}
	
	@RequestMapping(value="/lessonReviewWrite")
	public String reviewWrite(Model model, HttpSession session) {
		logger.info("리뷰 작성 요청");
		
		String page = "";
		String type = (String) session.getAttribute("user_type");
		
		if (type.equals("강사")) {
			page = "lesson/lessonReviewWriteT";
		} else if(type.equals("수강생")) {
			page = "lesson/lessonReviewWriteS";
		}
		logger.info(type);
		
		return page;
	}
	
	@RequestMapping(value="/reviewWrite", method = RequestMethod.POST)
	public String write(MultipartFile photos, HttpSession session, @RequestParam Map<String,String>param) {
		logger.info("리뷰 작성함");
		logger.info("params = {}", param);
		String page = "redirect:/lessonReviewList";
		if (session.getAttribute("loginId")!=null) {
			int row = reviewService.write(photos, param);
			if(row<1) {
				page = "lesson/lessonReviewWrite";
			}
		}
		
		return page;
	}
	
	
	@RequestMapping(value="/lessonReviewDetail")
	public String detail(Integer REVIEW_IDX, HttpSession session, Model model) {
	    logger.info("idx="+REVIEW_IDX+"리뷰 디테일 요청");
	    
	    
	    if(session.getAttribute("loginId") != null && REVIEW_IDX != null) {
	    	
	    	Integer POST_IDX = REVIEW_IDX; // POST_IDX 값을 REVIEW_IDX로 설정
	        String PHOTO_CATEGORY = "Review"; // PHOTO_CATEGORY 값을 고정값으로 설정
	        
	        logger.info("detail post idx = " + POST_IDX);
	        logger.info("detail photo category = " + PHOTO_CATEGORY);
	    	
	        reviewService.detail(REVIEW_IDX, POST_IDX, PHOTO_CATEGORY, model);
	        
	        return "lesson/lessonReviewDetail"; 
	    } else {
	        
	        return "redirect:/lessonReviewList"; 
	    }
	}
	
	
	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public String deleteReview(@RequestParam("reviewIdx") Integer reviewIdx) {
		logger.info(reviewIdx+"리뷰 삭제 요청 - controller");
	    reviewService.deleteReview(reviewIdx);
	    
	    return "redirect:/lessonReviewList"; 
	}
	
	
	
	@RequestMapping(value="/lessonReviewEdit")
	public String reviewEdit(Integer idx, Model model, HttpSession session) {
	    logger.info("idx="+idx + "리뷰 수정 요청");
	    
	    String page = "";
	    String type = (String) session.getAttribute("user_type");
	    Integer POST_IDX = idx; // POST_IDX 값을 REVIEW_IDX로 설정
	    String PHOTO_CATEGORY = "Review"; // PHOTO_CATEGORY 값을 고정값으로 설정
	    
	    if (type.equals("강사")) {
	        
	        reviewService.reviewEdit(idx, POST_IDX, PHOTO_CATEGORY, model);
	        page = "lesson/lessonReviewEditT";
	    } else if(type.equals("수강생")) {
	        
	        reviewService.reviewEdit(idx, POST_IDX, PHOTO_CATEGORY, model);
	        page = "lesson/lessonReviewEditS";
	    }
	    logger.info(type);
	    
	    return page;
	}
	
	@RequestMapping(value="/reviewEdit")
	public String edit(Integer REVIEW_IDX, Model model) {
		logger.info(REVIEW_IDX+"리뷰 수정함");
		
		
		return "lesson/lessonReviewList";
	}
	
	
	
	
	
	
	
}
