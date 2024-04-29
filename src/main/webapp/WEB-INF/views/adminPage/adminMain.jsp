<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
.table {
	margin: 0 auto;
	border-collapse: collapse;
}
#topTable th {
	width: 200px;
	border: solid 2px gray;
	padding : 30px;
}
.topTableContent {
	height: 150px;
}
.marginLeft {
	margin-left: 20%;
}
.bottomTable-th {
	width: 463px;
	border: solid 2px gray;
	padding : 30px;
}
.innerTable {
	border-collapse: collapse;
	margin: 0 auto;
}
.innerTable th {
	width: 100px;
	padding: 20px 5px;
	border: solid 1px lightgray;
}
.grayBackGround {
	background-color: lightgray;
}
#innerGraph {
	display: none;
}
.topGraph {
	height: 300px;
	width: 150px;
	vertical-align: bottom;
}
.middleGraph {
	background-color: rgb(224, 224, 224);
	padding: 10px 0;
}
.bottomGraph {
	background-color: lightgray;
	padding: 5px 10px;
	text-align: left;
}
.innerGraph {
	border-collapse: collapse;
	margin: 0 auto;
}
.miniBox {
	height: 10px;
	width: 10px;
	display: inline-block;
}
.redBackGround {
	background-color: rgb(255, 80, 80);
}
.yellowBackGround {
	background-color: rgb(253, 255, 121);
}
.blueBackGround {
	background-color: rgb(80, 150, 255);
}
.bar {
	height: 100px;
	display: inline-block;
}
.inline {
	display: inline-block;
}
.barWidth {
	width: 30px;
}
</style>
</head>
<body>
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
            	<br/><br/><br/><br/>
                <table class="table" id="topTable">
                	<tr>
                		<th>건의사항 답변 대기</th>
                		<th>신고 조치 대기</th>
                		<th>누적 회원 수</th>
                		<th>누적 수익금</th>
                	</tr>
                	<tr>
                		<th class="topTableContent">2 건</th>
                		<th class="topTableContent">2 건</th>
                		<th class="topTableContent">2 명</th>
                		<th class="topTableContent">2 원</th>
                	</tr>
                </table>
                <br/><br/><br/><br/><br/><br/>
                <table class="table">
                	<thead>
                		<tr>
                			<td>
                				<b>SONA 통계 (최근 3개월)</b><br/><br/>
                			</td>
                		</tr>
                	</thead>
                	<tbody>
	                	<tr>
	                		<th class="bottomTable-th">
	                			<table class="innerTable">
	                				<tr>
	                					<th class="grayBackGround"></th>
	                					<th class="grayBackGround">2월</th>
	                					<th class="grayBackGround">3월</th>
	                					<th class="grayBackGround">4월</th>
	                				</tr>
	                				<tr>
	                					<th class="grayBackGround">신규 수강생</th>
	                					<th>10</th>
	                					<th>20</th>
	                					<th>30</th>
	                				</tr>
	                				<tr>
	                					<th class="grayBackGround">신규 강사</th>
	                					<th>10</th>
	                					<th>20</th>
	                					<th>30</th>
	                				</tr>
	                				<tr>
	                					<th class="grayBackGround">신규 강의</th>
	                					<th>10</th>
	                					<th>20</th>
	                					<th>30</th>
	                				</tr>
	                			</table>
	                		</th>
	                		<th class="bottomTable-th">
	                			<!-- <table class="innerTable" id="innerGraph">
	                				<thead>
		                				<tr>
		                					<td></td>
		                					<th>2월</th>
		                					<th>3월</th>
		                					<th>4월</th>
		                				</tr>
	                				</thead>
	                				<tbody>
		                				<tr>
		                					<th>신규 수강생</th>
		                					<td>10</td>
		                					<td>20</td>
		                					<td>30</td>
		                				</tr>
		                				<tr>
		                					<th>신규 강사</th>
		                					<td>10</td>
		                					<td>20</td>
		                					<td>30</td>
		                				</tr>
		                				<tr>
		                					<th>신규 강의</th>
		                					<td>10</td>
		                					<td>20</td>
		                					<td>30</td>
		                				</tr>
	                				</tbody>
	                			</table> -->
	                			<table class="innerGraph">
	                				<tr>
	                					<th class="topGraph">
	                						<div class="inline">
		                						<div class="barWidth">10</div>
		                						<div class="bar barWidth redBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">10</div>
		                						<div class="bar barWidth blueBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">10</div>
		                						<div class="bar barWidth yellowBackGround"></div>
	                						</div>
	                					</th>
	                					<th class="topGraph">
	                						<div class="inline">
		                						<div class="barWidth">20</div>
		                						<div class="bar barWidth redBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">20</div>
		                						<div class="bar barWidth blueBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">20</div>
		                						<div class="bar barWidth yellowBackGround"></div>
	                						</div>
	                					</th>
	                					<th class="topGraph">
	                						<div class="inline">
		                						<div class="barWidth">30</div>
		                						<div class="bar barWidth redBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">30</div>
		                						<div class="bar barWidth blueBackGround"></div>
	                						</div>
	                						<div class="inline">
		                						<div class="barWidth">30</div>
		                						<div class="bar barWidth yellowBackGround"></div>
	                						</div>
	                					</th>
	                				</tr>
	                				<tr>
	                					<th class="middleGraph">2월</th>
	                					<th class="middleGraph">3월</th>
	                					<th class="middleGraph">4월</th>
	                				</tr>
	                				<tr>
	                					<th colspan="3" class="bottomGraph">
	                						<div class="miniBox redBackGround"></div> 신규 수강생&nbsp;&nbsp;&nbsp;
	                						<div class="miniBox blueBackGround"></div> 신규 강사&nbsp;&nbsp;&nbsp;
	                						<div class="miniBox yellowBackGround"></div> 신규 강의
	                					</th>
	                				</tr>
	                			</table>
	                		</th>
	                	</tr>
                	</tbody>
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

/* $('#innerGraph').visualize({type: 'bar'}); */

</script>
</html>