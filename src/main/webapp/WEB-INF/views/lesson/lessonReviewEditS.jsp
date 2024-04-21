<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	text-align: center;
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
	width: 100%; /* 컨텐츠 영역을 꽉 채우도록 설정 */
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
			<form action="reviewEdit" method="post" enctype="multipart/form-data"
				onsubmit="return confirmWrite(event);">
				<table>
					<tr>
						<th>평가 강의번호 : ${review.CLASS_IDX} 평가 강사명: ${review.RATEE_ID}</th>
					</tr>
					<tr>
						<td><input type="hidden" name="REVIEW_IDX"
							value="${review.REVIEW_IDX}" /></td>
						<th style="font-size: 14px;">리뷰 제목</th>
						<td><input type="text" name="REVIEW_TITLE"
							style="width: 300px; font-size: 16px;"
							value="${review.REVIEW_TITLE}" /></td>
						<th style="font-size: 12px;">작성자 : ${review.RATER_ID}<input
							type="hidden" name="RATER_ID" value="${review.RATER_ID}" /></th>
						<th style="font-size: 12px;">작성일 : ${review.REVIEW_REG_DATE}</th>
					</tr>
					<tr>
						<td colspan="4"
							style="color: #FED000; font-size: 22px; text-align: right;">★${review.SCORE}</td>
					</tr>
					<tr>
						<td colspan="4"
							style="font-size: 14px; text-align: right; color: #999;">만족도는
							수정이 불가합니다.</td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td colspan="2"><textarea name="REVIEW_CONTENT"
								style="width: 882px; height: 311px; resize: none;"> ${review.REVIEW_CONTENT}</textarea></td>
					</tr>
					<tr>
						<input type="hidden" name="PHOTO_CATEGORY" value="Review">
						<th>리뷰 사진</th>
						<td><c:if test="${photos.size() > 0}">
								<c:forEach items="${photos}" var="photo">
									<div class="photo-container">
										<img src="/photo/${photo.NEW_FILENAME}" width="500"
											height="300" />
										<button
											onclick="deletePhoto('${photo.POST_IDX}', '${photo.PHOTO_CATEGORY}', event)">삭제</button>
									</div>
								</c:forEach>
							</c:if>
							<div id="fileList"></div> <input type="file" name="photos"
							accept="image/*" onchange="checkFileCountAndExistingPhoto(this)"
							style="width: 100%;" /> <small style="color: #999;">(한
								장의 사진만 첨부 가능합니다)</small></td>
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
				<td colspan="2">${loginName}회원님</td>
				<td>&nbsp&nbsp&nbsp</td>
				<td class="manner">♥ ${manner}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${totalPoint}</span>
		</div>
		<br />
		<div>
			<a href="#">내가 쓴 리뷰</a>
		</div>
		<br />
		<div>
			<a href="myPage.go">마이페이지</a>
		</div>
		<br />
		<br />
		<br />
		<div>
			<a href="#">로그아웃</a>
		</div>
	</div>
</body>
<script>


function deletePhoto(postIdx, photoCategory, event) {
    event.preventDefault(); // 폼의 기본 동작 중지
    // 사용자에게 삭제 여부를 묻는 확인 메시지 표시
    var result = confirm('삭제 하시겠습니까?');
    
    // 확인 메시지에서 '확인'을 선택한 경우에만 삭제 요청을 보냄
    if (result) {
    	$.ajax({
            url: './photoEdit.ajax',
            method: 'POST',
            data: { postIdx: postIdx, photoCategory: photoCategory },
            complete: function() {
                // 요청이 완료된 후에 실행되는 콜백에서 미리보기 삭제
                $(event.target).parent().remove();
                $('#fileList').empty();
                alert('사진이 성공적으로 삭제되었습니다.');
            }
        });
    }
}

function checkFileCountAndExistingPhoto(input) {
    // 현재 첨부된 파일 개수 확인
    var fileCount = input.files.length;
    
    // 기존에 사진이 있는지 확인
    var existingPhotoCount = $('.photo-container').length;

    // 첨부 파일이 1장을 초과하거나, 기존에 사진이 있는 경우
    if (fileCount > 1 || existingPhotoCount > 0) {
        // 경고창 표시
        alert("기존 사진이 있거나, 첨부파일은 1장만 첨부할 수 있습니다.");
        // 파일 선택 취소
        input.value = '';
    }
}


function confirmWrite(event) {
    // 수정 버튼을 클릭한 경우에만 알림 창을 띄우고 폼을 제출합니다.
    var buttonClicked = $(event.target).find('button[type="submit"]').is(':focus');
    if (buttonClicked) {
        var result = confirm("수정을 하시겠습니까?");
        if (result) {
            alert("수정이 완료되었습니다.");
        }
        return result;
    } else {
        return true; // 수정 버튼이 아닌 경우에는 그냥 제출을 허용합니다.
    }
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