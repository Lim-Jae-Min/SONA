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
<style></style>
</head>
<body>
	<%@ include file="layout/header.jsp"%>
	<%@ include file="layout/lessonheader.jsp"%>


	<img src="resources/img/review.png" id="review">                  강의 리뷰 작성
	<br />

	<div style="text-align: center;">
		<div
			style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
			<form action="reviewWrite" method="post" enctype="multipart/form-data" onsubmit="return confirmWrite();">
				<table>
					<tr>
						<th style="font-size: 14px;">리뷰 제목</th>
						<td><input type="text" name="REVIEW_TITLE"
							style="font-size: 16px;" /></td>
						<th style="font-size: 12px;">작성자</th>
						<td style="font-size: 12px;"><input type="text"
							id="RATER_ID" value="${sessionScope.loginId}" /></td>
						<th style="font-size: 12px;">작성일 : <span id="currentDate"></span></th>
					</tr>
					<tr>
						<th>만족도</th>
						<td colspan="4"><span style="color: #FED000;">★</span> <select
							name="SCORE" style="margin-left: 10px;">
								<option value="0.5">0.5</option>
								<option value="1.0">1.0</option>
								<option value="1.5">1.5</option>
								<option value="2.0">2.0</option>
								<option value="2.5">2.5</option>
								<option value="3.0">3.0</option>
								<option value="3.5">3.5</option>
								<option value="4.0">4.0</option>
								<option value="4.5">4.5</option>
								<option value="5.0">5.0</option>
						</select></td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td colspan="4"><textarea name="REVIEW_CONTENT"
								style="width: 882px; height: 311px; resize: none;"></textarea></td>
					</tr>
					<tr>
						<th>리뷰 사진</th>
						<td colspan="4">
							<div id="fileList"></div> <input type="file" id="fileInput"
							accept="image/*" multiple="multiple" style="width: 100%;" /> <small
							style="color: #999;">(한 장의 사진만 첨부 가능합니다)</small>
						</td>
					</tr>
					<td colspan="5" style="text-align: center;"><input
							type="button" onclick="location.href='./lessonReviewList'"
							value="취소" />
							<button>작성</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>


	<%@ include file="layout/footer.jsp"%>

</body>
<script>
	var currentDateElement = document.getElementById('currentDate');
	var currentDate = new Date().toLocaleDateString('ko-KR');
	currentDateElement.innerText = currentDate;
	
	function confirmWrite() {
	    var result = confirm("리뷰 작성을 하시겠습니까?");
	    if (result) {
	        // 사용자가 "예"를 선택한 경우
	        alert("리뷰 작성이 완료되었습니다.");
	        // 여기에 작성 완료 후의 동작 추가 가능
	    }
	    return result; // 사용자가 "아니오"를 선택한 경우도 처리
	}
	
	
</script>
</html>