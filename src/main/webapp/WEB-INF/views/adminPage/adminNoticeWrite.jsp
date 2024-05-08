<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 공지사항 작성 - 관리자</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
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
	
	#inputContent{
		width: 790px;
		height: 300px;
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
    <form action="noticeWrite.do" method="post" enctype="multipart/form-data" onsubmit="return confirmWrite();">
	    <div class="container">
	        <h1>공지사항 글작성</h1>
	        	<hr>
	            <div>제목 <input name="title" class="textA" type="text" id="title"  placeholder="제목을 입력 해주세요."> </div>    
	        	<hr>
	        	내용  
	        <div id="boardDetail">
				<!-- <input name="content" class="textA" type="text" id="content" placeholder="내용을 입력 해주세요">    -->  
				<textarea  cols="100" wrap="hard"  name="content" required="required" id="inputContent"></textarea>
	        	<hr>
	        </div>
	        <div>
	        	<input type="hidden" name="writer" value="${sessionScope.loginId}">
	        	<!-- <input type="file" name = "photos" multiple="multiple" placeholder="사진"> -->
	        </div>       
	     	<button class="buttonA" type="submit">작성</button>
	    	<button class="buttonA" type="button" onclick="returnList()">취소</button>
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

function returnList(){
	
	location.href = 'adminNoticeList.go';
}

function confirmWrite() {
    // 제목과 내용 입력 필드의 값 가져오기
    var title = document.querySelector('input[name="title"]').value.trim();
    var content = document.querySelector('textarea[name="content"]').value.trim();

    // 제목이나 내용이 비어 있는지 확인
    if (title === '' || content === '') {
        // 비어 있는 필드가 있을 경우
        alert("제목과 내용을 모두 입력해주세요.");
        return false; // 작성 중지
    }

    // 리뷰 작성 여부 확인
    var result = confirm("공지사항을 작성 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("공지사항 작성이 완료 되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
}
$('#logo').click(function main(){
	location.href = 'adminMain.go';
});
</script>
</html>