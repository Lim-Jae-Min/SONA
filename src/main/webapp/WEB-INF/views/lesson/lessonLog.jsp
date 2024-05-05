<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의일지</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#content {
	text-align: center;
}
.topTable {
	border-collapse: collapse;
	margin: 0 auto;
}
#bottomTable {
	border-collapse: collapse;
	margin: 0 auto;
}
.topRow {
	border-bottom: solid 3px gray;
}
.top-first-col {
	padding: 20px;
	width: 150px;
}
.top-second-col {
	padding: 20px;
	width: 350px;
}
.right-border {
	border-right: solid 3px gray;
}
.gray {
	color: gray;
}
.profileImg {
	width: 120px;
	height: 120px;
}
.bottom-first-row {
	background-color: lightgray;
	border-top: solid 2px black;
	border-bottom: solid 2px black;
}
.bottom-first-col {
	width: 50px;
	padding: 3px 10px;
}
.bottom-second-col {
	width: 500px;
	padding: 3px 10px;
}
.bottom-third-col {
	width: 150px;
	padding: 3px 10px;
}
.bottom-fourth-col {
	width: 150px;
	padding: 3px 10px;
}
.bottom-fifth-col {
	width: 200px;
	padding: 3px 10px;
}
.bottom-normal-row {
	border-bottom: solid 2px gray;
	text-align: center;
	height: 40px;
}
button {
	background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}
.editComplete {
	display: none;
}
.editCancel {
	background-color: gray;
	display: none;
}
.save {
	display: none;
}
.absent {
	background-color: red;
	display: none;
}
.edit {
	background-color: rgb(68, 68, 68);
	display: none;
}
.lesson {
	width: 100%
}
.stop {
	background-color: red;
}
.bottom {
	text-align: center;
}
.reviewWrite {
	display: none;
}
.hidden {
	display: none;
}
.red {
	color: red;
}
.editNotice {
	display: none;
}
.inputNotice {
	display: none;
}
</style>
</head>
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
    <div id="content">
    	<br/><br/><br/>
        <table class="topTable">
        	<tr class="topRow">
        		<th class="top-first-col">강의명</th>
        		<td class="top-second-col"><b>${lessonInfo.class_name}</b></td>
        		<th class="top-first-col">강의 시작일</th>
        		<td class="top-second-col"><b>${lessonInfo.start_date}</b></td>
        	</tr>
        	<tr>
        		<th class="top-first-col">
        			<c:if test="false">
        				<img src="/photo/${studentProfile.new_filename}" class="profileImg">
        			</c:if>
        			<c:if test="true">
        				<img src="resources/img/basic_user.png" class="profileImg">
        			</c:if>
        		</th>
        		<td class="top-second-col right-border">
        			${studentProfile.user_name} 수강생
        			<br/><br/>
        			<small class="gray">${studentProfile.user_id}</small>
        		</td>
        		<th class="top-first-col">
        			<c:if test="false">
        				<img src="/photo/${teacherProfile.new_filename}" class="profileImg">
        			</c:if>
        			<c:if test="true">
        				<img src="resources/img/basic_user.png" class="profileImg">
        			</c:if>
        		</th>
        		<td class="top-second-col">
        			${teacherProfile.user_name} 강사
        			<br/><br/>
        			<small class="gray">${teacherProfile.user_id}</small>
        		</td>
        	</tr>
        	<tr>
        		<th class="top-first-col">이메일</th>
        		<td class="top-second-col right-border">${studentProfile.user_email}</td>
        		<th class="top-first-col">이메일</th>
        		<td class="top-second-col">${teacherProfile.user_email}</td>
        	</tr>
        	<tr>
        		<th class="top-first-col">전화번호</th>
        		<td class="top-second-col right-border">${studentProfile.user_phone}</td>
        		<th class="top-first-col">전화번호</th>
        		<td class="top-second-col">${teacherProfile.user_phone}</td>
        	</tr>
        </table>
        <br/><br/><br/>
        <form action="lessonLogWrite.do" method="post">
	        <table id="bottomTable">
	        	<tr>
					<td colspan="5">
						&nbsp;&nbsp;&nbsp;<b>강의 일지</b><br/><br/>
					</td>
				</tr>
				<tr class="bottom-first-row">
					<th class="bottom-first-col">회차</th>
					<th class="bottom-second-col">내용</th>
					<th class="bottom-third-col">수업일자</th>
					<th class="bottom-fourth-col">작성일자</th>
					<th class="bottom-fifth-col"></th>
				</tr>
				<c:forEach items="${logList}" var="log" varStatus="status">
					<c:if test="${log.ch_result ne '강의 종료'}">
						<tr class="bottom-normal-row">
							<td class="bottom-first-col">${status.index + 1}</td>
							<td class="bottom-second-col">${log.ch_content}</td>
							<td class="bottom-third-col">${log.ch_date}</td>
							<td class="bottom-fourth-col">${log.ch_write_date}</td>
							<th class="bottom-fifth-col"><button class="save" type="button">저장</button>&nbsp;<button class="edit" type="button">수정</button>&nbsp;<button class="editComplete" type="button">수정 완료</button>&nbsp;<button class="absent" type="button">결석</button>&nbsp;<button class="editCancel" type="button">수정 취소</button></th>
						</tr>
					</c:if>
				</c:forEach>
	        </table>
	    &nbsp;&nbsp;&nbsp;<small class="red inputNotice">(입력한 강의일지는 삭제할 수 없습니다. 신중하게 입력해주세요.)</small>
		&nbsp;&nbsp;&nbsp;<small class="red editNotice">(결석으로 수정할 경우 내용에 '결석' 이라고 입력해주세요.)</small>
        <input type="text" value="${lessonInfo.apply_idx}" name="apply_idx" class="hidden"/>
        </form>
        <br/>
        <div class="bottom">
        	<button class="stop" type="button">강의 중단</button>
        	<button class="reviewWrite" type="button">리뷰 작성</button>
        </div>
        <br/><br/><br/><br/><br/><br/>
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

