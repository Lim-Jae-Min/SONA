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


	 <img src="resources/img/QnA.png" id="review"> Q&A 작성
	<br />

	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="qWrite" method="post"
				enctype="multipart/form-data" onsubmit="return confirmWrite();">
				<table>
					<tr>
						<th>질문 강의IDX: ${CLASS_IDX}<input type="hidden" name="CLASS_IDX" value="${CLASS_IDX}"></th>
					</tr>
					<tr>
						<th style="font-size: 14px;">Q&A 제목</th>
						<td><input type="text" name="Q_TITLE"
							style="width: 300px; font-size: 16px;" /></td>
						<th style="font-size: 12px;">작성자 : ${sessionScope.loginId}<input
							type="hidden" name="USER_ID" value="${sessionScope.loginId}"></th>
						<th style="font-size: 12px;">작성일 : <span id="currentDate"></span></th>
					</tr>
					<tr>
						<th>Q&A 내용</th>
						<td colspan="4"><textarea name="Q_CONTENT"
								style="width: 882px; height: 311px; resize: none;"></textarea></td>
					</tr>
					<tr>
   					 <th>공개 여부</th>
    				<td>
        				<input type="radio" id="public" name="ANONYMOUS_STATUS" value="false" checked>
        				<label for="public">공개</label>
        				<input type="radio" id="private" name="ANONYMOUS_STATUS" value="true">
        				<label for="private">비공개</label>
    				</td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
						type="button" onclick="location.href='./lessonQnAList'"
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
				<td colspan="2">${loginName}회원님</td>
				<td>&nbsp&nbsp&nbsp</td>
				<td class="manner">♥ ${manner}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${totalPoint}</span>
		</div>
		<br />
		<div>
			<a href="#">내가 쓴 리뷰</a>
		</div>
		<br />
		<div>
			<a href="myPage.go">마이페이지</a>
		</div>
		<br />
		<br />
		<br />
		<div>
			<a href="#">로그아웃</a>
		</div>
	</div>
</body>
<script>
var currentDateElement = document.getElementById('currentDate');
var currentDate = new Date().toLocaleDateString('ko-KR');
currentDateElement.innerText = currentDate;

function confirmWrite() {
    var result = confirm("Q&A 작성을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("리뷰 작성이 완료되었습니다.");
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
	
	
</script>
</html>