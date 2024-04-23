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
            max-width: 400px;
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
    <!-- 헤더 영역에 프로필 및 로그인한 유저 정보 표시 -->
    <form action="chargePoint.do" method="post">
	        <div class="profile">
	            <img src="profile.jpg" alt="프로필 사진">
	            <span id="userId">${sessionScope.loginId}
	            <div> 님이 보유중인 포인트 ${havaPoint}</div>
	            </span>
	        </div>
	
	    <div class="container">
	        <h2>포인트 충전</h2>
	        <!-- 충전금액 입력 -->
	        <div class="form-group">
	            <label for="chargeAmount">충전금액:</label>
	            <input type="number" id="chargeAmount" name="amount" onkeyup="calculatePoints()" value="0">
	        </div>
	
	        <!-- 결제 방식 선택 -->
	        <div class="form-group">
	            <label>결제 방식:</label><br>
	            <input type="radio" id="creditCard" name="paymentMethod" value="creditCard" onchange="calculatePoints()">
	            <label for="creditCard">신용카드</label><br>
	            <input type="radio" id="debitCard" name="paymentMethod" value="debitCard" onchange="calculatePoints()">
	            <label for="debitCard">직불카드</label><br>
	            <input type="radio" id="bankTransfer" name="paymentMethod" value="bankTransfer" onchange="calculatePoints()">
	            <label for="bankTransfer">계좌이체</label>
	        </div>
	
	        <!-- 포인트 정보 표시 -->
	        <div class="point-info">
	            <p>보유 포인트: <span id="currentPoints">${havaPoint} P</span></p>
	            <p>충전 포인트: <span id="chargingPoints">0</span></p>
	            <p>결제금액: <span id="paymentAmount">0</span></p>
	            <p>충전 후 포인트: <span id="afterPoints">0</span></p>
	        </div>
	    <button type="submit"> 결제하기 </button>
	    </div>
	</form>
	
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
    
    <script>
        // 충전 포인트, 결제금액, 충전 후 포인트 계산 및 UI 업데이트 함수
        function calculatePoints() {
            // 충전금액 입력값 가져오기
            var chargeAmount = parseInt(document.getElementById('chargeAmount').value);

            // 현재 보유 포인트 가져오기 (여기서는 임의의 값으로 대체)
            var currentPoints = ${havaPoint};

            // 결제 방식 선택 여부 확인
            var paymentMethod = document.querySelector('input[name="paymentMethod"]:checked');

            // 결제 방식에 따라 결제 금액 설정 (여기서는 임의의 값으로 대체)
            var paymentAmount = chargeAmount*1.05;
            if (paymentMethod) {
                var method = paymentMethod.value;
                if (method === 'creditCard') {
                    // 신용카드 선택 시 추가 처리
                } else if (method === 'debitCard') {
                    // 직불카드 선택 시 추가 처리
                } else if (method === 'bankTransfer') {
                    // 계좌이체 선택 시 추가 처리
                }
            }

            // 충전 포인트 및 충전 후 포인트 계산
            var chargingPoints = chargeAmount;
            var afterPoints = currentPoints + chargingPoints;

            // UI 업데이트
            document.getElementById('currentPoints').innerText = currentPoints;
            document.getElementById('chargingPoints').innerText = chargingPoints;
            document.getElementById('paymentAmount').innerText = paymentAmount;
            document.getElementById('afterPoints').innerText = afterPoints;
        }
        
        
    </script>
</body>

<div id="footer">
    <%@ include file="../member/layout/footer.jsp" %>
</div>
</body>
<script>

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});
</script>
</html>