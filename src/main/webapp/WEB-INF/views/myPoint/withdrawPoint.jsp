<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script> 
 <link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
 <style>
    .container {
        max-width: 500px;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="number"],
    input[type="radio"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .btn-group {
        margin-top: 20px;
        text-align: center;
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .result {
        margin-top: 20px;
    }
    
        /* Modal Container */
    .modal {
        display: none; /* 숨겨진 상태 */
        position: fixed; /* 고정 위치 */
        z-index: 1; /* 다른 요소 위에 표시 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* 스크롤 가능하도록 설정 */
        background-color: rgba(0,0,0,0.5); /* 배경색 및 투명도 조절 */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 모달을 화면 중앙에 위치 */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* 모달의 너비 */
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
        animation-name: modalopen;
        animation-duration: 0.4s;
    }

    /* Modal Open Animation */
    @keyframes modalopen {
        from {opacity: 0}
        to {opacity: 1}
    }

    /* Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
    img {
        width: 150px; /* 이미지의 너비 */
        height: 150px; /* 이미지의 높이 */
   	}
   	.profile {
        text-align: center; /* 텍스트 가운데 정렬 */
        margin-bottom: 20px; /* 아래 여백 */
   	}
   	.buttonDiv{
	position: relative;
	left:23%;
	}
	#cancelButton{
		width: 105px;
	}
</style>

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

	<!-- 헤더 영역에 프로필 및 로그인한 유저 정보 표시 -->
	<form action="withdrawPoint.do" method="post">
		<div class="profile">
			<br>
			<c:if test="${photoNewFileName != null}">
				<img src="/photo/${photoNewFileName}" class="lessonImg">
			</c:if>
			<c:if test="${photoNewFileName == null}">
				<img src="resources/img/basic_user.png" class="lessonImg">
			</c:if>

			<br> <span id="userId">
				<h2><a href = "userDetail.go?user_id=${sessionScope.loginId}">${sessionScope.loginId}</a></h2>
				<div>님이 보유중인 포인트 ${havePoint} P</div>
			</span>
		</div>

		<div class="container">
			<h2>포인트 출금</h2>
			<!-- 출금 금액 입력 -->
			<div class="form-group">
				<label for="withdrawAmount">출금 금액:</label> <input type="number"
					id="withdrawAmount" name="amount" onkeyup="calculatePoints()"
					value="0">
			</div>

			<!-- 출금 방식 선택 -->
			<hr>
			<div class="form-group">
				<div>
					<label>계좌정보</label>
					<p>
						이름: <span>${sessionScope.user_name}</span>
					</p>
					<p>
						계좌번호: <span>${userAccount}</span>
					</p>
					<p>
						전화번호: <span>${userPhone}</span>
					</p>

				</div>
			</div>
			<hr>
			<!-- 포인트 정보 표시 -->
			<div class="point-info">
				<label>출금 확인</label>
				<p>
					보유 포인트: <span id="currentPoints">${havePoint} P</span>
				</p>
<!-- 				<p>
					출금 포인트: <span id="withdrawingPoints">0</span>
				</p>
				<p>
					출금 후 포인트: <span id="afterPoints">0</span>
				</p> -->
			</div>
			<hr>
			<div class="buttonDiv">
				<button type="button" class="btn" onclick="withdrawPoint()">출금하기</button>
				<button type="button" class="btn" id="cancelButton"	onclick="myPageGo()">취소</button>
			</div>
		</div>
		
		

	</form>
	<!-- footer -->
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
				<td colspan="2">${sessionScope.user_name}회원님</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="manner">♥ ${sessionScope.manner_variance}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${sessionScope.point}</span>
		</div>
		<br />
		<div>
			<c:if test="${sessionScope.user_type eq '수강생'}">
				<a href="studentWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
			<c:if test="${sessionScope.user_type eq '강사'}">
				<a href="teacherWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
		</div>
		<br />
		<div>
			<a href="myPage.go">마이페이지</a>
		</div>
		<br />
		<br />
		<br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>
	<!-- footer끝 -->
<script>
	// 페이지 로드 시 저장된 출금 금액 불러오기


	window.onload = function() {
		var savedWithdrawAmount = sessionStorage.getItem('withdrawAmount');
		if (savedWithdrawAmount !== null) {
			document.getElementById('withdrawAmount').value = savedWithdrawAmount;
			calculatePoints();
		}
	};

	// 출금 포인트 및 출금 후 포인트 계산 및 UI 업데이트 함수
	function calculatePoints() {
		// 출금 금액 입력값 가져오기
		var currentPoints = ${havePoint};
		var withdrawAmount = parseInt(document.getElementById('withdrawAmount').value);

		// 현재 보유 포인트 가져오기 (여기서는 임의의 값으로 대체)

		// 출금 방식 선택 여부 확인
		var withdrawMethod = document
				.querySelector('input[name="withdrawMethod"]:checked');

		// 출금 방식에 따라 출금 금액 설정 (여기서는 출금 금액과 출금 후 포인트를 동일하게 처리)
		var withdrawingPoints = withdrawAmount;

		// 출금 후 포인트 계산
		var afterPoints = currentPoints - withdrawingPoints;

		// UI 업데이트
		document.getElementById('currentPoints').innerText = currentPoints
				+ ' P';
		document.getElementById('withdrawingPoints').innerText = withdrawingPoints
				+ ' P';
		document.getElementById('afterPoints').innerText = afterPoints + ' P';

		if (afterPoints < 0) {
			alert("출금 금액이 보유 포인트보다 많습니다. 다시 입력해 주세요.");
			document.getElementById('withdrawAmount').value = 0;
			calculatePoints();
		} else {
			// 계산된 출금 금액을 세션 스토리지에 저장
			sessionStorage.setItem('withdrawAmount', withdrawAmount);
		}
	}


	function withdrawPoint() {
		var withdrawAmount = parseInt($("#withdrawAmount").val());

		var confirmationMessage = "출금 금액: " + withdrawAmount + " P\n";
		confirmationMessage += "정말로 출금하시겠습니까?";

		if (confirm(confirmationMessage)) {
			$.ajax({
				url : "withdrawPoint.ajax",
				method : "POST",
				data : {
					amount : withdrawAmount
				},
				success : function(response) {
					if (response.success == 1) {
						
						var msg = response.msg;
						alert(msg);
						// 여기에 추가적으로 처리할 내용을 작성할 수 있습니다.
						window.location.href = "myPage.go";
					} else {
						
						var msg = response.msg;
						alert(msg);
					}
				},
				error : function(xhr, status, error) {
					alert("서버 오류로 인해 포인트 출금을 처리할 수 없습니다.");
				}
			});
		} else {
			alert("포인트 출금이 취소되었습니다.");
		}
	}
</script>
</body>

<script>
	
	function myPageGo(){
		location.href = "myPage.go";	
	};
	
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