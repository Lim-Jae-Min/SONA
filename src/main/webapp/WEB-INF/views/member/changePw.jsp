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
#findForm {
    max-width: 300px; /* 폼의 최대 너비 설정 */
    margin: 0 auto; /* 좌우 중앙 정렬 */
    position: absolute; /* 위치를 절대값으로 설정 */
    top: 50%; /* 상단 위치를 화면 세로 중앙에 */
    left: 50%; /* 좌측 위치를 화면 가로 중앙에 */
    transform: translate(-50%, -50%); /* 수평 및 수직으로 50% 이동하여 정중앙에 */
    text-align: center; /* 텍스트 중앙 정렬 */
}   

/* 입력 필드 스타일 */
.form-group {
    margin-bottom: 20px; /* 입력 필드 간격 설정 */
}

input[type="text"],
input[type="password"] {
    width: 100%; /* 입력 필드 너비 설정 */
    padding: 10px; /* 입력 필드 안 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    border: 1px solid #ccc; /* 테두리 스타일 설정 */
    border-radius: 5px; /* 테두리 모서리 둥글게 설정 */
}

/* 제출 버튼 스타일 */
#id-find {
    display: block; /* 블록 요소로 설정하여 가로 너비 전체 차지 */
    width: 100%; /* 버튼 너비 설정 */
    padding: 10px; /* 버튼 안 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    background-color: #007bff; /* 배경색 설정 */
    color: #fff; /* 글자색 설정 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 모서리 둥글게 설정 */
    cursor: pointer; /* 커서 모양 변경 */
}

#id-find:hover {
    background-color: #0056b3; /* 호버 상태 배경색 변경 */
}
.input-group {
    position: relative;
    display: inline-block;
}

/* 버튼 스타일 */
.input-group button {
    position: absolute;
    top: 50%;
    right: 5px; /* 또는 원하는 위치로 조정 */
    transform: translateY(-50%);
}
#footer {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
    padding: 10px; /* 여백 지정 */
    border-top: 1px solid #ccc; /* 윗부분 테두리 추가 */
}
</style>
</head>
<body>
<%@ include file="layout/header.jsp" %>

<form id="findForm" method="post">
	<input type="hidden" name = "changePwNeedId" value=${changePwNeedId}>  
    <div class="form-group input-group">
        <input type="password" name="newPassword" id="newPassword" placeholder="새로운 비밀번호">
    </div>
    <div class="form-group input-group">
        <input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인">
    </div>
    <button type="button" id="changePw" onclick="changePassword()">비밀번호 변경</button>
    
</form>

<div id="footer">
    <%@ include file="layout/footer.jsp" %>
</div>

</body>

<script>
	function changePassword(){
	var password = $('input[name="newPassword"]').val();
	var confirmPassword = $('input[name="confirmPassword"]').val();
	console.log(confirmPassword + password);
		if(password != confirmPassword){
			alert("비밀번호를 다시 확인해 주세요.")
		}else{
			alert("비밀번호가 변경 되었습니다.")
			$('#findForm').attr("action","changePw.do").submit();
		}	
	}
</script>
</html>