<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의신청</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#footer{
	position: absolute;
    width: 100%; /* 화면 전체 너비 차지 */
}


h1 {
    text-align: center;
    margin-top: 5px;
}
p {
    text-align: center;
    margin-right: 494px;
}
#hope__style{
	 text-align: center;
	 margin-right: 487px;
}
#location{
    width: 607px; /* 드롭다운 메뉴의 너비 설정 */
    padding: 10px; /* 드롭다운 메뉴의 여백 설정 */
    font-size: 12px; /* 드롭다운 메뉴의 폰트 크기 설정 */
    border-radius: 5px; /* 드롭다운 메뉴의 테두리 모서리 둥글게 설정 */
    margin-bottom: 12px;
}
#instCategory,
#inst{
    width: 300px; /* 드롭다운 메뉴의 너비 설정 */
    padding: 10px; /* 드롭다운 메뉴의 여백 설정 */
    font-size: 12px; /* 드롭다운 메뉴의 폰트 크기 설정 */
    border-radius: 5px; /* 드롭다운 메뉴의 테두리 모서리 둥글게 설정 */
    margin-bottom: 12px;
}

#have{
    width: 150px; /* 드롭다운 메뉴의 너비 설정 */
    padding: 10px; /* 드롭다운 메뉴의 여백 설정 */
    font-size: 15px; /* 드롭다운 메뉴의 폰트 크기 설정 */
    border-radius: 5px; /* 드롭다운 메뉴의 테두리 모서리 둥글게 설정 */
    margin-bottom: 12px;
    
}

#inst__drop {
    text-align: center;
    margin-bottom: 46px;
    margin-top: 31px;
}

#location__drop {
    text-align: center;
    margin-bottom: 23px;
    
}

#have__drop {
    text-align:center;
    margin-left: -453px;
 
}
.selected {
        background-color: lightblue;
}

#apply_button{
	position: absolute;
   	background-color: #BEE6FF;
    border-radius: 6px;
    font-size: 100%;
    width: 684px;
    height: 45px;
    margin-left: 29%;
    margin-top: 34px;
	  top: 73%;
	  left: 21%;
	  transform: translate(-50%, -50%);
}

#days__select{
	text-align:center;
	margin-bottom: 30px;
}


#style__select{
	text-align:center;
	margin-bottom: 44px;
}

.multiclick {
   padding: 5px;
   background-color: gray;
   color: white;
   border-radius: 5px;
   display: inline-block;
   cursor: pointer;
   text-align: center;
}
.days {
   width: 75px;
   height: 24px;
}
.multiclickresult{
   display: none;
}
.style {
   width: 91px;
   height: 24px;
}


