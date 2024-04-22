<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 결제</title>
<style>
    /* 전체 영역 스타일 */
    .wrapper {
        max-width: 800px; /* 좀 더 넓은 크기로 조절 */
        margin: 0 auto;
        padding: 20px;
        background-color: #f9f9f9;
        border: 2px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    /* 각 영역 스타일 */
    .section {
        margin-bottom: 20px;
        padding: 20px;
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* 수평선 스타일 */
    .divider {
        border-top: 1px solid #ccc;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    /* 버튼 스타일 */
    .btn-group {
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
        transition: background-color 0.3s ease;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <%@ include file="../member/layout/header.jsp" %>
    <body>
        <!-- 전체 영역 -->
        <div class="wrapper">
            <!-- 프로필 영역 -->
            <div class="section profile">
                <img src="profile.jpg" alt="프로필 사진">
                <div>
                    <span id="userId">${sessionScope.loginId}</span><br>
                    <span>강의 제목: ${lectureTitle}</span><br>
                    <span>강의 횟수: ${lectureCount}</span><br>
                    <span>강의 가격: ${lecturePrice}</span>
                </div>
            </div>
            <!-- 각 영역을 구분하는 수평선 -->
            <div class="divider"></div>

            <!-- 보유 포인트 영역 -->
            <div class="section">
                <span>보유 포인트: ${havePoint}</span>
            </div>
            <!-- 수평선 -->
            <div class="divider"></div>

            <!-- 강의료 및 포인트 정보 영역 -->
            <div class="section">
                <span>총 강의료: ${totalLectureFee}</span><br>
                <span>현재 포인트: ${currentPoint}</span><br>
                <span>남은 포인트: ${remainingPoint}</span>
            </div>
            <!-- 수평선 -->
            <div class="divider"></div>

            <!-- 최종 결제 금액 영역 -->
            <div class="section">
                <span>최종 결제 금액: ${finalPaymentAmount}</span>
            </div>
            <!-- 수평선 -->
            <div class="divider"></div>

            <!-- 버튼 영역 -->
            <div class="btn-group">
                <button type="submit" class="btn">결제하기</button>
                <button type="button" class="btn">취소하기</button>
            </div>
        </div>
    </body>
</body>


<div id="footer">
    <%@ include file="../member/layout/footer.jsp" %>
</div>
</body>
<script>
</script>
</html>