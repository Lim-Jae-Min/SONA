<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 신고 상세보기 - 관리자</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
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
		background-color : skyblue;
	    text-align: center;
	    margin-left: 50px;
	    width: 120px;
	    height: 50px;
	}
	#returnList{
	margin-left : 630px;
	}
	
	#boardTitle{
		margin-left : 40px;
	
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
    
    <div id = "divvv">
    <div id="wrapper1">
            <div id="adminside">
                <h3>신고 관리</h3>
                <hr/>
                <a href="adminMain.go">관리자 페이지</a>
                <a href="adminUserList.go">회원 관리</a>
                <a href="adminLessonList.go">강의 관리</a>
                <a href="adminNoticeList.go">공지사항 관리</a>
                <a href="adminFaqList.go">FAQ 관리</a>
                <a href="adminSuggestionsList.go">건의사항 관리</a>
                <a href="adminReviewList.go">리뷰 관리</a>
                <a href="adminReportManagement.go">신고 관리</a>
                <a href="userSuspensionHistory.go">회원 정지 이력</a>

            </div>
        </div>
        
   <div class="container" style="width:100%;">
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
			<span id="action_result">조치 상태 : ${reportDetail.action_result}</span>
           		</td>
			</tr>           	        
            <hr class = "contenthr">
            <span>신고 유형 : ${reportDetail.board_category}</span>
            <br><br><br><br><br>            
            <p id="boardContent">사유 : <br><br>${reportDetail.report_content}</p>
            <br><br><br><br><br>
			<input type="hidden" id="review_idx" value="${reportDetail.board_idx}">
			<button id="reviewDetailBtn" onclick="reviewDetail()">바로가기</button>
			<br><br>
            
            <hr class = "contenthr">
            <br><br>
            <tr>
			<td>
				<button class = "footBtn" id="returnList" onclick="backList()">돌아가기</button>
				<button type = "button" class = "footBtn" id="reject" onclick="reject()">반려하기</button>
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
window.onload = function() {
    // 반려 상태인 경우 버튼 비활성화
    var action_result = "${reportDetail.action_result}";
    if (action_result === "반려" || action_result === "조치 완료") {
        disableButtons("반려");
    }
};



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
                document.getElementById("action_result").innerText = "반려";
                // 반려 상태일 경우 버튼 비활성화
                disableButtons("반려"); // disableButtons 함수 호출
            }
        };
        xhr.send(params);
    }
}
	
	function disableButtons(action_result) {
	    if (action_result === "반려" || action_result === "조치 완료") {
	        var rejectButton = document.getElementById("reject");
	        var actionWriteButton = document.getElementById("actionWrite");

	        if (rejectButton || actionWriteButton) {
	            rejectButton.disabled = true;
	            actionWriteButton.disabled = true;
	        }
	    }
	}
	function writeAction() {
	    // 알림창 표시
	    if (confirm("작성하시겠습니까?")) {
	        // 작성창으로 이동
	        var reportIdx = document.getElementById("report_idx").value;
	        var url = "./adminActionWrite.go?report_idx=" + reportIdx;
	        window.location.href = url;
	    }
	}

	function reviewDetail() {
	    // review_idx 값을 가져오기
	    var reviewIdx = document.getElementById("review_idx").value;
	
	    // 새로운 URL 생성
	    var url = "./adminReviewDetail.go?review_idx=" + ${reportDetail.board_idx}
	
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
		location.href = 'adminMain.go';
	});

	$('.alarm').click(function alarmList() {
		location.href = 'alarmList.go';
	});
</script>
</html>