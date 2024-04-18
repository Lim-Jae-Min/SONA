<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>메인화면</title>
        <style>
            /* 여기에 CSS 스타일을 추가하세요 */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #BEE6FF;
                color: #fff;
                padding: 10px;
                text-align: center;
            }
            .menu {
                width: 170px;
            }
            #logo {
                width: 70px;
                height: 70px;
            }
            #alarm {
                width: 20px;
                height: 20px;
            }
            #mymenu {
                position: absolute;
                top: 30px;
                right: 30px;
            }
            header a {
                color: black;
                text-decoration: none;
                padding: 10px;
            }
            #mainmenu {
                display: inline;
                margin: 0 auto;
            }
        </style>
    </head>
    <body>
            <header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu"><a href="#">추천 강의</a></th>
                <th class="menu"><a href="#">전체 강의</a></th>
                <th class="menu"><a href="#">고객센터</a></th>
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
                    <th><a href="#">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    </body>
</html>
</html>