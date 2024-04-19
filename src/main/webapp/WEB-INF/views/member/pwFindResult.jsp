<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
    <title>아이디 찾기 결과</title>
    <style>
        /* 결과 페이지 스타일 */
        #resultPage {
            max-width: 300px;
            margin: 0 auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }

        #footer {
            width: 100%;
            position: fixed;
            bottom: 0;
            left: 0;
            padding: 10px;
            border-top: 1px solid #ccc;
        }

        .result-msg {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .result-id {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        /* 버튼 스타일 */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</style>
</head>
<head>
<body>
    <%@ include file="layout/header.jsp" %>
    <form id="chanePw"  action="changePw.go" method = "post">
	    <input type="hidden" name = "changePwNeedId" value=${username}>  
	    <div id="resultPage">
	    <div class="result-msg">비밀번호 찾기 결과</div>
	    <div class="result-id">
			<tr>
				<td>${findPwResult}</td>
			</tr>
	    </div>
	    	<a href="/login.do" class="btn">로그인 하기</a>
	    	<input  type="submit" class="btn" value="비밀번호 변경하기">
	    </div>
    </form>
    <div id="footer">
        <%@ include file="layout/footer.jsp" %>
    </div>
</body>
<script>
 	var id = "${username}" ;
 	console.log(id);
</script>
</html>