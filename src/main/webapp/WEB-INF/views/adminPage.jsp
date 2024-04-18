<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
</style>
</head>
<body>
<body>
    <header>
        <table id="adminmain">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"></th>
                <th class="menu"></th>
                <th class="menu"></th>
            </tr>
        </table>
        <table id="mymenu">
            <tr>
                <th><img src="resources/img/alarm.png" id="alarm"></th>
                <th><a href="#">로그인</a></th>
            </tr>
        </table>
    </header>
    <div id="wrapper">
            <div id="adminside">
                <h3>관리자 페이지</h3>
                <hr/>
                <a href="#">관리자 페이지</a>
                <a href="#">회원 관리</a>
                <a href="#">강의 관리</a>
                <a href="#">공지사항 관리</a>
                <a href="#">FAQ 관리</a>
                <a href="#">건의사항 관리</a>
                <a href="#">리뷰 관리</a>
                <a href="#">신고 관리</a>
                <a href="#">회원 정지 이력</a>
            </div>
            <div id="content">
                ${msg}
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
</html>
</body>
<script>
</script>
</html>