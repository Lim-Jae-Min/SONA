<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
		.main {
		    font-size: 20px; 
		    #contents{
		    font-size: 15px;
		}
		.main {
		    font-size: 20px; 
		}
</style>
</head>
<body>
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
    <div id="wrapper">
            <div id="sidemenu">
                <h3>마이페이지</h3>
                <hr/>
                <a href="#">마이페이지</a>
                <a href="#">개인 정보 수정</a>
                <a href="#">즐겨찾기 강사</a>
                <a href="#">숨김 강사</a>
                <a href="#">내가 작성한 Q&A</a>
                <a href="#">포인트 내역</a>
                <a href="#">내가 받은 리뷰</a>
                <a href="#">내가 작성한 리뷰</a>
                <a href="#">수강 이력</a>
            </div>
         <div id="content">
            <table style="width: 100%;">
                <thead>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr style="width: 100%;">
                        <td style="width: 60%; text-align: left;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../img/account_box.png" style="display: inline-block; vertical-align: middle;">
                            <div style="display: inline-block; vertical-align: middle;">
                                <input type="text" name="name" value = "   USER" style="margin-left: 10px; display: block; width: 400px; height: 35px;"> <!-- 텍스트 입력란 -->
                                &nbsp;&nbsp;seajnu15
                            </div>
                        </td>    
                        <td style="width: 40%; min-width: 150px; text-align: right;">
                            <img src="resources/img/heart.png" style="margin-right: 30px; width: 20px; height: 20px;" id="heart">44.5
                        </td>
                    </tr>
                    </thead>
                    
                    로그인 
                <tbody>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새 비밀번호 <span class="contents" style="margin-left: 61px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인 <span class="contents" style="margin-left: 42px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                    </tr>
                    <tr>
                        <td class="trash" style="font-size: small; white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호는 8자 이상 포함되어야 합니다.</td>
                    </tr>
                    <tr>
                        <td class="trash" style="font-size: small; white-space: nowrap;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호는 영문자, 숫자, 특수문자가 최소 1개이상 포함되어 있어야합니다.</td>
                    </tr>
                    
                    <tr>
                            <td class="main" colspan="2" style="width: 50%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 <span class="contents" style="margin-left: 109px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                     </tr>            
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                      <tr>
                            <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 <span class="contents" style="margin-left: 89px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                     </tr>
                     <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                      <tr>
                            <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호 <span class="contents" style="margin-left: 89px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                     </tr>
                     <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                      <tr>
                            <td class="main" colspan="2" style="width: 100%; text-align: left;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;은행 <span class="contents" style="margin-left: 130px; width: 200px; display: inline-block;"><input type="password" value="  USER" id="name" style="width: 400px; height: 50px; font-size: 29px;"></span></td>
                     </tr> 
                </tbody>
            </table>
            <br>  <br>  <br>  <br>
            <tr>
                <td colspan="3">
                    <hr style="width: 100%; border: none; border-bottom: 1px solid black; margin-top: 5px;">
                </td>
            </tr>
            <tr>
                <td style="text-align: left; font-weight: bold; font-size: 24px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수강신청서</td>
            </tr>
            <br> <br><br><br>
            <tr>
            <td>&nbsp;&nbsp;&nbsp;희망악기 :</td>
            <td><input type = "radio" name = "INST_CATEGORY_NAME" value="피아노"/>피아노
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type = "radio" name = "INST_CATEGORY_NAME" value="기타"/>기타
            </td>
            </tr>

            <tr>
                <td>&nbsp;&nbsp;&nbsp;희망악기 : <select name="instCategory" id="instCategory">
               <option value="0">악기 카테고리</option>
               <option value="1">건반</option>
               <option value="2">기타</option>
               <option value="3">현악기</option>
               <option value="4">관악기</option>
               <option value="5">타악기</option>
               <option value="6">그 외</option>
            </select>
            <select name="inst" id="inst">

            </select>
            	</td>
              
            </tr>
                <br><br><br><br><br>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;희망지역 :
                    <select name="location" id="location" style="width: 50%;">
                        <option value="지역 전체">전체</option>
                        <option value="서울특별시 강남구">서울특별시 강남구</option>
                        <option value="서울특별시 강동구">서울특별시 강동구</option>
                        <option value="서울특별시 강북구">서울특별시 강북구</option>
                        <option value="서울특별시 강서구">서울특별시 강서구</option>
                        <option value="서울특별시 관악구">서울특별시 관악구</option>
                        <option value="서울특별시 광진구">서울특별시 광진구</option>
                        <option value="서울특별시 구로구">서울특별시 구로구</option>
                        <option value="서울특별시 금천구">서울특별시 금천구</option>
                        <option value="서울특별시 노원구">서울특별시 노원구</option>
                        <option value="서울특별시 도봉구">서울특별시 도봉구</option>
                        <option value="서울특별시 동대문구">서울특별시 동대문구</option>
                        <option value="서울특별시 동작구">서울특별시 동작구</option>
                        <option value="서울특별시 마포구">서울특별시 마포구</option>
                        <option value="서울특별시 서대문구">서울특별시 서대문구</option>
                        <option value="서울특별시 서초구">서울특별시 서초구</option>
                        <option value="서울특별시 성동구">서울특별시 성동구</option>
                        <option value="서울특별시 성북구">서울특별시 성북구</option>
                        <option value="서울특별시 송파구">서울특별시 송파구</option>
                        <option value="서울특별시 양천구">서울특별시 양천구</option>
                        <option value="서울특별시 영등포구">서울특별시 영등포구</option>
                        <option value="서울특별시 용산구">서울특별시 용산구</option>
                        <option value="서울특별시 은평구">서울특별시 은평구</option>
                        <option value="서울특별시 종로구">서울특별시 종로구</option>
                        <option value="서울특별시 중구">서울특별시 중구</option>
                        <option value="서울특별시 중랑구">서울특별시 중랑구</option>
                     </select>
                </td>               
            </tr> 
            
             <tr>
                
                <br><br><br>
                &nbsp;&nbsp; &nbsp;&nbsp;<td>희망요일(중복가능)</td>
                <td class="main" colspan="2" style="width: 100%; text-align: left;">
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                <br>
                    <button id="mondayBtn" onclick="changeColor('monday')" style="margin-left: 50px; width: 60px;">월</button>
                    <button id="tuesdayBtn" onclick="changeColor('tuesday')" style="margin-left: 10px; width: 60px;">화</button>
                    <button id="wednesdayBtn" onclick="changeColor('wednesday')" style="margin-left: 10px; width: 60px;">수</button>
                    <button id="thursdayBtn" onclick="changeColor('thursday')" style="margin-left: 10px; width: 60px;">목</button>
                    <button id="fridayBtn" onclick="changeColor('friday')" style="margin-left: 10px; width: 60px;">금</button>
                    <button id="saturdayBtn" onclick="changeColor('saturday')" style="margin-left: 10px; width: 60px;">토</button>
                    <button id="sundayBtn" onclick="changeColor('sunday')" style="margin-left: 10px; width: 60px;">일</button>

                    <input type="hidden" id="selectedDays" name="selectedDays" value="">
                    </div>
                    <!-- 나머지 요일도 동일한 방식으로 추가 -->
                </td>
            </tr>
            
            
            
            
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
        <div><a href="#">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="#">로그아웃</a></div>
    </div>
