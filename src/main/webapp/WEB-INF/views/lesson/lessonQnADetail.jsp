<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after"
	type="text/css">
<style>
	body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
        }
        .container {
            width: 900px;
            margin: 20px auto;
            background-color: #ffffff;
            border: 1px solid #BEE6FF;
            border-radius: 10px;
            padding: 20px;
        }
        #review {
            width: 30px;
            height: 30px;
            margin-right: 20px;
        }
        .review-title {
            font-size: 24px;
            margin-bottom: 10px;
        }
        .author-info {
            font-size: 14px;
            color: #777777;
            margin-bottom: 10px;
        }
        .satisfaction {
            font-size: 20px;
            color: #FED000;
            float: right;
            margin-left: 20px;
        }
        .content {
            width: 882px;
            height: 311px;
            border: 1px solid #BEE6FF;
            border-radius: 10px;
            padding: 10px;
            margin-bottom: 20px;
            overflow: auto;
        }
        .button-container {
            text-align: right; /* 버튼을 오른쪽으로 정렬 */
            margin-top: 10px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }
        .question-box {
    	border: 2px solid #BEE6FF;
   		border-radius: 10px;
    	background-color: #FFFFFF;
    	padding: 20px;
    	margin-bottom: 20px;
		}
		.answer-box {
    	border: 2px solid #BEE6FF;
    	border-radius: 10px;
    	background-color: #BEE6FF; /* 답변 칸의 배경색을 하늘색으로 지정 */
    	padding: 20px;
    	margin-bottom: 20px;
		}
        
         .edit, .delete {
            background-color: #ff0000;
            color: #ffffff;
            margin-left: auto; /* 오른쪽 여백 추가 */
        }
        .edit {
            background-color: #BEE6FF;
        }
        .delete {
            background-color: #cccccc;
            color: #000000;
        }
        .return-btn {
            margin-top: 20px;
            text-align: center;
        }
        /* Header Container */
.header {
    background-color: #FFF;
    padding: 20px;
    display: flex;
    align-items: flex-end;
}

/* Course Info */
.course-info {
    margin-right: auto;
}

.course-name {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

.category {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.rating {
    font-size: 14px;
    color: black; 
}

/* Teacher Info */
.teacher-info {
    margin-left: auto;
    text-align: right;
}

.teacher-name {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 5px;
}

.location {
    font-size: 16px;
    color: #666;
    margin-bottom: 5px;
}

.likes {
    font-size: 16px;
    color: black; 
}

.rounded-image {
    background-color: #BEE6FF;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
}

.rounded-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
        
</style>
</head>
<body>
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
    
		<div class="header">
    <div class="course-info">
        <div class="course-name">쉽게 배우는 기타</div>
        <div class="category">- 기타, 어쿠스틱 기타</div>
        <div class="rating">평균 만족도 : <span style="color: #FED000;">★4.7</span></div>
    </div>
    <div class="teacher-info">
        <div class="teacher-name">ㅇㅇㅇ선생님</div>
        <div class="location">📌서울 금천구</div>
        <div class="likes"><span style="color: red;">♥</span>80.5</div>
    </div>
    <div class="rounded-image">
        <img src="resources/img/basic_user.png" alt="Teacher Photo">
    </div>
	</div>
 	<hr style="flex: 1; margin: 0; border: 0; border-top: 4px solid #BEE6FF;">
	
	 <div class="container">
		<img src="resources/img/QnA.png" id="QnA">                  Q&A 상세보기
	  <div class="question-box">
        <div class="qna-title">글번호: ${question.QUESTION_IDX}</div>
        <div>Q&A 제목: ${question.q_TITLE}</div>
        <div class="author-info">작성자: ${question.USER_ID} 작성일: ${question.q_REG_DATE} 조회수: ${question.q_HIT}</div>
        <div class="content">${question.q_CONTENT}</div>
        <div class="button-container">
            <button class="button reply" onclick="redirectToReplyPage(${question.QUESTION_IDX})">답변</button>
            <button class="button edit" onclick="redirectToEditPage(${question.QUESTION_IDX})">수정</button>
            <button class="button delete" onclick="confirmDelete(${question.QUESTION_IDX})">삭제</button>
        		</div>
    		</div>
		<!-- 답변이 아직 작성이 안됐을경우 -->
		<c:if test="${not empty answerMessage}">
			<div class="answer-box">
				<div class="content">${answerMessage}</div>
			</div>
		</c:if>
		<!-- 답변이 작성 됐을 경우 -->
		<c:if test="${not empty answer}">
			<div class="answer-box">
				<div class="author-info">답변자: ${answer.USER_ID} 답변일:
					${answer.a_REG_DATE}</div>
				<div class="content">${answer.a_CONTENT}</div>
			</div>
		</c:if>


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
var classIdx = ${question.CLASS_IDX};
var qidx = ${question.QUESTION_IDX};

function confirmDelete(questionIdx) {
    if (confirm("삭제 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteQnA",
            data: { questionIdx: questionIdx },
            success: function(response) {
            	alert("삭제되었습니다.");
            	location.href = './lessonQnAList?CLASS_IDX=' + classIdx;
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
}




$(document).ready(function() {
    // 현재 로그인한 사용자의 아이디
    var loggedInUserId = "${sessionScope.loginId}";
    // qna 작성자의 아이디
    var qnaUserId = "${question.USER_ID}";
    
    var teacherId = "${question.TEACHER_ID}";

    // 만약 현재 로그인한 사용자의 아이디와 qna 작성자의 아이디가 일치하는 경우에만
    // 수정 및 삭제 버튼을 표시합니다.
    if (loggedInUserId !== qnaUserId) {
        $(".edit").hide();
        $(".delete").hide();
    }
    if (loggedInUserId !== teacherId) {
        $(".reply").hide();
    }
});

function redirectToList(classIdx) {
    window.location.href = './lessonQnAList?CLASS_IDX=' + classIdx;
}


function redirectToEditPage(qidx) {
    window.location.href = './lessonQnAEdit?QUESTION_IDX=' + qidx;
}

function redirectToReplyPage(qidx) {
    window.location.href = './lessonQnARepy?QUESTION_IDX=' + qidx;
}

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});

$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});



</script>
</html>