var content = '';
content = $('#bottomTable').html();

var total_times = parseInt('${lessonInfo.total_times}');
var accumulate_times = parseInt('${lessonInfo.accumulate_times}');

if ('${check}' != '') {
	accumulate_times -= 1;	
}


console.log(accumulate_times);

if ('${sessionScope.user_type}' == '수강생') {
	$('.stop').css('display', 'none');
}

for (var i = accumulate_times + 1; i <= total_times; i++) {
	
	content += '<tr class="bottom-normal-row">';
	content += '<td class="bottom-first-col">' + i + '</td>';
	content += '<td class="bottom-second-col"></td>';
	content += '<td class="bottom-third-col"></td>';
	content += '<td class="bottom-fourth-col"></td>';
	content += '<th class="bottom-fifth-col"><button class="save" type="button">저장</button>&nbsp;<button class="edit" type="button">수정</button>&nbsp;'
	content += '<button class="editComplete" type="button">수정 완료</button>&nbsp;<button class="absent" type="button">결석</button>';
	content += '&nbsp;<button class="editCancel" type="button">수정 취소</button></th>';
	content += '</tr>';
}

$('#bottomTable').html(content);

for (var i = i; i < total_times; i++) {
	$('.bottom-first-col').eq(i).html(i);
}

for (var i = 0; i < accumulate_times; i++) {
	if ('${sessionScope.user_type}' == '강사') {
		$('.edit').eq(i).css('display', 'inline-block');
	}
}

// <input type="text" class="lesson contentBox" name="content"/>
// <input type="date" class="lesson date" name="date"/>
// <button class="save" type="button">저장</button>&nbsp;<button class="edit" type="button">수정</button>&nbsp;
// <button class="editComplete" type="button">수정 완료</button>&nbsp;<button class="absent" type="button">결석</button></br>
// <button class="editCancel" type="button">수정 완료</button>

var backUpData1 = [];
var backUpData2 = [];

