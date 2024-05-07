<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의 개설</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#content {
    padding-bottom: 100px;
}
#top {
    height: 100px;
    padding-left: 350px;
    border-bottom: solid 5px #BEE6FF;
    display: flex;
    align-items: center;
}
#lessonWriteImg {
	width: 20px;
	height: 20px;
}
#middle {
	display: flex;
    justify-content: center; /* 가로 가운데 정렬 */
}
#lessonContent table, td, th {
	padding: 20px;
}
.red {
	color: red;
}
#imgPreview {
	height: 100px;
	width: 100px;
}
.notice {
	width: 800px;
	background-color: #BEE6FF;
	color: gray;
	font-size: 12px;
	padding: 10px;
}
textarea {
	resize: none;
	width: 100%;
	height: 200px;
}
#class_name {
	width: 520px;
}
.inst {
	width: 150px;
}
#location, #careerYears {
	width: 200px;
}
.gray {
	color: gray;
	font-size: 10px;
}
input[type="file"]::-webkit-file-upload-button {
    background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}
button {
	background-color: #0070b6;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.4);
}
.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 60%;
    border-radius: 5px;
}
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
#sendURL {
	width: 80%;
}
#receiveURL{
	width: 100%;
	border: 1px solid #0070b6;
	padding: 5px;
	display: none;
	border-radius: 5px;
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
	width: 50px;
	height: 24px;
}
.multiclickresult{
	display: none;
}
.style {
	width: 80px;
	height: 24px;
}
#goBack {
	background-color: gray;
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
    <div id="content">
        <div id="top">
        	<img src="resources/img/lessonOpen.png" id="lessonWriteImg">&nbsp;&nbsp;&nbsp;<b>강의 개설</b>
        </div>
        <div id="middle">
        	<form action="lessonOpen.do" method="post" enctype="multipart/form-data">
	        	<table id="lessonContent">
	        		<tr>
	        			<td colspan="3">
	        				<div class="notice">
		        				<span class="red">*</span> 은 필수 입력 사항입니다.	        				
	        				</div>
	        			</td>
	        		</tr>
	        		<tr>
	        			<th><img id="imgPreview" src="resources/img/basic_user.png"></th>
	        			<th>강의 제목<span class="red">*</span></th>
	        			<th><input type="text" name="class_name" id="class_name"/></th>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				<input type="file" name="lessonLogo" multiple="multiple" id="imgUpload"/>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				<div class="notice">
	        					- 부적절한 강의 제목 및 내용은 삭제될 수 있습니다.
	        					<br/>
	        					- 허위 정보를 포함하거나 타인을 비방하는 내용은 삭제될 수 있습니다.
	        				</div>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				강의 악기<span class="red">*</span>
		        			<br/><br/>
		        			<select name="inst_category_idx" id="instCategory" class="inst">
								<option value="">악기 카테고리</option>
								<option value="1">건반</option>
								<option value="2">기타</option>
								<option value="3">현악기</option>
								<option value="4">관악기</option>
								<option value="5">타악기</option>
								<option value="6">그 외</option>
							</select>
							<select name="class_inst" id="inst" class="inst"></select>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				강의 내용<span class="red">*</span>
		        			<br/><br/>
		        			<textarea name="class_content" placeholder="내용을 입력해주세요." id="classContent"></textarea>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				강의 지역<span class="red">*</span>
		        			<br/><br/>
		        			<select name="class_location" id="location">
								<option value=""></option>
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
	        			<td colspan="3">
	        				경력 년수<span class="red">*</span>
	        				<br/><br/>
	        				<select name="career_years" id="careerYears">
								<option value=""></option>
								<option value="1년">1년</option>
								<option value="2년">2년</option>
								<option value="3년">3년</option>
								<option value="4년">4년</option>
								<option value="5년">5년</option>
								<option value="6년">6년</option>
								<option value="7년">7년</option>
								<option value="8년">8년</option>
								<option value="9년">9년</option>
								<option value="10년 이상">10년 이상</option>
							</select>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				경력 사항<span class="red">*</span>
		        			<br/><br/>
		        			<textarea name="career_content" placeholder="내용을 입력해주세요."></textarea>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				경력 사진&nbsp;&nbsp;&nbsp;<span class="gray">사진은 3개까지 첨부 가능합니다.</span>
		        			<br/><br/>
		        			<input type="file" name="class_photos" multiple="multiple" id="photos"/>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				경력 영상 URL&nbsp;&nbsp;&nbsp;<span class="gray">영상은 1개까지 첨부 가능합니다.</span>
		        			<br/><br/>
		        			<button type="button" id="url" onclick="openModal()">URL 첨부</button>
		        			<br/><br/>
		        			<div id="receiveURL"></div>
		        			<input type="text" class="multiclickresult" id="videoURL" name="video_url"/>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				개인 악기 필요 여부<span class="red">*</span>
		        			<br/><br/>
		        			<input type="radio" class="need_inst" name="need_inst" value="1" checked>필요&nbsp;&nbsp;&nbsp;
		        			<input type="radio" class="need_inst" name="need_inst" value="0">필요X
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				가능 요일<span class="red">*</span>&nbsp;<span class="gray">(중복 선택 가능)</span>
		        			<br/><br/>
		        			<div class="multiclick days">월요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">화요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">수요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">목요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">금요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">토요일</div>&nbsp;&nbsp;
		        			<div class="multiclick days">일요일</div>&nbsp;&nbsp;
		        			<input type="text" class="multiclickresult" id="classDays" name="class_days"/>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				가능 시간<span class="red">*</span>&nbsp;<span class="gray">(강의 가능 시간대를 선택해주세요.)</span>
		        			<br/><br/>
		        			<select name="start_hour" id="startHour" class="hour"></select>&nbsp;&nbsp;부터
		        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        			<select name="end_hour" id="endHour" class="hour"></select>&nbsp;&nbsp;까지
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				강의스타일<span class="red">*</span>&nbsp;<span class="gray">(중복 선택 가능)</span>
		        			<br/><br/>
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
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				강의 총 횟수<span class="red">*</span>&nbsp;<span class="gray">(숫자만 입력해주세요.)</span>
	        				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        			<input type="text" name="class_times" id="classTimes"/>&nbsp;&nbsp;&nbsp;회
	        			</td>
	        		</tr>
	          		<tr>
	        			<td colspan="3">
	        				강의료<span class="red">*</span>&nbsp;<span class="gray">(숫자만 입력해주세요.)</span>
	        				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		        			<input type="text" name="class_price" id="classPrice"/>&nbsp;&nbsp;&nbsp;원
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3">
	        				<div class="notice">
	        					- 강의료 정산 시 수수료(5%)를 제외한 금액이 정산됩니다.
	        					<br/>
	        					- 실제 정산 금액은 출석률에 따라 변동될 수 있습니다.
	        				</div>
	        			</td>
	        		</tr>
	        		<tr>
	        			<td colspan="3" style="text-align: center;">
	        				<button type="button" id="open">강의 개설</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        				<button type="button" id="goBack">돌아가기</button>
	        			</td>
	        		</tr>
	        	</table>
        	</form>
        </div>
    </div>
    <!-- 모달 -->
	<div id="myModal" class="modal" onclick="closeModal()">
	    <div class="modal-content" onclick="event.stopPropagation()">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <p>영상 URL 주소 입력</p>
	        <input type="text" id="sendURL">&nbsp;&nbsp;&nbsp;
	        <button onclick="submitInput()">확인</button>
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

