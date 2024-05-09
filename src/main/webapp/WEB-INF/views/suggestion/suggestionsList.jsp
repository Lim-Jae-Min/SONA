<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 건의사항 게시판</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#serviceSideMenu {
    color: black;
    padding: 10px;
    text-align: center;
    width: 200px; /* 메뉴 창 너비 */
    height: auto;
}
#serviceSideMenu a {
    display: block; /* 링크를 블록 레벨 요소로 표시하여 세로로 정렬 */
    padding: 10px;
}
.listTable {
	margin: 0 auto;
	border-collapse: collapse;
}
.blueFont {
	color: #024e7d;
}
.searchBox {
	float: right;
}
.first-col {
	height: 30px;
	width: 50px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.second-col {
	height: 30px;
	width: 100px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.third-col {
	height: 30px;
	width: 400px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.fourth-col {
	height: 30px;
	width: 100px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.fifth-col {
	height: 30px;
	width: 150px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.sixth-col {
	height: 30px;
	width: 150px;
	border-top: solid 1px lightgray;
	border-bottom: solid 1px lightgray;
	text-align: center;
}
.grayBackGround {
	background-color: lightgray;
}
#write {
	float: right;
}
.locked {
	width: 20px;
	height: 20px;
	vertical-align: bottom;
}
#condition {
	height: 20px;
}
</style>
</head>
<body>
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
	    <div id="serviceSideMenu">
	        <h3 class="blueFont">고객센터</h3>
	        <hr/>
	        <a href="noticeList.go">공지사항</a>
	        <a href="faqList.go">FAQ</a>
	        <a href="suggestionsList.go">건의사항</a>
	    </div>
	    <div id="content">
	    	<br/><br/><br/><br/>
	        <table class="listTable">
	        	<thead>
		        	<tr>
		        		<td colspan="6">
		        			<b>건의사항</b>
		        			<span class="searchBox">
		        				<select id="condition">
		        					<option value="sug_title">제목</option>
		        					<option value="sug_content">내용</option>
		        					<option value="user_name">작성자</option>
		        				</select>
		        				<input type="text" id="searchContent"/>
		        				<button id="search">검색</button>
		        			</span>
		        		</td>
		        	</tr>
		        	<tr><td colspan="6"><hr/></td></tr>
		        	<tr>
		        		<th class="first-col grayBackGround">No</th>
		        		<th class="second-col grayBackGround"></th>
		        		<th class="third-col grayBackGround">제목</th>
		        		<th class="fourth-col grayBackGround">답변여부</th>
		        		<th class="fifth-col grayBackGround">작성자</th>
		        		<th class="sixth-col grayBackGround">작성일자</th>
		        	</tr>
	        	</thead>
	        	<tbody id="listContent"></tbody>
                <tr>
		      		<td colspan="6"><br/><br/>
		      			<div class="container">                           
		            		<nav aria-label="Page navigation" style="text-align:center">
		                		<ul class="pagination" id="pagination"></ul>
		            		</nav>               
		        		</div>
		      		</td>
		      	</tr>
		      	<tr><td colspan="6"><button id="write">글 작성</button></td></tr>
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

var showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

$('#search').click(function (){
	$('#pagination').twbsPagination('destroy');
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'post',
       url:'./suggestionsList.ajax',
       data:{
    	   'page':page
    	   ,'condition':$('#condition').val()
    	   ,'searchContent':$('#searchContent').val()
       },
       dataType:'json',
       success:function(data){
    	  console.log('시작');
          drawList(data.list);
          console.log(data);          
          // 플러그인 추가
          
          var startPage = 1;
          
          $('#pagination').twbsPagination({
        	  startPage:startPage,		// 시작페이지
        	  totalPages:data.totalPages, 	// 총 페이지 갯수
        	  visiblePages:5,	// 보여줄 페이지 수 [1][2][3][4][5]
        	  onPageClick:function(evt, pg){ // 페이지 클릭시 실행 함수
        		  console.log(evt);//이벤트 객체
        		  console.log(pg);//클릭한 페이지 번호
        		  showPage = pg;
        		  listCall(pg);
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
function drawList(list){
	var content = '';
	
	for (var data of list) {
		content += '<tr>';
		content += '<td class="first-col">' + data.sug_idx + '</td>';
		if (data.sug_secret == 1) {
			if ('${sessionScope.loginId}' == data.user_id) {
				content += '<td class="second-col"><img src="resources/img/locked.png" class="locked"></td>';
				content += '<td class="third-col"><a href="suggestionsDetail.go?sug_idx=' + data.sug_idx + '">' + data.sug_title + '</a></td>';
			} else {
				content += '<td class="second-col"><img src="resources/img/locked.png" class="locked"></td>';
				content += '<td class="third-col"><a onclick="locked()">' + data.sug_title + '</a></td>';
			}
		} else {
			content += '<td class="second-col"></td>';
			content += '<td class="third-col"><a href="suggestionsDetail.go?sug_idx=' + data.sug_idx + '">' + data.sug_title + '</a></td>';
		}
		
		if (data.sug_answer_idx != '') {
			content += '<td class="fourth-col">Y</td>';
		} else {
			content += '<td class="fourth-col">N</td>';
		}
		
		content += '<td class="fifth-col"><a href="userDetail.go?user_id=' + data.user_id + '">' + data.user_name + '</a></td>';
		
		var date = new Date(data.sug_reg_date);
		var dateStr = date.toLocaleDateString("ko-KR");//en-US		
		
		content += '<td class="sixth-col">' + dateStr + '</td>';
		content += '</tr>'
	}
	
 	$('#listContent').html(content);
	
}

$('#write').click(function (){
	location.href = 'suggestionsWrite.go';
});

function locked() {
	alert('작성자만 확인 가능한 게시글입니다.');
}
</script>
</html>