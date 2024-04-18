<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style></style>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/lessonheader.jsp" %>
	<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
        <img src="resources/img/review.png" id="review">강의 리뷰 작성
        <form action ="write" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>리뷰 제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_name" value="${sessionScope.loginId}"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photos" multiple="multiple"/></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./list'" value="리스트"/>
					<button>글쓰기</button>
				</th>
			</tr>
		</table>
	</form>
    </div>
	</div>
	
	<%@ include file="layout/footer.jsp" %>

</body>
<script>
</script>
</html>