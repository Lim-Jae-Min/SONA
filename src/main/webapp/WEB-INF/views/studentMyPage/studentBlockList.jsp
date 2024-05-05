<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#del {
	float: right;
}
#all {
	margin-left: 26px;
}
button {
	background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
#teacherTable {
    margin: 0 auto;
}
#teacherTable th {
    text-align: center;
    padding-left: 20px;
    padding-right: 20px;
}
.profileImg {
    width: 180px;
    height: 180px;
}
.smallFont {
    font-size: 12px;
}
.blank {
    height: 100px;
    width: 150px;
}
.line {
	border: solid 1px gray;
}
.box {
	width: 240px;
	text-align: left;
	margin: 0 auto;
}
input[type="checkBox"] {
    height: 15px;
    width: 15px;
} 
.first-line {
	width: 1100px;
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
    <div id="wrapper">
	    <div id="sidemenu">
	        <h3>숨김 강사</h3>
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
	    <div id="content">
	    	<br/><br/><br/><br/>
	        <table id="teacherTable">
	        	<thead>
	        		<tr>
	        			<td colspan="4" class="first-line">
	        				<input type="checkBox" id="all"/>
	        				<button id="del" onclick="del()">선택 삭제</button>
	        				<hr class="line"/>
	        			</td>
	        		</tr>
	        	</thead>
	        	<tbody id="teacherList"></tbody>
	        	<tr>
      			<td colspan="4">
      				<div class="container">                           
            			<nav aria-label="Page navigation" style="text-align:center">
                			<ul class="pagination" id="pagination"></ul>
            			</nav>               
        			</div>
      			</td>
      		</tr>
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
	location.href = '/main';
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});


var showPage = 1;
var loginId = '${sessionScope.loginId}';

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'get',
       url:'./blockList.ajax',
       data:{
    	   'page':page
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
	
	if (list.length < 4) {
		content += '<tr>'
		for (var i = 0; i < list.length; i++) {
			if (list[i].new_filename != null) {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/>';
				content += '<img src="/photo/' + list[i].new_filename + '" class="profileImg"></div></th>';
			}else {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/></div>';
				content += '<img src="resources/img/basic_user.png" class="profileImg"></th>';
			}
		}
	 	content += '</tr>';
	 	content += '<tr>';
	 	for (var i = 0; i < list.length; i++) {
			content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + '</a></th>';
		}
	 	content += '</tr>';
	 	content += '<tr class="smallFont">';
		for (var i = 0; i < list.length; i++) {
			content += '<th>강의 ' + list[i].accumulate_lesson + ' 개</th>';
		}
		content += '</tr>';
	 	content += '<tr class="manner smallFont">';
		for (var i = 0; i < list.length; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
		content += '</tr>';
		
		content += '<tr class="blank"></tr>';
		content += '<tr class="blank"></tr>';
		content += '<tr class="blank"></tr>';
	}else {
		content += '<tr>'
		for (var i = 0; i < 4; i++) {
			if (list[i].new_filename != null) {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/>';
				content += '<img src="/photo/' + list[i].new_filename + '" class="profileImg"></div></th>';
			}else {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/></div>';
				content += '<img src="resources/img/basic_user.png" class="profileImg"></th>';
			}
		}
		content += '</tr>';
		content += '<tr>';
		for (var i = 0; i < 4; i++) {
			content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + '</a></th>';
		}
		content += '</tr>';
		content += '<tr class="smallFont">';
		for (var i = 0; i < 4; i++) {
			content += '<th>강의 ' + list[i].accumulate_lesson + ' 개</th>';
		}
		content += '</tr>';
		content += '<tr class="manner smallFont">';
		for (var i = 0; i < 4; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
		content += '</tr>';
		content += '<tr><td colspan="5"><br/><br/><br/><hr class="line"/></td></tr>';
		content += '<tr>';
		for (var i = 4; i < list.length; i++) {
			if (list[i].new_filename != null) {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/>';
				content += '<img src="/photo/' + list[i].new_filename + '" class="profileImg"></div></th>';
			}else {
				content += '<th><div class="box"><input type="checkbox" name="del" value="'+list[i].user_id+'"/><br/></div>';
				content += '<img src="resources/img/basic_user.png" class="profileImg"></th>';
			}
		}
		content += '</tr>';
		content += '<tr>';
		for (var i = 4; i < list.length; i++) {
			content += '<th><a href="userDetail.go?user_id=' + list[i].user_id + '">' + list[i].user_name + '</a></th>';
		}
		content += '</tr>';
		content += '<tr class="smallFont">';
		for (var i = 4; i < list.length; i++) {
			content += '<th>강의 ' + list[i].accumulate_lesson + ' 개</th>';
		}
		content += '</tr>';
		content += '<tr class="manner smallFont">';
		for (var i = 4; i < list.length; i++) {
			content += '<th>♥ ' + list[i].manner + '</th>';
		}
		content += '</tr>';
		content += '<tr class="blank"></tr>';
	}
	
 	$('#teacherList').html(content);
	
}

$('#all').on('click',function(){	
	var $chk = $('input[name="del"]');	
	
	if($(this).is(":checked")){
		$chk.prop('checked',true);	
	}else{
		$chk.prop('checked',false);	
	}
});

function del(){ // 체크 표시된 value 값을 delArr 에 담아보자
	var delArr = [];
	$('input[name="del"]').each(function(idx,item){
		if($(item).is(":checked")){
			var val = $(this).val();
			//console.log(val);
			delArr.push(val);
		}
	});
	console.log('delArr : ',delArr);
	
	$.ajax({
		type:'post',
		url:'./teacherListDel.ajax',
		data:{delList:delArr},
		dataType:'JSON',
		success:function(data){
			if(data.cnt>0){
				var result = confirm("선택한 항목을 삭제하시겠습니까?");
				if (result) {
					$('#list').empty();
					listCall(showPage);
				}
			}
		},
		error:function(error){
			console.log(error);
		}
	});	
}

$(document).ready(function() {

	var count = 0;
	
	$(document).on('click', 'input[name="del"]', function (){
		if ($('input[name="del"]:checked').length == $('input[name="del"]').length) {
			$('#all').prop('checked', true);
		}else {
			$('#all').prop('checked', false);
		}
	});
});


</script>
</html>