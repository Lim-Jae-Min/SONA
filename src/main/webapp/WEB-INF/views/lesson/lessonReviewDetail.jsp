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
		<img src="resources/img/review.png" id="review">                  강의 리뷰 상세보기
	 <div class="review-title">${review.REVIEW_TITLE}</div>
        <div class="author-info">
            작성자: ${review.RATER_ID} 작성일자: ${review.REVIEW_REG_DATE}
            <span class="satisfaction">★${review.SCORE}</span>
        </div>
        <div class="content">
            ${review.REVIEW_CONTENT}
        </div>
        <div>리뷰 사진</div>
        <div>
        <c:forEach items="${photos}" var="photo">
			<img src="/photo/${photo.NEW_FILENAME}" width="500" height="300"/>
			<br/><br/>
		</c:forEach>	
        </div>
        <div>
        <c:if test="${user_type eq 'admin'}">
    		<button class="button blind" onclick="confirmBlind(${review.REVIEW_IDX})">블라인드</button>
		</c:if>
        </div>
        <div class="button-container">	
            <c:if test="${loginId eq review.RATEE_ID}">
   				 <button class="button report" onclick="confirmReport(${review.REVIEW_IDX})">신고</button>
			</c:if>
            <button class="button edit" onclick="redirectToEditPage(${review.REVIEW_IDX})">수정</button>
            <button class="button delete" onclick="confirmDelete(${review.REVIEW_IDX})">삭제</button>
        </div>
        <div class="button-container return-btn">
            <button class="button" onclick="location.href='./lessonReviewList'">리스트로 돌아가기</button>
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
function confirmBlind(reviewIdx) {
    if (confirm("블라인드 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteReview",
            data: { reviewIdx: reviewIdx },
            success: function(response) {
            	alert("블라인드 되었습니다.");
            	location.href = './lessonReviewList';
            },
            error: function(error) {
                console.log(error);
            }
        });
    }
}



function confirmReport() {
    var confirmation = confirm("신고 하시겠습니까?");
    if (confirmation) {
        alert("신고 처리 되었습니다.");
        location.href = './lessonReviewList';
    }
}

function confirmDelete(reviewIdx) {
    if (confirm("삭제 하시겠습니까?")) {
        $.ajax({
            type: "POST",
            url: "./deleteReview",
            data: { reviewIdx: reviewIdx },
            success: function(response) {
            	alert("삭제되었습니다.");
            	location.href = './lessonReviewList';
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
    var userType = "${sessionScope.user_type}";

    // 리뷰 작성자의 아이디
    var reviewUserId = "${review.RATER_ID}";

    // 만약 현재 사용자가 관리자가 아니라면
    if (userType !== "admin") {
        // 블라인드 버튼 숨기기
        $(".blind").hide();
    }

    // 만약 현재 로그인한 사용자의 아이디와 리뷰 작성자의 아이디가 일치하는 경우에만
    // 수정 및 삭제 버튼을 표시합니다.
    if (loggedInUserId !== reviewUserId) {
        $(".edit").hide();
        $(".delete").hide();
    }
});

function redirectToEditPage(reviewIdx) {
    window.location.href = './lessonReviewEdit?idx=' + reviewIdx;
}



</script>
</html>