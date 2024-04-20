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
	
	 <div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="reviewEdit" method="post" enctype="multipart/form-data" onsubmit="return confirmWrite();">
				<table>
					<tr>
						<th>평가 강의명 : ${review.CLASS_IDX} 평가 강사명: ${review.RATEE_ID}</th>
					</tr>
					<tr>
						<th style="font-size: 14px;">리뷰 제목</th>
						<td><input type="text" name="REVIEW_TITLE"
							style="width: 300px; font-size: 16px;" value="${review.REVIEW_TITLE}" /></td>
						<th style="font-size: 12px;">작성자 : ${sessionScope.loginId}</th>
						<th style="font-size: 12px;">작성일 : ${review.REVIEW_REG_DATE}</th>
					</tr>
					<tr>
						<th style="color: #FED000;">★${review.SCORE}</th>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td colspan="4"><textarea name="REVIEW_CONTENT"
								style="width: 882px; height: 311px; resize: none;"> ${review.REVIEW_CONTENT}</textarea></td>
					</tr>
					<tr>
						<input type="hidden" name="PHOTO_CATEGORY" value="Review">
						<th>리뷰 사진</th>
						<c:if test="${photos.size()>0}">
							<tr>
								<td><c:forEach items="${photos}" var="photo">
										<img src="/photo/${photo.NEW_FILENAME}" width="500" height="300"/>
										<br />
										<br />
									</c:forEach>
									</td>
							</tr>
						</c:if>
						<td colspan="4">
							<div id="fileList"></div> <input type="file" name="photos"
							accept="image/*" multiple="multiple" style="width: 100%;" /> <small
							style="color: #999;">(한 장의 사진만 첨부 가능합니다)</small>
						</td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
							type="button" onclick="location.href='./lessonReviewList'"
							value="취소" />
							<button>수정</button></td>
					</tr>
				</table>
			</form>
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
function confirmWrite() {
    var result = confirm("수정을 하시겠습니까?");
    if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("수정이 완료되었습니다.");
    }
    return result; // 사용자가 "아니오"를 선택한 경우도 처리
}

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