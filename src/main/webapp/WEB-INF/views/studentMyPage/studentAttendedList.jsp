<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>수강 이력</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	  #progress {
        position: relative;
        appearance: none;
      }
      
      #progress::-webkit-progress-bar {
        background: #f0f0f0;
        border-radius: 12px;
        border: 1px solid #eeeeee;
        overflow: hidden;
      }

      #progress::-webkit-progress-value {
        background: #fdd4d6;
        border-radius: 0px;
      }



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
                <h3>수강 이력</h3>
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
 			<div id="content" style="width : 1100px;margin-left : 50px;margin-right : 50px;
				    margin-top : 50px;margin-bottom : 50px;">
				   
 			
                <table style="width: 100%;">
                    <!-- 검색 부분은 그대로 유지 -->
                </table>
                <table style="border-collapse: collapse; width: 100%;">
               <thead style="background-color: #f2f2f2;">
					    <tr>
					        <th style=" padding: 8px; text-align: center;">No</th>
					        <th style=" padding: 8px; text-align: center;">강의 제목</th>
					        <th style=" padding: 8px; text-align: center;">강사</th>
					        <th style=" padding: 8px; text-align: center;">가격</th>
					        <th style=" padding: 8px; text-align: center;">진행률</th>
					        <th style=" padding: 8px; text-align: center;">상태</th>
					        <th style=" padding: 8px; text-align: center;">신청날짜</th>					        
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
$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});

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

var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	courseListCall(showPage);
});

function courseListCall(page, loginId) {
    $.ajax({
        type: 'get',
        url: './courseList.ajax',
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
                    courseListCall(pg, loginId); // 페이지 번호와 로그인된 사용자의 ID 전달
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

function convertToPercentage(course) {
    // course.lesson_progress가 null이면 처리하지 않고 그대로 반환
    if (course == null || course.lesson_progress == null) {
        return '0'; // 데이터가 없는 경우 0% 반환
    } else {
    	var index1 = course.lesson_progress.indexOf('(');
    	var index2 = course.lesson_progress.indexOf(')');
    	
    	// "수업 완료"를 제거하고 남은 문자열에서 숫자 부분을 추출
        // var progressStr = course.lesson_progress.replace("수업 완료(", "").replace(")", "");
        var progressStr = course.lesson_progress.substring(index1 + 1, index2 + 1);
    	
    	// "/"를 기준으로 분자와 분모로 나눔
        var parts = progressStr.split("/");
        // 분자와 분모를 숫자로 변환하여 계산
        var numerator = parseFloat(parts[0]);
        var denominator = parseFloat(parts[1]);
        // 백분율 계산
        var percentage = (numerator / denominator) * 100;

        // 소수점 이하가 있는 경우에만 소수점을 제거하고, 그 외의 경우에는 그대로 출력
        var formattedPercentage = Number.isInteger(percentage) ? percentage.toFixed(0) : percentage.toFixed(2);
        return formattedPercentage;
    }
}

function drawList(list) {
    var content = '';
    for (var i = 0; i < list.length; i++) {
        var course = list[i];
        var totalCount = list.length; // 리스트의 총 개수

        // 진행률 게이지 바 색상 설정
     	var gaugeColor = "white"; // 진행이 안된 바는 흰색으로 설정

		if (convertToPercentage(course) !== '') {
		    // 진행률이 있는 경우에만 회색으로 설정
		    gaugeColor = "green";
		}; 
        
        
        if (convertToPercentage(course) === '') {
            continue; // 다음 반복으로 넘어감
        }
        
        if (course.end_check == null){
			if (course.apply_state =="수락 완료"){
		        course.apply_state ="결제 대기";
		    }else if(course.apply_state =="신청 완료"){
		        course.apply_state = "결제 대기";
		    }
            course.end_check = course.apply_state;
        }
    

        content += '<tr style="border-bottom: 1px solid #ddd; height: 50px;">'; // 각 항목에 경계선 추가
        content += '<td style="text-align: center;">' + (totalCount - i) + '</td>'; // 총 개수에서 현재 인덱스를 뺀 번호를 출력
	     if (course.apply_state === '결제 완료') {
	         content += '<td style="text-align: center;">' +
	             '<a href="lessonLog.go?apply_idx=' + course.apply_idx + '">' + course.class_name + '</a>' +
	             '</td>'; // 제목을 클릭하면 해당 강의일지의 세부 정보 페이지로 이동
	     } else {
	         content += '<td style="text-align: center;">' +
	             '<a href="lessonPayment.go?class_idx=' + course.class_idx + '">' + course.class_name + '</a>' +
	             '</td>'; // 제목을 클릭하면 해당 강의의 결제 페이지로 이동
	     }
	     content += '<td style="text-align: center;">' +
	        '<a href="./userDetail.go?user_id=' + course.user_id + '">' + course.teacher_name + '</a>' +
	        '</td>'; // 선생님 이름
        content += '<td style="text-align: center;">' + course.class_price + '</td>'; // 가격
        // 진행률 게이지 바 추가
		content += '<td style="text-align: center;">';
		if (course.apply_state == '결제 완료') {
		    content += '<progress max="100" value="' + convertToPercentage(course) + '" id = "progress";"></progress><br>' +
		        convertToPercentage(course) + '%';
		}
		content += '</td>';
        if (course.end_check !== null) {
            content += '<td style="text-align: center;">' + course.end_check + '</td>'; // 상태
        }
        content += '<td style="text-align: center;">' + new Date(course.apply_date).toLocaleDateString() + '</td>'; // 날짜

        content += '</tr>';
    }        
    $('#list').html(content); // 리스트를 테이블에 추가
}
</script>
</html>