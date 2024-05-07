<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>내가 받은 리뷰</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
		.multiclickresult{
		   display: none;
		}
		
		
		#wrapper {
		    text-align: center;
		}
			
		#list-container {
		    margin-top: 30px;
		}
				
		#tab {
		    display: inline-block;
		    border: 2px solid #BEE6FF;
		    border-radius: 15px;
		    padding: 10px;
		    margin-bottom: 10px;
		    margin-left: 0px;
		    width: 98%;
		}
		
		#tab th,
	    #tab td {
	        padding: 8px; /* 각 셀의 패딩 조절 */
	        width:auto;
	        max-width: 200px; /* 각 셀의 최대 너비 설정 */
	        overflow: hidden; /* 텍스트 넘침 처리 */
	        text-overflow: ellipsis; /* 텍스트 넘침 시 생략 부호(...) 표시 */
	        white-space: nowrap; /* 텍스트가 너무 길어도 줄바꿈 없이 한 줄에 표시 */
	        text-align: center;
	    }

		#tab th {
	        border-bottom: 3px solid #BEE6FF;
	        padding: 8px;
	        font-size: 18px;
		}
		#list tr.list-item td {
		    border-top: 1px solid #BEE6FF; /* 바디의 각 행에 위쪽에 1픽셀 두께의 회색 선 추가 */
		}
		
		#list tr.list-item:first-child td {
		    border-top: none; /* 첫 번째 바디 행에는 위쪽 선을 없앱니다. */
		}
	    
	     #progress {
	        position: relative;
	        appearance: none;
	      }
	      
	      #progress::-webkit-progress-bar {
	        background: #f0f0f0;
	        border-radius: 12px;
	        border: 1px solid #eeeeee;
	        overflow: hidden;
	      }
	
	      #progress::-webkit-progress-value {
	        background: #fdd4d6;
	        border-radius: 0px;
	      }

	    .pagination {
		    display: inline-block;
		    padding-left: 0;
		    margin: 20px 0;
		    border-radius: 4px;
		    margin-left: -259px;
		}
		#nav__bar{
		 text-align:center;
		 margin-left:279px;
		}
		
		#heart{
		color: red;
		font-size: 34px;
		}
		
		#content {
		    width: 1000px;
		    padding: 10px;
		    padding-bottom: 100px;
		    margin-left: 113px;
		}
		h3{
		text-align: center;
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
    <div id="wrapper">
            <div id="sidemenu">
                <h3>내가 작성한 리뷰</h3>
                <hr/>
                <a href="teacherPage.go">마이페이지</a>
                <a href="teacherPageEdit.go">개인 정보 수정</a>
                <a href="teacherLessonList.go">강의 관리</a>
                <a href="teacherStudentList.go">수강생 관리</a>
                <a href="teacherQnaList.go">강의 Q&A 관리</a>
                <a href="teacherPointList.go">포인트 내역</a>
                <a href="teacherReceivedList.go">내가 받은 리뷰</a>
                <a href="teacherWrittenList.go">내가 작성한 리뷰</a>
            </div>
 		<!-- HTML 코드 -->
 		
	<div style="text-align: center; margin-top: 30px;">
	    <div id = "content"> 
		<div><h3>내가 작성한 리뷰</h3></div>
	       <hr style= "width: 100%; border: none; border-bottom: 1px solid black; margin-top: 5px;">
		    <div id="tab" >
		        <table style="border-collapse: collapse; width: 100%;">
		            <thead>
		                <tr>
							<th>날짜</th>
							<th>제목</th>
							<th>대상자</th>
							<th>만족도</th>
		                </tr>
		            </thead>
		            <tbody id="list">
		            
		            </tbody>
		            <tr>
		                <td colspan="6">
		                    <div class="container">                           
		                        <nav aria-label="Page navigation"  id = "nav__bar">
		                            <ul class="pagination" id="pagination"></ul>
		                        </nav>               
		                    </div>
		                </td>
		            </tr>
		        </table>
		    </div>
	    </div>
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
$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
});



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




var showPage =1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	 listCall(showPage);
});


function listCall(page){
    $.ajax({
       type:'get',
       url:'./teacherWrittenList.ajax',
       data:{
          'page':page,
          'cnt':10
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
       error:function(request, status, error){
    	   console.log("code: " + request.status)
           console.log("message: " + request.responseText)
           console.log("error: " + error);
       }
    });
}



function drawList(list) {
    var content = ''; // 테이블에 추가할 전체 문자열
    for (item of list) {
        
        function formatDate(dateString) {
            var date = new Date(dateString);
            if (dateString === null) {
                return '-';
            }
            return date.toLocaleDateString("ko-KR");
        }
        
        var rdate = formatDate(item.review_reg_date);

        content += '<tr class="list-item">';
        content += '<td>' + rdate + '</td>';
        content += '<td>'+ 
                    '<a href="lessonReviewDetail.go?review_idx=' + item.review_idx + '">' + item.review_title + '</a>' +
                   '</td>'; // 제목을 클릭하면 해당 리뷰의 세부 정보 페이지로 이동
        content += '<td>' + item.ratee_id + '</td>';
        content += '<td><span style="color: #FED000;">★</span>' + parseFloat(item.score).toFixed(1) + '</td>'; // score를 소숫점 한 자리까지 표시
        content += '</tr>';
    }
    $('#list').html(content); // 전체 문자열을 테이블에 추가
}





</script>
</html>