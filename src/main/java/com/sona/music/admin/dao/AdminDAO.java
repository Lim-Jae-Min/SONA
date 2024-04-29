package com.sona.music.admin.dao;

import java.util.List;

import com.sona.music.admin.dto.AdminDTO;

public interface AdminDAO {

	int noticeDel(int noticeIdx);

	int adminCheck(String attribute);

	int noticeWrite(AdminDTO noticeWriteDto);


	void noticePhotoWrite(String fileName, String newFileName, int noticeIdx, String noticeWriteId,
			String photoCategory);

	int noticeUpdate(AdminDTO noticeWriteDto);

	int photoDel(int photoidx, String photocategory, String photoname);

	int adminFaqWriteDo(String adminId, String faqTitle, String faqAnswer, String faqType);

	int faqEdit(AdminDTO faqEditDto);

	int faqDel(int faqIdx);

	AdminDTO adminData();

	List<AdminDTO> userData(int currentMonth, int oneMonthAgo, int twoMonthAgo);

	List<AdminDTO> adminUserListCall(int pagePerCnt, int start, String condition, String searchContent);

	int adminUserListCount(int pagePerCnt, String condition, String searchContent);

	int userCount(String condition, String searchContent);

	AdminDTO adminUserDetail(String user_id);

}
