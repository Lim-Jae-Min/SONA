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
        <div style="float: left;">
            <img src="resources/img/QnA.png" id="qna" style="margin-right: 10px;"> 
            <span style="vertical-align: middle;">강의 Q&A</span> 
        </div>
         <div style="float: right;"> <!-- Q&A 작성 버튼을 오른쪽으로 옮김 -->
            <button class="button write" onclick="location.href='./lessonQnAWrite'" style="background-color: #BEE6FF; color: black; border: none; padding: 8px 20px; border-radius: 10px;">Q&A 작성</button> <!-- 테두리 없애고 padding 조절 -->
        </div>
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                	<th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">글번호</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">작성자</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">답변 여부</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">조회수</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px; text-align: center;">작성일자</th>
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
var showPage =1;
var classIdx = ${classIdx};

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page, classIdx){
    $.ajax({
       type:'get',
       url:'./qnalist.ajax',
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
	        content += '<tr>';
	        content += '<input type="hidden" name="class_idx" value="' + item.class_idx + '">';
	        content += '<input type="hidden" name="teacher_id" value="' + item.teacher_id + '">';
	        content += '<input type="hidden" name="anonymous_status" value="' + item.anonymous_status + '">';
	        content += '<input type="hidden" name="user_id" value="' + item.user_id + '">';
	        content += '<td>' + item.question_idx + '</td>';
	        content += '<td>';
	        if (item.anonymous_status) {
	            content += '<img src="resources/img/locked.png" style="width: 16px; height: 16px; margin-right: 5px;">';
	        }
	        content += '<a href="#" class="question-link" data-question-idx="' + item.question_idx + '" data-anonymous="' + item.anonymous_status + '">' + item.q_title + '</a>';
	        content += '</td>';
	        content += '<td>' + item.user_id + '</td>';
	        var replyCheck = item.reply_check ? "Y" : "N";
	        content += '<td>' + replyCheck +'</td>';
	        content += '<td>' + item.q_hit +'</td>';
	        var date = new Date(item.q_reg_date);
	        var dateStr = date.toLocaleDateString("ko-KR");
	        content += '<td>' + dateStr + '</td>';
	        content += '</tr>';
	     }
	     $('#list').html(content);
	     $('#list').parent().css('text-align', 'center');
	
	     $('.question-link').click(function(e) {
	    	    e.preventDefault(); // 기본 동작 방지
	    	    
	    	    // 클릭된 글의 QUESTION_IDX 추출
	    	    var questionIdx = $(this).data('question-idx');
	    	    
	    	    // 유저 타입 확인
	    	    var userType = "${sessionScope.user_type}";
	    	    var loginId = "${sessionScope.loginId}";
	    	    
	    	    // 해당 글의 작성자 아이디 추출
	    	    var userId = $(this).closest('tr').find('input[name="user_id"]').val();
	    	    
	    	    // 해당 강의글을 작성한 강사의 아이디 추출
	    	    var teacherId = $(this).closest('tr').find('input[name="teacher_id"]').val();
	    	    
	    	    var anonymousStatus = $(this).data('anonymous');
	    	    
	    	    console.log(anonymousStatus);
	    	    console.log(userId);
	    	    console.log(teacherId);
	    	    
	    	    // 열람 권한 조건 확인
	    	    if (anonymousStatus === true && (userType === "admin"  ||  loginId === userId || loginId === teacherId)) {
        		// 열람 권한이 있는 경우 해당 페이지로 이동
       			 window.location.href = './lessonQnADetail?question_idx=' + questionIdx;
    			} else if (anonymousStatus === false) {
        		// ANONYMOUS_STATUS가 false이면 해당 페이지로 이동
        		window.location.href = './lessonQnADetail?question_idx=' + questionIdx;
    			} else {
        		// 그 외의 경우에는 열람 권한이 없음을 알림창으로 표시
        		alert("열람 권한이 없습니다.");
    			}
	    	});
		}
	
	$(document).ready(function() {
		
		var userType = "${sessionScope.user_type}";
		
	    // 만약 현재 사용자가 수강생이 아니라면
	    if (userType !== "수강생") {
	        // 작성 버튼 숨기기
	        $(".write").hide();
	    }

	});
	
	$(document).ready(function() {
	    // Q&A 작성 버튼 클릭 이벤트 처리
	    $(".write").click(function() {
	        // hidden 필드로부터 CLASS_IDX 값 가져오기
	        var classIdx = $('input[name="class_idx"]').val();

	        // Q&A 작성 페이지로 이동할 URL
	        var url = './lessonQnAWrite?class_idx=' + classIdx;

	        // 해당 URL로 이동
	        window.location.href = url;
	    });
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
