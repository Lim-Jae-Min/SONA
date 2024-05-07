<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 리뷰 상세보기 - 관리자</title>
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
	width: 882px;
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

.blind {
	background-color: #ff0000;
	color: #ffffff;
	margin-right: auto; /* 왼쪽 여백 추가 */
	text-align: left;
}

.report, .edit, .delete {
	background-color: #ff0000;
	color: #ffffff;
	margin-left: auto; /* 오른쪽 여백 추가 */
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

	<div id="content">
		<div id="top">
			<div id="left">
				<b> ${lesson.class_name}</b> <br /> <span class="gray">${lesson.class_inst}</span>
				<br />
				<br />
				<br /> 평균 만족도 <span class="yellow">★ ${lesson.class_score}</span>
			</div>
			<div id="right">
				<table>
					<tr>
						<td> <a href="userDetail.go?user_id=${lesson.user_id}">${lesson.user_name}</a> </td>
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

	<div class="container">
		<img src="resources/img/review.png" id="review"> 강의 리뷰 상세보기
		<div class="review-title">${review.review_title}</div>
		<div class="author-info">
		
			<a href="userDetail.go?user_id=${review.rater_id}">작성자: ${review.rater_id}</a> 작성일자: ${review.review_reg_date} <span
				class="satisfaction">★${review.score}</span>
		</div>
		<div class="content">${review.review_content}</div>
		<div>리뷰 사진</div>
		<div>
			<c:forEach items="${photos}" var="photo">
				<img src="/photo/${photo.new_filename}" width="500" height="300" />
				<br />
				<br />
			</c:forEach>
		</div>
		<div>

				<button class="button blind"
					onclick="confirmBlind(${review.review_idx})">블라인드</button>

		</div>
		<div class="button-container">
			<c:if test="${loginId eq review.ratee_id}">
				<button class="button report"
					onclick="confirmReport(${review.review_idx})">신고</button>
			</c:if>
			<button class="button edit"
				onclick="redirectToEditPage(${review.review_idx})">수정</button>
			<button class="button delete"
				onclick="confirmDelete(${review.review_idx})">삭제</button>
		</div>
		<div class="button-container return-btn">
			<button class="button" onclick="returnReviewList()">리스트로
				돌아가기</button>
		</div>
	</div>
	
	<br/><br/>
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
var classIdx = ${review.class_idx};


function confirmBlind(reviewIdx) {
    if (confirm("블라인드 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteReview.ajax",
            data: { reviewIdx: reviewIdx },
            success: function(response) {
            	alert("블라인드 되었습니다.");
            	location.href = 'adminReviewList.go';
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
}




function returnReviewList(){
	
	location.href = "adminReviewList.go";
}

function confirmDelete(reviewIdx) {
    if (confirm("삭제 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteReview.ajax",
            data: { reviewIdx: reviewIdx },
            success: function(response) {
            	alert("삭제되었습니다.");
            	location.href = 'adminReviewList.go';
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
}

$(document).ready(function() {
    // 현재 로그인한 사용자의 아이디
    var loggedInUserId = "${sessionScope.loginId}";
    var userType = "${sessionScope.user_type}";

    // 리뷰 작성자의 아이디
    var reviewUserId = "${review.rater_id}";

    // 만약 현재 사용자가 관리자가 아니라면

    // 만약 현재 로그인한 사용자의 아이디와 리뷰 작성자의 아이디가 일치하는 경우에만
    // 수정 및 삭제 버튼을 표시합니다.
    if (loggedInUserId !== reviewUserId) {
        $(".edit").hide();
        $(".delete").hide();
    }
});

function redirectToEditPage(reviewIdx) {
    window.location.href = './lessonReviewEdit.go?idx=' + reviewIdx;
}

function redirectToList(classIdx) {
    window.location.href = './lessonReviewList.go?class_idx=' + classIdx;
}

$('#logo').click(function main(){
	location.href = 'adminMain.go';
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
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