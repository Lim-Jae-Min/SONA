<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    background-color: #BEE6FF; /* 초기 배경색 */
    overflow: hidden; /* 가로 스크롤 막기 */
}

#loadingScreen {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}

#loadingScreen img {
    width: 100px; /* 로고 이미지 너비 조정 */
    height: auto;
    margin-bottom: 20px;
}

.loadingBarContainer {
    width: 200px; /* 로딩 진행바 컨테이너 너비 */
    height: 20px; /* 로딩 진행바 컨테이너 높이 */
    background-color: #BEE6FF; /* 로딩 진행바 색상 */
    border-radius: 10px; /* 로딩 진행바 컨테이너 둥근 모서리 */
    overflow: hidden; /* 내부 요소 오버플로우 처리 */
}

#loadingBar {
    width: 0; /* 초기 로딩 진행도 0% */
    height: 100%; /* 로딩 진행바 높이 */
    background-color: #ffffff; /* 로딩 진행바 색상 */
    animation: wave 2s infinite; /* 파도 애니메이션 적용 */
}

@keyframes wave {
    0% { background-position-x: 0; }
    100% { background-position-x: 100%; }
}

#loadingProgress {
    margin-top: 20px; /* 로딩 진행 메시지 상단 여백 */
    font-size: 16px;
    color: #333333; /* 로딩 진행 메시지 색상 */
}

/* 물결 애니메이션 */
body::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to right, #ffffff 0%, #BEE6FF 50%, #ffffff 100%);
    z-index: -1;
    animation: waveBackground 5s infinite;
}

@keyframes waveBackground {
    0% {
        background-position: -100% 0;
    }
    100% {
        background-position: 100% 0;
    }
}
</style>
</head>
<body>
 <!-- 로딩 화면 -->
    <div id="loadingScreen">
        <img src="resources/img/logo.png" alt="로딩 중...">
        <div class="loadingBarContainer">
            <div id="loadingBar"></div>
        </div>
        <p id="loadingProgress">로딩 중...</p>
    </div>
    <!-- 메인 페이지로 이동 -->
</body>
<script>
function increaseProgress() {
    var loadingBar = document.getElementById("loadingBar");
    var loadingProgress = document.getElementById("loadingProgress");
    var width = 1;
    var id = setInterval(frame, 10); // 20ms 마다 실행

    function frame() {
        if (width >= 100) {
            clearInterval(id); // 로딩 진행이 완료되면 setInterval 종료
            window.location.href = './videoList.go'; // 로딩 진행이 완료되면 메인 페이지로 이동
        } else {
            width++;
            loadingBar.style.width = width + "%";
            loadingProgress.innerHTML = width + "% 로딩 중...";
        }
    }
}

// 로딩 진행 시작
increaseProgress();

</script>
</html>