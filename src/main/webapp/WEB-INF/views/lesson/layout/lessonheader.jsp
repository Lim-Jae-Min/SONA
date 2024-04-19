<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
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

</body>
<script>
</script>
</html>