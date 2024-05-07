<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 알림 상세보기</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
		hr{
		 width: 100%;
		 border: none;
		 border-bottom: 1px solid black;
		 margin-top: 5px;
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


		#content {
		    width: 1000px;
		    padding: 10px;
		    padding-bottom: 100px;
		    margin-left: 132px;
		}
	    
	    
	    .notification-item {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		}
		
		.title {
		    margin-right: auto; /* Delete button이 왼쪽으로 밀리도록 오른쪽 마진을 auto로 설정 */
		}
	    
	    .button {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #007bff;
		    color: #fff;
		    text-decoration: none;
		    border-radius: 5px;
		    cursor: pointer;
		    margin-top: 10px;
		}
		
		.button:hover {
		    background-color: #0056b3;
		}
		
		.button2 {
		    display: inline-block;
		    padding: 10px 20px;
		    background-color: #adabab;
		    color: black;
		    text-decoration: none;
		    border-radius: 5px;
		    cursor: pointer;
		    width: 64px;
   			text-align: center;
   			margin-top: 10px;
    		margin-left: 450px;
		}
		
		.button2:hover {
		    background-color: #8a8989;
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
	<div id="wrapper">
	    <div id="sidemenu">
	        <h2>알림</h2>
	        <hr/>
	    </div>
	    <div>
	        <div id="content">     
	            <div style="margin-bottom: 10px; margin-left: -2px;">
	                <div class="notification-item">
	                    <div class="title"><h2>${alarm.alarm_title}</h2></div>
	                    <div class="delete-button">
	                        <button class="click delete" onclick="del(${alarm.alarm_idx})">
	                            <i class="fas fa-trash-alt"></i>
	                        </button>
	                    </div>
	                </div>
	            </div>
	            <hr>
	            <div>${alarm.alarm_date}</div>
	            </br></br>
	            <div>${alarm.alarm_content}</div>
	            <div><a class="button" href="#">바로가기</a></div>
	            <hr>
	            <div><a class="button2" href="alarmList.go">목록</a></div>
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


function del(alarm_idx) {
	var confirmDelete = confirm("이 알림을 삭제하시겠습니까?");
    if (confirmDelete) {
        $.ajax({
            type: 'post',
            url: './detailDel.ajax',
            data: { alarm_idx: alarm_idx },
            dataType: 'json',
            success: function (data) {
                alert('선택하신 글이 삭제되었습니다.');
                $('#list').empty();
                listCall(showPage);
                // 알림이 삭제된 후 알림 리스트 페이지로 이동
                location.href = 'alarmList.go';
                console.log(data);
            },
            error: function (error) {
                console.log(error);
            }
        });
    } else {
    	
    }
}








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
		location.href = '/';	
	}
});

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
});


</script>
</html>