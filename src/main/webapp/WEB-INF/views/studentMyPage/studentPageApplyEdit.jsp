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
<c:if test="${sessionScope.user_type eq '관리자'}">
      <header id="adminmain">
           <table id="mainmenu">
               <tr>
                   <th class="menu"><img src="resources/img/logo.png" id="logo"></th>
                   <th class="menu"></th>
                   <th class="menu"></th>
                   <th class="menu"></th>
               </tr>
           </table>
           <table id="mymenu">
              <tr>
                 <td><a href="adminLogout.do">로그아웃</a></td>
              </tr>
           </table>
       </header>
   </c:if>
   <c:if test="${sessionScope.user_type ne '관리자'}">
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
   </c:if>
    <div id="wrapper">
            <div id="sidemenu">
                <h3>개인 정보 수정</h3>
                <hr/>
                <a href="studentPage.go">마이페이지</a>
                <a href="studentPageEdit.go">개인 정보 수정</a>
                <a href="favoriteList.go">즐겨찾기 강사</a>
                <a href="blockList.go">숨김 강사</a>
                <a href="studentQnAList.go">내가 작성한 Q&A</a>
                <a href="studentPointList.go">포인트 내역</a>
                <a href="studentReceivedList.go">내가 받은 리뷰</a>
                <a href="studentWrittenList.go">내가 작성한 리뷰</a>
                <a href="studentAttendedList.go">수강 이력</a>
            </div>
 		<div id="content">
 			<hr>
 			<tr>
				<td style="text-align: left; font-weight: bold; font-size: 35px; width: 50%;"><span style="font-size:25px; margin-left : 20px; height:40px;">&nbsp;&nbsp;수강신청서</span></td>
			</tr>
            <table style="width: 100%;">
            <form action="./studentPageApply.edit" method="POST">    
             
	            <tr>
	                <td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
	            </tr>   
	             
	            <tr>
	                <td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
	            </tr>
                   
				<tr>
					<td style="width :100%; margin-left:50px; font-size:17px;">&nbsp;&nbsp;희망악기 : 
						
						<select name="inst_category_idx" id="instCategory" style="width: 40%; height:30px; font-size : 15px;">
							<option value="">악기 카테고리</option>
							<option value="1">건반</option>
							<option value="2">기타</option>
							<option value="3">현악기</option>
							<option value="4">관악기</option>
							<option value="5">타악기</option>
							<option value="6">그 외</option>
						</select>
						
						<select name="applyform_inst" id="inst" style="width: 40%; height:30px; font-size : 15px;"></select>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>
                  
 				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>

				<tr>
 					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>
                  
				<tr>
 					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>                                    
                  
                                                	  
				<tr>
					<td style="width :100%; margin-left:50px; font-size:17px;">&nbsp;&nbsp;희망지역 :
                    	<select name="applyform_location" id="location" style="width: 80%; height:30px; font-size : 15px;">
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
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>
            
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>

				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>
            
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>           
            
            
				<tr>     
					<td style="width :100%; margin-left:50px; font-size:17px;">&nbsp;&nbsp;희망요일(중복가능)</td>
				</tr>
				<tr>
	                <td class="main" colspan="2" style="width: 100%; text-align: left;">
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                <br>
					    <button type = "button" id="월요일Btn" onclick="changeColor('월요일')" style="margin-left: 50px; width: 110px; height: 40px">월요일</button>
						<button type = "button" id="화요일Btn" onclick="changeColor('화요일')" style="margin-left: 20px; width: 110px; height: 40px">화요일</button>
						<button type = "button" id="수요일Btn" onclick="changeColor('수요일')" style="margin-left: 20px; width: 110px; height: 40px">수요일</button>
						<button type = "button" id="목요일Btn" onclick="changeColor('목요일')" style="margin-left: 20px; width: 110px; height: 40px">목요일</button>
						<button type = "button" id="금요일Btn" onclick="changeColor('금요일')" style="margin-left: 20px; width: 110px; height: 40px">금요일</button>
						<button type = "button" id="토요일Btn" onclick="changeColor('토요일')" style="margin-left: 20px; width: 110px; height: 40px">토요일</button>
						<button type = "button" id="일요일Btn" onclick="changeColor('일요일')" style="margin-left: 20px; width: 110px; height: 40px">일요일</button>
						
						<!-- 선택한 요일 정보를 저장할 숨겨진 입력 필드 -->
						<input type="hidden" id="applyform_days" name="applyform_days" value="">
	                    
	                    <!-- 나머지 요일도 동일한 방식으로 추가 -->
	                </td>
				</tr> 
				  
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr> 
            
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr> 

				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr> 
            
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>             
            
            



				<tr>                
					<td style="width :100%; margin-left:50px; font-size:17px;">&nbsp;&nbsp;희망 강의스타일(중복가능)</td>
				</tr>
				<tr>
					<td class="main" colspan="2" style="width: 100%; text-align: left;">
	                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                <br>
	                    <button type = "button" id="체계적인Btn" onclick="changeColor1('체계적인')" style="margin-left: 50px; width: 110px; height: 40px">체계적인</button>
	                    <button type = "button" id="글로벌한Btn" onclick="changeColor1('글로벌한')"style="margin-left: 20px; width: 110px; height: 40px">글로벌한</button>
	                    <button type = "button" id="진지한Btn" onclick="changeColor1('진지한')"style="margin-left: 20px; width: 110px; height: 40px">진지한</button>
	                    <button type = "button" id="자유로운Btn" onclick="changeColor1('자유로운')"style="margin-left: 20px; width: 110px; height: 40px">자유로운</button>
	                    <button type = "button" id="실기 중심Btn" onclick="changeColor1('실기 중심')"style="margin-left: 20px; width: 110px; height: 40px">실기 중심</button>
	                    <button type = "button" id="창의적인Btn" onclick="changeColor1('창의적인')"style="margin-left: 20px; width: 110px; height: 40px">창의적인</button>
	                    <br><br>
	                    <button type = "button" id="유머러스한Btn" onclick="changeColor1('유머러스한')"style="margin-left: 50px; width: 110px; height: 40px">유머러스한</button>
	                    <button type = "button" id="적극적인Btn" onclick="changeColor1('적극적인')"style="margin-left: 20px; width: 110px; height: 40px">적극적인</button>
	                    <button type = "button" id="엄격한Btn" onclick="changeColor1('엄격한')"style="margin-left: 20px; width: 110px; height: 40px">엄격한</button>
	                    <button type = "button" id="센스있는Btn" onclick="changeColor1('센스있는')"style="margin-left: 20px; width: 110px; height: 40px">센스있는</button>
	                    <button type = "button" id="자상한Btn" onclick="changeColor1('자상한')"style="margin-left: 20px; width: 110px; height: 40px">자상한</button>
	                    <button type = "button" id="성실한Btn" onclick="changeColor1('성실한')"style="margin-left: 20px; width: 110px; height: 40px">성실한</button>
                    
						<input type="hidden" id="applyform_style" name="applyform_style" value="">
					</td>
				</tr>
                  
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr> 

				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr> 
              
				<tr>
					<td style="width :100%; margin-left:50px; font-size:17px;">&nbsp;&nbsp;개인악기 유무 : 
				        <select name="have_inst" id="have_inst" style="width: 40%; height:30px; font-size : 15px;">
				        	<option value=""></option>				        
							<option value="1">무</option>
							<option value="0">유</option>
						</select>
					</td>
				</tr>
            	                   
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>                 
                  
				<tr>
					<td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
				</tr>                 
                  
				<tr>
					<td style = "text-align: right;">
						<button type = "button" onclick="goToStudentPageEdit()">돌아가기</button>
						&nbsp;&nbsp;<button style = "text-align: left;" type = "button" onclick="applyEdit()">수정</button></td>
                  </tr>
            
            </form>
			</table>
  			
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


