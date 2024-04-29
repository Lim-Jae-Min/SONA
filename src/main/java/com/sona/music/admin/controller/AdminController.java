package com.sona.music.admin.controller;

import java.util.HashMap;
import java.util.List;
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

import com.sona.music.admin.service.AdminService;
import com.sona.music.board.service.NoticeService;

@Controller
public class AdminController {

	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	AdminService adminService;
	@Autowired
	NoticeService noticeService;

	@RequestMapping(value="adminMain.go")
	public String adminMainGo(HttpSession session) {
//		String page = "main/main";
		String page = "adminPage/adminMain";
		
		String user_type = (String) session.getAttribute("user_type");
		
//		if (user_type.equals("관리자")) {
//			page = "adminPage/adminMain";
//		}
		
    	return page;
	}
	
	
	@RequestMapping(value="adminLogout.do")
	public String adminLogout(HttpSession session) {
		
		session.removeAttribute("loginId");
		session.removeAttribute("user_type");
    	
    	return "redirect:/";
	}
	
	
	@RequestMapping(value = "/noticeManagement.go")
	public String noticeManagementGo() {

		return "adminPage/noticeManagement";
	}

	@RequestMapping(value = "/noticeDetailAdmin.go")
	public String noticeDetailAdminGo(int idx, Model model) {
		noticeService.noticeDetailAdmin(idx, model);

		return "adminPage/noticeDetail";
	}
	
	@RequestMapping(value = "/noticeEditAdmin.go")
	public String noticeEditAdminGo(int idx, Model model) {
		noticeService.noticeDetailAdmin(idx, model);

		return "adminPage/noticeEdit";
	}

	
	
	@RequestMapping(value = "/noticeWrite.go")
	public String noticeWrite() {

		return "adminPage/noticeWrite";
	}
	
	@RequestMapping(value = "faqManagement.go")
	public String faqManagementGo() {
		logger.info("faq관리 페이지 이동");
		return "adminPage/faqManagement";
	}

	@RequestMapping(value = "/noticeDel.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> noticeDel(int noticeIdx) {
		logger.info("공지사항 삭제 받은 idx : " + noticeIdx);
		Map<String, Object> map = new HashMap<String, Object>();
		int row = adminService.noticeDel(noticeIdx);
		map.put("success", row);
		return map;

	}

	@RequestMapping(value = "/noticeWrite.do")
	public String noticeWriteDo(MultipartFile[] photos, HttpSession session, @RequestParam Map<String, String> param) {
		logger.info("공지사항 글작성 컨트롤러");
		com.sona.music.admin.dto.PhotoDTO photoInfo = new com.sona.music.admin.dto.PhotoDTO();
//		int adminIdRow = adminService.adminCheck(session.getAttribute("writer"));
			int row = adminService.noticeWrite(photos,param);
		 
			  for (MultipartFile p : photos) {
				  p.getOriginalFilename();
				  photoInfo.setOri_filename(p.getOriginalFilename());
				  photoInfo.getOri_filename();
				  logger.info("공지사항 포토 이름 : " + photoInfo.getOri_filename());
			  }		  
		  
		 

		logger.info("공지사항에서 받은 제목 : " + param.get("title"));
		logger.info("공지사항에서 받은 내용 : " + param.get("content"));

		return "adminPage/noticeWrite";
	}
	
	@RequestMapping(value = "/noticeEditAdmin.do")
	public String noticeEditAdminDo(MultipartFile[] photos, HttpSession session, @RequestParam Map<String, String> param) {
		logger.info("공지사항 글작성 컨트롤러");
		com.sona.music.admin.dto.PhotoDTO photoInfo = new com.sona.music.admin.dto.PhotoDTO();
//		int adminIdRow = adminService.adminCheck(session.getAttribute("writer"));
			int row = adminService.noticeUpdate(photos,param);
		 
			  for (MultipartFile p : photos) {
				  p.getOriginalFilename();
				  photoInfo.setOri_filename(p.getOriginalFilename());
				  photoInfo.getOri_filename();
				  logger.info("공지사항 포토 이름 : " + photoInfo.getOri_filename());
			  }		  
		  
		 

		logger.info("공지사항에서 받은 제목 : " + param.get("title"));
		logger.info("공지사항에서 받은 내용 : " + param.get("content"));

		return "adminPage/noticeEdit";
	}
	
	@RequestMapping(value = "noticePhotoDel.ajax", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>noticePhotoDel(@RequestParam Map<String, String> param){
		Map<String, Object> map = new HashMap<String, Object>();
		int photoidx = Integer.parseInt(param.get("postIdx"));
		String photoname = param.get("photoName");
		String photocategory = param.get("photoCategory");
		int row=adminService.photoDel(photoidx,photoname,photocategory);
		logger.info("사진 삭제된 개수" + row);
			
		map.put("success", row);
		logger.info("사진삭제에서 가져온거 : " + photoidx);
		logger.info("사진삭제에서 가져온거 : " + photocategory);
		logger.info("사진삭제에서 가져온거 : " + photoname);
		return map;
	}

}
