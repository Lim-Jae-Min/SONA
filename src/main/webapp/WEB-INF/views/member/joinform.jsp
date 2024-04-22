<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
.join{
    width: 452px;
    height: 720px;
    position: absolute;
    left: 50%;
    top: 44%;
    transform: translate(-50%,-50%);
}

.join h1 {
    font-size: 32px;
    color:#111;
    border-bottom: px solid #000;
    text-align: center;
    margin-right: 4px;
}

.join ul {
    list-style-type: none; /* 리스트의 글머리 제거 */
    padding: 0; /* 기본 패딩 제거 */
    margin-top: 	-9px;
}

.join li {
    margin-bottom: -10px; /* 각 입력란과 버튼 사이의 간격을 조정합니다. */
}


.join p {
    margin-bottom: 5px;
    margin-top: 0;
}
#join_button{
    background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
    width: 104%;
    height: 45px;
    margin-top: 10px;
}


.join input[type="text"],
.join input[type="password"],
.join input[type="radio"],
.join p{
    margin-right: 10px;
    margin-bottom: 11px;
    width: 100%; /* 입력 필드 너비 설정 */
    padding: 8px; /* 입력 필드 안 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    border-radius: 5px; /* 테두리 모서리 둥글게 설정 */
}

.join div ul {
    display: flex;
    justify-content: center;
    margin-top: 0;
}
.join div ul li {position: relative; padding: 0 40px;}
.join div ul li~li:after {content: ""; position: absolute; left: 0; top: 4px;
                         height: 14px; width: 1px; background: #111; transform: rotate(25deg);}
.join div ul li a {font-size: 20%; color: #111;}

.join .radio {
    display: flex; /* 라디오 버튼을 가로로 정렬하기 위해 flexbox 사용 */
    justify-content: center; /* 가운데 정렬 */
     margin-left: 92px;
     margin-top:14px;
}


.join .radio label {
        margin-right: 86px; /* 라벨과 다음 라디오 버튼 사이의 간격 조정 */
}


.join .radio input[type="radio"] {
    margin-right: 5px; /* 각 라디오 버튼 사이의 간격 조정 */
    width: 20px; /* 너비 조정 */
    height: 20px; /* 높이 조정 */
}
.join select {
    width: 33%; /* 드롭다운 메뉴의 너비 설정 */
    padding: 10px; /* 드롭다운 메뉴의 여백 설정 */
    font-size: 12px; /* 드롭다운 메뉴의 폰트 크기 설정 */
    border-radius: 5px; /* 드롭다운 메뉴의 테두리 모서리 둥글게 설정 */
    margin-bottom: 12px;
}
#footer{
	position: absolute;
    width: 100%; /* 화면 전체 너비 차지 */
}
.join li select {
    margin-left: 10px; /* 드롭다운 메뉴와 텍스트 입력란 사이의 간격 조정 */
    vertical-align: middle; /* 드롭다운 메뉴를 수직 정렬 */
}
.ptag p{
	margin-bottom: 0px;
}

.join #info__id {
  position: relative;
}

#info__id input[type="text"] {
  width: calc(80% - 9px); /* 입력 필드 너비 설정 */
  padding: 10px; /* 입력 필드 안 여백 설정 */
  font-size: 16px; /* 폰트 크기 설정 */
  border-radius: 5px; /* 테두리 모서리 둥글게 설정 */
}

#info__id .check {
  position: absolute;
  width: 90px; /* 버튼 너비 설정 */
  height: calc(100% - 13px); /* 버튼 높이 설정 */
  top: 0;
  right: -20px;
  margin: auto 0;
  border: none; /* 버튼의 테두리 없애기 */
  background-color: #BEE6FF; /* 버튼 배경색 설정 */
  color: black; /* 버튼 텍스트 색상 설정 */
  border-radius: 0 10px 10px 0; /* 버튼 오른쪽 모서리 둥글게 설정 */
}
#boxcolor{

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
    </header>
    <form action="join.do" method="post">
	    <section class="join" >
	        <h1>회원가입</h1>
	        	<p>*아이디</p>
	            <div id="info__id">
                <input type="text" placeholder="아이디" name="id">
                <input type="button" class="check" value="중복체크" onclick="overlay()"/>
                </div>
	        <ul>
	            <li><p>*이름</p></li>
	            <li><input type="text" placeholder="이름(실명)"name="name"></li>
	            <li><p>*이메일 인증</p></li>
	            <li><input type="text" placeholder="이메일을 입력해주세요." name="email"></li>
	            <li><p>*비밀번호</p></li>
	            <li><input type="password" placeholder="비밀번호" name="pw"></li>
	            <li ><input id="boxcolor" type="password"  placeholder="비밀번호 확인" name="confirm"></li>
	            <li><p>*전화번호</p></li>
	            <li><input type="text" placeholder="전화번호 입력" name="phone"></li>
	            <li class="ptag"><p>*계좌번호</p>
	            <select name="bank">
				        <option value="국민은행">국민은행</option>
				        <option value="신한은행">신한은행</option>
				        <option value="우리은행">우리은행</option>
				        <option value="하나은행">하나은행</option>
				        <option value="기업은행">기업은행</option>
				        <option value="농협은행">농협은행</option>
				        <option value="카카오뱅크">카카오뱅크</option>
				        <!-- 다른 은행도 필요에 따라 추가할 수 있습니다 -->
				</select>
	            </li>
	            <li class="ptag"><input type="text" placeholder="'-'를 제외한 계좌번호를 입력해주세요." name="accountnumber"></li>
	            <li class="radio">
	                <input type="radio" id="select" name="usertype" value="수강생"><label for="select">수강생</label>
	                <input type="radio" id="select2" name="usertype" value="강사"><label for="select2">강사</label>
	            </li>
	        </ul>
	            <button type="button" id=join_button onclick="join()">회원가입</button>
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

