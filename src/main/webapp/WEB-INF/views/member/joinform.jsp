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
}

.join li {
    margin-bottom: -10px; /* 각 입력란과 버튼 사이의 간격을 조정합니다. */
}


.join p {
    margin-bottom: 5px;
    margin-top: 0;
}
.join button{
    background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
}


.join input[type="text"],
.join input[type="password"],
.join input[type="radio"],
.join button,
.join p{
    margin-right: 10px;
    margin-bottom: 11px;
    width: 100%; /* 입력 필드 너비 설정 */
    padding: 10px; /* 입력 필드 안 여백 설정 */
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
}


.join .radio label {
        margin-right: 86px; /* 라벨과 다음 라디오 버튼 사이의 간격 조정 */
}


.join .radio input[type="radio"] {
    margin-right: 5px; /* 각 라디오 버튼 사이의 간격 조정 */
    width: 20px; /* 너비 조정 */
    height: 20px; /* 높이 조정 */
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
	        <ul><li><p>*아이디</p></li>
	            <li><input type="text" placeholder="아이디" name="id"></li>
	            <li><input type="button" id="check" value="중복체크" onclick="overlay()"/></li>
	            <li><p>*이름</p></li>
	            <li><input type="text" placeholder="이름(실명)"name="name"></li>
	            <li><p>*이메일 인증</p></li>
	            <li><input type="text" placeholder="이메일을 입력해주세요." name="email"></li>
	            <li><input type="text" placeholder="인증번호를 입력해주세요." name="authnum"></li>
	            <li><p>*비밀번호</p></li>
	            <li><input type="password" placeholder="비밀번호" name="pw"></li>
	            <li><input type="password" placeholder="비밀번호 확인" name="confirm"></li>
	            <li><p>*전화번호</p></li>
	            <li><input type="text" placeholder="전화번호 입력" name="phone"></li>
	            <li><p>*계좌번호</p></li>
	            <li><input type="text" placeholder="'-'를 제외한 계좌번호를 입력해주세요." name="accountnumber"></li>
	            <li class="radio">
	                <input type="radio" id="select" name="shop" value="수강생"><label for="select">수강생</label>
	                <input type="radio" id="select2" name="shop" value="강사"><label for="select2">강사</label>
	            </li>
	            <li><button type="button" onclick="join()">회원가입</button></li>
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
	var $name = $('input[name="name"]');
	var $email = $('input[name="email"]');
	var $authnum = $('input[name="authnum"]');
	var $pw = $('input[name="pw"]');
	var $confirm = $('input[name="confirm"]:checked');
	var $phone = $('input[name="phone"]');
	var $accountnumber = $('input[name="accountnumber"]');
	
	
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