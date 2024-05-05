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

.title {
	position: relative;
	text-align: left;
}

.answer-box {
	border: 2px solid #BEE6FF;
	border-radius: 10px;
	background-color: #FFFFFF;
	padding: 20px;
	margin-bottom: 20px;
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
<body>
	<header id="usermain">
		<table id="mainmenu">
			<tr>
				<th class="menu"><img src="resources/img/logo.png" id="logo"></th>
				<th class="menu"><c:if test="${sessionScope.loginId eq null}">
						<c:if test="${sessionScope.user_type ne '강사'}">
							<a href="login.go">추천 강의</a>
						</c:if>
					</c:if> <c:if test="${sessionScope.loginId ne null}">
						<c:if test="${sessionScope.user_type ne '강사'}">
							<a href="recommendList.go">추천 강의</a>
						</c:if>
					</c:if></th>
				<th class="menu"><a href="allList.go">전체 강의</a></th>
				<th class="menu"><a href="serviceCenter.go">고객센터</a></th>
			</tr>
		</table>
		<table id="mymenu">
			<c:if test="${sessionScope.loginId ne null}">
				<tr>
					<c:if test="${sessionScope.alarm_count > 0}">
						<th><img src="resources/img/alarm_on.png"
							class="miniimg alarm"></th>
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
						<td><span class="red">♥ ${lesson.manner}</span></td>
					</tr>
				</table>
			</div>
		</div>
	</div>




	<br />

	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="aWrite.do" method="post" enctype="multipart/form-data"
				onsubmit="return confirmWrite();">
				<div class="title">
					<img src="resources/img/QnA.png" id="review"> Q&A 답변 작성
				</div>
				<table>
					<input type="hidden" name="class_idx" value="${question.class_idx}" />
					<tr style="text-align: left;">
						<th><input type="hidden"
							name="question_idx" value="${question.question_idx}"></th>
					</tr>
					<tr>
						<td>질문 제목: ${question.q_title}</td>
					</tr>
					<tr>
						<td>질문 내용: ${question.q_content}</td>
					</tr>
					<tr>
						<td>질문 작성자: ${question.user_id} 질문 작성일: ${question.q_reg_date}</td>
					</tr>
				</table>
				<div style="font-size: 12px; text-align: right;">
					작성자 : ${sessionScope.loginId}<input type="hidden" name="user_id"
						value="${sessionScope.loginId}"> 작성일 : <span
						id="currentDate"></span>
				</div>
				<div style="margin-top: 10px; text-align: left;">답변 내용</div>
				<div class="answer-box">
					<textarea name="a_content"
						style="width: 882px; height: 311px; resize: none;"></textarea>
				</div>
				<div style="text-align: right;">
					<input type="button" value="취소"
						onclick="redirectToList(${question.class_idx})" />
					<button>작성</button>
				</div>
			</form>
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

var currentDateElement = document.getElementById('currentDate');
var currentDate = new Date().toLocaleDateString('ko-KR');
currentDateElement.innerText = currentDate;

function confirmWrite() {
    var result = confirm("답변 작성을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("답변 작성이 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
}

function redirectToList(classIdx) {
    window.location.href = './lessonQnAList.go?class_idx=' + classIdx;
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

$('#logo').click(function main(){
	location.href = '/main';
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});
	
	
</script>
</html>