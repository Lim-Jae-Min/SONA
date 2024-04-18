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
.join{
    width: 480px;
    height: 720px;
    position: absolute;
    left: 50%;
    top: 47%;
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
}

.join li {
    margin-bottom: -10px; /* 각 입력란과 버튼 사이의 간격을 조정합니다. */
}

.join input[type="text"],
.join input[type="password"],
.join button, 
.join p {
    width: calc(80% - 20px); /* 입력란과 버튼을 가로 폭을 동일하게 설정합니다. */
    padding: 10px; /* 내부 여백 설정 */
    margin-left: 60px;
    margin-bottom: 10px; /* 간격 조정 */
    margin-top: 0;
}
.join p {
    margin-bottom: 5px;
    margin-top: 0;
}
.join button{
    background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
    margin-top: 20px;
}

.login input[type="text"],
.login input[type="password"]{
    margin-right: 10px;
    margin-bottom: 0px;
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

.radio {
    margin-left: 170px;
}

#footer{
	position: absolute;
    width: 100%; /* 화면 전체 너비 차지 */
}

</style>
</head>
<body>

<header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="../HTML/img/KakaoTalk_20240402_125012976.png" id="logo"></th>
                <th class="menu"><a href="#">추천 강의</a></th>
                <th class="menu"><a href="#">전체 강의</a></th>
                <th class="menu"><a href="#">고객센터</a></th>
            </tr>
        </table>
    </header>
    <form action="join.do" method="post">
	    <section class="join" >
	        <h1>회원가입</h1>
	        <ul><li><p>*아이디</p></li>
	            <li><input type="text" placeholder="아이디" title="아이디입력"></li>
	            <li><p>*이름</p></li>
	            <li><input type="text" placeholder="이름(실명)" title="이름입력"></li>
	            <li><p>*이메일 인증</p></li>
	            <li><input type="text" placeholder="이메일을 입력해주세요." title="이메일입력"></li>
	            <li><input type="text" placeholder="인증번호를 입력해주세요." title="인증번호입력"></li>
	            <li><p>*비밀번호</p></li>
	            <li><input type="password" placeholder="비밀번호" title="비밀번호입력"></li>
	            <li><input type="password" placeholder="비밀번호 확인" title="비밀번호입력"></li>
	            <li><p>*전화번호</p></li>
	            <li><input type="text" placeholder="전화번호 입력" title="전화번호"></li>
	            <li><p>*계좌번호</p></li>
	            <li><input type="text" placeholder="'-'를 제외한 계좌번호를 입력해주세요." title="이름입력"></li>
	            <li class="radio">
	                <input type="radio" id="select" name="shop"><label for="select">수강생</label>
	                <input type="radio" id="select2" name="shop"><label for="select2">강사</label>
	            </li>
	            <li><button>회원가입</button></li>
	        </ul>
	        
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
	var $pw = $('input[name="pw"]');
	var $auth = $('input[name="auth"]:checked');
	var $name = $('input[name="name"]');
	var $age = $('input[name="age"]');
	var $gender = $('input[name="gender"]:checked');
	var $email = $('input[name="email"]');
	
	if(overChk == false){
		alert('중복 체크를 해주세요.');
		$id.focus();
	}else if($id.val()==''){
		alert('아이디를 입력해 주세요!');
		$id.focus();
	}else if($pw.val() == ''){
		alert('비밀번호를 입력해 주세요!')
	}else if($name.val()==''){
		alert('이름을 입력 해 주세요!');
		$name.focus();
	}else if($age.val()==''){
		alert('나이를 입력 해 주세요!');
		$age.focus();
	}else if($gender.val()==null){
		alert('성별을 체크해 주세요!');
	}else if($email.val()==''){
		alert('이메일을 입력 해 주세요!');
		$email.focus();
	}else{
		var regExp = new RegExp('[a-zA-Zㄱ-ㅎ가-하]');
		var match = regExp.test($age.val());
		if(match){
			alert('숫자만 입력해 주세요.');
			$age.val('');
			$age.focus();
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

$('#confirm').on('keyup',function(){
	if($('input[name="pw"]').val() == $(this).val()){
		$('#msg').html('비밀번호가 일치합니다.');
		$('#msg').css({'color':'green'});
	}else{
		$('#msg').html('비밀번호가 일치하지 않습니다.'	);
		$('#msg').css({'color':'red'});
	}
});

</script>
</html>