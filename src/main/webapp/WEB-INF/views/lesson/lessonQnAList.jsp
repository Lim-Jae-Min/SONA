<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
/* Header Container */
.header {
    background-color: #FFF;
    padding: 20px;
    display: flex;
    align-items: flex-end;
}

/* Course Info */
.course-info {
    margin-right: auto;
}

.course-name {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

.category {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.rating {
    font-size: 14px;
    color: black; 
}

/* Teacher Info */
.teacher-info {
    margin-left: auto;
    text-align: right;
}

.teacher-name {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 5px;
}

.location {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.likes {
    font-size: 16px;
    color: black; 
}

.rounded-image {
    background-color: #BEE6FF;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
}

.rounded-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

</style>
</head>
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
                    <th><a href="login.go">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    <div class="header">
    <div class="course-info">
        <div class="course-name">쉽게 배우는 기타</div>
        <div class="category">- 기타, 어쿠스틱 기타</div>
        <div class="rating">평균 만족도 : <span style="color: #FED000;">★4.7</span></div>
    </div>
    <div class="teacher-info">
        <div class="teacher-name">ㅇㅇㅇ선생님</div>
        <div class="location">📌서울 금천구</div>
        <div class="likes"><span style="color: red;">♥</span>80.5</div>
    </div>
    <div class="rounded-image">
        <img src="resources/img/basic_user.png" alt="Teacher Photo">
    </div>
	</div>
 	<hr style="flex: 1; margin: 0; border: 0; border-top: 4px solid #BEE6FF;">
	
	<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
        <img src="resources/img/QnA.png" id="review">강의 Q&A
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                	<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">글번호</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성자</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">답변 여부</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">조회수</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성일자</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
            <tr>
      		<td colspan="7" id="paging">
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
</body>
<script>
var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'get',
       url:'./list.ajax',
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
	        content += '<td>' + item.review_IDX + '</td>';
	        content += '<td><span style="color: #FED000;">★</span>' + item.score + '</td>';
	        content += '<td><a href="#" class="review-link" data-review-idx="' + item.review_IDX + '">' + item.review_TITLE + '</a></td>';
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
	
	$('.review-link').click(function(e) {
        e.preventDefault(); // 기본 동작 방지
        console.log('data-review-idx');
        var reviewIdx = $(this).data('review-idx');// 클릭된 리뷰의 REVIEW_IDX 추출
        
        console.log('reviewIdx:', reviewIdx);
       
        window.location.href = './lessonReviewDetail?REVIEW_IDX=' + reviewIdx; // REVIEW_IDX를 파라미터로 lessonReviewDetail 페이지로 이동
    });
}
	
	
</script>
</html>
