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
<style></style>
</head>
<body>
	</style>
</head>
<body>
<body>
    <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="recommendList.go">추천 강의</a></th>
                <th class="menu"><a href="allList.go">전체 강의</a></th>
                <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
            </tr>
        </table>
        <table id="mymenu">
            <c:if test="${loginName != null}">
                <tr>
                    <c:if test="${alarmCount > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg"></th>
                    </c:if>
                    <c:if test="${alarmCount == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg"></th>
                    </c:if>
                    <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                    <th><div id="userName">${loginName}</div></th>
                </tr>
            </c:if>
            <c:if test="${loginName == null}">
                <tr>
                    <c:if test="${alarmCount > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg"></th>
                    </c:if>
                    <c:if test="${alarmCount == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg"></th>
                    </c:if>
                    <th><a href="login.go">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
	<%@ include file="layout/lessonheader.jsp"%>


	<img src="resources/img/review.png" id="review">                  강의 리뷰 작성
	<br />

	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="reviewWrite" method="post" enctype="multipart/form-data" onsubmit="return confirmWrite();">
				<table>
					<tr>
						<th>평가 강의명 : 2<input type="hidden" name="CLASS_IDX" value="2">평가 학생명: user1<input type="hidden" name="RATEE_ID" value="user1"></th>
					</tr>
					<tr>
						<th style="font-size: 14px;">리뷰 제목</th>
						<td><input type="text" name="REVIEW_TITLE"
							style="width: 300px; font-size: 16px;" /></td>
						<th style="font-size: 12px;">작성자 : ${sessionScope.loginId} <input type="hidden" name="RATER_ID" value="${sessionScope.loginId}"></th>
						<th style="font-size: 12px;">작성일 : <span id="currentDate"></span></th>
					</tr>
					<tr>
						<th>만족도</th>
						<td colspan="4"><span style="color: #FED000;">★</span> <select
							name="SCORE" style="margin-left: 10px;">
								<option value="0.5">0.5</option>
								<option value="1.0">1.0</option>
								<option value="1.5">1.5</option>
								<option value="2.0">2.0</option>
								<option value="2.5">2.5</option>
								<option value="3.0">3.0</option>
								<option value="3.5">3.5</option>
								<option value="4.0">4.0</option>
								<option value="4.5">4.5</option>
								<option value="5.0">5.0</option>
						</select></td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td colspan="4"><textarea name="REVIEW_CONTENT"
								style="width: 882px; height: 311px; resize: none;"></textarea></td>
					</tr>
					<tr>
						<input type="hidden" name="PHOTO_CATEGORY" value="Review">
						<th>리뷰 사진</th>
						<td colspan="4">
							<div id="fileList"></div> 
							<input type="file" name="photos"
							accept="image/*" multiple="multiple" style="width: 100%;"
							onchange="checkFileCount(this)" /> 
							<small style="color: #999;">
							(한장의 사진만 첨부 가능합니다)</small>
						</td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
							type="button" onclick="location.href='./lessonReviewList'"
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
                <td colspan="2">${loginName} 회원님</td>
                <td>&nbsp&nbsp&nbsp</td>
                <td class="manner">♥ ${manner}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${totalPoint}</span></div>
        <br/>
        <div><a href="#">내가 쓴 리뷰</a></div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="#">로그아웃</a></div>
    </div>
</body>
<script>
var currentDateElement = document.getElementById('currentDate');
var currentDate = new Date().toLocaleDateString('ko-KR');
currentDateElement.innerText = currentDate;

function confirmWrite() {
    var result = confirm("리뷰 작성을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("리뷰 작성이 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
}

function checkFileCount(input) {
    // 현재 첨부된 파일 개수 확인
    var fileCount = input.files.length;
    
    // 첨부 파일이 1장을 초과하는 경우
    if (fileCount > 1) {
        // 경고창 표시
        alert("첨부파일은 1장만 첨부할 수 있습니다.");
        // 파일 선택 취소
        input.value = '';
    }
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
	
</script>
</html>