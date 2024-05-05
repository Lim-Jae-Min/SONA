<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 알림</title>
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
        	margin-left: 28px;
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
        	margin-left: -7px;
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
		    margin-left: 132px;
		}
		#tab {
		    display: inline-block;
		    border: 2px solid #BEE6FF;
		    border-radius: 15px;
		    padding: 10px;
		    margin-bottom: 10px;
		    margin-left: 22px;
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
	    
	    #tab th {
	        border-bottom: 3px solid #BEE6FF;
	        padding: 8px;
	        font-size: 20px;
		}
	    
	    #tab #checkbox{
	    width: 1px;
	    }
	    
	    #nav__bar{
		 text-align:center;
		 margin-left:0px;
		}
		
		#list tr.list-item td {
		    border-top: 1px solid #BEE6FF; /* 바디의 각 행에 위쪽에 1픽셀 두께의 회색 선 추가 */
		}
		
		#list tr.list-item:first-child td {
		    border-top: none; /* 첫 번째 바디 행에는 위쪽 선을 없앱니다. */
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
	 		<div style="margin-bottom: 10px; margin-left: -2px;">
	 				<div style="display: inline-block;"><botton class="click read" onclick="read()">읽음</button></div>&nbsp;&nbsp;
	 				<div style="display: inline-block;"><botton class="click delete" onclick="del()">삭제</button></div>&nbsp;&nbsp;
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
    for(item of list){
       console.log(item);
       content += '<tr class = "list-item">';
       content += '<td><input type="checkbox" name="selected" value="' + item.alarm_idx +'"/></td>';
       // 조회수에 따라 스타일을 추가
       var titleStyle = (item.alarm_views >= 1) ? 'color:red;' : 'font-weight: bold;'; // 조회수가 1 이상이면 회색, 아니면 검정색
       content += '<td style="' + titleStyle + '">' +
                  '<a href="alarmDetail.go?alarm_idx=' + item.alarm_idx + '">' + item.alarm_title + '</a>' +
                  '</td>';
       var date = new Date(item.alarm_date);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       
       content += '</tr>';
    }
    $('#list').html(content);
}


function del() {
    var delArr = [];
    $("input[name='selected']").each(function(index, item) {
      if ($(item).is(":checked")) {
         var val = $(this).val();
         console.log(val);
         delArr.push(val);
      }
   });
     $.ajax({
         type:'post' // method 방식
         ,url:'./del.ajax' // 요청할 주소 // 파라미터 
         ,data:{delList:delArr}
        ,dataType:'json' // 기본 데이터 타입은 JSON 이다
         ,success:function(data){
            if(data.cnt>0){
               alert('선택하신'+data.cnt+'개의 글이 삭제되었습니다.');
               $('#list').empty(); // 업데이트 전 리스트들을 지워버리고
               listCall(showPage); // 업데이트 후 리스트들을 다시 불러옴
            }
            console.log(data);
         } 
         ,error:function(error){ // 통신 실패한 경우
             console.log(error);
         }
     });
}



function read() {
    var readArr = [];
    $("input[name='selected']").each(function(index, item) {
        if ($(item).is(":checked")) {
            var val = $(this).val();
            console.log(val);
            readArr.push(val);
        }
    });
    
    $.ajax({
        type: 'post',
        url: './read.ajax',
        data: { readList: readArr },
        dataType: 'json',
        success: function(data) {
            if (data.cnt > 0) {
                alert('선택하신 ' + data.cnt + '개의 알림이 읽음 처리되었습니다.');
                $('#list').empty();
                listCall(showPage);
            }
            console.log(data);
        },
        error: function(error) {
            console.log(error);
        }
    });
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