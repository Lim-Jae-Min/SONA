<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SONA FAQ 상세보기</title>
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
   	#reportdetail{
		text-align : center;
		font-size : 25px;
	}
	p,td,span{
		margin-left :40px;
		font-size : 18px;
	}
	
	#boardTitle{
		text-align : center;
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
    
    
   <div class="container" style="width:100%;">
   		<br>
        <h4 id = reportdetail>FAQ</h4>
            <h4 id="boardTitle">FAQ 질문 : ${faqDetail.faq_title}</h4>
            <br><br><br><br>
            <tr>
           		<td><span>조회 수 : ${faqDetail.faq_views}
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		           		           		
				게시판 종류 : ${faqDetail.faq_target} &nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		날짜 : ${faqDetail.faq_reg_date}</span>
           		</td>
			</tr>           	        
            <hr class = "contenthr">
            <span>작성자 : ${faqDetail.admin_id}</span>
            <br><br><br><br><br>            
            <p id="boardContent">답변 : <br><br>${faqDetail.faq_answer}</p>
            <br><br><br><br><br>
			<br><br>
            
            <hr class = "contenthr">
            <br><br>
            <tr>
			<td>
				<button class = "footBtn" id="returnList" onclick="backList()">돌아가기</button>
			</tr>
			
	           
             </div>
        <div id="boardDetail">


            
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
	
    function backList() {
        window.location.href = "./faqList.go";
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