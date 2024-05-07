<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#contentTable {
	margin: 0 auto;
	width: 900px;
}
#sug_title {
	width: 500px;
}
#sugContent {
	width: 100%;
	height: 300px;
	resize: none;
}
.right {
	float: right;
}
button {
	background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
   	width: 70px;
}
#goList {
	background-color: gray;
}
.contentPhoto {
	width: 300px;
	height: 300px;
	display: block;
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
    
    <div>
    	<br/><br/><br/><br/>
    	<form action="adminSuggestionsEdit.do?sug_idx=${dto.sug_idx}" method="post" enctype="multipart/form-data">
    		<table id="contentTable">
	        	<tr>
	        		<td><b>건의사항 작성</b></td>
	        	</tr>
	        	<tr><td><hr/></td></tr>
	        	<tr>
	        		<td>
	        			<span>제목</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			<input type="text" name="sug_title" placeholder="제목을 입력해주세요." id="sug_title" value="${dto.sug_title}"/>
	        		</td>
	        	</tr>
	        	<tr><td><hr/></td></tr>
	        	<tr><td>내용</td></tr>
	        	<tr>
	        		<td>
	        			<textarea name="sug_content" placeholder="내용을 입력해주세요." id="sugContent">${dto.sug_content}</textarea>
	        		</td>
	        	</tr>
	        	<c:if test="${photos.size() > 0}">
	        		<tr>
	        			<td>
	        				<c:forEach items="${photos}" var="photo">
	        					<img src="/photo/${photo.new_filename}" class="contentPhoto"/><br/>
	        				</c:forEach>
	        			</td>
	        		</tr>
	        	</c:if>
	        	<tr><td><hr/></td></tr>
	        	<tr>
	        		<td>
	        			<span>
	        				<input type="file" name="sug_photos" multiple="multiple" id="photos"/>
	        			</span>
	        			<span class="right">
	        				<input type="radio" name="sug_secret" value="0" id="secretOff"/>공개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				<input type="radio" name="sug_secret" value="1" id="secretOn"/>비공개
	        			</span>
	        		</td>
	        	</tr>
	        	<tr><td><br/></td></tr>
	        	<tr><td><br/></td></tr>
	        	<tr>
	        		<td>
	        			<span class="right">
	        				<button type="button" id="editSubmit">수정</button>
	        				<button type="button" id="goList">돌아가기</button>
	        			</span>
	        		</td>
	        	</tr>
	        </table>
    	</form>
    	<br/><br/><br/><br/><br/>
    </div>
    <div id="footer">
        <li>상호명 : SONA</li>
        <li>대표자 : 김○○</li>
        <li>전화 : 02-123-4567</li>
        <li>팩스 : 02-123-4568</li>
        <li>사업자등록번호 : 000-00-00000</li>
        <li>본관 : (08505) 서울특별시 금천구 가산디지털2로 95</li>
    </div>
    <div id="slide">
        <table>
            <tr>
                <td colspan="2">${sessionScope.user_name} 회원님</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="manner">♥ ${sessionScope.manner_variance}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${sessionScope.point}</span></div>
        <br/>
        <div>
        	<c:if test="${sessionScope.user_type eq '수강생'}">
	        	<a href="studentWrittenList.go">내가 쓴 리뷰</a>        	
        	</c:if>
        	<c:if test="${sessionScope.user_type eq '강사'}">
	        	<a href="teacherWrittenList.go">내가 쓴 리뷰</a>        	
        	</c:if>
        </div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="logout.do">로그아웃</a></div>
    </div>
</body>
<script>

$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});

$('#logo').click(function main(){
	location.href = '/main';
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});

$('#goList').click(function (){
	location.href = 'adminSuggestionsList.go';
});

$('#editSubmit').click(function (){
	var result = confirm('수정하시겠습니까?')
	
	var $sug_title = $('input[name="sug_title"]');
	var $sug_content = $('textarea[name="sug_content"]');
	
	if (result) {
		if ($sug_title.val() == '') {
			alert('제목을 입력해주세요.');
			$sug_title.focus();
		}else if ($sug_content.val() == '') {
			alert('내용을 입력해주세요.');
			$sug_content.focus();
		}else {
			$('form').submit();
		}
	}
});

var secret = parseInt('${dto.sug_secret}');

if (secret == 0) {
	$('#secretOff').prop('checked', true);
}else if (secret == 1) {
	$('#secretOn').prop('checked', true);
}

</script>
</html>