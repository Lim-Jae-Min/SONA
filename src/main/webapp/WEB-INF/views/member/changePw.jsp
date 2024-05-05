<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
	#findForm {
		max-width: 300px; /* 폼의 최대 너비 설정 */
		margin: 0 auto; /* 좌우 중앙 정렬 */
		position: absolute; /* 위치를 절대값으로 설정 */
		top: 50%; /* 상단 위치를 화면 세로 중앙에 */
		left: 50%; /* 좌측 위치를 화면 가로 중앙에 */
		transform: translate(-50%, -50%); /* 수평 및 수직으로 50% 이동하여 정중앙에 */
		text-align: center; /* 텍스트 중앙 정렬 */
	}

	/* 입력 필드 스타일 */
	.form-group {
		margin-bottom: 20px; /* 입력 필드 간격 설정 */
	}

	input[type="text"], input[type="password"] {
		width: 100%; /* 입력 필드 너비 설정 */
		padding: 10px; /* 입력 필드 안 여백 설정 */
		font-size: 16px; /* 폰트 크기 설정 */
		border: 1px solid #ccc; /* 테두리 스타일 설정 */
		border-radius: 5px; /* 테두리 모서리 둥글게 설정 */
	}

	/* 제출 버튼 스타일 */
	#id-find {
		display: block; /* 블록 요소로 설정하여 가로 너비 전체 차지 */
		width: 100%; /* 버튼 너비 설정 */
		padding: 10px; /* 버튼 안 여백 설정 */
		font-size: 16px; /* 폰트 크기 설정 */
		background-color: #007bff; /* 배경색 설정 */
		color: #fff; /* 글자색 설정 */
		border: none; /* 테두리 없음 */
		border-radius: 5px; /* 모서리 둥글게 설정 */
		cursor: pointer; /* 커서 모양 변경 */
	}

	#id-find:hover {
		background-color: #0056b3; /* 호버 상태 배경색 변경 */
	}
	
	.input-group {
		position: relative;
		display: inline-block;
	}
	
	/* 버튼 스타일 */
	.input-group button {
		position: absolute;
		top: 50%;
		right: 5px; /* 또는 원하는 위치로 조정 */
		transform: translateY(-50%);
	}
	
	#footer {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
		padding: 10px; /* 여백 지정 */
		border-top: 1px solid #ccc; /* 윗부분 테두리 추가 */
	}
	
		.btn {
		display: inline-block;
		padding: 10px 20px;
		font-size: 16px;
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		text-decoration: none;
		margin-right: 10px;
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


	<form id="findForm" method="post">
		<input type="hidden" name="changePwNeedId" value=${changePwNeedId}>
		<div class="form-group input-group">
			<input type="password" name="newPassword" id="newPassword"
				placeholder="새로운 비밀번호">
		</div>
		<div class="form-group input-group">
			<input type="password" name="confirmPassword" id="confirmPassword"
				placeholder="비밀번호 확인">
		</div>
		<button type="button" id="changePw" onclick="changePassword()" class="btn">비밀번호
			변경</button>

	</form>

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

	function changePassword() {
		var password = $('input[name="newPassword"]').val();
		var confirmPassword = $('input[name="confirmPassword"]').val();
		console.log(confirmPassword + password);
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
		} else {
			alert("비밀번호가 변경 되었습니다.");
			$('#findForm').attr("action", "changePw.do").submit();

		}
	};
	
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