<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 추천 강의 목록</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#content {
	padding-bottom: 100px;
}

#top {
	height: 100px;
	padding-left: 300px;
	border-bottom: solid 5px #BEE6FF;
}

.highlight {
	color: #024e7d;
}

#listTable {
	margin: 0 auto;
}

#lessonList th {
	text-align: center;
	padding-left: 20px;
	padding-right: 20px;
}

.smallFont {
	font-size: 12px;
}

.lessonImg {
	width: 180px;
	height: 180px;
}

.className {
	cursor: pointer;
}

#blank {
	height: 100px;
}

#searchBox {
	margin-right: 20%;
	margin-left: 15%;
}

#condition {
	width: 100px;
	height: 24px;
}
</style>
</head>
<body>
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
        <div id="top">
            <br/>
            <b class="highlight">${sessionScope.user_name}</b>님을 위한 추천 강의
            <br/><br/>
            <b class="highlight">${sessionScope.user_name}</b>님이 선호하는 악기 <b class="highlight">${inst}</b> 추천 강의입니다.
            <span id="searchbox">
                <select name="condition" id="condition">
                    <option value="class_name">강의명</option>
                    <option value="user_name">강사명</option>
                    <option value="class_location">지역</option>
                </select>
                <input type="text" id="searchContent">
                <input type="button" value="검색">
            </span>
        </div>
        <br/><br/><br/>
        <table id="listTable">
        	<tbody id="lessonList"></tbody>
            <tr>
      			<td colspan="5">
      				<div class="container">                           
            			<nav aria-label="Page navigation" style="text-align:center">
                			<ul class="pagination" id="pagination"></ul>
            			</nav>               
        			</div>
      			</td>
      		</tr>
        </table>
        <table>
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

var showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

$('input[type="button"]').click(function (){
	$('#pagination').twbsPagination('destroy');
	listCall(showPage);
});

var inst = '${inst}';

function listCall(page){
    $.ajax({
       type:'get',
       url:'./recommendList.ajax',
       data:{
    	   'page':page,
    	   'condition':$('#condition').val(),
    	   'content':$('#searchContent').val(),
    	   'inst':inst
       },
       dataType:'json',
       success:function(data){
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
       error:function(error){
          console.log(error)
       }
	});
}

function drawList(list){
	var content = '';
	
	if (list.length < 5) {
		content += '<tr>'
		for (var i = 0; i < list.length; i++) {
			if (list[i].new_filename != null) {
				content += '<th><img src="/photo/' + list[i].new_filename + '" class="lessonImg"></th>';
			}else {
				content += '<th><img src="resources/img/basic_user.png" class="lessonImg"></th>';
			}
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 0; i < list.length; i++) {
			content += '<th><a href="lessonDetail.go?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
		 content += '</tr>';
		 content += '<tr class="smallFont">';
		 for (var i = 0; i < list.length; i++) {
			 content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + ' 강사님</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="manner smallFont">';
		for (var i = 0; i < list.length; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
		content += '</tr>';
		content += '<tr class="smallFont">';
		for (var i = 0; i < list.length; i++) {
			content += '<th>누적 수강생 : ' + list[i].accumulate_student + ' 명</th>';
		}
		content += '</tr>';
		content += '<tr class="smallFont">';
		for (var i = 0; i < list.length; i++) {
			content += '<th>' + list[i].class_location + '</th>';
		}
		content += '</tr>';
		content += '<tr id="blank"></tr>';
		content += '<tr id="blank"></tr>';
		content += '<tr id="blank"></tr>';
	}else {
		content += '<tr>';
		for (var i = 0; i < 5; i++) {
			if (list[i].new_filename != null) {
				content += '<th><img src="/photo/' + list[i].new_filename + '" class="lessonImg"></th>';
			}else {
				content += '<th><img src="resources/img/basic_user.png" class="lessonImg"></th>';
			}
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 0; i < 5; i++) {
			content += '<th><a href="lessonDetail.go?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 0; i < 5; i++) {
	 		content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + ' 강사님</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="manner smallFont">';
	 	for (var i = 0; i < 5; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 0; i < 5; i++) {
	 		content += '<th>누적 수강생 : ' + list[i].accumulate_student + ' 명</th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 0; i < 5; i++) {
	 		content += '<th>' + list[i].class_location + '</th>';
		}
	 	content += '</tr>';
	 	content += '<tr id="blank"></tr>';
	 	content += '<tr>';
	 	for (var i = 5; i < list.length; i++) {
	 		if (list[i].new_filename != null) {
				content += '<th><img src="/photo/' + list[i].new_filename + '" class="lessonImg"></th>';
			}else {
				content += '<th><img src="resources/img/basic_user.png" class="lessonImg"></th>';
			}
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 5; i < list.length; i++) {
			content += '<th><a href="lessonDetail.go?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 5; i < list.length; i++) {
	 		content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + ' 강사님</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="manner smallFont">';
	 	for (var i = 5; i < list.length; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 5; i < list.length; i++) {
	 		content += '<th>누적 수강생 : ' + list[i].accumulate_student + ' 명</th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 5; i < list.length; i++) {
	 		content += '<th>' + list[i].class_location + '</th>';
		}
	 	content += '</tr>';
		content += '<tr id="blank"></tr>';
	}
	

 	$('#lessonList').html(content);
	
}

</script>
</html>