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
    height : 500px;
    margin: 0 auto; /* 중앙 정렬 */
    text-align: center; /* 텍스트 중앙 정렬 */
}

/* 입력 필드 스타일 */
.form-group {
    margin-bottom: 20px; /* 입력 필드 간격 설정 */
}

input[type="text"],
input[type="email"] {
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
</style>
</head>
<body>
    <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="#">추천 강의</a></th>
                <th class="menu"><a href="#">전체 강의</a></th>
                <th class="menu"><a href="#">고객센터</a></th>
            </tr>
        </table>
        <table id="mymenu">
            <tr>
                <th><img src="resources/img/alarm.png" id="alarm"></th>
                <th><a href="#">로그인</a></th>
            </tr>
        </table>
    </header>
    <div>
        ${msg}
    </div>
    

<form id="findForm" action="${contextPath }/member/findIdCheck" method="post">
   <div class="form-group input-group">
    <input type="text" name="email" id="email" placeholder="이메일">
    <button type="button" id="idFindEmailSubmit" onclick="submitEmail()">전송</button>
</div>
<div class="form-group input-group">
    <input type="email" name="CertificationNumber" id="CertificationNumber" placeholder="인증번호">
    <button type="button" id="idFindCertSubmit" onclick="submitCert()">확인</button>
</div>
    <button type="submit" id="id-find" onclick="findSubmit(); return false;">아이디 찾기</button>
</form>
	<%@ include file="layout/footer.jsp" %>
</body>
<script>
</script>
</html>