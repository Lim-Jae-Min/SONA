<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의 리뷰 목록</title>
<link rel="stylesheet" href="resources/css/common.css?after"
	type="text/css">

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"
	type="text/javascript"></script>
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

#content {
	padding-bottom: 100px;
}

#top {
	height: 150px;
	padding-left: 28%;
	padding-right: 28%;
	border-bottom: solid 5px #BEE6FF;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#left {
	display: inline-block;
}

#right {
	display: inline-block;
}

.gray {
	color: gray;
	font-size: 12px;
}

.red {
	color: red;
}

.yellow {
	color: #ffc400;
}

.lessonLogo {
	height: 120px;
	width: 120px;
}

.classStyles {
	padding: 5px;
	background-color: #0070b6;
	color: white;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
}

.reviewProfile {
	width: 50px;
	height: 50px;
}

.smallFontSize {
	font-size: 12px;
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
	
	<div id="content">
		<div id="top">
			<div id="left">
				<b>${lesson.class_name}</b> <br /> <span class="gray">${lesson.class_inst}</span>
				<br />
				<br />
				<br /> 평균 만족도 <span class="yellow">★ ${lesson.class_score}</span>
			</div>
			<div id="right">
				<table>
					<tr>
						<td><a href="userDetail.go?user_id=${lesson.user_id}">${lesson.user_name}</a></td>
						<c:if test="${lessonLogo != null}">
							<td rowspan="3"><img src="/photo/${lessonLogo}"
								class="lessonLogo"></td>
						</c:if>
						<c:if test="${lessonLogo == null}">
							<td rowspan="3"><img src="resources/img/basic_user.png"
								class="lessonLogo"></td>
						</c:if>
					</tr>
					<tr>
						<td>${lesson.class_location}</td>
					</tr>
					<tr>
						<td>
							<span class="red">
								♥ ${lesson.manner == 0.0 ? '신규 회원' : lesson.manner}
							</span>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>




	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px; width: 1500px;">
			<img src="resources/img/review.png" id="review">강의 리뷰
			<table style="border-collapse: collapse; width: 100%;">
				<thead>
					<tr>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">글번호</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">만족도</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">리뷰
							제목</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성자</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">수강
							기간</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">사진</th>
						<th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성일자</th>
					</tr>
				</thead>
				<tbody id="list"></tbody>
				<tr>
					<td colspan="7" id="paging">
						<div class="container">
							<nav aria-label="Page navigation" style="text-align: center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<br />
	<br />
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
				<td colspan="2">${sessionScope.user_name}회원님</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="manner">♥ ${sessionScope.manner_variance}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${sessionScope.point}</span>
		</div>
		<br />
		<div>
			<c:if test="${sessionScope.user_type eq '수강생'}">
				<a href="studentWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
			<c:if test="${sessionScope.user_type eq '강사'}">
				<a href="teacherWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
		</div>
		<br />
		<div>
			<a href="myPage.go">마이페이지</a>
		</div>
		<br /> <br /> <br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
</body>
<script>
var showPage =1;
var classIdx = ${classIdx};

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page, classIdx){
    $.ajax({
       type:'get',
       url:'./list.ajax',
       data:{
          'page':page,
          'cnt':5,
          'classIdx':${classIdx}
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
        		  listCall(pg, classIdx);
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
	        content += '<tr style="text-align: center;">';
	        content += '<td>' + item.review_idx + '</td>';
	        content += '<td><span style="color: #FED000;">★</span>' + item.score + '</td>';
	        content += '<td><a href="#" class="review-link" data-review-idx="' + item.review_idx + '">' + item.review_title + '</a></td>';
	        content += '<td>';
	        content +=  '<a href="userDetail.go?user_id=' + item.rater_id + '">' + item.rater_id + '</a>';
	        content += '</td>';
	        content += '<td>' + item.study_date +'</td>';
	        content += '<td>';
	        var img = item.img_cnt > 0 ?'image.png' : 'no_image.png';
	        content += '<img class="icon" src="resources/img/' + img + '"width= "30" height = "30"/>';
	        content += '</td>';
	        var date = new Date(item.review_reg_date);
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
       
        window.location.href = './lessonReviewDetail.go?review_idx=' + reviewIdx; // REVIEW_IDX를 파라미터로 lessonReviewDetail 페이지로 이동
    });
}
	

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
	
	$('#userName').click(function slide() {
		var display = $('#slide').css('display');
	    if (display == 'none') {
	        $('#slide').css('display', 'block');
	    }
	    if (display == 'block') {
	        $('#slide').css('display', 'none');
	    }
	});
	
	
</script>
</html>
