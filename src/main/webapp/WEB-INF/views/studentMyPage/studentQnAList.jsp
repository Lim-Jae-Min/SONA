<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>

		.multiclickresult{
		   display: none;
		}
		
		#searchButton{
		    width: 20px;
		    height: 20px;		
		
		}
		#search{
		    width: 20px;
		    height: 20px;		
		
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
		    min-width: 20px;
		    min-height: 20px;
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
				
		.pagination {
		    display: inline-block;
		    padding-left: 0;
		    margin: 20px 0;
		    border-radius: 4px;
		    margin-left: -259px;
		}
		
		#nav__bar{
		 text-align:center;
		 margin-left:251px;
		}
		
		
			
		#list-container {
		    margin-top: 30px;
		}
				
		#tab {
		    display: inline-block;
		    border: 2px solid #BEE6FF;
		    border-radius: 15px;
		    padding: 10px;
		    margin-bottom: 10px;
		    margin-left: 98px;
		    width: 93%;
		}
		
		#tab th,
	    #tab td {
	        padding: 8px; /* 각 셀의 패딩 조절 */
	        width:auto;
	        max-width: 200px; /* 각 셀의 최대 너비 설정 */
	        overflow: hidden; /* 텍스트 넘침 처리 */
	        text-overflow: ellipsis; /* 텍스트 넘침 시 생략 부호(...) 표시 */
	        white-space: nowrap; /* 텍스트가 너무 길어도 줄바꿈 없이 한 줄에 표시 */
	        text-align: center;
	    }

		#tab th {
	        border-bottom: 3px solid #BEE6FF;
	        padding: 8px;
	        font-size: 18px;
		}
		#list tr.list-item td {
		    border-top: 1px solid #BEE6FF; /* 바디의 각 행에 위쪽에 1픽셀 두께의 회색 선 추가 */
		}
		
		#list tr.list-item:first-child td {
		    border-top: none; /* 첫 번째 바디 행에는 위쪽 선을 없앱니다. */
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
                <h3>내가 작성한 Q&A</h3>
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
 			<div id="content" style="margin-left:50px; width : 1140px">
				   <div id="top">
					    <br/>
					    <br/><br/>
							<span id="searchbox" style="margin-right: 50px; margin-bottom: 130px; height: 50px; position: relative;">
							    <label for="condition" style="margin-left: 60px; margin-bottom: 30px;">강의명 :</label>
							      <select name="condition" id="condition" style="margin-left:7px; width: 850px;">
									    <option style="margin-left: 50px; width: 700px" value="전체" >전체</option>
									    <c:forEach items="${classNames}" var="class_name">
											<option value="${class_name}" <c:if test="${selectedClass eq class_name}">selected</c:if>>${class_name}</option>
										</c:forEach>
									</select>
							    <button id="searchButton" style="position: absolute; top: 0; right: 0; padding: 5px;">
							        <img src="resources/img/search.png" id = "search" alt="Search" style="width: 20px;height: 20px;margin-bottom : 20px; position : relative; margin-right:5px;">
							    </button>
							</span>
					        <br><br>
					</div>
 			
                <table style="width: 100%;">
                    <!-- 검색 부분은 그대로 유지 -->
                </table>
                <table style="border-collapse: collapse; width: 100%;">
           		    <thead style="background-color: #f2f2f2;">
					    <tr>
							<th style="padding: 8px; width: 20%; text-align: center;">익명여부</th>
							<th style="padding: 8px; width: 50%; text-align: center;">제목</th>
							<th style="padding: 8px; text-align: center;">답변 여부</th>
							<th style="padding: 8px; text-align: center;">날짜</th>
					    </tr>
					</thead>
                    <tbody id="list">
                        <!-- 여기에 목록이 자동으로 삽입됩니다 -->
                    </tbody>
                	<tr>
                		<td colspan="6">
                			<div class="container">
	                        	<nav aria-label="Page navigation"  id = "nav__bar">
                        			<ul class="pagination" id="pagination"></ul>
                    				</nav>
                    		</div>
                    	</td>
                   </tr>
                    </table>
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

var searchRemain = false;


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


$('#condition').change(function() {
	$('#pagination').twbsPagination('destroy');
    var selectedClass = $(this).val(); // 선택한 강의 제목
    listCall(showPage, selectedClass); // 선택한 강의 제목으로 데이터 필터링
});


var selectedClass = "전체";
var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	// select 요소의 첫 번째 옵션을 선택하여 클릭 이벤트를 발생시킴
    $('#condition option[value="전체"]').prop('selected', true).click();
    
	listCall(showPage, $('#condition').val());
});


function listCall(page, selectedClass){
    $.ajax({
       type:'get',
       url:'./qnaList.ajax',
       data:{
           'page':page,
           'cnt':10,
           'selectedClass': selectedClass
        },
        dataType:'json',
        success:function(data){
           drawList(data.list);
           console.log(data);
	       var startPage = 1;
	       console.log(startPage);
 
           
           $('#pagination').twbsPagination({
         	  startPage:data.currPage, //시작페이지
         	  totalPages:data.totalPages, //총 페이지 갯수
         	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
          	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
         		  console.log(evt); // 이벤트 객체
         		  console.log(pg); //클릭한 페이지 번호
         		  showPage = pg;
         		  listCall(pg, selectedClass);
         	  }
         	  
           });
           
        },
        error:function(request, status, error){
     	   console.log("code: " + request.status)
            console.log("message: " + request.responseText)
            console.log("error: " + error);
        }
     });
 }




function drawList(list) {
    var content = '';
    for (var i = 0; i < list.length; i++) {
        var qna = list[i];
        var lockIcon = qna.anonymous_status ? "resources/img/locked.png" : "resources/img/unlocked.png"; // 이미지 경로 설정

        content += '<tr style="border-bottom: 1px solid #ddd;">'; // 각 항목에 경계선 추가
        content += '<td style="text-align: center;"><img src="' + lockIcon + '" class="locked-img" width="38" height="38"></td>'; // locked 이미지에 클래스 추가 및 중앙 정렬
        content += '<td style="text-align: center;">' +
        '<a href="./lessonQnADetail.go?question_idx=' + qna.question_idx + '">' + qna.q_title + '</a>' +
        '</td>'; // 질문 제목
        content += '<td style="text-align: center;">' + qna.answer_status + '</td>'; // 답변 여부
        content += '<td style="text-align: center;">' + qna.q_reg_date + '</td>'; // 날짜
        content += '</tr>';
    }
    $('#list').html(content); // 리스트를 테이블에 추가
}


</script>
</html>