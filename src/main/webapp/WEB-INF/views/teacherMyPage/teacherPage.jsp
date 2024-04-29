<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
		.main {
		    font-size: 20px;
		}
		.profile {
			width: 100px;
			height: 100px;
		}
		
		#heart{
			margin-right: 3px;
		 	width: 20px; 
		 	height: 20px;
		}
		hr {
		width: 100%; 
		border: none; 
		border-bottom: 1px solid black; 
		margin-top: 5px;
		}
		.profile_s{
		width: 100px;
		}	
		button{
		background-color:  #BEE6FF; 
		color: black; border: none;
		padding: 10px 20px;
		text-align: center;
		display: inline-block; 
		font-size: 16px; margin: 4px 2px; 
		cursor: pointer; border-radius: 4px;"
		}
		.content{
		width: 100%;
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
    <div id="wrapper">
    <div id="sidemenu">
        <h3>마이페이지</h3>
        <hr/>
        <a href="teacherPage.go">마이페이지</a>
        <a href="teacherPageEdit.go">개인 정보 수정</a>
        <a href="teacherLessonList.go">강의 관리</a>
        <a href="teacherStudentList.go">수강생 관리</a>
        <a href="teacherQnaList.go">강의 Q&A 관리</a>
        <a href="teacherPointList.go">포인트 내역</a>
        <a href="teacherReceivedList.go">내가 받은 리뷰</a>
        <a href="#">내가 작성한 리뷰</a>
    </div>
            
    <div>     
        <table style="width: 100%;">
            <thead>
                <tr> 
                    <td id="profile_s">
                        <c:if test="${userInfo.profile != null}">
                            <img src="/photo/${userInfo.profile}" class="profile">
                        </c:if>
                        <c:if test="${userInfo.profile == null}">
                            <img src="resources/img/basic_user.png" class="profile">
                        </c:if>
                    </td>
                    <td class="main">
                        <span style="width: 200px;">${userInfo.user_name} ${userInfo.user_type}</span><br><br>
                        ${userInfo.user_id}
                    </td>
                    <td style="width: 60%; min-width: 150px; text-align: right;">
                        <img src="resources/img/heart.png"  id="heart" style="vertical-align: middle;">
                        <span style="vertical-align: middle;">${sessionScope.manner_variance}</span>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="3" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                </tr>
                <tr>
                    <td class="main" colspan="3" style="width: 100%; text-align: left;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 
                        <span class="contents" style="margin-left: 100px; width: 200px; display: inline-block;">
                            ${userInfo.user_email}
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                </tr>
                <tr>
                    <td class="main" colspan="3" style="width: 100%; text-align: left;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 
                        <span class="contents" style="margin-left: 80px; width: 200px; display: inline-block;">
                            ${userInfo.user_phone}
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                </tr>
                <tr>
                    <td class="main" colspan="3" style="width: 100%; text-align: left;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;은행
                        <span class="contents" style="margin-left: 120px; width: 400px; display: inline-block;">
                            ${userInfo.user_bank}
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                </tr>
                <tr>
                    <td class="main" colspan="3" style="width: 100%; text-align: left;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호 
                        <span class="contents" style="margin-left: 80px; width: 400px; display: inline-block;">
                            ${userInfo.user_accountnumber}
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                </tr>
                <tr>
                    <td class="main" colspan="3" style="width: 100%; text-align: left;">
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잔여 포인트 
                        <span class="contents" style="margin-left: 60px; width: 200px; display: inline-block;">
                            ${sessionScope.point} P
                        </span>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        <button onclick="window.location.href='withdrawPoint.go';" >출금</button>
                    </td>
                </tr>
            </tbody>    
        </table>
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
$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
});

$('#logo').click(function main(){
	   location.href = '/main';
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