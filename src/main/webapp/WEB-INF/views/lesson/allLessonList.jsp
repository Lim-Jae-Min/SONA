<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#content {
    padding-bottom: 100px;
}
#top {
    height: 100px;
    padding-left: 200px;
    border-bottom: solid 5px #BEE6FF;
    display: flex;
    justify-content: space-between;
    align-items: center;
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
.className{
	cursor: pointer;
}
.blank {
    height: 100px;
    width: 150px;
}
#condition {
    width: 150px;
    height: 24px;
}
#searchContent {
	width: 250px;
}
#smallLogo {
	width: 50px;
	height: 50px;
}
#location {
	width: 200px;
	height: 24px;
}
.inst {
	width: 120px;
	height: 24px;
}
#newClass {
	width: 100px;
	height: 30px;
	background-color: #0070b6;
	color: white;
	border: none;
	margin-left: 80px;
	display: block;
}
</style>
</head>
<body>
<body>
    <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="recommendList.go">추천 강의</a></th>
                <th class="menu"><a href="allList.go">전체 강의</a></th>
                <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
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
    <div id="content">
        <div id="top">
            <br/>
            <table>
				<tr>
					<th><img src="resources/img/logo.png" id="smallLogo"></th>
					<th>의 전체 강의</th>
					<th class="blank"></th>
					<th class="blank"></th>
					<th class="blank"></th>
				</tr>
			</table>
            <span id="searchbox">
            	<br/>
            	<select name="location" id="location">
					<option value="지역 전체">전체</option>
					<option value="서울특별시 강남구">서울특별시 강남구</option>
					<option value="서울특별시 강동구">서울특별시 강동구</option>
					<option value="서울특별시 강북구">서울특별시 강북구</option>
					<option value="서울특별시 강서구">서울특별시 강서구</option>
					<option value="서울특별시 관악구">서울특별시 관악구</option>
					<option value="서울특별시 광진구">서울특별시 광진구</option>
					<option value="서울특별시 구로구">서울특별시 구로구</option>
					<option value="서울특별시 금천구">서울특별시 금천구</option>
					<option value="서울특별시 노원구">서울특별시 노원구</option>
					<option value="서울특별시 도봉구">서울특별시 도봉구</option>
					<option value="서울특별시 동대문구">서울특별시 동대문구</option>
					<option value="서울특별시 동작구">서울특별시 동작구</option>
					<option value="서울특별시 마포구">서울특별시 마포구</option>
					<option value="서울특별시 서대문구">서울특별시 서대문구</option>
					<option value="서울특별시 서초구">서울특별시 서초구</option>
					<option value="서울특별시 성동구">서울특별시 성동구</option>
					<option value="서울특별시 성북구">서울특별시 성북구</option>
					<option value="서울특별시 송파구">서울특별시 송파구</option>
					<option value="서울특별시 양천구">서울특별시 양천구</option>
					<option value="서울특별시 영등포구">서울특별시 영등포구</option>
					<option value="서울특별시 용산구">서울특별시 용산구</option>
					<option value="서울특별시 은평구">서울특별시 은평구</option>
					<option value="서울특별시 종로구">서울특별시 종로구</option>
					<option value="서울특별시 중구">서울특별시 중구</option>
					<option value="서울특별시 중랑구">서울특별시 중랑구</option>
				</select>
				<select name="instCategory" id="instCategory" class="inst">
					<option value="">악기 카테고리</option>
					<option value="1">건반</option>
					<option value="2">기타</option>
					<option value="3">현악기</option>
					<option value="4">관악기</option>
					<option value="5">타악기</option>
					<option value="6">그 외</option>
				</select>
				<select name="inst" id="inst" class="inst"></select>
				<br/><br/>
                <select name="condition" id="condition">
                    <option value="class_name">강의명</option>
                    <option value="user_name">강사명</option>
                    <option value="class_location">지역</option>
                </select>
                <input type="text" id="searchContent">
                <input type="button" id="search" value="검색">
            </span>
        </div>
        <br/>
        <table id="listTable">
        	<tr>
        		<td><button id="newClass" onclick="location.href='lessonOpen.go'">강의 개설</button></td>
        	</tr>
        	<tr class="blank"></tr>
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
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td class="manner">♥ ${manner}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${totalPoint}</span></div>
        <br/>
        <div><a href="#">내가 쓴 리뷰</a></div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
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

$('#logo').click(function main(){
	location.href = '/main';
});

if ('${user_type}' == '강사') {
	$('#newClass').css('display', 'block');
}


var category1 = ['클래식 피아노', '재즈 피아노', '피아노 반주'];
var category2 = ['어쿠스틱 기타', '일렉 기타', '베이스 기타'];
var category3 = ['바이올린', '비올라', '첼로', '콘트라베이스'];
var category4 = ['클라리넷', '플룻', '오보에', '트럼펫', '트럼본', '색소폰'];
var category5 = ['드럼', '카혼'];
var category6 = ['보컬', '작곡', '미디'];

$('#instCategory').change(function() {
	console.log('값이 변경되었습니다.');
	var selectedCategory = $('#instCategory').val();
	var option = '';
	option += '<option value=""></option>';
	if (selectedCategory == 1) {
		for (var value of category1) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	if (selectedCategory == 2) {
		for (var value of category2) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	if (selectedCategory == 3) {
		for (var value of category3) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	if (selectedCategory == 4) {
		for (var value of category4) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	if (selectedCategory == 5) {
		for (var value of category5) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	if (selectedCategory == 6) {
		for (var value of category6) {
			option += '<option value="' + value + '">' + value + '</option>';
		}
	}
	$('#inst').html(option);
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
       type:'get',
       url:'./allList.ajax',
       data:{
    	   'page':page,
    	   'condition':$('#condition').val(),
    	   'content':$('#searchContent').val(),
    	   'loca':$('#location').val(),
    	   'instCategory':$('#instCategory').val(),
    	   'inst':$('#inst').val()
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
	
	if (list.length < 5) {
		content += '<tr>'
		for (var i = 0; i < list.length; i++) {
			content += '<th><img src="/photo/"' + list[i].new_filename + 'class="lessonImg"></th>'
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 0; i < list.length; i++) {
			content += '<th><a href="del?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
		 content += '</tr>';
		 content += '<tr class="smallFont">';
		 for (var i = 0; i < list.length; i++) {
			content += '<th>' + list[i].user_name + ' 강사님</th>';
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
		content += '<tr class="blank"></tr>';
		content += '<tr class="blank"></tr>';
		content += '<tr class="blank"></tr>';
	}else {
		content += '<tr>';
		for (var i = 0; i < 5; i++) {
			content += '<th><img src="/photo/"' + list[i].new_filename + 'class="lessonImg"></th>'
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 0; i < 5; i++) {
			content += '<th><a href="del?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 0; i < 5; i++) {
	 		content += '<th>' + list[i].user_name + ' 강사님</th>';
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
	 	content += '<tr class="blank"></tr>';
	 	content += '<tr>';
	 	for (var i = 5; i < list.length; i++) {
			content += '<th><img src="/photo/"' + list[i].new_filename + 'class="lessonImg"></th>'
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 5; i < list.length; i++) {
			content += '<th><a href="del?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
	 	for (var i = 5; i < list.length; i++) {
	 		content += '<th>' + list[i].user_name + ' 강사님</th>';
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
		content += '<tr class="blank"></tr>';
	}
	

 	$('#lessonList').html(content);
	
}

</script>
</html>