<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#contentTable{
	width: 900px;
	margin: 0 auto;
}
#contentTable th, #contentTable td {
	padding: 10px;
}
#editMenu {
	float: right;
}
.locked {
	width: 20px;
	height: 20px;
	vertical-align: bottom;
}
#editMenu {
	font-weight: 900;
}
.eyes {
	width: 20px;
	height: 20px;
	vertical-align: bottom;
}
#sugContent {
	height: 400px;
}
.contentPhoto {
	width: 300px;
	height: 300px;
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
    <div>
    	<br/><br/><br/><br/>
        <table id="contentTable">
        	<thead>
        		<tr>
        			<td>
        				<c:if test="${dto.sug_secret eq 1}">
        					<span><img src="resources/img/locked.png" class="locked"/>&nbsp;&nbsp;<b>${dto.sug_title}</b></span>
        					<span id="editMenu">&hellip;</span>
        				</c:if>
        				<c:if test="${dto.sug_secret eq 0}">
        					<span><b>${dto.sug_title}</b></span>
        					<span id="editMenu">&hellip;</span>
        				</c:if>
        			</td>
        		</tr>
        		<tr>
        			<td>
        				<span><b>${dto.user_name}</b>(${dto.user_id})&nbsp;&nbsp;&nbsp;&nbsp;${dto.sug_reg_date}</span>&nbsp;&nbsp;&nbsp;&nbsp;
        				<span><img src="resources/img/eyes.png" class="eyes"/>&nbsp;&nbsp;${dto.sug_views}</span>
        			</td>
        		</tr>
        		<tr><td><hr/></td></tr>
        	</thead>
        	<tbody>
        		<tr>
        			<td>
        				<div id="sugContent">${dto.sug_content}</div>
        			</td>
        		</tr>
        		<c:if test="${photos.size() > 0}">
        			<tr>
        				<td>
        					<c:forEach items="${photos}" var="photo">
        						<img src="/photo/${photo.new_filename}" class="contentPhoto"/><br/>
        					</c:forEach>
        				</td>
        			</tr>
        		</c:if>
        		<tr><td><hr/></td></tr>
        		<c:if test="${dto.sug_answer_idx ne ''}">
	        		<tr>
	        			<td><b>답변</b></td>
	        		</tr>
        		</c:if>
        	</tbody>
        	<tfoot></tfoot>
        </table>
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

</script>
</html>