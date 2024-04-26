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
.el-text {
	color: #BEE6FF; /* 원하는 색상 코드로 변경하세요 */
	font-weight: bold;
	font-size: 25px;
}

.des {
	color: #999; /* 원하는 색상 코드로 변경하세요 */
	font-weight: bold;
	font-size: 17px;
	margin-left: 100px;
}

.des1 {
	color: #6FA4FF; /* 원하는 색상 코드로 변경하세요 */
	font-weight: bold;
	font-size: 17px;
	margin-left: 830px;
	margin-bottom: 20px;
}

.heart {
	color: red; /* 원하는 색상 코드로 변경하세요 */
	font-weight: bold;
}

.main-title {
	margin-top: 20px;
	margin-left: 30px;
}

.main-title h1 {
	font-size: 36px;
	color: #6FA4FF;
	font-weight: bold;
}

.main-title1 {
	margin-top: 20px;
	margin-left: 98px;
}

.container {
	display: flex;
	justify-content: center; /* 가로 방향 중앙 정렬 */
	align-items: center; /* 세로 방향 중앙 정렬 */
	text-align: center;
	margin-top: 20px;
}

.box1 {
	width: 400px;
	height: 180px;
	background-color: white;
	color: #BEE6FF;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	line-height: 1.5em;
	border-radius: 15px;
	margin: 20px;
	margin-top: 220px;
	border: 2px solid #BEE6FF;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	position: relative;
}

.box1::before {
	content: attr(data-number);
	position: absolute;
	top: 5px;
	right: 5px;
	font-size: 24px;
	font-weight: bold;
}

.box2 {
	width: 400px;
	height: 180px;
	background-color: white;
	color: #BEE6FF;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	line-height: 1.5em;
	border-radius: 15px;
	margin: 20px;
	margin-top: -213px;
	border: 2px solid #BEE6FF;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	position: relative;
}

.box2::before {
	content: attr(data-number);
	position: absolute;
	top: 5px;
	right: 5px;
	font-size: 24px;
	font-weight: bold;
}

.box3 {
	width: 400px;
	height: 180px;
	background-color: white;
	color: #BEE6FF;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
	line-height: 1.5em;
	border-radius: 15px;
	margin: 20px;
	margin-top: 220px;
	border: 2px solid #BEE6FF;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
	position: relative;
}