function goToStudentPageEdit() {
    window.location.href = "./studentPageEdit.go";
}

var overChk = false;


$('#logo').click(function main(){
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
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
	
	$('#userName').click(function slide() {
		var display = $('#slide').css('display');
	    if (display == 'none') {
	        $('#slide').css('display', 'block');
	    }
	    if (display == 'block') {
	        $('#slide').css('display', 'none');
	    }
	});
	
	var applyform_days = []; // 선택한 요일을 저장할 배열
	var applyform_style = []; // 선택한 스타일을 저장할 배열

	function changeColor(day) {
	    var btnId = day + "Btn";
	    var button = document.getElementById(btnId);
	    
	    // 현재 색 확인
	    var currentColor = button.style.backgroundColor;
	    
	    // 현재 색이 파란색인지 확인하여 다른 색으로 변경
	    if (currentColor !== "blue") {
	        // 파란색이 아니면 파란색으로 변경
	        button.style.backgroundColor = "blue";
	        applyform_days.push(day);
	    } else {
	        // 파란색이면 원래 색상으로 변경
	        button.style.backgroundColor = ""; // 빈 문자열로 설정하여 기본 색상으로 돌아감
	        var index = applyform_days.indexOf(day);
	        if (index !== -1) {
	            // 이미 선택된 요일인 경우 배열에서 제거
	            applyform_days.splice(index, 1);
	        }
	    }

	    // 숨겨진 입력 필드에 선택한 요일 정보 업데이트
	    document.getElementById("applyform_days").value = applyform_days.join(",");
	}
	
	function changeColor1(style) {
	    var btnId = style + "Btn";
	    var button = document.getElementById(btnId);
	    
	    // 현재 색 확인
	    var currentColor = button.style.backgroundColor;
		console.log(btnId);
	    // 현재 색이 파란색인지 확인하여 다른 색으로 변경
	    if (currentColor !== "blue") {
	        // 파란색이 아니면 파란색으로 변경
	        button.style.backgroundColor = "blue";
	        applyform_style.push(style);
	    } else {
	        // 파란색이면 원래 색상으로 변경
	        button.style.backgroundColor = ""; // 빈 문자열로 설정하여 기본 색상으로 돌아감
	        var index = applyform_style.indexOf(style);
	        if (index !== -1) {
	            // 이미 선택된 요일인 경우 배열에서 제거
	            applyform_style.splice(index, 1);
	        }
	    }
		console.log("ㅎㅇ");

	    // 숨겨진 입력 필드에 선택한 요일 스타일 업데이트
	    document.getElementById("applyform_style").value = applyform_style.join(",");
	}
	
	function applyEdit() {
	    var $instCategory = $('select[name="inst_category_idx"]');
	    var $inst = $('select[name="applyform_inst"]');
	    var $location = $('select[name="applyform_location"]');
	    var $haveinst = $('select[name="have_inst"]');
	    
	    // 체크된 요일 가져오기
	    var selectedDays = [];
	    $('input[name="dayCheckbox"]:checked').each(function() {
	        selectedDays.push($(this).val());
	    });
	    
	    // 체크된 스타일 가져오기
	    var selectedStyles = applyform_style;

	    if ($instCategory.val() == '') {
	        alert('희망악기 카테고리를 선택해주세요');
	        $instCategory.focus();
	    } else if ($inst.val() == '') {
	        alert('희망악기를 선택해주세요');
	        $inst.focus();
	    } else if ($location.val() == '') {
	        alert('희망지역을 선택해주세요');
	        $location.focus();
	    } else if (selectedStyles.length === 0) { // 선택된 스타일이 없는 경우
	        alert('적어도 하나의 스타일을 선택해주세요');
	        // 스타일 선택 영역으로 포커스 이동
	        $('button[id$="Btn"]').first().focus();
	    } else {
	        // 전화번호가 숫자만 포함하는지 확인
	        if ($haveinst.val() == '') {
	            alert('악기 유무를 체크해주세요!');
	            $haveinst.focus();
	            return false;
	        }

	        // 폼을 직접 제출
	        if (confirm('수정하시겠습니까?')) {
	        	$('form').submit();
	            $('form').attr('action', './studentPage.go');
	            
	        }
	    }
	}
	

</script>
</html>