</body>
<script>
var category1 = ['클래식 피아노', '재즈 피아노', '피아노 반주'];
var category2 = ['어쿠스틱 기타', '일렉 기타', '베이스 기타'];
var category3 = ['바이올린', '비올라', '첼로', '콘트라베이스'];
var category4 = ['클라리넷', '플룻', '오보에', '트럼펫', '트럼본', '색소폰'];
var category5 = ['드럼', '카혼'];
var category6 = ['보컬', '작곡', '미디'];

$('#instCategory').change(function() {
   console.log('값이 변경되었습니다.');
   var selectedCategory = $('#instCategory').val();
   var option = '';
   option += '<option value=""></option>';
   if (selectedCategory == 1) {
      for (var value of category1) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   if (selectedCategory == 2) {
      for (var value of category2) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   if (selectedCategory == 3) {
      for (var value of category3) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   if (selectedCategory == 4) {
      for (var value of category4) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   if (selectedCategory == 5) {
      for (var value of category5) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   if (selectedCategory == 6) {
      for (var value of category6) {
         option += '<option value="' + value + '">' + value + '</option>';
      }
   }
   $('#inst').html(option);
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

function changeColor(day) {
    var btnId = day + "Btn";
    var button = document.getElementById(btnId);
    button.style.backgroundColor = "skyblue"; // 색 변경

    // 선택한 요일 정보를 서버에 전송할 준비
    $.ajax({
        url: '/saveSelectedDay',
        type: 'POST',
        data: { selectedDay: day },
        success: function(response) {
            console.log('요일 정보 전송 성공');
        },
        error: function(xhr, status, error) {
            console.error('AJAX request error:', error);
        }
    });
}


</script>
</html>