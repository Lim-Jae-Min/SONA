<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style> 
.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #fff;
    border-radius: 5px;
    background-color: #fff;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

#boardDetail {
    margin-top: 20px;
}

#boardTitle {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

#boardWriter, #boardDate, #boardViews {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

#boardImageWrapper img {
    max-width: 100%;
    height: auto;
    margin-bottom: 10px;
}

#boardContent {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 20px;
}

#adminButtons {
    margin-top: 20px;
    text-align: center;
}

#adminButtons button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    background-color: #007bff;
    color: #eee;
    font-size: 16px;
    cursor: pointer;
}

#confirmDelete {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
}

.modal-content p {
    font-size: 16px;
    margin-bottom: 20px;
}

.modal-content button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    background-color: #007bff;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
}

.hidden {
    display: block;
}
img{
	width: 40%
}

hr{
	margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 3px solid #eee
}
#editButton{
/* 	position : relative;
	left: 48%;
	background-color: rgba(0,0,0,0);
	border: none;
	font-size: 5px; */
    position: relative;
    /* position: absolute; */
    left: 366px;
    background-color: rgba(0, 0, 0, 0);
    border: none;
    font-size: x-large;
    top: 7px;
    height: 0px;
}
p.editOption{
	position : relative;
}

#editslide{
	display : none;
	border: 1px solid black;
	position:absolute;
	max-width: 50px;
	left: 48%;
	width: 45;
    text-align: center;
    font-size : 15px;
    top: 39px;

    
}
#returnList{
	left : 50%;
	position: relative;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header id="adminmain">
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
    <!-- 헤더영역 -->
    
    <!-- 게시판 영역 -->
    <div class="container">
        <h1>FAQ 상세보기</h1>
            <h2 id="boardTitle">${faqDetail.faq_title}</h2>
           	<div id = "editButton">
           		<button id="editButton">⋮</button>
	            <div id = "editslide">
	             	<p class="editOption" id="" onclick="faqDel()">삭제</p>
	             	<p class="editOption" id="" onclick="faqEdit()">수정</p>
	            </div>
             </div>
        <div id="boardDetail">
        작성자 : ${faqDetail.admin_id}  작성일자 : ${faqDetail.faq_reg_date} &nbsp;&nbsp;  조회수 : ${faqDetail.faq_views} 대상 : ${faqDetail.faq_target}
            <hr>
 
            <p id="boardContent">${faqDetail.faq_answer}</p>
            <hr>

            
            <button id="returnList" onclick="backList()">목록</button>
        </div>
    </div>
    
    <!-- 게시판 영역 -->


	<!-- 푸터 영역 -->
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
    <!-- 푸터 영역 -->
    
    
</body>
<script>
function redirectToReplyPage() {
    window.location.href = './videoList.go';
}

$('#editButton').click(function slide() {
	var display = $('#editslide').css('display');
    if (display == 'none') {
        $('#editslide').css('display', 'block');
    }
    if (display == 'block') {
        $('#editslide').css('display', 'none');
    }
});

$('#logo').click(function main(){
	location.href = '/main';
});

$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});
	
	
/* 	document.getElementById('deleteButton').addEventListener('click', function() {
	    document.getElementById('confirmDelete').style.display = 'block';
	});
	
    // 삭제 확인 모달에서 확인 버튼 클릭 시 게시글 삭제
    document.getElementById('confirmDeleteButton').addEventListener('click', function() {
        // 여기에 게시글을 삭제하는 AJAX 요청을 보내는 로직을 작성합니다.
        // 삭제 완료 후 페이지를 새로고침하거나, 삭제된 상태를 반영하는 등의 작업을 수행합니다.
    });

    // 삭제 확인 모달에서 취소 버튼 클릭 시 모달 닫기
    document.getElementById('cancelDeleteButton').addEventListener('click', function() {
        document.getElementById('confirmDelete').style.display = 'none';
    });
    
    document.getElementById('editButton').addEventListener('click', function() {
        // 여기에 수정 페이지로 이동하는 로직을 작성합니다.
        // 실제로는 수정 페이지로 이동하는 URL로 리다이렉트하거나, SPA의 경우 페이지를 변경하는 등의 작업을 수행합니다.
    }); */
    
    
    
    
    /* 삭제 버튼 구현 */
    
    function faqDel() {



		var confirmationMessage = "정말로 faq를 삭제하시겠습니까?";

		if (confirm(confirmationMessage)) {
			$.ajax({
				url : "faqDel.ajax", 
				method : "POST",
				data : {
					faqIdx : ${faqDetail.faq_idx}
					
				},
				success : function(response) {
					if (response.success == 1) {
						alert("삭제를 성공 했습니다.");
						// 여기에 추가적으로 처리할 내용을 작성할 수 있습니다.
						window.location.href = "faqManagement.go"; // 강의 구매 완료 후 이동할 페이지를 지정합니다.
					} else {
						alert("삭제를 실패 했습니다.");
/* 						var form = document.createElement('form'); // 폼객체 생성
						form.setAttribute('method', 'post'); //get,post 가능
						form.setAttribute('action', "chargePoint.go"); //보내는 url
						document.body.appendChild(form);
						form.submit(); */

					}
				},
				error : function(xhr, status, error) {
					alert("서버 오류로 인해 공지사항 삭제를 실퍃하였습니다..");
				}
			});
		} else {
			alert("faq 삭제를 취소 했습니다.");
		}
	}
    
    /* 목록으로 가기 */
	 function backList(){
	    	location.href = "faqManagement.go";
	    	
	    }
    function faqEdit(){
    	console.log("수정버튼 클릭됨");
    	location.href = 'faqEditAdmin.go?idx=${faqDetail.faq_idx}';
/*     	var form = document.createElement('form'); // 폼객체 생성
		form.setAttribute('method', 'post'); //get,post 가능
		form.setAttribute('action', "chargePoint.go"); //보내는 url
		document.body.appendChild(form);
		form.submit();  */
    }
    /* 수정으로 가기 */
</script>
</html>