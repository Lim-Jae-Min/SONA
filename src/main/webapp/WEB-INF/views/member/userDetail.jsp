<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
		h2 {
		text-align: left;
   	 	margin-left: 100px;
		}
</style>
</head>
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
    
    <h2>회원 정보</h2>
    
    <form action="studentPage.do">
 			<div id="content">
            <table style="width: 100%;">
                <thead>
   			 <hr style="width: 100%; border: none; border-bottom: 1px solid black; margin-top: 5px;">

                    <tr>
                        &nbsp;<td rowspan="2" style="width: 70px;"><img src="resources/img/account_box.png" style="margin-left: 30px;"  id="account"></td>
                        <td class="main" style="padding-right: 800px; width : 200px;"><span style = "width : 200px;">${userInfo.user_name} ${userInfo.user_type}<span><br><br>${userInfo.user_id}</td>
                        <td style="width: 60%; min-width: 150px; text-align: right;">
                            <img src="resources/img/heart.png" style="margin-right: 30px; width: 20px; height: 20px;" id="heart">44.5
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 <span class="contents" style="margin-left: 100px; width: 200px; display: inline-block;">${userInfo.user_email}</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        
        <hr style="flex: 1; margin: 0; border: 0; border-top: 4px solid #BEE6FF;">
	
	<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px; margin-top: 24px;">
        <img src="resources/img/review.png" id="review">강의 목록
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">No</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">리뷰 제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">누적 수강생 수</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">만족도</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">개설일자</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
            <tr>
      		<td colspan="6" >
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
        </form>
    
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


var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'get',
       url:'./classreview.ajax',
       data:{
          'page':page,
          'cnt':5
       },
       dataType:'json',
       success:function(data){
          drawList(data.list);
          console.log(data);
          //플러그인 추가
          var startPage = data.currPage > data.totalPages? data.totalPages : data.currPage;
          
          $('#pagination').twbsPagination({
        	  startPage:startPage, //시작페이지
        	  totalPages:data.totalPages, //총 페이지 갯수
        	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
         	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
        		  console.log(evt); // 이벤트 객체
        		  console.log(pg); //클릭한 페이지 번호
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
       console.log(item);
       content += '<tr>';
       content += '<td><span style="color: #FED000;">★</span>' + item.score + '</td>';
       content += '<td>' + item.review_TITLE + '</td>';
       content += '<td>' + item.rater_ID + '</td>';
       content += '<td>' + item.study_DATE +'</td>';
       content += '<td>';
       var img = item.img_cnt > 0 ?'image.png' : 'no_image.png';
       content += '<img class="icon" src="resources/img/' + img + '"width= "30" height = "30"/>';
       content += '</td>';
       var date = new Date(item.review_REG_DATE);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       content += '</tr>';
    }
    $('#list').html(content);
}




</script>
</html>