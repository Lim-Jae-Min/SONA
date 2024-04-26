<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 관리</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
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
		    margin-left: 500px;
		    width: 700px;
		}
		td{
		text-align:center;
		padding-top: 19px;
		}
		
		  th {
	        border-bottom: 2px solid #BEE6FF;
	        padding: 8px;
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
                <h3>마이페이지</h3>
                <hr/>
                <a href="teacherPage.go">마이페이지</a>
                <a href="teacherPageEdit.go">개인 정보 수정</a>
                <a href="teacherLessonList.go">강의 관리</a>
                <a href="teacherStudentList.go">수강생 관리</a>
                <a href="#">강의 Q&A 관리</a>
                <a href="#">포인트 내역</a>
                <a href="#">내가 받은 리뷰</a>
                <a href="#">내가 작성한 리뷰</a>
            </div>
 		<!-- HTML 코드 -->
 		
 		<div style="text-align: center; margin-top: 30px;">
 		<div style="margin-bottom: 10px; margin-left: 52px;">
 				상태:  <select name="class_name"></select> 
 		</div>
    <div id="tab" >
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                    <th>No</th>
					<th>이름</th>
					<th>강의명</th>
					<th>진행률</th>
					<th>상태</th>
					<th>시작일자</th>
					<th>종료일자</th>
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

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
	$('.click.class').first().click(); // click인 요소 중에서 클래스가 class인 첫 번째 요소를 선택하고, 그 요소에 클릭 이벤트를 발생시키는 역할
});



$(document).ready(function() {
	String userId = ${sessionScope.user_Id};
	classTitle(userId);
	listCall(showPage);
});

function classTitle(userId)
    // 강의 제목을 가져와서 드롭다운 박스에 추가
    $.ajax({
        type: 'GET',
        url: '/classTitle.ajax',
        user_id: userId // 현재 사용자의 아이디를 서버에 전달
        dataType: 'json',
        success: function(data) {
            // 가져온 강의 제목을 이용하여 드롭다운 박스에 옵션을 추가
            var dropdown = $('select[name=""]');
            $.each(data, function(index, title) {
                dropdown.append($('<option>').text(title));
            });
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
        
    });


function listCall(page){
    $.ajax({
       type:'get',
       url:'./studentLesson.ajax',
       data:{
          'page':page,
          'cnt':10
       },
       dataType:'json',
       success:function(data){
          drawList2(data.list);
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
    var lastIndex = list.length; // 마지막 인덱스
    for(item of list){
       console.log(item);
       content += '<tr class = "list-item">';
       // 인덱스를 역순으로 부여
       var index = lastIndex--;
       content += '<td>'+ index +'</td>';
       content += '<td>' + item.class_name + '</td>';
       content += '<td>'+ item.count+'명' + '</td>';
       content += '<td><span style="color: #FED000;">★</span>' + item.score +'</td>';
       // state 값에 따라 '활성' 또는 '비활성' 출력
       var stateText = item.state === 1 ? '비활성' : '활성';
       content += '<td>' + stateText +'</td>';
       var date = new Date(item.class_reg_date);
       var dateStr = date.toLocaleDateString("ko-KR");
       content += '<td>' + dateStr + '</td>';
       content += '</tr>';
    }
    $('#list').html(content);
}





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
	
	

</script>
</html>