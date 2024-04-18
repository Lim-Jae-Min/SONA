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
		    #contents{
		    font-size: 15px;
		}
		.main {
		    font-size: 20px; 
		}
</style>
</head>
<body>
<body>
    <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="#">추천 강의</a></th>
                <th class="menu"><a href="#">전체 강의</a></th>
                <th class="menu"><a href="#">고객센터</a></th>
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
                    <th><a href="#">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    <div id="wrapper">
            <div id="sidemenu">
                <h3>마이페이지</h3>
                <hr/>
                <a href="#">마이페이지</a>
                <a href="#">개인 정보 수정</a>
                <a href="#">즐겨찾기 강사</a>
                <a href="#">숨김 강사</a>
                <a href="#">내가 작성한 Q&A</a>
                <a href="#">포인트 내역</a>
                <a href="#">내가 받은 리뷰</a>
                <a href="#">내가 작성한 리뷰</a>
                <a href="#">수강 이력</a>
            </div>
       <div id="content">
            <table style="width: 100%;">
                <thead>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        &nbsp;<td rowspan="2" style="width: 70px;"><img src="../img/account_box.png" style="margin-left: 30px;"  id="account"></td>
                        <td class="main" style="padding-right: 500px;">User 수강생<br>seajnu15</td>
                        <td style="width: 80%; min-width: 150px; text-align: right;">
                            <img src="../img/heart.png" style="margin-right: 30px; width: 20px; height: 20px;" id="heart">44.5
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 <span class="contents" style="margin-left: 100px; width: 200px; display: inline-block;">sewq naver.com</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 <span class="contents" style="margin-left: 80px; width: 200px; display: inline-block;">010-2312-1212</span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호 
                            <span class="contents" style="margin-left: 80px; width: 400px; display: inline-block;">국민은행 12321039123099</span>
                        </td>                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;잔여 포인트 
                            <span class="contents" style="margin-left: 60px; width: 200px; display: inline-block;">55500P</span>
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            <button>충전</button> &nbsp;
                            <button>출금</button>
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
        <div><a href="#">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="#">로그아웃</a></div>
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


</script>
</html>