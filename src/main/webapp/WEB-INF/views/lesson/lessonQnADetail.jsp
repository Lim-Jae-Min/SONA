<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의 Q&A 상세보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after"
	type="text/css">
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #ffffff;
}

.container {
	width: 900px;
	margin: 20px auto;
	background-color: #ffffff;
	border: 1px solid #BEE6FF;
	border-radius: 10px;
	padding: 20px;
}

#review {
	width: 30px;
	height: 30px;
	margin-right: 20px;
}

.review-title {
	font-size: 24px;
	margin-bottom: 10px;
}

.author-info {
	font-size: 14px;
	color: #777777;
	margin-bottom: 10px;
}

.satisfaction {
	font-size: 20px;
	color: #FED000;
	float: right;
	margin-left: 20px;
}

.content {
	width: 820x;
	height: 311px;
	border: 1px solid #BEE6FF;
	border-radius: 10px;
	padding: 10px;
	margin-bottom: 20px;
	overflow: auto;
}

.button-container {
	text-align: right; /* 버튼을 오른쪽으로 정렬 */
	margin-top: 10px;
}

.button {
	display: inline-block;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
	border: none;
}

.question-box {
	border: 2px solid #BEE6FF;
	border-radius: 10px;
	background-color: #FFFFFF;
	padding: 20px;
	margin-bottom: 20px;
}

.answer-box {
	border: 2px solid #BEE6FF;
	border-radius: 10px;
	background-color: #BEE6FF; /* 답변 칸의 배경색을 하늘색으로 지정 */
	padding: 20px;
	margin-bottom: 20px;
}

.edit, .delete, .adelete, .reply {
	background-color: #ff0000;
	color: #ffffff;
	margin-left: 10px; /* 오른쪽 여백 추가 */
	margin-bottom: 12px;
}

.edit {
	background-color: #BEE6FF;
}

.delete {
	background-color: #cccccc;
	color: #000000;
}

.return-btn {
	margin-top: 20px;
	text-align: center;
}
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

#content {
	padding-bottom: 100px;
}

#top {
	height: 150px;
	padding-left: 28%;
	padding-right: 28%;
	border-bottom: solid 5px #BEE6FF;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#left {
	display: inline-block;
}

#right {
	display: inline-block;
}

.gray {
	color: gray;
	font-size: 12px;
}

.red {
	color: red;
}

.yellow {
	color: #ffc400;
}

.lessonLogo {
	height: 120px;
	width: 120px;
}

.classStyles {
	padding: 5px;
	background-color: #0070b6;
	color: white;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
}

.reviewProfile {
	width: 50px;
	height: 50px;
}

