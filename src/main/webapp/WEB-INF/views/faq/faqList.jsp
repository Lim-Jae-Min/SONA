<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
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
		height: 30px;
		width: 50px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.second-col {
		height: 30px;
		width: 100px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.third-col {
		height: 30px;
		width: 400px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.fourth-col {
		height: 30px;
		width: 100px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.fifth-col {
		height: 30px;
		width: 150px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.sixth-col {
		height: 30px;
		width: 150px;
		border-top: solid 1px lightgray;
		border-bottom: solid 1px lightgray;
		text-align: center;
	}
	.grayBackGround {
		background-color: lightgray;
	}
	#write {
		float: right;
	}
	.locked {
		width: 20px;
		height: 20px;
		vertical-align: bottom;
	}
	#condition {
		height: 20px;
	}
	.faq-icon{
		height:17px;
		width:17px;
	}
	#paaaa{
		width : 100%;
	}
	.hr-row{
		width: 100%;
	}
	#showlist{
		width : 100%;
		height : 600px;
	}
	.cate{
		margin-left:10px;
		width : 110px;
		border: none;
        background-color: white; 
        color: black; 
	}
	   .selected {
        color: skyblue; /* 선택된 버튼의 글자색을 흰색으로 변경 */
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
	        <a href="noticeList.go">공지사항</a>
	        <a href="faqList.go">FAQ</a>
	        <a href="suggestionsList.go">건의사항</a>
	    </div>
        
     	<div id = "paaaa">    	  
	     	<h3>FAQ</h3> 
	     	<!-- 구분기능  -->
			<div>
				<button class = "cate" value="1" onclick="setCategory(1)">전체</button> 
				<button class = "cate" value="2" onclick="setCategory(2)">수강생</button>
				<button class = "cate" value="3" onclick="setCategory(3)">강사</button>
				<button class = "cate" value="4" onclick="setCategory(4)">서비스</button>
			</div>
			
			<br><br><hr>
		   <table id ="showlist">
		     <tbody id="list" class="listhead"></tbody>
				<tr>
					<td colspan="7" id = "paging">
						<div class="container">                           
		               		<nav aria-label="page navigation" style="text-align:center">
		                 	 <ul class="pagination" id="pagination"></ul>
		               		</nav> 
		               		<hr>              
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
	var category = 1;
	var showPage =1;
	var searchRemain = false;
	
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(showPage);
	});



	function setCategory(num){
	    console.log(num);
	    category = num;
	    $('#pagination').twbsPagination('destroy');
	    showPage = 1;
	    
	    // 모든 카테고리 버튼에서 선택 취소
	    $('.cate').removeClass('selected');
	    // 선택한 카테고리 버튼에 선택 표시
	    $('.cate[value="' + num + '"]').addClass('selected');
	    
	    listCall(showPage); // 새로운 카테고리에 맞는 리스트 호출
	}
	
	
	
	function listCall(page){

	    $.ajax({
	       type:'get',
	       url:'faqList.ajax',
	       data:{
	    	    'page':page,
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

	function drawList(list) {
	    var content = '';
	    for (var i = 0; i < Math.min(10, list.length); i++) {
	        var item = list[i];
	        content += '<tr>';
	        content += '<td class="ntitle"><a href="faqDetail.go?idx=' + item.faq_idx + '"><img src="resources/img/question.png" class="faq-icon"></a>&nbsp;&nbsp;' + item.faq_title + '</td>';
	        content += '</tr>';
	        content += '<tr class="hr-row hidden">';
	        content += '<td><hr></td>';
	        content += '</tr>';
	        content += '<tr class="answer-row hidden">';
	        content += '<td class="nbhit"><img src="resources/img/answer.jpg" class="faq-icon">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + item.faq_answer + '</td>';
	        content += '</tr>';
	        content += '<tr class="hr-row hidden">';
	        content += '<td><br><br><hr></td>';
	        content += '</tr>';
	    }
	    $('#list').html(content);

	    // 초기에는 모든 faq_answer와 구분선을 숨김
	    $('.answer-row').hide();
	    $('.hr-row').hide();

	    // FAQ title을 클릭했을 때 이벤트 처리
	    $('.ntitle').click(function() {
	        var $this = $(this);
	        var $answerRow = $this.parent().next().next('.answer-row');
	        var $hrRows = $this.parent().nextAll('.hr-row').slice(0, 2);
	        // 클릭한 faq_title과 관련된 faq_answer와 구분선 토글
	        $answerRow.slideToggle();
	        $hrRows.slideToggle();
	        // 다른 faq_answer와 구분선 숨기기
	        $('.answer-row').not($answerRow).slideUp();
	        $('.hr-row').not($hrRows).slideUp();
	    });
	}

	
	
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