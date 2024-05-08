<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의 Q&A 작성</title>
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

.title {
	position: relative;
	text-align: left;
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
						<td><a href="userDetail.go?user_id=${lesson.user_id}">${lesson.user_name}</a></td>
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
								♥ ${lesson.manner == 0.0 ? '신규 회원' : lesson.manner}
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>



	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="qWrite.do" method="post" enctype="multipart/form-data"
				onsubmit="return confirmWrite();">
				<div class="title">
					<img src="resources/img/QnA.png" id="review"> Q&A 작성
				</div>
				<br />
				<table>
					<tr>
						<th>질문 강의IDX: ${class_idx}<input type="hidden"
							name="class_idx" value="${class_idx}"></th>
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
						<td colspan="4"><textarea name="q_content"  cols="100" wrap="hard"
								style="width: 882px; height: 311px; resize: none;"></textarea></td>
					</tr>
					<tr>
						<th>공개 여부</th>
						<td><input type="radio" id="public" name="anonymous_status"
							value="false" checked> <label for="public">공개</label> <input
							type="radio" id="private" name="anonymous_status" value="true">
							<label for="private">비공개</label></td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
						type="button" onclick="redirectToList(${class_idx})" value="취소" />
						<button>작성</button></td>
					</tr>
				</table>
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
		<br /> <br /> <br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
</body>
<script>
var currentDateElement = document.getElementById('currentDate');
var currentDate = new Date().toLocaleDateString('ko-KR');
currentDateElement.innerText = currentDate;

var classIdx = ${class_idx};

function confirmWrite() {
    // 제목과 내용 입력 필드의 값 가져오기
    var title = document.querySelector('input[name="q_title"]').value.trim();
    var content = document.querySelector('textarea[name="q_content"]').value.trim();

    // 제목이나 내용이 비어 있는지 확인
    if (title === '' || content === '') {
        // 비어 있는 필드가 있을 경우
        alert("제목과 내용을 모두 입력해주세요.");
        return false; // 작성 중지
    }

    // 리뷰 작성 여부 확인
    var result = confirm("Q&A 작성을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("Q&A 작성이 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
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
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
});

$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});
	
	
</script>
</html>