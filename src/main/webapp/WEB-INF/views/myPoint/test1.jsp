<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
#serviceSideMenu {
    color: black;
    padding: 10px;
    text-align: center;
    width: 200px; /* 메뉴 창 너비 */
    height: auto;
}
#serviceSideMenu a {
    display: block; /* 링크를 블록 레벨 요소로 표시하여 세로로 정렬 */
    padding: 10px;
}
.listTable {
   margin: 0 auto;
   border-collapse: collapse;
}
.blueFont {
   color: #024e7d;
}
.searchBox {
   float: right;
}
.first-col {
   width: 50px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.second-col {
   width: 100px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.third-col {
   width: 400px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.fourth-col {
   width: 100px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.fifth-col {
   width: 150px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.sixth-col {
   width: 150px;
   border-top: solid 1px lightgray;
   border-bottom: solid 1px lightgray;
}
.grayBackGround {
   background-color: lightgray;
}
#write {
   float: right;
}

#list tr.underline {
    border-bottom: 1px solid #ddd; /* 밑줄 스타일 및 색상 설정 */
}
</style>
</head>
<body>
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
       <div id="serviceSideMenu">
           <h3 class="blueFont">고객센터</h3>
           <hr/>
           <a href="#">공지사항</a>
           <a href="#">FAQ</a>
           <a href="#">건의사항</a>
       </div>
       <div id="content">
          <br/><br/><br/><br/>
           <table class="listTable">
              <thead>
                 <tr>
                    <td colspan="6">
                       <b>건의사항</b>
                       <span class="searchBox">
                          <select id="condition">
                             <option value="sug_title">제목</option>
                             <option value="sug_content">내용</option>
                             <option value="user_id">작성자</option>
                          </select>
                          <input type="text" id="searchContent"/>
                          <button id="search">검색</button>
                       </span>
                    </td>
                 </tr>
                 <tr><td colspan="6"><hr/></td></tr>
                 <tr>
                    <th class="first-col grayBackGround">No</th>
                    <th class="second-col grayBackGround"></th>
                    <th class="third-col grayBackGround">제목</th>
                    <th class="fourth-col grayBackGround">답변여부</th>
                    <th class="fifth-col grayBackGround">작성자</th>
                    <th class="sixth-col grayBackGround">작성일자</th>
                 </tr>
              </thead>
              <tbody id="list"></tbody>
                <tr>
                  <td colspan="6"><br/><br/>
                     <div class="container">                           
                        <nav aria-label="Page navigation" style="text-align:center">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>               
                    </div>
                  </td>
               </tr>
               <tr><td colspan="6"><button id="write">글 작성</button></td></tr>
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
	var category = 1;
	var showPage =1;
	var searchRemain = false;
	
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(showPage);
	});

	$('#search').click(function (){
		$('#pagination').twbsPagination('destroy');
		showPage =1;
		listCall(showPage);
	});

	function setCategory(num){
		console.log(num);
		category = num;
		$('#pagination').twbsPagination('destroy');
		showPage =1;
		listCall(showPage);
	}
	
	
	
	function listCall(page){
			var serachText = $('input[id="searchText"]').val();
			category =1;
			var searchType = 1;
			console.log(searchType);
			console.log(serachText);
	    $.ajax({
	       type:'get',
	       url:'adminSuggestionsLIst.ajax',
	       data:{
	    	    'page':page,
	    		'searchType':searchType,
	    		'serachText':serachText,
	    		'categoryNum' : category
	       },
	       dataType:'json',
	       success:function(data){
	          drawList(data.list);
	          
	          var startPage = 1;
	          
	       // 플러그인 추가
	       	$('#pagination').twbsPagination({
	    		startPage:data.currPage, // 시작 페이지
	    		totalPages:data.totalPages, // 총 페이지 갯수
	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	    			console.log(evt); // 이벤트 객체
	    			console.log(pg); //클릭한 페이지 번호 의미
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

	        content += '<td class="nidx">' + item.sug_idx + '</td><>';
	        content += '<td class="nidx">' + item.sug_secret + '</td>';
	        content += '<td class="ntitle">'+ item.sug_secret  +'<a href="faqDetailAdmin.go?idx=' + item.sug_idx + '">' + item.sug_title + '</a></td>'
	        content += '<td class="nid">' + item.user_id + '</td>';
	        var date = new Date(item.sug_reg_date);
	        var dateStr = date.toLocaleDateString("ko-KR");
	        content += '<td class="ndate">' + dateStr + '</td>';
	        
	        if (item.sug_answerCount >0) {
	            content += '<td class="nid">' + 'Y' + '</td>';	
	        } else {
	            content += '<td class="nid">' + 'N' + '</td>';				
	        }

	        content += '</tr>';
	        
	        // Add underline to each row
	        content += '<tr class="underline">';
	        content += '<td colspan="6"></td>';
	        content += '</tr>';
	    }

	    $('#list').html(content);
	}

	function del() {
		var delArr = [];
	    $("input[name='del']").each(function(index, item) {
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
	           		alert('선택하신'+data.cnt+'개의 클이 삭제되었습니다.');
	            	$('#list').empty();
	            	listCall();
	            }
	        	console.log(data);
	         } 
	         ,error:function(error){ // 통신 실패한 경우
	         	console.log(error);
	         }
	     });
	}

	$('#all').on('click',function(){
		var $chk = $('input[name="del"]');
		// attr : 정적 속성 : 처음부터 그려져 있거나 JSP에서 그린 내용
		// prop : 동적 속성 : 자바스크렙트로 나중에 그려진 내용 ※ 초보자들 시점 문제가 큼 : 
		// -> 렛갈림 시행 할려는 내용이 그려지는것보다 먼저면 attr 사용하면 안됨  
		if($(this).is(":checked")){
			$chk.attr('checked',true);	
		}else{
			$chk.attr('checked',false);
		}
		
	});
	
	
	function redirectToReplyPage() {
	    window.location.href = './videoList.go';
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
		location.href = '/main';
	});

	$('.alarm').click(function alarmList() {
		location.href = 'alarmList.go';
	});
	
	function faqWriteGo(){
		location.href = "adminFaqWrite.go";
		
	}
</script>
</html>