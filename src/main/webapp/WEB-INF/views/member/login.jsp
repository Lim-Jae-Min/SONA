<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 로그인</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#footer{
	position: absolute;
    width: calc(100% - 200px); /* 화면 전체 너비 차지 */
    bottom: 0;
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
    margin-right: -5px;
}

.login ul {
    list-style-type: none; /* 리스트의 글머리 제거 */
    padding: 0; /* 기본 패딩 제거 */
}

.login li {
    margin-bottom: 10px; /* 각 입력란과 버튼 사이의 간격을 조정합니다. */
}

.login input[type="text"],
.login input[type="password"]
{
    width: calc(80% - 20px); /* 입력란과 버튼을 가로 폭을 동일하게 설정합니다. */
    padding: 10px; /* 내부 여백 설정 */
    margin-left: 60px;
    margin-bottom: 10px; /* 간격 조정 */
}
.login button{
    background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
    width: 81%;
    height: 45px;
    margin-left: 58px;
}

.login input[type="text"],
.login input[type="password"]{
    margin-right: 10px;
}

.login div ul {
    display: flex;
    justify-content: center;
    margin-top: -13px;
    margin-left: 13px;
}
.login div ul li {position: relative; padding: 0 40px;}
.login div ul li~li:after {content: ""; position: absolute; left: 0; top: 6px;
                         height: 11px; width: 1px; background: #111; transform: rotate(0deg);}
.login div ul li a {font-size: 20%; color: #111;}

</style>
</head>
<body>
<c:if test="${sessionScope.user_type eq '관리자'}">
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
   </c:if>
   <c:if test="${sessionScope.user_type ne '관리자'}">
      <header id="usermain">
           <table id="mainmenu">
               <tr>
                   <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                   <th class="menu">
                      <c:if test="${sessionScope.loginId eq null}">
                         <c:if test="${sessionScope.user_type ne '강사'}">
                            <a href="login.go">추천 강의</a>                   
                         </c:if>
                      </c:if>
                      <c:if test="${sessionScope.loginId ne null}">
                         <c:if test="${sessionScope.user_type ne '강사'}">
                            <a href="recommendList.go">추천 강의</a>                   
                         </c:if>
                      </c:if>
                   </th>
                   <th class="menu"><a href="allList.go">전체 강의</a></th>
                   <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
               </tr>
           </table>
           <table id="mymenu">
               <c:if test="${sessionScope.loginId ne null}">
                   <tr>
                       <c:if test="${sessionScope.alarm_count > 0}">
                           <th><img src="resources/img/alarm_on.png" class="miniimg alarm"></th>
                       </c:if>
                       <c:if test="${sessionScope.alarm_count == 0}">
                           <th><img src="resources/img/alarm.png" class="miniimg alarm"></th>
                       </c:if>
                       <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                       <th><div id="userName">${sessionScope.user_name}</div></th>
                   </tr>
               </c:if>
               <c:if test="${sessionScope.loginId eq null}">
                   <tr>
                       <th><a href="login.go">로그인</a></th>
                   </tr>
               </c:if>
           </table>
       </header>
   </c:if>
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
                <li><a href="idFind.go">아이디찾기</a></li>
                <li><a href="pwFind.go">비밀번호 찾기</a></li>
                <li><a href="joinform.go">회원가입</a></li>
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
	var msg = '${msg}'; // 쿼터 빠지면 넣은 문구가 변수로 인식됨.
	if(msg != ''){
	alert(msg);
}

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});


$('#logo').click(function main(){
	   if ('${sessionScope.user_type}' == '관리자') {
	      location.href = 'adminMain.go';
	   }else {
	      location.href = '/main';   
	   }
});
</script>
</html>