.box3::before {
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
	font-weight: bold;
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

.button-container.videoList1 button {
	background-color: #6FA4FF;
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

.button-container.videoList1 button:hover {
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
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.video-container {
	width: 300px;
	height: 270px;
	background-color: #BEE6FF;
	border-bottom-left-radius: 15px; /* 테두리 둥근 정도 조정 */
	padding: 20px;
	text-align: center;
	font-weight: bold;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
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

.spacer1 img {
	top: 20px; /* container의 상단에서부터의 위치 */
	left: 20px; /* container의 왼쪽에서부터의 위치 */
}

.spacer2 img {
	top: 20px; /* container의 상단에서부터의 위치 */
	left: calc(50% - 201.5px); /* container의 가로 중앙에서부터의 위치 */
}

.spacer3 img {
	top: 20px; /* container의 상단에서부터의 위치 */
	right: 20px; /* container의 오른쪽에서부터의 위치 */
}

.spacer1 img {
	width: 400px; /* 이미지의 너비를 조절합니다. */
	height: 190px; /* 높이는 자동으로 조절됩니다. */
	border-radius: 15px; /* 이미지를 원하는 만큼 둥글게 조절하세요 */
	margin-top: -420px;
	margin-left: 308px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.spacer2 img {
	width: 400px; /* 이미지의 너비를 조절합니다. */
	height: 185px; /* 높이는 자동으로 조절됩니다. */
	border-radius: 15px; /* 이미지를 원하는 만큼 둥글게 조절하세요 */
	margin-top: -205px;
	margin-left: 750px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.spacer3 img {
	width: 400px; /* 이미지의 너비를 조절합니다. */
	height: 190px; /* 높이는 자동으로 조절됩니다. */
	border-radius: 15px; /* 이미지를 원하는 만큼 둥글게 조절하세요 */
	margin-top: -420px;
	margin-left: 1200px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.box1:hover, .box2:hover, .box3:hover, .spacer1:hover img, .spacer2:hover img,
	.spacer3:hover img {
	transform: scale(1.1); /* 1.1배 크기로 확대됨 */
	transition: transform 0.8s ease; /* 부드러운 전환 효과를 위한 transition 추가 */
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border-radius: 15px;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #BEE6FF;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 800px;
	text-align: center;
	border-radius: 15px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
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
	<br />
	<br />
	<div class="container">
		<div class="box1" data-number="01">
			<p>
				음악에 특화된 플랫폼<br /> <br /> <span class="content">음악에 특화된 서비스
					제공으로<br /> 전문적인 강의를 수강 할 수 있어요.
				</span>
			</p>
		</div>

		<div class="box2" data-number="02">
			<p>
				나만을 위한 맞춤 강의<br /> <br /> <span class="content">수강신청서 작성으로
					회원에게 <br /> 맞춤 서비스를 제공해 드려요.
				</span>
			</p>
		</div>

		<div class="box3" data-number="03">
			<p>
				상호 평가<br /> <br /> <span class="content">수강생과 강사 사이의 상호간
					평가를 반영한 매너지수로 <br /> 강의 및 학생 선택에 도움을 드려요.
				</span>
			</p>
		</div>

	</div>
	<div class="spacer1">
		<img src="resources/img/spee.jpg" alt="music">
	</div>
	<div class="spacer2">
		<img src="resources/img/service.jpg" alt="service">
	</div>
	<div class="spacer3">
		<img src="resources/img/feedback.jpg" alt="feedback">
	</div>
	<span class="des1"><img src="resources/img/logo.png" id="logo"
		style="width: 50px; height: 40px; margin-top: 20px;"> 와 함께
		시작해보세요!</span>
	<br />
	<br />
	<br />
	<c:if test="${sessionScope.loginId != null}">
		<div class="main-title1">
			<h2>
				<span class="el-text">${sessionScope.loginId}</span> 님을 위한 <span
					class="el-text">${list[1].applyform_inst}</span> 추천 영상입니다.
			</h2>
		</div>
	</c:if>
	<div>
		<span class="des">하늘색 박스를 클릭하면 크게 볼 수 있습니다.</span>
	</div>
	<c:forEach items="${list}" var="list" varStatus="loop">
		<div class="video-wrapper" data-class-idx="${list.class_idx}">
			<div class="video-container">
				<iframe width='300' height='200' src="${list.video_url}"
					frameborder='0' allowfullscreen></iframe>
				<br />
				<br /> ${list.teacher_id} 선생님 <br />
				<br /> <span class="heart">♥</span>${list.manner_score} <input
					type="hidden" name="class_idx" value="${list.class_idx}" />
			</div>
			<div class="corner-label">${loop.index + 1}</div>
		</div>
	</c:forEach>

	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="button-container videoList">
		<button class="button" onclick="redirectToReplyPage()">추천 영상
			더보기</button>
	</div>
	<input type="hidden" value="${sessionScope.loginId}" />
	<br />
	<br />
	<br />
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<iframe id="videoFrame" width="560" height="315" frameborder="0"
				allowfullscreen></iframe>
			<br />
			<br />
			<div class="button-container videoList1">
				<button id="viewLectureBtn">해당 영상 강의보기</button>
			</div>
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

$(document).ready(function() {
    // 각 video-wrapper를 클릭했을 때
    $('.video-wrapper').click(function() {
        // 해당 video-wrapper의 class_idx 가져오기
        var classIdx = $(this).data('class-idx');
        var videoUrl = $(this).find('iframe').attr('src');
        console.log(classIdx);
        // 해당 강의 보기 버튼 클릭 시 이벤트 처리
        $('#viewLectureBtn').click(function() {
            // 가져온 class_idx를 사용하여 링크를 생성하고 이동
            window.location.href = "./lessonDetail.go?class_idx=" + classIdx;
        });
        // 모달 열기
        openModal(videoUrl);
    });

    // 모달 열기
    function openModal(videoUrl) {
        var modal = document.getElementById("modal");
        var videoFrame = document.getElementById("videoFrame");
        videoFrame.src = videoUrl; // 동영상 URL 설정
        modal.style.display = "block";
    }
    
    // 모달 닫기 버튼 클릭 시 모달 닫기
    $('.close').click(function() {
        closeModal();
    });

    // 모달 영역 외의 다른 곳 클릭 시 모달 닫기
    window.onclick = function(event) {
        var modal = document.getElementById("modal");
        if (event.target == modal) {
            closeModal();
        }
    };

    // 모달 닫기
    function closeModal() {
        var modal = document.getElementById("modal");
        modal.style.display = "none";
    }
});

function redirectToReplyPage() {
    window.location.href = './loading.do';
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