if ('${sessionScope.user_type}' == '강사') {
	$('.inputNotice').css('display', 'inline-block');
	
	if (total_times != accumulate_times) {
		
		$('.bottom-second-col').eq(accumulate_times + 1).html('<input type="text" class="lesson contentBox" name="content"/>');
		$('.bottom-third-col').eq(accumulate_times + 1).html('<input type="date" class="lesson date" name="date"/>');
		$('.save').eq(accumulate_times).css('display', 'inline-block');
		$('.absent').eq(accumulate_times).css('display', 'inline-block');
	}
	
	
	$('.edit').click(function (){
		var index = $('.edit').index(this);
		
		$('.bottom-first-col').eq(index + 1).html(index + 1 + '<input type="text" value="' + index + '" name="index" class="hidden"/>');
		// console.log(index);
		$('.save').eq(accumulate_times).css('display', 'none');
		$('.absent').eq(accumulate_times).css('display', 'none');
		$('.edit').css('display', 'none');
		
		backUpData1[0] = index;
		backUpData1[1] = $('.bottom-second-col').eq(index + 1).html();
		backUpData2[0] = index;
		backUpData2[1] = $('.bottom-third-col').eq(index + 1).html();
		// console.log(backUpData1);
		
		$('.bottom-second-col').eq(index + 1).html('<input type="text" class="lesson contentBox" name="content"/>');
		$('.bottom-third-col').eq(index + 1).html('<input type="date" class="lesson date" name="date"/>');
		$('.bottom-second-col').eq(accumulate_times + 1).html('');
		$('.bottom-third-col').eq(accumulate_times + 1).html('');
		$('.editComplete').eq(index).css('display', 'inline-block');
		$('.editCancel').eq(index).css('display', 'inline-block');
		$('.editNotice').css('display', 'inline-block');
		$('.inputNotice').css('display', 'none');
	});
	
	$('.editCancel').click(function (){
		var index = backUpData1[0];
		console.log(backUpData1[1]);
		
		$('.bottom-first-col').eq(index + 1).html(index + 1);
		
		$(this).css('display', 'none');
		$('.editComplete').eq(index).css('display', 'none');
		// console.log(backUpData1);
		$('.bottom-second-col').eq(index + 1).html(backUpData1[1]);
		$('.bottom-third-col').eq(index + 1).html(backUpData2[1]);
		$('.bottom-second-col').eq(accumulate_times + 1).html('<input type="text" class="lesson contentBox" name="content"/>');
		$('.bottom-third-col').eq(accumulate_times + 1).html('<input type="date" class="lesson date" name="date"/>');
		$('.save').eq(accumulate_times).css('display', 'inline-block');
		$('.absent').eq(accumulate_times).css('display', 'inline-block');
		$('.editNotice').css('display', 'none');
		$('.inputNotice').css('display', 'inline-block');
		
		for (var i = 0; i < accumulate_times; i++) {
			$('.edit').eq(i).css('display', 'inline-block');
		}
	});
	
}

if ('${check}' != '') {
	$('.reviewWrite').css('display', 'inline-block');
	$('.stop').css('display', 'none');
	$('.inputNotice').css('display', 'none');
}


$('.editComplete').click(function (){
	
	var $contentBox = $('.contentBox');
	var $date = $('.date');
	
	var result = confirm("수정하시겠습니까?");
	if (result) {
		if ($contentBox.val() == '') {
			alert('내용을 입력해주세요.');
			$contentBox.focus();
		} else if ($date.val() == '') {
			alert('날짜를 입력해주세요.');
			$date.focus();
		} else {
			$('form').attr('action', 'lessonLogEdit.do');
			$('form').submit();
		}
	}
});
$('.save').click(function (){
	var $contentBox = $('.contentBox');
	var $date = $('.date');
	
	var result = confirm("저장하시겠습니까?");
	if (result) {
		if ($contentBox.val() == '') {
			alert('내용을 입력해주세요.');
			$contentBox.focus();
		} else if ($date.val() == '') {
			alert('날짜를 입력해주세요.');
			$date.focus();
		} else {
			$('form').submit();
		}
	}
});
$('.absent').click(function (){
	var $date = $('.date');
	
	var result = confirm("결석 처리하시겠습니까?");
	if (result) {
		if ($date.val() == '') {
			alert('날짜를 입력해주세요.');
			$date.focus();
		}else {
			$('form').attr('action', 'lessonAbsent.do');
			$('form').submit();
		}
	}
});
$('.stop').click(function (){
	var result = confirm("강의 중단하시겠습니까?");
	if (result) {
		$('form').attr('action', 'lessonStop.do');
		$('form').submit();
	}
});

$('.reviewWrite').click(function (){
	var class_idx = '${lessonInfo.class_idx}';
	var ratee_id = '';
	if ('${sessionScope.user_type}' == '수강생') {
		ratee_id = '${teacherProfile.user_id}';
	}else if ('${sessionScope.user_type}' == '강사') {
		ratee_id = '${studentProfile.user_id}';
	}
	location.href = 'lessonReviewWrite.go?class_idx=' + class_idx + '&user_id=' + ratee_id;
	
});

if ('${check}' != '') {
	$('.save').css('display', 'none');
	$('.absent').css('display', 'none');
	$('.edit').css('display', 'none');
	$('.contentBox').css('display', 'none');
	$('.date').css('display', 'none');
}


</script>
</html>