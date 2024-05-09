<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>강의 결제</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script> 
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 결제</title>
<style>
/* 전체 영역 스타일 */
	.wrapper {
		max-width: 800px; /* 좀 더 넓은 크기로 조절 */
		margin: 0 auto;
		padding: 20px;
		background-color: #f9f9f9;
		border: 2px solid #ccc;
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	/* 각 영역 스타일 */
	.section {
		margin-bottom: 20px;
		padding: 20px;
		background-color: #fff;
		border: 1px solid #ccc;
		border-radius: 5px;
	}
	
	/* 수평선 스타일 */
	.divider {
		border-top: 1px solid #ccc;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	
	/* 버튼 스타일 */
	.btn-group {
		text-align: center;
	}
	
	.btn {
		padding: 10px 20px;
		font-size: 16px;
		background-color: #007bff;
		color: #fff;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		transition: background-color 0.3s ease;
	}
	
	.btn:hover {
		background-color: #0056b3;
	}
	
	/* 프로필 영역 스타일 */
	.profile-info {
		display: flex;
		align-items: center;
	}
	
	.lecture-info {
		text-align: left;
	}
	
	img {
		width: 100px; /* 이미지의 너비 */
		height: 100px; /* 이미지의 높이 */
	}
	.buttonDiv{
	position: relative;
	left:35%;
	}
	#cancelButton{
		width: 105px;
	}
	.lessonPayMentHead{
		position: relative;
		left: 42%;
	}
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
	<br> <br>
		
	<form action="lessonPayment.do" method="post">
		<div class="wrapper">
		<h1 class="lessonPayMentHead">강의 결제</h1>
			<!-- 프로필 영역 -->
			<div class="section profile">
				<div class="profile-info">
					<br>
					<c:if test="${photoNewFileName != null}">
						<img src="/photo/${photoNewFileName}" class="lessonImg">
					</c:if>
					<c:if test="${photoNewFileName == null}">
						<img src="resources/img/basic_user.png" class="lessonImg">
					</c:if>
					&nbsp;&nbsp;&nbsp;
					<div class="lecture-info">
						<input type="hidden" name="TuserName" value="${USER_NAME}">
						<!-- 강사 이름정보 -->
						<input type="hidden" name="classPrice" value="${Class_price}">
						<!-- 강의 가격 -->
						<input type="hidden" name="TuserId" value="${T_USER_ID}">
						<!-- 강사 아이디  -->
						<input type="hidden" name="classIdx" value="${Class_idx}">
						<span id="teacherId"> <a href="user_detail?user_id=?${T_USER_ID}">${USER_NAME} 강사님</a> </span>
						<br> 
						<span>강의제목: ${Class_name}</span>
						<br> <span>강의 횟수: ${Class_times}</span>
						<br>
						<span>강의 가격: ${Class_price}</span>
					</div>
				</div>
			</div>
			<!-- 각 영역을 구분하는 수평선 -->
			<div class="divider"></div>

			<!-- 보유 포인트 영역 -->
			<div class="section">
				<span>보유 포인트: ${havePoint}</span>
			</div>
			<!-- 수평선 -->
			<div class="divider"></div>

			<!-- 강의료 및 포인트 정보 영역 -->
			<div class="section">
				<span>총 강의료: ${Class_price}</span><br> <span>현재 포인트:
					${havePoint}</span><br> <span id="">남은 포인트: ${remainPoint}</span>
			</div>
			<!-- 수평선 -->
			<div class="divider"></div>

			<!-- 최종 결제 금액 영역 -->
			<div class="section">
				<span>최종 결제 금액: ${Class_price} P</span>
			</div>
			<!-- 수평선 -->
			<div class="divider"></div>

			<!-- 버튼 영역 -->
			<div class="buttonDiv">
				<button type="button" class="btn" onclick="lessonPayment()">결제하기</button>
				<button type="button" class="btn" id="cancelButton" onclick="myPageGo()">취소</button>
			</div>
		</div>
	</form>

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

	var msg = '${msg}';
	console.log(msg);
	if (msg != '') {
		alert(msg);
	}

	/* 결제버튼 구현  */
	function lessonPayment() {

		var paymentAmount = ${Class_price}; // 결제 금액을 가져옵니다.

		var TuserName = $("input[name='TuserName']").val(); // 강사 이름 정보 가져오기
		var classPrice = $("input[name='classPrice']").val(); // 강의 가격 정보 가져오기
		var TuserId = $("input[name='TuserId']").val(); // 강사 아이디 정보 가져오기
		var classIdx = $("input[name='classIdx']").val(); // 강의 인덱스 정보 가져오기

		var confirmationMessage = "결제 금액: " + paymentAmount + "원\n";
		confirmationMessage += "정말로 강의를 구매하시겠습니까?";

		if (confirm(confirmationMessage)) {
			$.ajax({
				url : "lessonPayment.ajax", // 강의 구매 처리를 위한 URL을 지정합니다.
				method : "POST",
				data : {
					TuserName : TuserName,
					classPrice : classPrice,
					TuserId : TuserId,
					classIdx : classIdx
				}, // 강의 ID와 결제 금액을 서버로 전송합니다.
				success : function(response) {
					if (response.success == 1) {
						alert("강의 구매가 완료되었습니다.");
						// 여기에 추가적으로 처리할 내용을 작성할 수 있습니다.
						console.log("appIdx값 : " + response.appIdx);
						
						window.location.href = "lessonLog.go?apply_idx="+response.appIdx; // 강의 구매 완료 후 이동할 페이지를 지정합니다.
					} else {
						alert("결제 포인트가 부족합니다 . 포인트 충전 페이지로 이동합니다.");
						var form = document.createElement('form'); // 폼객체 생성
						var input1 = document.createElement('input');
						input1.setAttribute("type", "hidden");
						input1.setAttribute("name", "GetremainPoint");
						input1.setAttribute("value", ${remainPoint});
						
						form.setAttribute('method', 'post'); //get,post 가능
						form.setAttribute('action', "chargePoint.go"); //보내는 url
						form.appendChild(input1);
						document.body.appendChild(form);
						
						form.submit();

					}
				},
				error : function(xhr, status, error) {
					alert("서버 오류로 인해 강의 구매를 처리할 수 없습니다.");
				}
			});
		} else {
			alert("강의 구매가 취소되었습니다.");
		}
	}
	
	function myPageGo(){
		location.href = "studentAttendedList.go";	
	};
	
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
		if ('${sessionScope.user_type}' == '관리자') {
			location.href = 'adminMain.go';
		}else {
			location.href = '/';	
		}
	});

	$('.alarm').click(function alarmList() {
		location.href = 'alarmList.go';
	});
</script>
</html>