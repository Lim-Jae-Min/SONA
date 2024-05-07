<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 회원 정지 이력 상세보기 - 관리자</title>
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
	#boardTitle {
		margin-left: 40px;
		text-align: left;
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
		margin-left : 50px;
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
	#writingAction{
		margin-left: 50px;
		width: 700px;
		height: 110px;
	}
	
	.prosecuter {
	    margin-left: 1097px;
	}
	#actionDetail {
		background-color : skyblue;
	    width: 200px;
	    margin-bottom: 10px;
	    height: 40px;
	    margin-left: 760px;
	    margin-top: 50px;
	}
	#unbanned{
		margin-left: 715px;
	}
	#myModal{
		text-align:center;
	}
	.son{
		margin-left: 600px;
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
                <h3>회원 정지 이력</h3>
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
        
   <div class="container" style = "width:100%;">
   		<br>
        <h4 id = reportdetail>회원 정지 이력 상세보기</h4>
            <h4 id="boardTitle">정지회원 번호 : ${suspension.banned_idx}</h4>
            
            <br><br>
            <td><span>정지 대상자 : ${suspension.user_name}</span>
            
            <input type="hidden" id="user_id" name = "user_id" value="${suspension.user_id}">
            
           	
            
            
  
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
                <span class = "son">정지기간 : ${suspension.start_date} ~ ${suspension.end_date}</span>

 				
    	       	<br><br>
          	  </td>       
            <hr class = "contenthr">
            <br>
            <span>유형 : ${suspension.action_category}</span>
            <span class = "prosecuter">조치자 : ${suspension.admin_id}</span>

            <br><br><br><br><br>            
			<p id="boardContent">정지 사유 : <br><br>신고 누적으로 인한 로그인<span id="suspensionPeriod"></span>일 정지</p>
			
            <br><br>
            
			<button type="button" id="actionDetail" onclick="viewUserDetail('${suspension.user_id}')">조치 내역 상세보기</button>
			<hr class = "contenthr">
			<br>

			<tr>
			<br>
			
			</tr>
            
            
            <tr>
			<td>
			
				<button type = "button" class = "footBtn" id="unbanned" onclick="unbanUser(${suspension.banned_idx})">정지 해제</button>
				<button type="button" class="footBtn" onclick="addban()">추가 정지</button>
				
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close" onclick="closeModal()">&times;</span>
				    <label for="end_date">추가 정지 기간:</label>
				    <input type="date" id="end_date">
				    <button id="confirmBtn" onclick="confirmBan(${suspension.banned_idx})">확인</button>
				  </div>
				</div>
				
				<!-- 버튼 -->
			</tr>			
	           
             </div>

			<span id="startDate" style="display: none;">${suspension.start_date}</span>
			<span id="endDate" style="display: none;">${suspension.end_date}</span>


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

	// 페이지 로드 시 실행되는 함수
	window.onload = function() {
	    // 모달을 숨깁니다.
	    closeModal();
	};


	function addban() {
		var modal = document.getElementById("myModal");
		modal.style.display = "block";
	}
	
		// 모달 닫기
	function closeModal() {
		var modal = document.getElementById("myModal");
		modal.style.display = "none";
	}
		
	function viewUserDetail(userId) {
	    window.location.href = "adminUserDetail.go?user_id=" + userId;
	}
	
		// 확인 버튼 클릭 시
	function confirmBan(banned_idx) {
	    var end_date = document.getElementById("end_date").value;
	    var xhr = new XMLHttpRequest();
	    var url = "./addBan"; // 컨트롤러의 매핑 주소
	    var params = "banned_idx=" + encodeURIComponent(banned_idx) + "&end_date=" + encodeURIComponent(end_date);
	    xhr.open("POST", url, true);
	    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	    xhr.onload = function() {
	        if (xhr.status == 200) {
	            alert("사용자가 추가 정지되었습니다.");
	            // 추가 정지 후에 필요한 추가 동작이 있으면 여기에 추가하세요.
	            // 추가 정지가 완료된 후에 userSuspensionHistory.go로 이동하도록 추가합니다.
	            window.location.href = "userSuspensionHistory.go";
	        } else {
	            alert("요청을 처리하는 동안 오류가 발생했습니다.");
	        }
	    };
	    xhr.send(params);
	    closeModal(); // 모달 닫기
	}






	function unbanUser(banned_idx) {
	    // 확인창 표시
	    if (confirm("정지를 해제하시겠습니까?")) {
	        var xhr = new XMLHttpRequest();
	        var url = "./unbanned";
	        var params = "banned_idx=" + encodeURIComponent(banned_idx);
	        xhr.open("POST", url, true);
	        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        xhr.onload = function() {
	            if (xhr.status == 200) {
	                alert("사용자가 정지가 해제되었습니다.");
	                // 정지 해제 후에 필요한 추가 동작이 있으면 여기에 추가하세요.
	                // 사용자가 정지가 해제된 후에 userSuspensionHistory.go로 이동하도록 추가합니다.
	                window.location.href = "userSuspensionHistory.go";
	            } else {
	                alert("요청을 처리하는 동안 오류가 발생했습니다.");
	            }
	        };
	        xhr.send(params);
	    }
	}

	
	function disableButtons(report_state) {
	    if (report_state === "조치 완료" || report_state === "반려하기") {
	        document.getElementById("reject").disabled = true;
	        document.getElementById("actionWrite").disabled = true;
	    }
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
		   if ('${sessionScope.user_type}' == '관리자') {
		      location.href = 'adminMain.go';
		   }else {
		      location.href = '/main';   
		   }
	});

	$('.alarm').click(function alarmList() {
		location.href = 'alarmList.go';
	});
	
	
	//suspension.start_date와 suspension.end_date를 각각 JavaScript Date 객체로 가정합니다.
	var startDateStr = document.getElementById('startDate').textContent;
	var endDateStr = document.getElementById('endDate').textContent;
	var startDate = new Date(startDateStr);
	var endDate = new Date(endDateStr);
	
	// 두 날짜의 차이를 계산합니다.
	var timeDifference = endDate.getTime() - startDate.getTime();
	var daysDifference = Math.ceil(timeDifference / (1000 * 60 * 60 * 24)); // 밀리초를 일 단위로 변환하고 반올림합니다.
	
	// 결과를 원하는 요소에 삽입합니다.
	document.getElementById('suspensionPeriod').textContent = daysDifference;
</script>
</html>