$('#userName').click(function slide() {
	var display = $('#slide').css('display');
    if (display == 'none') {
        $('#slide').css('display', 'block');
    }
    if (display == 'block') {
        $('#slide').css('display', 'none');
    }
});

$('#logo').click(function main(){
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
});
$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});

	
$('#imgUpload').change(function (){
	var count = $(this)[0].files.length;
	var files = this.files;
	var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
	/* console.log(count); */
	if (count > 1) {
		alert("이미지 파일 첨부는 1개까지 가능합니다.");
		$('#imgPreview').attr('src', 'resources/img/basic_user.png');
		this.value = '';
	}
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!allowedExtensions.exec(file.name)) {
            alert("이미지 파일 첨부만 가능합니다.");
            this.value = '';
            $('#imgPreview').attr('src', 'resources/img/basic_user.png');
            return;
        }
    }
	
    if (file) {
    var reader = new FileReader();
        reader.onload = function (){
            $('#imgPreview').attr('src', reader.result);
        };
        reader.readAsDataURL(file);
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

$('#photos').change(function() {
	var count = $(this)[0].files.length;
	var files = this.files;
	var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
	/* console.log(count); */
	if (count > 3) {
		alert("이미지 파일 첨부는 3개까지 가능합니다.");
		this.value = '';
	}
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        if (!allowedExtensions.exec(file.name)) {
            alert("이미지 파일 첨부만 가능합니다.");
            this.value = '';
            return;
        }
    }
});

//모달 창 열기
function openModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
}

