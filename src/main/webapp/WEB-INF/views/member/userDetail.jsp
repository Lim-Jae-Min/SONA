<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 회원 상세보기</title>
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
#content{
	flex: 1;
	padding: 10px;
	padding-bottom: 32px;
}
		
.list-item{
	box-sizing: border-box;
	border-block-end: inherit;
}
.profile {
	width: 200px;
	height: 200px;
}
.myTeacher {
	width: 20px;
	height: 20px;
	cursor: pointer;
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
    
    <h2>회원 정보</h2>
    
    <form action="studentPage.do">
 			<div id="content">
            <table style="width: 100%;">
                <thead>
   			 <hr style="width: 100%; border: none; border-bottom: 1px solid black; margin-top: 5px;">
                        <tr> 
        				<c:if test="${detail.profile != null}">
        					&nbsp;<td rowspan="2" style="width: 50px;"><img src="/photo/${detail.profile}" class="profile"></td>
        				</c:if>
        				<c:if test="${detail.profile == null}">
        					&nbsp;<td rowspan="2" style="width: 50px;"><img src="resources/img/basic_user.png" class="profile"></td>
        				</c:if>
        				</tr>
                        <tr>
                        <td class="main" style="padding-right: 800px; width : 200px;">
	                        <span style = "width : 200px;">
	                        	${detail.user_name} ${detail.user_type}
	                        	<c:if test="${sessionScope.user_type eq '수강생' and detail.user_type eq '강사'}">
	                        		&nbsp;&nbsp;&nbsp;&nbsp;<img src="resources/img/favoriteOff.png" class="myteacher favorite"/>
	                        		&nbsp;&nbsp;<img src="resources/img/blockOff.png" class="myteacher block"/>
	                        	</c:if>
	                        </span>
	                        <br><br>${detail.user_id}
                        </td>
                        <td style="width: 60%; min-width: 150px; text-align: right;">
                            <img src="resources/img/heart.png" style="margin-right: 7px; width: 20px; height: 20px;" id="heart">${detail.manner}
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일: <span class="contents" style="margin-left: 7px; width: 200px; display: inline-block;">${detail.user_email}</span></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <c:if test="${detail.user_type eq '강사'}">
        <hr style="flex: 1; margin: 0; border: 0; border-top: 4px solid #BEE6FF;">
	
<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px; margin-top: 43px;">
        <img src="resources/img/review.png" id="review">강의 목록
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">No</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">누적 수강생 수</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">만족도</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">개설일자</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
            <tr>
                <td colspan="6">
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
</c:if>

  <hr style="flex: 1; margin-top: 10px; border: 0; border-top: 4px solid #BEE6FF;">
	
	<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px; margin-top: 30px;">
        <img src="resources/img/review.png" id="review">회원이 받은 리뷰
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">No</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성자</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">만족도</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성일자</th>
                </tr>
            </thead>
            <tbody id="list2"></tbody>
            <tr>
      		<td colspan="6" >
      	     <div class="container">                           
             <nav aria-label="Page navigation" style="text-align:center">
             <ul class="pagination" id="pagination2"></ul>
             </nav>               
            </div>
      	</td>
      </tr>
        </table>
    </div>
</div>
        </form>
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

$('#logo').click(function main(){
	   if ('${sessionScope.user_type}' == '관리자') {
	      location.href = 'adminMain.go';
	   }else {
	      location.href = '/main';   
	   }
});

var showPage =1;

var user_type = '${detail.user_type}';

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	if (user_type == '강사') {
		listCall(showPage);		
	}
	
	listCall2(showPage);
});



