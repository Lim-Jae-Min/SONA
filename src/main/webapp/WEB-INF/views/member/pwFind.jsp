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
#footer {
    width: 100%;
    position: fixed;
    bottom: 0;
    left: 0;
    padding: 10px; /* 여백 지정 */
    border-top: 1px solid #ccc; /* 윗부분 테두리 추가 */
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
</style>
</head>
<body>
<%@ include file="layout/header.jsp" %>

    <div>
        ${msg}
    </div>
    

<form id="findForm" method="post">
    <div class="form-group input-group">
        <input type="text" name="username" id="username" placeholder="아이디">
    </div>
    <div class="form-group input-group">
        <input type="text" name="email" id="email" placeholder="이메일">
        <button type="button" id="idFindEmailSubmit" onclick="submitEmail()">전송</button>
    </div>
    <!-- 아이디 입력란 추가 -->
    <div class="form-group input-group">
        <input type="password" name="CertificationNumber" id="CertificationNumber" placeholder="인증번호">
        <button type="button" id="idFindCertSubmit" onclick="submitCert()">확인</button>
    </div>
    <button type="submit" id="id-find" onclick="findSubmit()">비밀번호 찾기</button>
</form>
	<div id = "footer">
	<%@ include file="layout/footer.jsp" %>
	</div>
</body>
<script>
/* function submitEmail(){
	var email = $('input[name="email"]').val();
	// ajax 를 이용한 비동기 통신
	$.ajax({
		type:'post', // method 방식
		url:'findIdEmail.do', // 요청할 주소
		data:{'email':email},
	    dataType:'json',//파라메터
		success:function(data){ // 통신 성공시
			console.log(data);
				alert('이메일로 인증번호를 보냈습니다.');		
		},
		error:function(error){ //통신 실패시
			console.log(error);
		}
	});
} */
var cfEmail = null;
function submitEmail() {
	console.log('click');
	var email = $('input[name="email"]').val();
	var username = $('input[name="username"]').val();
	console.log(username);
	//ajax를 이용한 비동기 통신 (자바스크렙트를 사용해 보안성이 좋지 못함 취약함)
	console.log(email);
	$.ajax({
		type:'post', // method 방식
		url:'findPwEmail.do', // 요청한 주소
		data:{'email':email,
			   'username':username
		}, // 파라메터
		success:function(data){ // 통신 성공했을경우
		//ajax에서 XmlhttpRequest 객체를 통해 대신 받아와서
		//여기에 뿌려준다
			console.log(data.checkedEmail);
		var chkEmail = data.checkedEmail;
			if(data.checkedEmail ==null){
				alert('이메일을 다시 입력해 주세요');
				$('input[name="email"]').val('');
			}else{
				alert(chkEmail+'로 인증번호를 보냈습니다.');
				cfEmail = chkEmail;
			}
		}, 
		error:function(error){ // 통신 실패 시
			console.log(error);
		} 
	});
}
var cfn = false;
function submitCert() {
    // 입력된 이메일과 인증번호 가져오기
    var cfNumber = $('input[name="CertificationNumber"]').val();
    console.log(cfNumber);

    // 여기에서 서버로 인증번호 확인 요청을 보내고,
    // 서버에서는 해당 인증번호가 맞는지 확인한 후 응답을 보냅니다.
    // 여기서는 간단히 인증번호가 "123456"이라고 가정합니다.
    var crNumber = "123456";
    
    if(crNumber==cfNumber){
    	cfn = true;
    	alert("인증번호가 확인 되었습니다.");
    	
    	
    }else{
    	cfn = false;
    	alert("인증번호가 틀렸습니다.");
    }

    // 인증번호가 맞으면 다음 페이지로 이동
}

function findSubmit(){
	
	if(cfn==false){
		alert("인증번호를 확인 해주세요.");
	}else if(cfn==true){
		var email = cfEmail;
	$('#findForm').attr("action","pwFindResult.do").submit();
	}
	
}
</script>
</html>