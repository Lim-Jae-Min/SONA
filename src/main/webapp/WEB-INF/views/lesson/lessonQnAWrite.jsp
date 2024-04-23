<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after"
	type="text/css">
<style>
   /* Header Container */
.header {
    background-color: #FFF;
    padding: 20px;
    display: flex;
    align-items: flex-end;
}

/* Course Info */
.course-info {
    margin-right: auto;
}

.course-name {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

.category {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.rating {
    font-size: 14px;
    color: black; 
}

/* Teacher Info */
.teacher-info {
    margin-left: auto;
    text-align: right;
}

.teacher-name {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 5px;
}

.location {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.likes {
    font-size: 16px;
    color: black; 
}

.rounded-image {
    background-color: #BEE6FF;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
}

.rounded-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
<body>
	<header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu">
                   <c:if test="${sessionScope.loginId eq null}">
                      <c:if test="${sessionScope.user_type ne '강사'}">
                         <a href="login.go">추천 강의</a>                   
                      </c:if>
                   </c:if>
                   <c:if test="${sessionScope.loginId ne null}">
                      <c:if test="${sessionScope.user_type ne '강사'}">
                         <a href="recommendList.go">추천 강의</a>                   
                      </c:if>
                   </c:if>
                </th>
                <th class="menu"><a href="allList.go">전체 강의</a></th>
                <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
            </tr>
        </table>
        <table id="mymenu">
            <c:if test="${sessionScope.loginId ne null}">
                <tr>
                    <c:if test="${sessionScope.alarm_count > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg alarm"></th>
                    </c:if>
                    <c:if test="${sessionScope.alarm_count == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg alarm"></th>
                    </c:if>
                    <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                    <th><div id="userName">${sessionScope.user_name}</div></th>
                </tr>
            </c:if>
            <c:if test="${sessionScope.loginId eq null}">
                <tr>
                    <th><a href="login.go">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    
	<div class="header">
    <div class="course-info">
        <div class="course-name">쉽게 배우는 기타</div>
        <div class="category">- 기타, 어쿠스틱 기타</div>
        <div class="rating">평균 만족도 : <span style="color: #FED000;">★4.7</span></div>
    </div>
    <div class="teacher-info">
        <div class="teacher-name">ㅇㅇㅇ선생님</div>
        <div class="location">📌서울 금천구</div>
        <div class="likes"><span style="color: red;">♥</span>80.5</div>
    </div>
    <div class="rounded-image">
        <img src="resources/img/basic_user.png" alt="Teacher Photo">
    </div>
	</div>
 	<hr style="flex: 1; margin: 0; border: 0; border-top: 4px solid #BEE6FF;">


	 <img src="resources/img/QnA.png" id="review"> Q&A 작성
	<br />

	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="qWrite" method="post"
				enctype="multipart/form-data" onsubmit="return confirmWrite();">
				<table>
					<tr>
						<th>질문 강의IDX: ${class_idx}<input type="hidden" name="class_idx" value="${class_idx}"></th>
					</tr>
					<tr>
						<th style="font-size: 14px;">Q&A 제목</th>
						<td><input type="text" name="q_title"
							style="width: 300px; font-size: 16px;" /></td>
						<th style="font-size: 12px;">작성자 : ${sessionScope.loginId}<input
							type="hidden" name="user_id" value="${sessionScope.loginId}"></th>
						<th style="font-size: 12px;">작성일 : <span id="currentDate"></span></th>
					</tr>
					<tr>
						<th>Q&A 내용</th>
						<td colspan="4"><textarea name="q_content"
								style="width: 882px; height: 311px; resize: none;"></textarea></td>
					</tr>
					<tr>
   					 <th>공개 여부</th>
    				<td>
        				<input type="radio" id="public" name="anonymous_status" value="false" checked>
        				<label for="public">공개</label>
        				<input type="radio" id="private" name="anonymous_status" value="true">
        				<label for="private">비공개</label>
    				</td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
						type="button" onclick="redirectToList(${class_idx})"
						value="취소" />
						<button>작성</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
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
</body>
<script>
var currentDateElement = document.getElementById('currentDate');
var currentDate = new Date().toLocaleDateString('ko-KR');
currentDateElement.innerText = currentDate;

var classIdx = ${class_idx};

function confirmWrite() {
    var result = confirm("Q&A 작성을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("리뷰 작성이 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
}

function redirectToList(classIdx) {
    window.location.href = './lessonQnAList?class_idx=' + classIdx;
}



$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});
	
	
</script>
</html>