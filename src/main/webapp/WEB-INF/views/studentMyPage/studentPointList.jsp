<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 내역</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
		#sidemenu {
		    background-color: #F0FAFF;
		    color: black;
		    padding: 10px;
		    text-align: center;
		    width: 220px;
		    height: 964px;
		}

		img {
		    min-width: 50px;
		    min-height: 50px;
		    max-width: 70px;
		    max-height: 70px;
		}

		#logo {
		    width: 70px;
		    height: 70px;
		    cursor: pointer;
		}

		#usermain {
		    background-color: #BEE6FF;
		    color: #fff;
		    padding: 10px;
		    text-align: center;
		    height: 96px;
		}
		.h3, h3 {
		    font-size: 20px;
		    margin-bottom: 20px;
		    font-weight: bold;
		}
		hr {
		    display: block;
		    margin-top: 20px;
		    margin-block-start: 0.5em;
		    margin-block-end: 0.5em;
		    margin-inline-start: auto;
		    margin-inline-end: auto;
		    unicode-bidi: isolate;
		    overflow: hidden;
		    border-style: inset;
		    border-width: 1px;
		    margin-bottom: 10px;
		}
		.main {
		    font-size: 20px; 
		    #contents{
		    font-size: 15px;}
		}
		.main {
		    font-size: 20px; 
		}
		a {
		    font-size: 16px;
		    color: black;
		    text-decoration: none;
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
    <div id="wrapper">
            <div id="sidemenu">
                <h3>포인트 내역</h3>
                <hr/>
                <a href="studentPage.go">마이페이지</a>
                <a href="studentPageEdit.go">개인 정보 수정</a>
                <a href="favoriteList.go">즐겨찾기 강사</a>
                <a href="blockList.go">숨김 강사</a>
                <a href="studentQnAList.go">내가 작성한 Q&A</a>
                <a href="studentPointList.go">포인트 내역</a>
                <a href="studentReceivedList.go">내가 받은 리뷰</a>
                <a href="studentWrittenList.go">내가 작성한 리뷰</a>
                <a href="studentAttendedList.go">수강 이력</a>
            </div>
 			<div id="content" style="margin-left:50px; width : 1140px;">
					<div id="top" style="display: flex; justify-content: center; align-items: center; flex-direction: column; height: 130px; background-color : #F0FAFF; margin-right : 50px;margin-top : 50px; margin-bottom : 50px;">
					    <span style="text-align: left; width: 1000px; font-size: 28px; line-height: 100px;">
					    ${sessionScope.loginId}님의 잔여 포인트 ${sessionScope.point} P</span>
					</div>
 			
                <table style="width: 100%;">
                    <!-- 검색 부분은 그대로 유지 -->
                </table>
                <table style="border-collapse: collapse; width: 100%;">
              	   <thead style="background-color: #f2f2f2;">
						<tr>
						    <th style="padding: 8px; text-align: center;">날짜</th>
						    <th style="padding: 8px; text-align: center;">구분</th>
						    <th style="padding: 8px; text-align: center;">금액</th>
						    <th style="padding: 8px; text-align: center;">잔액</th>
						    <th style="padding: 8px; text-align: center;">비고</th>
						</tr>
					</thead>
                    <tbody id="list">
                        <!-- 여기에 목록이 자동으로 삽입됩니다 -->
                    </tbody>
                </table>
                <div class="container">
                    <nav aria-label="Page navigation" style="text-align:center">
                        <ul class="pagination" id="pagination"></ul>
                    </nav>
                </div>
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
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
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



var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	pointListCall(showPage);
});

function pointListCall(page, loginId) {
    $.ajax({
        type: 'get',
        url: './pointList.ajax',
        data: {
            'page': page,
            'cnt': 10,
            'loginId': loginId // 사용자의 ID를 전달하여 필터링
        },
        dataType: 'json',
        success: function(data) {
            drawList(data.list);
            console.log(data);
            // 플러그인 추가
            var startPage = data.currPage > data.totalPages ? data.totalPages : data.currPage;

            $('#pagination').twbsPagination({
                startPage: startPage, // 시작페이지
                totalPages: data.totalPages, // 총 페이지 갯수
                visiblePages: 5, // 보여줄 페이지 수 [1][2][3][4][5]
                onPageClick: function(evt, pg) { // 페이지 클릭시 실행 함수
                    console.log(evt); // 이벤트 객체
                    console.log(pg); // 클릭한 페이지 번호
                    showPage = pg;
                    pointListCall(pg, loginId); // 페이지 번호와 로그인된 사용자의 ID 전달
                }
            });
        },
        error: function(request, status, error) {
            alert('서버와의 통신 중 문제가 발생했습니다. 다시 시도해주세요.');
            console.log("code: " + request.status)
            console.log("message: " + request.responseText)
            console.log("error: " + error);
        }
    });
}





	function drawList(list) {
	    var content = '';
	    for (var i = 0; i < list.length; i++) {
	        var point = list[i];
	
	        content += '<tr style="border-bottom: 1px solid #ddd; height: 40px;">'; // 각 항목에 경계선 추가
	        content += '<td style="text-align: center;">' + new Date(point.point_date).toLocaleDateString() + '</td>'; // 날짜
	        content += '<td style="text-align: center; height: 30px;">' + point.point_type + '</td>'; // 구분
	        content += '<td style="text-align: center; height: 30px;">' + point.point + '</td>'; // 금액 증감
	        content += '<td style="text-align: center; height: 30px;">' + point.balance + '</td>'; // 잔액
	        content += '<td style="text-align: center; height: 30px;">' + point.etc + '</td>'; // 비고
	        content += '</tr>';
	    }
	    $('#list').html(content); // 리스트를 테이블에 추가
	}


</script>
</html>