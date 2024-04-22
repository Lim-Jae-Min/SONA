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
                <a href="studentPage.edit">개인 정보 수정</a>
                <a href="#">즐겨찾기 강사</a>
                <a href="#">숨김 강사</a>
                <a href="#">내가 작성한 Q&A</a>
                <a href="#">포인트 내역</a>
                <a href="#">내가 받은 리뷰</a>
                <a href="#">내가 작성한 리뷰</a>
                <a href="#">수강 이력</a>
            </div>
 		<div id="content">
      
            <br/>
            <br/><br/>
  			<th><input type="checkbox" id="selectAll"></th>
                <td>전체선택</td>
          
           <br/><br/><br/>
        <table id="listTable">
        	<tbody id="lessonList"></tbody>
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
        <table>
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
var showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

$('input[type="button"]').click(function (){
	$('#pagination').twbsPagination('destroy');
	listCall(showPage);
});




function listCall(page, condition, searchContent){
    $.ajax({
       type:'get',
       url:'./myTeacherList.ajax',
       data:{
    	   'page':page,
    	   'condition':$('#condition').val(),
    	   'content':$('#searchContent').val()
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




function drawList(list) {
    var content = '';

    // 최대 8개의 리스트만 표시
    for (var i = 0; i < Math.min(8, list.length); i++) {
        // 각 리스트 요소를 세로로 표시
        content += '<tr>';
        content += '<td>';
        content += '<input type="checkbox" class="listCheckbox"><br>'; // 체크박스 추가
        content += '<img src="/photo/' + list[i].new_filename + '" class="lessonImg"><br>'; // 사진
        content += '<a href="del?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a><br>'; // 강의 이름
        content += '<a href="teacherDetail?teacher_id=' + list[i].user_id + '">' + list[i].user_name + ' 강사님</a><br>'; // 강사 이름
        content += '<span class="smallFont">♥ ' + list[i].manner + '</span>'; // 매너 점수
        content += '</td>';
        content += '</tr>';
    }

    $('#lessonList').html(content);
}




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


$(document).ready(function() {
    // 전체 선택 체크박스를 클릭했을 때
    $('#selectAll').change(function() {
        if ($(this).is(':checked')) {
            // 전체 선택 체크박스가 선택되면 모든 리스트의 체크박스도 선택
            $('.listCheckbox').prop('checked', true);
        } else {
            // 전체 선택 체크박스가 해제되면 모든 리스트의 체크박스도 해제
            $('.listCheckbox').prop('checked', false);
        }
    });

    // 각 리스트의 체크박스를 클릭했을 때
    $('.listCheckbox').change(function() {
        var allChecked = true;
        $('.listCheckbox').each(function() {
            if (!$(this).is(':checked')) {
                allChecked = false;
                return false; // 하나라도 체크되지 않은 경우 반복문 종료
            }
        });

        // 모든 리스트의 체크박스가 선택되어 있으면 전체 선택 체크박스도 선택
        $('#selectAll').prop('checked', allChecked);
    });
});

</script>
</html>