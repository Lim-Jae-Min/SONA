<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
.mainTable th, .mainTable td {
	padding: 20px;
}
.first-col {
	width: 200px;
}
.second-col {
	width: 500px;
}
.third-col {
	width: 100px;
}
.grayFont {
	color: gray;
}
.redFont {
	color: red;
}
.profileImg {
	height: 150px;
	width: 150px;
}
.actionLog {
	border: solid 1px gray;
	border-radius: 5px;
}
</style>
</head>
<body>
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
    <div id="wrapper">
            <div id="adminside">
                <h3>관리자 페이지</h3>
                <hr/>
                <a href="adminMain.go">관리자 페이지</a>
                <a href="adminUserList.go">회원 관리</a>
                <a href="#">강의 관리</a>
                <a href="#">공지사항 관리</a>
                <a href="#">FAQ 관리</a>
                <a href="#">건의사항 관리</a>
                <a href="#">리뷰 관리</a>
                <a href="#">신고 관리</a>
                <a href="#">회원 정지 이력</a>
            </div>
            <div id="content">
                <table class="mainTable">
                	<tr>
                		<th class="first-col">
                			<c:if test="${dto.new_filename eq null}">
                				<img src="resources/img/basic_user.png" class="profileImg"/>
                			</c:if>
                			<c:if test="${dto.new_filename ne null}">
                				<img src="/photo/${dto.new_filename}" class="profileImg"/>
                			</c:if>
                		</th>
                		<td class="second-col">
                			<span>${dto.user_name}&nbsp;&nbsp;${dto.user_type}</span>
                			<br/><br/>
                			<span class="grayFont">${dto.user_id}</span>
                		</td>
                		<th class="third-col">
                			<span class="redFont">♥&nbsp;${dto.manner}</span>
                		</th>
                	</tr>
                	<tr>
                		<th class="first-col">비밀번호</th>
                		<td class="second-col">${dto.user_pass}</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<th class="first-col">이메일</th>
                		<td class="second-col">${dto.user_email}</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<th class="first-col">전화번호</th>
                		<td class="second-col">${dto.user_phone}</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<th class="first-col">계좌번호</th>
                		<td class="second-col">${dto.user_bank}&nbsp;&nbsp;&nbsp;${dto.user_accountnumber}</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<th class="first-col">잔여포인트</th>
                		<td class="second-col">${dto.point}</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<th class="first-col">신고 조치내역</th>
                		<td class="second-col">
                			<div class="actionLog">
                			
                			</div>
                		</td>
                		<th class="third-col"></th>
                	</tr>
                	<tr>
                		<td colspan="3"></td>
                	</tr>
                </table>
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
<script>
$('#logo').click(function main(){
	location.href = 'adminMain.go';
});
</script>
</html>