<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style> 
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #fff;
    border-radius: 5px;
    background-color: #fff;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

#boardDetail {
    margin-top: 20px;
    margin: 1px;
}

#boardTitle {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

#boardWriter, #boardDate, #boardViews {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

#boardImageWrapper img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
}

#boardContent {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 20px;
}

#adminButtons {
    margin-top: 20px;
    text-align: center;
}

#adminButtons button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    background-color: #007bff;
    color: #eee;
    font-size: 16px;
    cursor: pointer;
}

#confirmDelete {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
}

.modal-content p {
    font-size: 16px;
    margin-bottom: 20px;
}

.modal-content button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    background-color: #007bff;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

.hidden {
    display: block;
}
img{
	width: 40%
}

hr{
	margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 3px solid #eee
}
#editButton{
	position : relative;
	left: 48%;
}
p.editOption{
	position : relative;
}

#editslide{
	border: 1px solid black;
	position:absolute;
	max-width: 50px;
	left: 48%;
	width: 45;
    text-align: center;
}
.buttonA{
	position: relative;
	left: 87%;
}
.textA{
	width: 700px;
}
#content{
	width: 735px;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header id="adminmain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"></th>
                <th class="menu"></th>
                <th class="menu"></th>
            </tr>
        </table>
        <table id="mymenu">
           <tr>
              <td><a href="adminLogout.do">로그아웃</a></td>
           </tr>
        </table>
    </header>
    <!-- 헤더영역 -->
    
    <!-- 게시판 영역 -->
    <form action="noticeEditAdmin.do" method="post" enctype="multipart/form-data">
    	<input type="hidden" value="${noticeDetail.notice_content}">
	    <div class="container">
	        <h1>게시판 상세보기</h1>
	        	<hr>
	            <div>제목 <input name="title" class="textA" type="text" id="title"  value="${noticeDetail.notice_title}"> </div>    
	        	<hr>
	        	내용  
	        <div id="boardDetail">
				<input name="content" class="textA" type="text" id="content" value="${noticeDetail.notice_content}">           
	        	<hr>
	        </div>
	        <div>
	        	<input type="hidden" name="writer" value="${sessionScope.loginId}">
	        	<input type="hidden" name="noticeIdx" value="${noticeDetail.notice_idx}">
	        	<input type="file" name = "photos" multiple="multiple" placeholder="사진" value="">
	        	<c:if test="${photos.size() > 0}">
								<c:forEach items="${photos}" var="photo">
									<div class="photo-container">
									${photo.new_filename}
										<button
											onclick="deletePhoto('${photo.post_idx}', '${photo.photo_category}','${photo.new_filename}', event)">삭제</button>
									</div>
								</c:forEach>
				</c:if>
	        </div>       
	     	<button class="buttonA" type="submit">작성</button>
	    	<button class="buttonA">취소</button>
    	</div>
    </form>
    <!-- 게시판 영역 -->


	<!-- 푸터 영역 -->
	<div id="footer">
        <li>상호명 : SONA</li>
        <li>대표자 : 김○○</li>
        <li>전화 : 02-123-4567</li>
        <li>팩스 : 02-123-4568</li>
        <li>사업자등록번호 : 000-00-00000</li>
        <li>본관 : (08505) 서울특별시 금천구 가산디지털2로 95</li>
    </div>
    <div id="slide">
        <table>
            <tr>
                <td colspan="2">${sessionScope.user_name} 회원님</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="manner">♥ ${sessionScope.manner_variance}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${sessionScope.point}</span></div>
        <br/>
        <div>
           <c:if test="${sessionScope.user_type eq '수강생'}">
              <a href="studentWrittenList.go">내가 쓴 리뷰</a>           
           </c:if>
           <c:if test="${sessionScope.user_type eq '강사'}">
              <a href="teacherWrittenList.go">내가 쓴 리뷰</a>           
           </c:if>
        </div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="logout.do">로그아웃</a></div>
    </div>    
    <!-- 푸터 영역 -->
    
    
</body>
<script>
function deletePhoto(postIdx, photoCategory,photoName,event) {
    event.preventDefault(); // 폼의 기본 동작 중지
    // 사용자에게 삭제 여부를 묻는 확인 메시지 표시
    var result = confirm('삭제 하시겠습니까?');
    
    // 확인 메시지에서 '확인'을 선택한 경우에만 삭제 요청을 보냄
    if (result) {
    	$.ajax({
            url: './noticePhotoDel.ajax',
            method: 'POST',
            data: { postIdx: postIdx, 
            	photoCategory: photoCategory,
            	photoName : photoName	
            },
            complete: function(data) {
                // 요청이 완료된 후에 실행되는 콜백에서 미리보기 삭제
                	console.log(data.success);
                if(data.success==1){
                $(event.target).parent().remove();
                	
                $('#fileList').empty();
                alert('사진이 성공적으로 삭제되었습니다.');
                }
                else{
                	alert('사진삭제를 실패 하였습니다.');
                }
            }
        });
    }
}

</script>
</html>