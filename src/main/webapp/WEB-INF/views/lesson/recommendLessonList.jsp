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
}
.highlight {
    color: #024e7d;
}
#lessonList {
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
#blank {
    height: 100px;
}
#searchBox {
    float: right;
}
#condition {
    width: 100px;
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
            <b class="highlight">${loginName}</b>님을 위한 추천 강의
            <br/><br/>
            <b class="highlight">${loginName}</b>님이 선호하는 악기 <b class="highlight">${myInst}</b> 추천 강의입니다.
            <span id="searchbox">
                <select name="condition" id="condition">
                    <option value="lessonName">강의명</option>
                    <option value="teacherName">강사명</option>
                    <option value="lessonLocation">지역</option>
                </select>
                <input type="text" id="searchContent">
                <input type="button" value="검색">
            </span>
        </div>
        <br/><br/><br/>
        <table id="lessonList">
            <tr>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
            </tr>
            <tr>
                <th>강의 제목 1</th>
                <th>강의 제목 2</th>
                <th>강의 제목 3</th>
                <th>강의 제목 4</th>
                <th>강의 제목 5</th>
            </tr>
            <tr class="smallFont">
                <th>A 강사님</th>
                <th>B 강사님</th>
                <th>C 강사님</th>
                <th>D 강사님</th>
                <th>E 강사님</th>
            </tr>
            <tr class="manner smallFont">
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
            </tr>
            <tr class="smallFont">
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
            </tr>
            <tr class="smallFont">
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
            </tr>
            <tr id="blank"></tr>
            <tr>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
                <th><img src="../img/basic_user.png" class="lessonImg"></th>
            </tr>
            <tr>
                <th>강의 제목 1</th>
                <th>강의 제목 2</th>
                <th>강의 제목 3</th>
                <th>강의 제목 4</th>
                <th>강의 제목 5</th>
            </tr>
            <tr class="smallFont">
                <th>A 강사님</th>
                <th>B 강사님</th>
                <th>C 강사님</th>
                <th>D 강사님</th>
                <th>E 강사님</th>
            </tr>
            <tr class="manner smallFont">
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
                <th>♥ 40.5</th>
            </tr>
            <tr class="smallFont">
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
                <th>누적 수강생 : 00명</th>
            </tr>
            <tr class="smallFont">
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
                <th>서울특별시 금천구</th>
            </tr>
            <tr>
      			<td colspan="7">
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

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'get',
       url:'./list.ajax',
       data:{
    	   'page':page,
    	   'cnt':$('#pagePerNum').val()
       },
       dataType:'json',
       success:function(data){
          drawList(data.list);
          console.log(data);          
          // 플러그인 추가
          
          var startPage = data.currPage >data.totalPages ? data.totalPages : data.currPage;
          
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
	 for(item of list){
	    //console.log(item);
	    content += '<tr>';
	    content += '<td><input type="checkbox" name="del" value="' + item.idx +'"/></td>';
	    content += '<td>' + item.idx + '</td>';
	    content += '<td>';
	    
	    var img = item.img_cnt > 0 ?'image.png' : 'no_image.png';
	    content += '<img class="icon" src="resources/img/' + img + '"/>';
	 

	    content += '</td>';
	    content += '<td>' + item.subject + '</td>';
	    content += '<td>' + item.user_name + '</td>';
	    content += '<td>' + item.bHit +'</td>';
	    
	    //java.sql.Date 는 javascript에서는 밀리세컨드로 변환하여 표시한다.
	    //방법 1. Back-end : DTO의 반환 날짜 타입을 문자열로 변경 (서버를 껐다 켜야하니 웬만하면 프론트에서 해야햄)
	    //content += '<td>' + item.reg_date + '</td>';
	    //방법 2. Front-end : js에서 직접 변환
	    var date = new Date(item.reg_date);
	    var dateStr = date.toLocaleDateString("ko-KR"); //en-US
	    content += '<td>' + dateStr + '</td>';
	    
	    
	    content += '</tr>';
	 }
	 
	 $('#list').html(content);
}

</script>
</html>