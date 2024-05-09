<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>SONA</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
@import 'https://fonts.googleapis.com/css?family=Oswald';

html, body {
  
  background: #2193b0;  /* fallback for old browsers */
background: linear-gradient(to bottom, #6dd5ed, #BEE6FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Oswald', sans-serif;
  letter-spacing: 6px;
  overflow: hidden;
}

.water-fill {
  animation: wave 0.7s infinite linear, 
             fill-up 3s infinite ease-out alternate;
}

@keyframes wave {
  0% { x: -400px; }
  100% { x: 0; }
}


@keyframes fill-up {
  0% {
    height: 0;
    y: 130px;
  }
  100% {
    height: 160px;
    y: -30px;
  }
}
.txt{
	text-align: center;
}
</style>
</head>
<body>
	<!-- 로딩 화면 -->
	<svg class="loading" version="1.1" xmlns="http://www.w3.org/2000/svg"
		xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
		width="574.558px" height="190px" viewBox="0 0 574.558 120"
		enable-background="new 0 0 574.558 120" xml:space="preserve">
  <defs>
    <pattern id="water" width=".25" height="1.1"
			patternContentUnits="objectBoundingBox">
      <path fill="#59beff"
			d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z" />
    </pattern>
    
    <text id="text" transform="matrix(1 0 0 1 -8.0684 116.7852)"
			font-size="161.047" class="txt">  SONA ♬ </text>
    
    <mask id="text_mask">
      <use x="0" y="0" xlink:href="#text" opacity="1" fill="#fff" />
    </mask>
  </defs>
 
  <use x="0" y="0" xlink:href="#text" fill="#fff" />
  
  <rect class="water-fill" mask="url(#text_mask)" fill="url(#water)"
			x="-400" y="0" width="1600" height="120" />
</svg>
	<!-- 메인 페이지로 이동 -->
</body>
<script>
$(document).ready(function(){
    // 페이지 로딩이 완료되면 3초 후에 자동으로 페이지 이동
    setTimeout(function(){
        window.location.href = './videoList.go'; // 다음 페이지의 URL로 변경
    }, 3000); 
});



// 로딩 진행 시작


</script>
</html>