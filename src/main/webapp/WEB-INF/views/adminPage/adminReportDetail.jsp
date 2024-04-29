<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style> 
	#showlist {
		position : relative;
	    border-collapse: collapse;
	    width: 100%; /* 테이블 셀 경계를 병합하여 구분선이 하나만 나타나도록 설정 */
	}
	
	#showList th, #showList td {
	    border: 1px solid #dddddd; /* 셀 테두리 색상 설정 */
	    padding: 8px; /* 셀 내부 여백 설정 */
	    text-align: left; /* 텍스트를 왼쪽 정렬 */
	}
	
	#showList tr:nth-child(even) {
	    background-color: #f2f2f2; /* 짝수 행 배경색 설정 */

	}
	
	#showList th {
	    background-color: #dddddd; /* 헤더 배경색 설정 */
	    color: #333333; /* 헤더 텍스트 색상 설정 */
	}
	#divvv{
		display: flex;
		left: -400px;
		width: 100%;
	}
	.nidx{
		width: 8%;
	}
	.nid{
		width: 25%;
	}
	.nbhit{
		width: 16.6%;
	}
	.ndate{
		width: 20%;
	}
	.ntitle{
		width: 20%;	
	}
	.nchb{
		width: 10%;
	}
	#container{
		max-width: 600px;
	}
	#paaaa{
		position: relative;
		width: 80%;
		margin-left: 2%;
	}
	
	#wrapper1 {
    display: flex;
	}
	#adminside{
	height : 800px;
	}
	#reportdetail{
	text-align : center;
	font-size : 25px;
	margin-right : 50px;
	}
	p,td,span{
	margin-left :40px;
	font-size : 18px;
	}
	#text{
	font-size : 18px;
	}
	.contenthr {
	    margin-left: 40px;
	    border-width: 1px; /* 두께를 4px로 설정 */
	    border-color: black; /* 선의 색상을 검은색으로 설정 */
	    border-style: solid; /* 실선 스타일을 사용 */
	}
	
	#reviewDetailBtn{
	margin-left : 50px;
	}
	
	.footBtn {
	    text-align: center;
	    margin-left: 50px;
	    width: 120px;
	    height: 50px;
	}
	
</style>
</head>
<body>
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
    
    <div id = "divvv">
    <div id="wrapper1">
            <div id="adminside">
                <h3>신고 관리</h3>
                <hr/>
                <a href="/adminMain.go">관리자 페이지</a>
                <a href="#">회원 관리</a>
                <a href="#">강의 관리</a>
                <a href="/noticeManagement.go">공지사항 관리</a>
                <a href="faqManagement.go">faq 관리</a>
                <a href="adminSuggestionsLIst.go">건의사항 관리</a>
                <a href="#">리뷰 관리</a>
                <a href="adminReportManagement.go">신고 관리</a>
                <a href="userSuspensionHistory.go">회원 정지 이력</a>
            </div>
        </div>
        
   <div class="container">
   		<br><br>
        <h4 id = reportdetail>신고 상세보기</h4>
            <h4 id="boardTitle">신고 번호 : ${reportDetail.report_idx}</h4>
            <br><br><br><br>
            <tr>
           		<td><span>신고 대상 : ${reportDetail.class_name}
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
           		
           		           		
				작성일자 : ${reportDetail.report_date} &nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           		조치 상태 : ${reportDetail.report_state}</span>
           		</td>
			</tr>           	        
            <hr class = "contenthr">
            <span>신고 유형 : ${reportDetail.board_category}</span>
            <br><br><br><br><br>            
            <p id="boardContent">사유 : <br><br>${reportDetail.report_content}</p>
            <br><br><br><br><br>
			<input type="hidden" id="review_idx" value="${reportDetail.board_idx}">
			<button id="reviewDetailBtn" onclick="reviewDetail()">바로가기</button>
            
            <hr class = "contenthr">
            <tr>
			<td>
				<button class = "footBtn" id="returnList" onclick="backList()">돌아가기</button>
				<button class = "footBtn" id="reject" onclick="reject()">반려하기</button>
				<input type="hidden" id="report_idx" value="${reportDetail.report_idx}">
				<button class = "footBtn" id="actionWrite" onclick="writeAction()">조치내용 작성</button>
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
	function reject() {
	    // 확인창 표시
	    if (confirm("반려하시겠습니까?")) {
	        var xhr = new XMLHttpRequest();
	        var url = "./updateReportState";
	        var params = "report_idx=${reportDetail.report_idx}&new_state=반려";
	        xhr.open("POST", url, true);
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.onload = function() {
	            if (xhr.status == 200) {
	                document.getElementById("report_state").innerText = "반려";
	                // 반려 상태일 경우 버튼 비활성화
	                document.getElementById("reject").disabled = true;
	            }
	        };
	        xhr.send(params);
	    }
	}
	
	function disableButtons(report_state) {
	    if (report_state === "조치 완료" || report_state === "반려") {
	        document.getElementById("reject").disabled = true;
	    }
	}
	
	 function writeAction(){
		var reportIdx = document.getElementById("report_idx").value;
		var url = "./adminActionWrite.go?report_idx=" + ${reportDetail.report_idx}
	    window.location.href = url;

		 }

	function reviewDetail() {
	    // review_idx 값을 가져오기
	    var reviewIdx = document.getElementById("review_idx").value;
	
	    // 새로운 URL 생성
	    var url = "./lessonReviewDetail.go?review_idx=" + ${reportDetail.board_idx}
	
	    // 새로운 URL로 이동
	    window.location.href = url;
	}

	 function backList(){
	    location.href = "./adminReportManagement.go";
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
</script>
</html>