function listCall(page){
    $.ajax({
       type:'get',
       url:'./userLessonList.ajax',
       data:{
          'page':page,
          'cnt':5,
          'user_id':'${detail.user_id}'
       },
       dataType:'json',
       success:function(data){
          drawList(data.list, data.allCount, showPage);
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

function drawList(list, allCount, showPage){
	showPage--;
	
	
	showPage = parseInt(showPage);
	allCount = parseInt(allCount);
	console.log(allCount);
	console.log(showPage);
	var content = '';
    for(var i = 0; i < list.length; i++){
       content += '<tr class = "list-item">';
       content += '<td>&nbsp;&nbsp;' + (allCount - i - (showPage * 5)) + '</td>';
       content += '<td>&nbsp;&nbsp;<a href="lessonDetail.go?class_idx=' + list[i].class_idx + '">' + list[i].class_name + '</a></td>';
       content += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+ list[i].count+'명' + '</td>';
       content += '<td><span style="color: #FED000;">★</span>' + list[i].score +'</td>';
       var date = new Date(list[i].class_reg_date);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       content += '</tr>';
    }
    $('#list').html(content);
}


function listCall2(page){
    $.ajax({
       type:'get',
       url:'./userReviewList.ajax',
       data:{
          'page':page,
          'cnt':5,
          'user_id':'${detail.user_id}'
       },
       dataType:'json',
       success:function(data){
          drawList2(data.list);
          console.log(data);
          //플러그인 추가
          var startPage = data.currPage > data.totalPages? data.totalPages : data.currPage;
          
          $('#pagination2').twbsPagination({
        	  startPage:startPage, //시작페이지
        	  totalPages:data.totalPages, //총 페이지 갯수
        	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
         	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
        		  console.log(evt); // 이벤트 객체
        		  console.log(pg); //클릭한 페이지 번호
        		  showPage = pg;
        		  listCall2(pg);
        	  }
        	  
          });
          
       },
       error:function(error){
          console.log(error)
       }
    });
}

function drawList2(list){
    var content = '';
    for(item of list){
       console.log(item);
       content += '<tr class="list-item">';
       content += '<td>&nbsp;&nbsp;'+ item.index_order +'</td>';
       content += '<td><a href="lessonReviewDetail.go?review_idx=' + item.review_idx + '">'+ item.review_title +'</a></td>';
       content += '<td>&nbsp;&nbsp;&nbsp;' + item.rater_id + '</td>';
       content += '<td>&nbsp;&nbsp;<span style="color: #FED000;">★</span>' + item.score +'</td>';
       var date = new Date(item.review_reg_date);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       content += '</tr>';
    }
    $('#list2').html(content);
}

var favorite = '${myTeacher.favorite}';
var block = '${myTeacher.block}';

console.log(favorite);
console.log(block);

if (favorite != '') {
	$('.favorite').attr('src', 'resources/img/favoriteOn.png');
}
if (block != '') {
	$('.block').attr('src', 'resources/img/blockOn.png');
}

$('.favorite').click(function (){
	if ($(this).attr('src') == 'resources/img/favoriteOn.png') {
		$.ajax({
			type:'post',
			url:'unFavorite.ajax',
			data:{
				'loginId':'${sessionScope.loginId}',
				'teacher_id':'${detail.user_id}'
			},
			success:function(data){
				console.log(data.result);
				$('.favorite').attr('src', 'resources/img/favoriteOff.png');
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	} else if ($(this).attr('src') == 'resources/img/favoriteOff.png') {
		$.ajax({
			type:'post',
			url:'favorite.ajax',
			data:{
				'loginId':'${sessionScope.loginId}',
				'teacher_id':'${detail.user_id}'
			},
			success:function(data){
				console.log(data.result);
				$('.favorite').attr('src', 'resources/img/favoriteOn.png');
				$('.block').attr('src', 'resources/img/blockOff.png');
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
});

$('.block').click(function (){
	if ($(this).attr('src') == 'resources/img/blockOn.png') {
		$.ajax({
			type:'post',
			url:'unBlock.ajax',
			data:{
				'loginId':'${sessionScope.loginId}',
				'teacher_id':'${detail.user_id}'
			},
			success:function(data){
				console.log(data.result);
				$('.favorite').attr('src', 'resources/img/blockOff.png');
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	} else if ($(this).attr('src') == 'resources/img/blockOff.png') {
		$.ajax({
			type:'post',
			url:'block.ajax',
			data:{
				'loginId':'${sessionScope.loginId}',
				'teacher_id':'${detail.user_id}'
			},
			success:function(data){
				console.log(data.result);
				$('.favorite').attr('src', 'resources/img/favoriteOff.png');
				$('.block').attr('src', 'resources/img/blockOn.png');
			}, 
			error:function(error){ // 통신 실패 시
				console.log(error);
			} 
		});
	}
});


</script>
</html>