// 모달 창 닫기
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}

// 사용자 입력 받기
function submitInput() {
    var sendURL = document.getElementById("sendURL").value;
    if (sendURL == '') {
		alert("URL을 입력해주세요.");
	}else {
		$('#receiveURL').html(sendURL);
		$('#videoURL').val(sendURL);
		$('#receiveURL').css('display', 'block');
	    closeModal(); // 모달 창 닫기
		
	}    
}

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
    $('#classDays').val(daysResult);
});

var hourArr = [];
var hourContent = '';
hourContent += '<option value=""></option>';

for (var i = 9; i <= 11; i++) {
	hourContent += '<option value="오전 ' + i + '시">오전 ' + i + '시</option>';
	hourArr.push('오전 ' + i + '시');
}
hourContent += '<option value="오후 12시">오후 12시</option>';
hourArr.push('오후 12시');

for (var i = 1; i <= 11; i++) {
	hourContent += '<option value="오후 ' + i + '시">오후 ' + i + '시</option>';
	hourArr.push('오후 ' + i + '시');
}
$('.hour').html(hourContent);

$('#endHour').change(function (){
	//console.log($('#endHour').val());
	var start = $('#startHour').val();
	var end = $('#endHour').val();
	console.log(start);
	console.log(end);
	if (hourArr.indexOf(start) == -1 || hourArr.indexOf(start) > hourArr.indexOf(end)) {
		alert('강의 시간을 다시 입력해주세요.');
		$('#startHour').prop('selectedIndex', 0);
		$('#endHour').prop('selectedIndex', 0);
	}
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
    // console.log(stylesResult);
    $('#classStyle').val(stylesResult);
});

$('#goBack').click(function() {
	location.href = "./allList.go";
});

$('#open').click(function() {
	var result = confirm("강의를 개설하시겠습니까?");
	var regExp = new RegExp('[^0-9]');
	
	var $className = $('input[name="class_name"]');
	var $classInst = $('select[name="class_inst"]');
	var $classContent = $('textarea[name="class_content"]');
	var $classLocation = $('select[name="class_location"]');
	var $careerYears = $('select[name="career_years"]');
	var $careerContent = $('textarea[name="career_content"]');
	var $classDays = $('input[name="class_days"]');
	var $classStyle = $('input[name="class_style"]');
	var $classTimes = $('input[name="class_times"]');
	var $classPrice = $('input[name="class_price"]');
	
	var timesTest = regExp.test($classTimes.val());
	var priceTest = regExp.test($classPrice.val());
	
	/* console.log($className.val());
	console.log($classInst.val());
	console.log($classContent.val());
	console.log($classLocation.val());
	console.log($careerYears.val());
	console.log($careerContent.val());
	console.log($classDays.val());
	console.log($classStyle.val());
	console.log($classTimes.val());
	console.log($classPrice.val()); */
	if (result) {
		if ($className.val() == '') {
			alert('강의 제목을 입력해주세요!');
			$className.focus();
		} else if ($classInst.val() == '' || $classInst.val() == null) {
			alert('강의 악기를 입력해주세요!');
			$classInst.focus();
		} else if ($classContent.val() == '') {
			alert('강의 내용을 입력해주세요!');
			$classContent.focus();
		} else if ($classLocation.val() == '') {
			alert('강의 지역을 입력해주세요!');
			$classLocation.focus();
		} else if ($careerYears.val() == '') {
			alert('경력 년수를 입력해주세요!');
			$careerYears.focus();
		} else if ($careerContent.val() == '') {
			alert('경력 내용을 입력해주세요!');
			$careerContent.focus();
		} else if ($classDays.val() == '') {
			alert('강의 요일을 입력해주세요!');
			$classDays.focus();
		} else if ($classStyle.val() == '') {
			alert('강의스타일을 입력해주세요!');
			$classStyle.focus();
		} else if ($classTimes.val() == '') {
			alert('강의 총 횟수를 입력해주세요!');
			$classTimes.focus();
		} else if ($classPrice.val() == '') {
			alert('강의 가격을 입력해주세요!');
			$classPrice.focus();
		} else {
			if (timesTest) {
				alert('강의 총 횟수에 숫자만 입력해 주세요.');
				$classTimes.val('');
				$classTimes.focus();
				return false;
			} else if (priceTest) {
				alert('강의 가격에 숫자만 입력해 주세요.');
				$classPrice.val('');
				$classPrice.focus();
				return false;
			}else {
				$('form').submit();
			}
		}
	}
});

</script>
</html>