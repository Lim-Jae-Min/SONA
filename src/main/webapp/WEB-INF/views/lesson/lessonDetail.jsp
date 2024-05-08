<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>SONA 강의 상세보기</title>
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
    padding-left: 28%;
    padding-right: 28%;
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
.smallInterval {
	padding-bottom: 20px;
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
	color: #ffc400;
}
.lessonLogo {
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
.reviewProfile {
	width: 50px;
	height: 50px;
}
.smallFontSize {
	font-size: 12px;
}
.smallListBox {
	width: 350px;
	height: 320px;
	border: solid 2px #BEE6FF;
	border-radius: 5px;
	padding: 20px;
}
.smallList {
	width: 100%;
}
.reviewLeft {
	width: 60px;
}
.locked {
	width: 20px;
	height: 20px;
}
.centerBox {
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
}
#blindButton {
	background-color: red;
}
#editButton {
	background-color: rgb(219, 219, 219);
	color: black;
}
#disableButton {
	background-color: rgb(68, 68, 68);
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
        				<td><a href="userDetail.go?user_id=${lesson.user_id}">${lesson.user_name}</a></td>
        				<c:if test="${lessonLogo != null}">
        					<td rowspan="3"><img src="/photo/${lessonLogo}" class="lessonLogo"></td>
        				</c:if>
        				<c:if test="${lessonLogo == null}">
        					<td rowspan="3"><img src="resources/img/basic_user.png" class="lessonLogo"></td>
        				</c:if>
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
	        			<c:if test="${lesson.video_url eq null}">
	        				등록된 영상이 없습니다.
	        			</c:if>
	        			<c:if test="${lesson.video_url ne null}">
	        				<iframe 
				                width="800" height="600" 
				                src="${lesson.video_url}" 
                				title="강의 영상" 
				                frameborder="0" 
				                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
				                allowfullscreen>
                			</iframe>
	        			</c:if>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<td class="BigInterval">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의 리뷰
	        		</td>
	        		<td class="BigInterval">
	        			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의 Q&A&nbsp;&nbsp;&nbsp;&nbsp;
	        			<button type="button" id="QnAWrite">Q&A 작성</button>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<div class="smallListBox">
		        			<c:if test="${reviewList.size() < 1}">
		        				등록된 리뷰가 없습니다.
		        			</c:if>
		        			<c:if test="${reviewList.size() >= 1}">
		        				<table class="smallList">
			        				<c:forEach items="${reviewList}" var="review">
			        					<tr>
				        					<th class="smallInterval reviewLeft">
				        						<c:if test="${review.profile_photoname eq null}">
				        							<img src="resources/img/basic_user.png" class="reviewProfile">
				        						</c:if>
				        						<c:if test="${review.profile_photoname ne null}">
				        							<img src="/photo/${review.profile_photoname}" class="reviewProfile">
				        						</c:if>
				        					</th>
				        					<td class="smallInterval">
				        						<span class="smallFontSize">${review.rater_name}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="smallFontSize yellow">★ ${review.score}</span>
				        						<br/>
				        						<span><a href="lessonReviewDetail.go?review_idx=${review.review_idx}">${review.review_title}</a></span>
				        					</td>
			        					</tr>
			        				</c:forEach>
			        				<tr>
			        					<th colspan="2"><button id="moreReview">더보기</button></th>
			        				</tr>
			        			</table>
		        			</c:if>
	        			</div>
	        		</td>
	        		<td>
	        			<div class="smallListBox">
		        			<c:if test="${QnAList.size() < 1}">
		        				등록된 Q&A가 없습니다.
		        			</c:if>
		        			<c:if test="${QnAList.size() >= 1}">
		        				<table class="smallList">
			        				<c:forEach items="${QnAList}" var="QnA">
			        					<tr>
				        					<td class="smallInterval">
				        						<c:if test="${QnA.anonymous_status}">
				        							비공개 Q&A 입니다. <img src="resources/img/locked.png" class="locked">
				        						</c:if>
				        						<c:if test="${!QnA.anonymous_status}">
					        						<span><a href="lessonQnADetail.go?question_idx=${QnA.question_idx}">${QnA.q_title}</a></span>
				        						</c:if>
				        					</td>
			        					</tr>
			        				</c:forEach>
			        				<tr>
			        					<th colspan="2"><button id="moreQnA">더보기</button></th>
			        				</tr>
			        			</table>
		        			</c:if>
	        			</div>
	        		</td>
	        	</tr>
	        	<tr>
	        		<td class="BigInterval">
	  	      			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;누적 수강생 수
	        		</td>
	        		<td class="BigInterval">
	        			<img src="resources/img/musical-note.png" class="note">&nbsp;&nbsp;강의료
	        		</td>
	        	</tr>
	        	<tr>
	        		<td>
	        			<div class="smallcontentBox centerBox">
		        			${lesson.accumulate_student} 명
	        			</div>
	        		</td>
	        		<td>
	        			<div class="smallcontentBox centerBox">
		        			총 ${lesson.class_times}회
		        			<br/><br/>
		        			${lesson.class_price} 원
	        			</div>
	        		</td>
	        	</tr>
	        	<tr><td class="BigInterval"></td></tr><tr><td class="BigInterval"></td></tr>
	        	<tr>
	        		<th class="BigInterval" colspan="2">
	        			<c:if test="${applyCheck.accumulate_times eq lesson.class_times}">
	        				<button id="lessonApplyButton">수강신청</button>
	        			</c:if>
	        			<c:if test="${sessionScope.user_type eq '수강생' and applyCheck.apply_state ne '신청 완료' and applyCheck.apply_state ne '결제 완료'}">
		  	      			<button id="lessonApplyButton">수강신청</button>
	        			</c:if>
	        			<c:if test="${sessionScope.user_type eq '수강생' and applyCheck.apply_state eq '신청 완료'}">
		  	      			수강 신청이 완료되었습니다. 결제를 진행해주세요!
		  	      			<br/><br/>
		  	      			<button id="paymentGoButton">바로가기</button>
	        			</c:if>
	        			<c:if test="${sessionScope.user_type eq '수강생' and applyCheck.apply_state eq '결제 완료' and applyCheck.accumulate_times ne lesson.class_times}">
		  	      			수강 진행중입니다.
	        			</c:if>
	  	      			<c:if test="${sessionScope.user_type eq '관리자' and lesson.class_delete eq 0}">
		  	      			<button id="blindButton">블라인드</button>
	        			</c:if>
	        			<c:if test="${sessionScope.user_type eq '관리자' and lesson.class_delete eq 1}">
		  	      			<button id="unBlindButton">블라인드 해제</button>
	        			</c:if>
	  	      			<c:if test="${sessionScope.loginId eq lesson.user_id and lesson.class_disable eq 0}">
		  	      			<button id="editButton">강의수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="disableButton">비활성화</button>
	        			</c:if>
	        			<c:if test="${sessionScope.loginId eq lesson.user_id and lesson.class_disable eq 1}">
		  	      			<button id="editButton">강의수정</button>&nbsp;&nbsp;&nbsp;&nbsp;<button id="unDisableButton">비활성화 해제</button>
	        			</c:if>
	        		</th>
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

