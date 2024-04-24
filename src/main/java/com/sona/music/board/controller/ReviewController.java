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

		String page = "lesson/lessonReviewWrite";

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
	public String detail(Integer review_idx, HttpSession session, Model model) {
		logger.info("idx="+review_idx+"리뷰 디테일 요청");


		if(session.getAttribute("loginId") != null && review_idx != null) {

			Integer post_idx = review_idx; // POST_IDX 값을 REVIEW_IDX로 설정
			String photo_category = "Review"; // PHOTO_CATEGORY 값을 고정값으로 설정

			logger.info("detail post idx = " + post_idx);
			logger.info("detail photo category = " + photo_category);

			reviewService.detail(review_idx, post_idx, photo_category, model);

			return "lesson/lessonReviewDetail"; 
		} else {

			return "redirect:/lessonReviewList"; 
		}
	}


	@RequestMapping(value = "/deleteReview", method = RequestMethod.POST)
	public String deleteReview(@RequestParam("reviewIdx") Integer reviewIdx) {
		logger.info(reviewIdx+"리뷰 삭제 요청 - controller");

		String postIdx = String.valueOf(reviewIdx);
		String photoCategory = "Review";

		logger.info(postIdx+"리뷰 삭제 요청 - controller");
		logger.info(photoCategory+"리뷰 삭제 요청 - controller");


		reviewService.deleteReview(reviewIdx);
		reviewService.photoEdit(postIdx, photoCategory);

		return "redirect:/lessonReviewList"; 
	}



	@RequestMapping(value="/lessonReviewEdit")
	public String reviewEdit(Integer idx, Model model, HttpSession session) {
		logger.info("idx="+idx + "리뷰 수정 요청");


		String page = "";
		String type = (String) session.getAttribute("user_type");
		Integer post_idx = idx; // POST_IDX 값을 REVIEW_IDX로 설정
		String photo_category = "Review"; // PHOTO_CATEGORY 값을 고정값으로 설정

		if (type.equals("강사")) {

			reviewService.reviewEdit(idx, post_idx, photo_category, model);
			page = "lesson/lessonReviewEditT";
		} else if(type.equals("수강생")) {

			reviewService.reviewEdit(idx, post_idx, photo_category, model);
			page = "lesson/lessonReviewEditS";
		}
		logger.info(type);

		return page;
	}

	@RequestMapping(value="/reviewEdit")
	public String edit(MultipartFile photos,@RequestParam Map<String, String>param, HttpSession session) {
		logger.info(param.get("review_idx")+"리뷰 수정함");

		String page = "redirect:/lessonReviewList";

		if(session.getAttribute("loginId")!= null) {

			reviewService.update(photos, param);

			page = "redirect:/lessonReviewDetail?idx="+param.get("review_idx");			
		}

		return page;

	}

	@RequestMapping(value = "/photoEdit.ajax", method = RequestMethod.POST)
	public void photoEdit(@RequestParam("postIdx") String postIdx,
			@RequestParam("photoCategory") String photoCategory) {
		try {
			logger.info("photoEdit 컨트롤러:"+postIdx);
			logger.info("photoEdit 컨트롤러:"+photoCategory);
			// POST_IDX와 PHOTO_CATEGORY를 기준으로 사진을 삭제합니다.
			reviewService.photoEdit(postIdx, photoCategory);
		} catch (Exception e) {
			logger.error("사진 삭제 중 오류가 발생했습니다.", e);
		}
	}







}
