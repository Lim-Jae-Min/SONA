<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#footer{
	position: absolute;
    width: 100%; /* 화면 전체 너비 차지 */
}
.login{
    width: 480px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
}

.login h1 {
    font-size: 32px;
    color:#111;
    border-bottom: px solid #000;
    text-align: center;
    margin-right: 4px;
}

.login ul {
    list-style-type: none; /* 리스트의 글머리 제거 */
    padding: 0; /* 기본 패딩 제거 */
}

.login li {
    margin-bottom: 10px; /* 각 입력란과 버튼 사이의 간격을 조정합니다. */
}

.login input[type="text"],
.login input[type="password"],
.login button {
    width: calc(80% - 20px); /* 입력란과 버튼을 가로 폭을 동일하게 설정합니다. */
    padding: 10px; /* 내부 여백 설정 */
    margin-left: 60px;
    margin-bottom: 10px; /* 간격 조정 */
}
.login button{
    background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
    margin-bottom: 0;
}

.login input[type="text"],
.login input[type="password"]{
    margin-right: 10px;
}

.login div ul {
    display: flex;
    justify-content: center;
    margin-top: 0;
}
.login div ul li {position: relative; padding: 0 40px;}
.login div ul li~li:after {content: ""; position: absolute; left: 0; top: 4px;
                         height: 14px; width: 1px; background: #111; transform: rotate(25deg);}
.login div ul li a {font-size: 20%; color: #111;}

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
     
    </header>
    <form action="login.do" method="post">
    <section class="login" >
        <h1>로그인</h1>
        <ul>
            <li><input type="text" placeholder="아이디" title="아이디입력" name="id"></li>
            <li><input type="password" placeholder="비밀번호" title="비밀번호입력" name="pw"></li>
            <li><button>로그인</button></li>
        </ul>
    
        <div>
            <ul>
                <li><a href="joinform.go">회원가입</a></li>
                <li><a href="">아이디찾기</a></li>
                <li><a href="">비밀번호 찾기</a></li>
            </ul>    
        </div>
    </section>
    </form>
    <div>
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
</script>
</html>