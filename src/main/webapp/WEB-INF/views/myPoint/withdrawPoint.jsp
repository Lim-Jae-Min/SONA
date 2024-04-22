<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script> 
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

<body>
    <!-- 헤더 영역에 프로필 및 로그인한 유저 정보 표시 -->
    <form action="withdrawPoint.do" method="post">
        <div class="profile">
            <img src="profile.jpg" alt="프로필 사진">
            <span id="userId">${sessionScope.loginId}</span>
            <div>님이 보유중인 포인트 ${havaPoint} P</div>
        </div>

        <div class="container">
            <h2>포인트 출금</h2>
            <!-- 출금 금액 입력 -->
            <div class="form-group">
                <label for="withdrawAmount">출금 금액:</label>
                <input type="number" id="withdrawAmount" name="amount" onkeyup="calculatePoints()" value="0">
            </div>

            <!-- 출금 방식 선택 -->
            <div class="form-group">
				<div></div>
            </div>

            <!-- 포인트 정보 표시 -->
            <div class="point-info">
                <p>보유 포인트: <span id="currentPoints">${havaPoint} P</span></p>
                <p>출금 포인트: <span id="withdrawingPoints">0</span></p>
                <p>출금 후 포인트: <span id="afterPoints">0</span></p>
            </div>
            <button type="submit">출금하기</button>
        </div>
    </form>

    <script>
        // 출금 포인트 및 출금 후 포인트 계산 및 UI 업데이트 함수
        function calculatePoints() {
            // 출금 금액 입력값 가져오기
            var currentPoints = ${havaPoint};
            var withdrawAmount = parseInt(document.getElementById('withdrawAmount').value);

            // 현재 보유 포인트 가져오기 (여기서는 임의의 값으로 대체)
            var currentPoints = ${havaPoint};

            // 출금 방식 선택 여부 확인
            var withdrawMethod = document.querySelector('input[name="withdrawMethod"]:checked');

            // 출금 방식에 따라 출금 금액 설정 (여기서는 출금 금액과 출금 후 포인트를 동일하게 처리)
            var withdrawingPoints = withdrawAmount;

            // 출금 후 포인트 계산
            var afterPoints = currentPoints - withdrawingPoints;

            // UI 업데이트
            document.getElementById('currentPoints').innerText = currentPoints + ' P';
            document.getElementById('withdrawingPoints').innerText = withdrawingPoints + ' P';
            document.getElementById('afterPoints').innerText = afterPoints + ' P';
            
            if(afterPoints<0){
            	alert("출금 금액이 보유 포인트 보다 많습니다. 다시 입력해 주세요.");
            	 parseInt(document.getElementById('withdrawAmount').value=0);
            	 calculatePoints();
            }
        }
    </script>
</body>


<div id="footer">
    <%@ include file="../member/layout/footer.jsp" %>
</div>
</body>
<script>
</script>
</html>