.smallFontSize {
	font-size: 12px;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.user_type eq '관리자'}">
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
   </c:if>
   <c:if test="${sessionScope.user_type ne '관리자'}">
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
   </c:if>
	


	<div id="content">
		<div id="top">
			<div id="left">
				<b>${lesson.class_name}</b> <br /> <span class="gray">${lesson.class_inst}</span>
				<br />
				<br />
				<br /> 평균 만족도 <span class="yellow">★ ${lesson.class_score}</span>
			</div>
			<div id="right">
				<table>
					<tr>
						<td>${lesson.user_name}</td>
						<c:if test="${lessonLogo != null}">
							<td rowspan="3"><img src="/photo/${lessonLogo}"
								class="lessonLogo"></td>
						</c:if>
						<c:if test="${lessonLogo == null}">
							<td rowspan="3"><img src="resources/img/basic_user.png"
								class="lessonLogo"></td>
						</c:if>
					</tr>
					<tr>
						<td>${lesson.class_location}</td>
					</tr>
					<tr>
						<td>
							<span class="red">
								${lesson.manner === 0.0 ? '♥신규 회원' : `♥ ${lesson.manner}`}
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>


	<div class="container">
		<img src="resources/img/QnA.png" id="QnA"> Q&A 상세보기
		<div class="question-box">
			<div class="qna-title">No.${question.question_idx}</div>
			<div>
				Q&A 제목: ${question.q_title} <br />
			</div>
			<div class="author-info">작성자: <a href="userDetail.go?user_id=${question.user_id}">${question.user_id}</a> 작성일:
				${question.q_reg_date} 조회수: ${question.q_hit}</div>
			<div class="content"><pre>${question.q_content}</pre></div>
			<c:if test="${not empty answer}">
				<div style="text-align: right;">
					<button class="button delete"
						onclick="confirmAllDelete(${question.question_idx},${question.class_idx})">
						전체 삭제</button>
				</div>
			</c:if>
			<c:if test="${not empty answerMessage}">
				<div
					style="text-align: right; display: flex; justify-content: flex-end;">
					<button class="button edit"
						onclick="redirectToEditPage(${question.question_idx})">수정</button>
					<button class="button delete"
						onclick="confirmDelete(${question.question_idx},${question.class_idx})">삭제</button>
					<button class="button reply"
						onclick="redirectToReplyPage(${question.question_idx})">답변</button>
				</div>
			</c:if>
			<!-- 답변이 아직 작성이 안됐을경우 -->
			<c:if test="${not empty answerMessage}">
				<div class="answer-box">
					<div class="content">${answerMessage}</div>
				</div>
			</c:if>
			<!-- 답변이 작성 됐을 경우 -->
			<c:if test="${not empty answer}">
				<div class="answer-box">
					<div class="author-info">답변자: <a href="userDetail.go?user_id=${answer.user_id}">${answer.user_id}</a> 답변일:
						${answer.a_reg_date}</div>
					<div class="content">${answer.a_content}</div>
					<div style="text-align: right;">
						<button class="button adelete"
							onclick="answerDelete(${question.question_idx},${question.class_idx})">삭제</button>
					</div>
				</div>
			</c:if>
			<div class="button-container return-btn">
				<button class="button"
					onclick="redirectToList(${question.class_idx})">리스트로 돌아가기</button>
			</div>
		</div>
	</div>

	<br />
	<br />
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
				<td colspan="2">${sessionScope.user_name}회원님</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="manner">♥ ${sessionScope.manner_variance}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${sessionScope.point}</span>
		</div>
		<br />
		<div>
			<c:if test="${sessionScope.user_type eq '수강생'}">
				<a href="studentWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
			<c:if test="${sessionScope.user_type eq '강사'}">
				<a href="teacherWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
		</div>
		<br />
		<div>
			<a href="myPage.go">마이페이지</a>
		</div>
		<br />
		<br />
		<br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
</body>
<script>
var classIdx = ${question.class_idx};
var questionIdx = ${question.question_idx};


$(document).ready(function() {
    // 현재 로그인한 사용자의 아이디
    var loggedInUserId = "${sessionScope.loginId}";
    // qna 작성자의 아이디
    var qnaUserId = "${question.user_id}";
    
    var teacherId = "${question.teacher_id}";

    // 만약 현재 로그인한 사용자의 아이디와 qna 작성자의 아이디가 일치하는 경우에만
    // 수정 및 삭제 버튼을 표시합니다.
    if (loggedInUserId !== qnaUserId) {
        $(".edit").hide();
        $(".delete").hide();
    }
    if (loggedInUserId !== teacherId) {
        $(".reply").hide();
        $(".adelete").hide();
    }
});

function confirmAllDelete(questionIdx, classIdx){
	if(confirm("전체 삭제 하시겠습니까?")){
		 window.location.href = './deleteAllQnA.do?questionIdx=' + questionIdx + '&classIdx=' + classIdx;
	}
}

function confirmDelete(questionIdx, classIdx){
	if(confirm("질문을 삭제 하시겠습니까?")){
		window.location.href = './deleteQuestion.do?questionIdx=' + questionIdx + '&classIdx=' + classIdx;
	}
	
}

function answerDelete(questionIdx, classIdx){
	if(confirm("답변을 삭제 하시겠습니까?")){
		window.location.href = './deleteAnswer.do?questionIdx=' + questionIdx + '&classIdx=' + classIdx;
	}
}

function redirectToList(classIdx) {
    window.location.href = './lessonQnAList.go?class_idx=' + classIdx;
}


function redirectToEditPage(questionIdx) {
    window.location.href = './lessonQnAEdit.go?question_idx=' + questionIdx;
}

function redirectToReplyPage(questionIdx) {
    window.location.href = './lessonQnAReply.do?question_idx=' + questionIdx;
}

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});
	
$('#logo').click(function main(){
	   if ('${sessionScope.user_type}' == '관리자') {
	      location.href = 'adminMain.go';
	   }else {
	      location.href = '/main';   
	   }
	});


$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});



</script>
</html>