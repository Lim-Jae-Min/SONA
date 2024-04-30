<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>알림</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>

	    /* '전체' 선택 버튼의 스타일 */
	    .click.read {
	        padding: 5px;
	        background-color: #2064f8; /* 파란색으로 변경 */
	        color: white;
	        border-radius: 5px;
	        display: inline-block;
	        cursor: pointer;
	        text-align: center;
	        font-weight: bold; /* 텍스트를 굵게 */
        	font-size: 17px; /* 폰트 사이즈 조절 */
	    }

			
		/* '삭제' 버튼의 스타일 */
	    .click.delete {
	        padding: 5px;
	        background-color: #fa3434; /* 빨간색으로 변경 */
	        color: white;
	        border-radius: 5px;
	        display: inline-block;
	        cursor: pointer;
	        text-align: center;
	        font-weight: bold; /* 텍스트를 굵게 */
        	font-size: 17px; /* 폰트 사이즈 조절 */
	    }
		.read, .delete {
		   width: 67px;
  		   height: 24px;
		}
		.clickresult{
		   display: none;
		}
		#content {
		    width: 1000px;
		    padding: 10px;
		    padding-bottom: 100px;
		}
		#tab {
		    display: inline-block;
		    border: 2px solid #BEE6FF;
		    border-radius: 15px;
		    padding: 10px;
		    margin-bottom: 10px;
		    margin-left: 98px;
		    width: 93%;
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
	    
	    #tab #checkbox{
	    width: 1px;
	    }
	    
	    #nav__bar{
		 text-align:center;
		 margin-left:0px;
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
                <th class="menu">
                	<c:if test="${sessionScope.loginId eq null}">
                		<a href="login.go">전체 강의</a>
                	</c:if>
                	<c:if test="${sessionScope.loginId ne null}">
                		<a href="allList.go">전체 강의</a>
                	</c:if>
                </th>
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
        <h2>알림</h2>
        <hr/>
    </div>
    <div>
	    <div id = "content">     
	        <div><h3>알림 목록</h3></div>
	        <hr style= "width: 100%; border: none; border-bottom: 1px solid black; margin-top: 5px;">
	 		<div style="margin-bottom: 10px; margin-left: 91px;">
	 			   <div class="click read">읽음</div>&nbsp;&nbsp;
				   <div class="click delete">삭제</div>&nbsp;&nbsp;
				   <input type="text" class="clickresult" name="class_state"/>
	 		</div>
	 		<div id="tab" >
		        <table style="border-collapse: collapse; width: 100%;">
		            <thead>
		                <tr>
		                	<th id= "checkbox"><input type="checkbox" id="all"/></th>
							<th>제목</th>
							<th>작성일자</th>
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

var showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	
	   listCall(showPage);
	});

function listCall(page){
	
	
    $.ajax({
       type:'get',
       url:'./alarmList.ajax',
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
        		  listCall(pg);
        	  }
        	  
          });
          
       },
       error: function(request, status, error) {
           console.log("code: " + request.status)
           console.log("message: " + request.responseText)
           console.log("error: " + error);
       }
    });
}


function drawList(list){
    var content = '';
    var lastIndex = list.length; // 마지막 인덱스
    for(item of list){
       console.log(item);
       content += '<tr class = "list-item">';
       content += '<td><input type="checkbox" name="selected" value="' + item.alarm_idx +'"/></td>';
       content += '<td>' +
      		 '<a href="alarmDetail.go?alarm_idx=' + item.alarm_idx + '">' + item.alarm_title + '</a>' +
    		  '</td>';
       var date = new Date(item.alarm_date);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       
       content += '</tr>';
    }
    $('#list').html(content);
}





$('#all').on('click', function() {
    var $chk = $('input[name="selected"]');
    if ($(this).prop('checked')) {
        $chk.prop('checked', true);
    } else {
        $chk.prop('checked', false);
    }
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
	location.href = '/main';
});

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
});


</script>
</html>