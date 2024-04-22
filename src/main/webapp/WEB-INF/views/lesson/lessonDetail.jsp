<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3972a11b49199823dcd31c279f730c6e&libraries=services"></script> <!-- appkey 다음에 내 카카오 앱키 넣기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3972a11b49199823dcd31c279f730c6e"></script> <!-- appkey 다음에 내 카카오 앱키 넣기 -->

<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
#content {
    padding-bottom: 100px;
}
#top {
    height: 150px;
    padding-left: 350px;
    padding-right: 350px;
    border-bottom: solid 5px #BEE6FF;
    display: flex;
    align-items: center;
    justify-content: space-between;
    
}
.first_line {
	display: inline-block;
}
#reg_date {
	border: solid 2px #BEE6FF;
	border-radius: 5px;
}
.note {
	width: 15px;
	height: 15px;
}
.contentBox {
	width: 760px;
	height: 200px;
	border: solid 2px #BEE6FF;
	border-radius: 5px;
	padding: 20px;
}
.smallcontentBox {
	width: 350px;
	height: 100px;
	border: solid 2px #BEE6FF;
	border-radius: 5px;
	padding: 20px;
}
#lessonContent{
	padding-top: 40px;
	padding-bottom: 70px;
}
.bigInterval {
	padding-top: 20px;
	padding-bottom: 20px;
	width: 50%
}
#left {
	display: inline-block;
	float: left;
}
#right {
	display: inline-block;
	float: right;
}
#middle {
	display: flex;
    justify-content: center; /* 가로 가운데 정렬 */
}
.red {
	color: red;
}
.yellow {
	color: yellow;
}
#lessonLogo {
	height: 120px;
	width: 120px;
}
.gray {
	color: gray;
	font-size: 12px;
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
    margin: 15% auto;
    padding: 20px;
    height: 700px;
    width: 50%;
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
.classStyles {
	padding: 5px;
	background-color: #0070b6;
	color: white;
	border-radius: 5px;
	display: inline-block;
	text-align: center;
}
#locationMap {
	width: 350px;
	height: 328px;
	border: solid 2px #BEE6FF;
	border-radius: 5px;
	padding: 20px;
}
#map {
	width: 350px;
	height: 328px;
}
.lessonImg {
	height: 250px;
	width: auto;
	cursor: pointer;
}
.largeImg {
	height: 700px;
	width: auto;
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
                    <th><a href="#">로그인</a></th>
                </tr>
            </c:if>
        </table>
    </header>
    <div id="content">
        <div id="top">
        	<div id="left">
        		<b>${lesson.class_name}</b>
        		<br/>
        		<span class="gray">${lesson.class_inst}</span>
        		<br/><br/><br/>
        		평균 만족도 <span class="yellow">★ ${lesson.class_score}</span>
        	</div>
        	<div id="right">
        		<table>
        			<tr>
        				<td>${lesson.user_name}</td>
        				<td rowspan="3"><img src="/photo/${lessonLogo}" id="lessonLogo"></td>
        			</tr>
        			<tr>
        				<td>${lesson.class_location}</td>
        			</tr>
        			<tr>
        				<td><span class="red">♥ ${lesson.manner}</span></td>
        			</tr>
        		</table>
        	</div>
        </div>
        <div id="middle">
	        <table id="lessonContent">
	        	<tr>
	        		<td colspan="2">
	        			<div class="first_line"><img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;경력 <b>${lesson.career_years}</b></div>
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			<div class="first_line" id="reg_date">강의 개설일 : ${lesson.class_reg_date}</div>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval" colspan="2">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;경력 사항
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="2">
	  	      			<div class="contentBox">${lesson.career_contents}</div>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval" colspan="2">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의 내용
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="2">
	  	      			<div class="contentBox">${lesson.class_content}</div>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval" colspan="2">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의스타일
	        		</td>
	        	</tr>
	        	<tr>
	        		<td id="classStyle" colspan="2"></td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의 시간
	        		</td>
	        		<td class="BigInterval">
	        			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의 지역
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<div class="smallcontentBox">
	        				<li>${lesson.class_days}</li>
	        				<li>${lesson.class_hours}</li>
	        			</div>
	        		</td>
	        		<td rowspan="3">
	        			<div id="locationMap">
	        				<div id="map"></div>
	        			</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<br/><br/><br/>
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;개인 악기 필요 여부
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="BigInterval">
	        			<div class="smallcontentBox" id="needInst"></div>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval" colspan="2">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;사진
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="2" id="imgRow">
	        			<c:if test="${photos.size() < 1}">
	        				등록된 사진이 없습니다.
	        			</c:if>
	        			<c:forEach items="${photos}" var="photo">
	        				<img class="lessonImg" src="/photo/${photo.new_filename}">
	        			</c:forEach>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval" colspan="2">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;영상
	        		</td>
	        	</tr>
	        	<tr>
	        		<td colspan="2" id="imgRow">
	        			<c:if test="${lesson.video_url eq ''}">
	        				등록된 영상이 없습니다.
	        			</c:if>
	        			<c:if test="${lesson.video_url ne ''}">
	        				<iframe 
				                width="800" height="auto" 
				                src="https://youtu.be/d8IobxcRguU?si=uTWJUPsaWSqaPEJF" 
                				title="강의 영상" 
				                frameborder="0" 
				                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
				                allowfullscreen>
                			</iframe>
	        			</c:if>
	        		</td>
	        	</tr>
        	</table>
        </div>
    </div>
    <!-- 모달 -->
	<div id="myModal" class="modal" onclick="closeModal()">
	    <div class="modal-content" onclick="event.stopPropagation()">
	        <span class="close" onclick="closeModal()">&times;</span>
	        <div id="largeView"></div>
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
</body>
</html>
    <div id="slide">
        <table>
            <tr>
                <td colspan="2">${loginName} 회원님</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
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
	location.href = '/main';
});

var styles = '${lesson.class_style}';
// console.log(styles);

var styleArr = styles.split(',');
var content = '';
for (var style of styleArr) {
	content += '<div class="classStyles">' + style + '</div>&nbsp;&nbsp;&nbsp;';
}
$('#classStyle').html(content);

var needInst = '${lesson.need_inst}';

if (needInst == 1) {
	$('#needInst').html('필요')
}else if (needInst == 0) {
	$('#needInst').html('필요X')
}

// 지도 api
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  level: 3 // 지도의 확대 레벨
};  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${lesson.class_location}', function(result, status) {  // 여기에 주소 집어넣기!!!

	// 정상적으로 검색이 완료됐으면 
	if (status === kakao.maps.services.Status.OK) {
	
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });
	
	    // 인포윈도우로 장소에 대한 설명을 표시합니다
	    var infowindow = new kakao.maps.InfoWindow({  // 여기 아래 el태그에 마커 이름 넣기!!!
	        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + '${lesson.class_location}' + '</div>'
	    });
	    infowindow.open(map, marker);
	
	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	} 
});

$('.lessonImg').click(function (){
	var clickImg = $(this).attr('src');
	console.log(clickImg);
	openModal(clickImg);
});

//모달 창 열기
function openModal(clickImg) {
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
    
    var content = '<img class="largeImg" src="' + clickImg + '">'
    
    $('#largeView').html(content);
}

// 모달 창 닫기
function closeModal() {
    var modal = document.getElementById("myModal");
    modal.style.display = "none";
}
console.log('${lesson.video_url}');


</script>
</html>