var styles = '${lesson.class_style}';
// console.log(styles);

var styleArr = styles.split(',');
var content = '';
for (var i = 0; i < styleArr.length; i++) {
	content += '<div class="classStyles">' + styleArr[i] + '</div>&nbsp;&nbsp;&nbsp;';
	if (i == 5) {
		content += '</br></br>';
	}
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

$('#moreReview').click(function (){
	location.href = 'lessonReviewList.go?class_idx=${lesson.class_idx}';
});
$('#moreQnA').click(function (){
	location.href = 'lessonQnAList.go?class_idx=${lesson.class_idx}';
});
$('#lessonApplyButton').click(function (){
	var result = confirm("수강 신청하시겠습니까?");
	if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("강의 신청이 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
        location.href = 'lessonApply.do?class_idx=${lesson.class_idx}';
    }
});
$('#paymentGoButton').click(function (){
	location.href = 'lessonPayment.go?class_idx=${lesson.class_idx}';
});
$('#blindButton').click(function (){
	var result = confirm("강의 블라인드 하시겠습니까?");
	if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("강의 블라인드가 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
        location.href = 'lessonBlind.do?class_idx=${lesson.class_idx}';
    }
});
$('#unBlindButton').click(function (){
	var result = confirm("강의 블라인드 해제 하시겠습니까?");
	if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("강의 블라인드 해제가 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
        location.href = 'lessonUnBlind.do?class_idx=${lesson.class_idx}';
    }
});
$('#disableButton').click(function (){
	var result = confirm("강의 비활성화 하시겠습니까?");
	if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("강의 비활성화가 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
        location.href = 'lessonDisable.do?class_idx=${lesson.class_idx}';
    }
});
$('#unDisableButton').click(function (){
	var result = confirm("강의 비활성화 해제 하시겠습니까?");
	if (result) {
        // 사용자가 "예"를 선택한 경우
        alert("강의 비활성화 해제가 완료되었습니다.");
        // 여기에 작성 완료 후의 동작 추가 가능
        location.href = 'lessonUnDisable.do?class_idx=${lesson.class_idx}';
    }
});
$('#editButton').click(function (){
	location.href = 'lessonEdit.go?class_idx=${lesson.class_idx}';
});

$('#QnAWrite').click(function (){
	location.href = 'lessonQnAWrite.go?class_idx=${lesson.class_idx}';
});

</script>
</html>