</style>
</head>
<body>
<header id="usermain">
        <table id="mainmenu">
            <tr>
                <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                <th class="menu">
                   <c:if test="${sessionScope.loginId eq null}">
                      <c:if test="${sessionScope.user_type ne '강사'}">
                         <a href="login.go">추천 강의</a>                   
                      </c:if>
                   </c:if>
                   <c:if test="${sessionScope.loginId ne null}">
                      <c:if test="${sessionScope.user_type ne '강사'}">
                         <a href="recommendList.go">추천 강의</a>                   
                      </c:if>
                   </c:if>
                </th>
                <th class="menu"><a href="allList.go">전체 강의</a></th>
                <th class="menu"><a href="serviceCenter.go">고객센터</a></th>
            </tr>
        </table>
        <table id="mymenu">
            <c:if test="${sessionScope.loginId ne null}">
                <tr>
                    <c:if test="${sessionScope.alarm_count > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg alarm"></th>
                    </c:if>
                    <c:if test="${sessionScope.alarm_count == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg alarm"></th>
                    </c:if>
                    <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                    <th><div id="userName">${sessionScope.user_name}</div></th>
                </tr>
            </c:if>
            <c:if test="${sessionScope.loginId eq null}">
                <tr>
                    <th><a href="login.go">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    
    <div>
        ${msg}
    </div>
    
    <h1>나만의 강사 찾기</h1>   
  
    <form action="apply.do" method="post">  
    <div id="inst__drop">
        <label for="instCategory">희망 악기:</label>
        <select name="instCategory" id="instCategory" class="inst">
            <option value="">악기 카테고리</option>
            <option value="1">건반</option>
            <option value="2">기타</option>
            <option value="3">현악기</option>
            <option value="4">관악기</option>
            <option value="5">타악기</option>
            <option value="6">그 외</option>
        </select>
        <select name="inst" id="inst" class="inst">
            
        </select>
    </div>


    <div id="location__drop">
        <label for="location">희망 지역:</label>
        <select name="location" id="location">
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
    </div>
	<div id="days__select">
     <p>가능 요일<span class="red">*</span>&nbsp;<span class="gray">(중복 선택 가능)</span></p>
	   <div class="multiclick days">월요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">화요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">수요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">목요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">금요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">토요일</div>&nbsp;&nbsp;
	   <div class="multiclick days">일요일</div>&nbsp;&nbsp;
	   <input type="text" class="multiclickresult" id="classDays" name="class_days"/>
	</div>
    
    
    <div id="style__select">
		<p id="hope__style">강의스타일<span class="red">*</span>&nbsp;<span class="gray">(중복 선택 가능)</span></p>
	   <div class="multiclick style">체계적인</div>&nbsp;&nbsp;
	   <div class="multiclick style">글로벌한</div>&nbsp;&nbsp;
	   <div class="multiclick style">진지한</div>&nbsp;&nbsp;
	   <div class="multiclick style">자유로운</div>&nbsp;&nbsp;
	   <div class="multiclick style">실기중심</div>&nbsp;&nbsp;
	   <div class="multiclick style">창의적인</div>&nbsp;&nbsp;
	   <br/><br/>
	   <div class="multiclick style">유머러스한</div>&nbsp;&nbsp;
	   <div class="multiclick style">적극적인</div>&nbsp;&nbsp;
	   <div class="multiclick style">자상한</div>&nbsp;&nbsp;
	   <div class="multiclick style">센스있는</div>&nbsp;&nbsp;
	   <div class="multiclick style">엄격한</div>&nbsp;&nbsp;
	   <div class="multiclick style">성실한</div>&nbsp;&nbsp;
	   <input type="text" class="multiclickresult" id="classStyle" name="class_style"/>
	   </div>
     
    
    <div id="have__drop">
     <label for="have">악기 유무:</label>
        <select name="have" id="have" >
            <option value="1">유</option>
            <option value="0">무</option>
        </select>
    </div>
    
    
    <button  id=apply_button >강의 신청하기</button>
    </form> 
    
    
     <div id="slide">
        <table>
            <tr>
                <td colspan="2">${sessionScope.user_name} 회원님</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="manner">♥ ${sessionScope.manner_variance}</td>
            </tr>
        </table>
        <br/>
        <div>보유 포인트 : <span>${sessionScope.point}</span></div>
        <br/>
        <div>
           <c:if test="${sessionScope.user_type eq '수강생'}">
              <a href="studentWrittenList.go">내가 쓴 리뷰</a>           
           </c:if>
           <c:if test="${sessionScope.user_type eq '강사'}">
              <a href="teacherWrittenList.go">내가 쓴 리뷰</a>           
           </c:if>
        </div>
        <br/>
        <div><a href="myPage.go">마이페이지</a></div>
        <br/><br/><br/>
        <div><a href="logout.do">로그아웃</a></div>
    </div>
</body>
<script>
$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});


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


	var days = [];
	
	$('.days').click(function (){
	   var arr = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
	   var index = 0; 
	   
	    if ($(this).css('background-color') === 'rgb(128, 128, 128)') {
	        $(this).css('background-color', '#0070b6');
	        days.push($(this).html());
	    } else {
	        $(this).css('background-color', 'gray');
	        index = days.indexOf($(this).html());
	        days.splice(index, 1);
	    }
	    
	    var daysResult = [];
	    
	    for (var i = 0; i < arr.length; i++) {
	      if (days.indexOf(arr[i]) != -1) {
	         daysResult.push(arr[i]);
	      }
	   }
	    console.log(daysResult);
	    $('#classDays').val(daysResult);
	});

  
  var styles = [];

  $('.style').click(function (){
     var arr = ['체계적인', '글로벌한', '진지한', '자유로운', '실기중심', '창의적인', '유머러스한', '적극적인', '자상한', '센스있는', '엄격한', '성실한'];
     var index = 0; 
     
      if ($(this).css('background-color') === 'rgb(128, 128, 128)') {
          $(this).css('background-color', '#0070b6');
          styles.push($(this).html());
      } else {
          $(this).css('background-color', 'gray');
          index = styles.indexOf($(this).html());
          styles.splice(index, 1);
      }
      
      var stylesResult = [];
      
      for (var i = 0; i < arr.length; i++) {
        if (styles.indexOf(arr[i]) != -1) {
           stylesResult.push(arr[i]);
        }
     }
       console.log(stylesResult);
      $('#classStyle').val(stylesResult);
  });

    
</script>
</html>