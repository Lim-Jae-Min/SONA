<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#contentTable {
	margin: 0 auto;
	width: 900px;
}
#sug_title {
	width: 500px;
}
#sugContent {
	width: 100%;
	height: 300px;
	resize: none;
}
.right {
	float: right;
}
button {
	background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
   	width: 70px;
}
#goList {
	background-color: gray;
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
    <div>
    	<br/><br/><br/><br/>
    	<form action="suggestionsWrite.do" method="post" enctype="multipart/form-data">
    		<table id="contentTable">
	        	<tr>
	        		<td><b>건의사항 작성</b></td>
	        	</tr>
	        	<tr><td><hr/></td></tr>
	        	<tr>
	        		<td>
	        			<span>제목</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			<input type="text" name="sug_title" placeholder="제목을 입력해주세요." id="sug_title"/>
	        		</td>
	        	</tr>
	        	<tr><td><hr/></td></tr>
	        	<tr><td>내용</td></tr>
	        	<tr>
	        		<td>
	        			<textarea name="sug_content" placeholder="내용을 입력해주세요." id="sugContent"></textarea>
	        		</td>
	        	</tr>
	        	<tr><td><hr/></td></tr>
	        	<tr>
	        		<td>
	        			<span>
	        				<input type="file" name="sug_photos" multiple="multiple" id="photos"/>
	        			</span>
	        			<span class="right">
	        				<input type="radio" name="sug_secret" value="0"/>공개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				<input type="radio" name="sug_secret" value="1"/>비공개
	        			</span>
	        		</td>
	        	</tr>
	        	<tr><td><br/></td></tr>
	        	<tr><td><br/></td></tr>
	        	<tr>
	        		<td>
	        			<span class="right">
	        				<button type="button" id="sugSubmit">작성</button>
	        				<button type="button" id="goList">돌아가기</button>
	        			</span>
	        		</td>
	        	</tr>
	        </table>
    	</form>
    	<br/><br/><br/><br/><br/>
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
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});

$('#goList').click(function (){
	location.href = 'suggestionsList.go';
});

$('#sugSubmit').click(function (){
	var result = confirm('작성하시겠습니까?')
	
	var $sug_title = $('input[name="sug_title"]');
	var $sug_content = $('textarea[name="sug_content"]');
	
	if (result) {
		if ($sug_title.val() == '') {
			alert('제목을 입력해주세요.');
			$sug_title.focus();
		}else if ($sug_content.val() == '') {
			alert('내용을 입력해주세요.');
			$sug_content.focus();
		}else {
			$('form').submit();
		}
	}
});

</script>
</html>