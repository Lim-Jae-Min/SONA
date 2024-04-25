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
.main-title {
	margin-top: 20px;
	margin-left: 20px;
}

.main-title h1 {
	font-size: 36px;
	color: #6FA4FF;
	font-weight: bold;
}

.container {
	display: flex;
	justify-content: center; /* 가로 방향 중앙 정렬 */
	align-items: center; /* 세로 방향 중앙 정렬 */
	text-align: center;
	margin-top: 20px;
}

.box {
	width: 400px;
	height: 151px;
	background-color: white;
	color: #BEE6FF;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	line-height: 1.5em;
	border-radius: 15px;
	margin: 20px;
	border: 2px solid #BEE6FF;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	position: relative;
}

.box::before {
	content: attr(data-number);
	position: absolute;
	top: 5px;
	right: 5px;
	font-size: 24px;
	font-weight: bold;
}

.box p {
	margin: 0;
	padding: 10px;
	font-size: 20px;
	color: #6FA4FF;
}

.content {
	font-size: 15px;
	color: #999;
}

.button-container.videoList button {
	background-color: #BEE6FF;
	color: white;
	font-size: 18px; /* 폰트 크기 조정 */
	padding: 12px 24px; /* 버튼 크기 조정 */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button-container.videoList button:hover {
	background-color: #8DC1FF; /* 마우스 호버시 배경색 변경 */
}

.videoList {
	margin-top: 20px;
	text-align: center;
}
.video-wrapper {
    display: inline-block;
    position: relative;
    border-radius: 15px;
    overflow: hidden;
    margin-right: 5px; /* 각 동영상 간 간격 조정 */
    text-align: center; 
    margin-top: 20px;
    margin-left: 108px; /* 동영상 컨테이너 간 간격 조정 */
}

.video-container {
	width: 300px;
	height: 151px;
    background-color: #BEE6FF;
     /* 오른쪽 상단 모서리의 테두리 */
    /* 오른쪽 상단 모서리 둥근 정도 조정 */
    border-bottom-left-radius: 15px; /* 테두리 둥근 정도 조정 */
    padding: 20px;
    text-align: center;
   
}

.corner-label {
    position: absolute;
    top: 0;
    left: 0;
    background-color: #6FA4FF;
    color: white;
    font-size: 16px;
    font-weight: bold;
    padding: 5px 10px;
    border-bottom-right-radius: 10px;
}
.container .box:nth-child(odd) {
    margin-top: -180px; /* 홀수 번째 컨테이너는 위로 이동 */
}

.container .box:nth-child(even) {
    margin-top: 180px; /* 짝수 번째 컨테이너는 아래로 이동 */
}
</style>
</head>
<body>
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
	<div class="main-title">
		<h1>누구나 배울 수 있는 악기!</h1>
	</div>
	<div></div>
	<br/><br/>
	<div class="container">
		<div class="box" data-number="01">
			<p>
				음악에 특화된 플랫폼<br/> <br/> <span class="content">음악에 특화된 서비스 제공으로</br> 전문적인 강의를
					수강 할 수 있어요.
				</span>
			</p>
		</div>
		<div class="spacer">
    		<img src="resources/img/music.png" alt="music">
		</div>
		<div class="box" data-number="02">
			<p>
				나만을 위한 맞춤 강의<br/> <br/> <span class="content">수강신청서 작성으로 회원에게 </br> 맞춤 서비스를
					제공해 드려요.
				</span>
			</p>
		</div>
		<div class="spacer">
    		<img src="resources/img/service.png" alt="service">
		</div>
		<div class="box" data-number="03">
			<p>
				상호 평가<br/> <br/> <span class="content">수강생과 강사 사이의 상호간 평가를 반영한 매너지수로 </br>
					강의 및 학생 선택에 도움을 드려요.
				</span>
			</p>
		</div>
		<div class="spacer">
    		<img src="resources/img/feedback.png" alt="feedback">
		</div>
	</div>
	<br/><br/><br/>
	<div class="video-wrapper">
		<div class="video-container">
			<!-- 동영상 콘텐츠 -->
		</div>
		<div class="corner-label">1</div>
	</div>
	<div class="video-wrapper">
		<div class="video-container">
			<!-- 동영상 콘텐츠 -->
		</div>
		<div class="corner-label">2</div>
	</div>
	<div class="video-wrapper">
		<div class="video-container">
			<!-- 동영상 콘텐츠 -->
		</div>
		<div class="corner-label">3</div>
	</div>
	<div class="video-wrapper">
		<div class="video-container">
			<!-- 동영상 콘텐츠 -->
		</div>
		<div class="corner-label">4</div>
	</div>
	<br/><br/><br/>
	<div class="button-container videoList">
		<button class="button" onclick="redirectToReplyPage()">더보기</button>
	</div>
	
	<br/><br/><br/>
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
		<br /> <br /> <br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
</body>

<script>

function redirectToReplyPage() {
    window.location.href = './videoList.go';
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