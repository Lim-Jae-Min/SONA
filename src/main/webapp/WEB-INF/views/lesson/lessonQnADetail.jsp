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
        .blind {
            background-color: #ff0000;
            color: #ffffff;
            margin-right: auto; /* 왼쪽 여백 추가 */
            text-align: left;
        }
        .report, .edit, .delete {
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
</style>
</head>
<body>
 <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="recommendList.go">추천 강의</a></th>
                <th class="menu"><a href="allList.go">전체 강의</a></th>
                <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
            </tr>
        </table>
        <table id="mymenu">
            <c:if test="${loginName != null}">
                <tr>
                    <c:if test="${alarmCount > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg"></th>
                    </c:if>
                    <c:if test="${alarmCount == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg"></th>
                    </c:if>
                    <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                    <th><div id="userName">${loginName}</div></th>
                </tr>
            </c:if>
            <c:if test="${loginName == null}">
                <tr>
                    <c:if test="${alarmCount > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg"></th>
                    </c:if>
                    <c:if test="${alarmCount == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg"></th>
                    </c:if>
                    <th><a href="login.go">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
	<%@ include file="layout/lessonheader.jsp"%>
	
	 <div class="container">
		<img src="resources/img/QnA.png" id="QnA">                  Q&A 상세보기
	 <div class="qna-title">글번호:${qna.QUESTION_IDX} Q&A 제목: ${qna.Q_TITLE}</div>
        <div class="author-info">
            작성자: ${qna.USER_ID} 작성일자: ${qna.Q_REG_DATE} 조회수:${qna.Q_HIT}
        </div>
        <div class="content">
            ${qna.Q_CONTENT}
        </div>
        <div class="button-container">
        	<button class="button reply" onclick="redirectToReplyPage(${qna.QUESTION_IDX})">답변</button>
            <button class="button edit" onclick="redirectToEditPage(${qna.QUESTION_IDX})">수정</button>
            <button class="button delete" onclick="confirmDelete(${qna.QUESTION_IDX})">삭제</button>
        </div>
        <div class="button-container return-btn">
            <button class="button" onclick="redirectToList(${qna.CLASS_IDX})">리스트로 돌아가기</button>
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
    <div id="slide">
        <table>
            <tr>
                <td colspan="2">${loginName} 회원님</td>
                <td>&nbsp&nbsp&nbsp</td>
                <td class="manner">♥ ${manner}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${totalPoint}</span></div>
        <br/>
        <div><a href="#">내가 쓴 리뷰</a></div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="#">로그아웃</a></div>
    </div>
</body>
<script>

var classIdx = ${qna.CLASS_IDX};

function confirmDelete(questionIdx) {
    if (confirm("삭제 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteQnA",
            data: { questionIdx: questionIdx },
            success: function(response) {
            	alert("삭제되었습니다.");
            	location.href = './lessonQnAList?idx=' + classIdx;
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
}


function redirectToList(classIdx) {
    window.location.href = './lessonQnAList?idx=' + classIdx;
}


$(document).ready(function() {
    // 현재 로그인한 사용자의 아이디
    var loggedInUserId = "${sessionScope.loginId}";
    // qna 작성자의 아이디
    var qnaUserId = "${qna.USER_ID}";
    
    var teacherId = "${qna.TEACHER_ID}";

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

</script>
</html>