var overChk = false;


function join(){
	var $id = $('input[name="id"]');
	var $name = $('input[name="name"]');
	var $email = $('input[name="email"]');
	var $pw = $('input[name="pw"]');
	var $confirm = $('input[name="confirm"]');
	var $phone = $('input[name="phone"]');
	var $accountnumber = $('input[name="accountnumber"]');
	var $usertype = $('input[name="usertype"]');
	
	if(overChk == false){
		alert('중복 체크를 해주세요.');
		$id.focus();
	}else if($id.val()==''){
		alert('아이디를 입력해 주세요!');
		$id.focus();
	}else if($name.val() == ''){
		alert('이름을 입력해 주세요!')
		&name.focus();
	}else if($email.val()==''){
		alert('이메일을 입력 해 주세요!');
		$email.focus();
	}else if($pw.val()==''){
		alert('비밀번호를 입력 해 주세요!');
		$pw.focus();
	}else if($confirm.val()==''){
		alert('비밀번호 확인을 해주세요!');
		$confirm.focus();
	}else if($phone.val()==''){
		alert('전화번호를 입력 해 주세요!');
		$phone.focus();
	}else if($accountnumber.val()==''){
		alert('계좌 번호를 입력 해 주세요!');
		$accountnumber.focus();
	}else if($usertype.val()==null){
		console.log(usertype.val());
		alert('사용자 유형을 선택 해 주세요!');
	}else{
		var regExp = new RegExp('[a-zA-Zㄱ-ㅎ가-하]');
		var match = regExp.test($phone.val());
		var match2 = regExp.test($accountnumber.val());
		
		if(match){
			alert('전화번호에 숫자만 입력해 주세요.');
			$phone.val('');
			$phone.focus();
			return false;
		}else if(match2){
			alert('계좌 번호에 숫자만 입력해 주세요.');
			$accountnumber.val('');
			$accountnumber.focus();
			return false;
		}
		$('form').submit();
	}
}

var msg = '${msg}';
if(msg != ''){
	alert(msg);
}

function overlay(){
	console.log('click');
	
	var id = $('input[name="id"]').val();
	
	$.ajax({
		type:'post',
		url:'overlay.do',
		data:{'id':id},
		success:function(data){
			console.log(data);
			if(data.use > 0){
				alert('이미 사용중인 아이디입니다.');
				$('input[name="id"]').val('');
			}else{
				alert("사용 가능한 아이디입니다.");
				overChk = true;
			}
		},
		error:function(error){
			console.log(error);
		}
	
	});
	
}
/*
$('#boxcolor').on('keyup',function(){
	if($('input[name="pw"]').val() == $(this).val()){
		$('#boxcolor').css({'background-color':'lightgreen'});
	}else{
		$('#boxcolor').css({'background-color':'red'});
	}
});
  
 */
 $('#boxcolor').on('keyup', function() {
	    var confirmPassword = $(this).val();
	    var password = $('input[name="pw"]').val();
	    
	    if (confirmPassword === '') {
	        $(this).css({'background-color': 'white'}); // 값이 비어있을 때 기본 배경색으로 변경
	    } else if (confirmPassword === password) {
	        $(this).css({'background-color': 'lightgreen'});
	    } else {
	        $(this).css({'background-color': 'red'});
	    }
	});
 
 
 
$('#logo').click(function main(){
	   location.href = '/main';
	});

</script>
</html>