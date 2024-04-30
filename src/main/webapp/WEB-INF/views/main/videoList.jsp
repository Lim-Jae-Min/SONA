<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after"
	type="text/css">
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
.des{
	position: relative;
 	margin-left: 110px;
 	top: 60px;
  	color:#999;
 	font-size: 14px;
}
.container {
	display: flex;
	justify-content: center; /* 가로 방향 중앙 정렬 */
	align-items: center; /* 세로 방향 중앙 정렬 */
	text-align: center;
	margin-top: 20px;
}
.heart {
	color: red; /* 원하는 색상 코드로 변경하세요 */
	font-weight: bold;
}
.button-container.videoList1 button {
	background-color: #6FA4FF;
	color: white;
	font-size: 18px; /* 폰트 크기 조정 */
	padding: 12px 24px; /* 버튼 크기 조정 */
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}
.video-wrapper {
	display: inline-block;
	position: relative;
	border-radius: 15px;
	overflow: hidden;
	margin-right: 5px; /* 각 동영상 간 간격 조정 */
	text-align: center;
	margin-top: 20px;
	margin-left: 100px; /* 동영상 컨테이너 간 간격 조정 */
}

.video-container {
	width: 300px;
	height: 300px;
	background-color: #BEE6FF;
	/* 오른쪽 상단 모서리의 테두리 */
	/* 오른쪽 상단 모서리 둥근 정도 조정 */
	border-bottom-left-radius: 15px; /* 테두리 둥근 정도 조정 */
	padding: 20px;
	text-align: center;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	border-radius: 15px;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #BEE6FF;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 800px;
	text-align: center;
	border-radius: 15px;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
<body>
	<header id="usermain">
		<table id="mainmenu">
			<tr>
				<th class="menu"><img src="resources/img/logo.png" id="logo"></th>
				<th class="menu"><c:if test="${sessionScope.loginId eq null}">
						<c:if test="${sessionScope.user_type ne '강사'}">
							<a href="login.go">추천 강의</a>
						</c:if>
					</c:if> <c:if test="${sessionScope.loginId ne null}">
						<c:if test="${sessionScope.user_type ne '강사'}">
							<a href="recommendList.go">추천 강의</a>
						</c:if>
					</c:if></th>
				<th class="menu"><a href="allList.go">전체 강의</a></th>
				<th class="menu"><a href="serviceCenter.go">고객센터</a></th>
			</tr>
		</table>
		<table id="mymenu">
			<c:if test="${sessionScope.loginId ne null}">
				<tr>
					<c:if test="${sessionScope.alarm_count > 0}">
						<th><img src="resources/img/alarm_on.png"
							class="miniimg alarm"></th>
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
	
	<p class="des">하늘색 박스를 클릭하면 크게 볼 수 있습니다.</p>

	<br/><br/>
	<table>
	<thead></thead>
	<tbody id="list"></tbody>
				<tr>
					<td colspan="7" id="paging">
						<div class="container">
							<nav aria-label="Page navigation" style="text-align: center">
								<ul class="pagination" id="pagination"></ul>
							</nav>
						</div>
					</td>
				</tr>
			</table>

<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<iframe id="videoFrame" width="560" height="315" frameborder="0"
				allowfullscreen></iframe>
			<br />
			<br />
			<div class="button-container videoList1">
				<button id="viewLectureBtn">해당 영상 강의보기</button>
			</div>
		</div>
	</div>
	


	<br/><br/>
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
				<td colspan="2">${sessionScope.user_name}회원님</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td class="manner">♥ ${sessionScope.manner_variance}</td>
			</tr>
		</table>
		<br />
		<div>
			보유 포인트 : <span>${sessionScope.point}</span>
		</div>
		<br />
		<div>
			<c:if test="${sessionScope.user_type eq '수강생'}">
				<a href="studentWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
			<c:if test="${sessionScope.user_type eq '강사'}">
				<a href="teacherWrittenList.go">내가 쓴 리뷰</a>
			</c:if>
		</div>
		<br />
		<div>
			<a href="studentPage.do">마이페이지</a>
		</div>
		<br />
		<br />
		<br />
		<div>
			<a href="logout.do">로그아웃</a>
		</div>
	</div>

	<a href="apply.go">강의신청 test</a>
	</br>
	<a href="userdetail.go?user_id=user2">회원 상세보기</a>
</body>

<script>
var showPage =1;
var userId = "${sessionScope.loginId}";

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page, userId){
    $.ajax({
       type:'get',
       url:'./videoList.ajax',
       data:{
          'page':page,
          'cnt':8,
          'userId':'${sessionScope.loginId}'
       },
       dataType:'json',
       success:function(data){
          drawList(data.list);
          console.log(data);
          //플러그인 추가
          var startPage = data.currPage > data.totalPages? data.totalPages : data.currPage;
          console.log('정민호');
          $('#pagination').twbsPagination({
        	  startPage:startPage, //시작페이지
        	  totalPages:data.totalPages, //총 페이지 갯수
        	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
         	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
        		  console.log(evt); // 이벤트 객체
        		  console.log(pg); //클릭한 페이지 번호
        		  showPage = pg;
        		  listCall(pg, userId);
        	  }
        	  
          });
          
       },
       error:function(error){
          console.log(error)
       }
    });
}

function drawList(list){
	var content = '';
	 for(item of list){
	        console.log(item);
	        content += '<div class="video-wrapper" data-class-idx="' + item.class_idx + '">';
	        content += '<div class="video-container">';
	        content += '<iframe width="300" height="200" src="' + item.video_url + '" frameborder="0" allowfullscreen></iframe>';
	        content += '<br />';
	        content += '<br />' + item.teacher_id + ' 선생님 <br />';
	        content += '<br /><span class="heart">♥</span>' + item.manner_score + ' <input type="hidden" name="class_idx" value="' + item.class_idx + '" />';
	        content += '</div>';
	        content += '</div>';
	     }
	 $('#list').html(content);
	
	 $('.video-wrapper').click(function() {
	        // 해당 video-wrapper의 class_idx 가져오기
	        var classIdx = $(this).data('class-idx');
	        var videoUrl = $(this).find('iframe').attr('src');
	        console.log(classIdx);
	        // 해당 강의 보기 버튼 클릭 시 이벤트 처리
	        $('#viewLectureBtn').click(function() {
	            // 가져온 class_idx를 사용하여 링크를 생성하고 이동
	            window.location.href = "./lessonDetail.go?class_idx=" + classIdx;
	        });
	        // 모달 열기
	        openModal(videoUrl);
	    });

	    // 모달 열기
	    function openModal(videoUrl) {
	        var modal = document.getElementById("modal");
	        var videoFrame = document.getElementById("videoFrame");
	        videoFrame.src = videoUrl; // 동영상 URL 설정
	        modal.style.display = "block";
	    }
	    
	    // 모달 닫기 버튼 클릭 시 모달 닫기
	    $('.close').click(function() {
	        closeModal();
	    });

	    // 모달 영역 외의 다른 곳 클릭 시 모달 닫기
	    window.onclick = function(event) {
	        var modal = document.getElementById("modal");
	        if (event.target == modal) {
	            closeModal();
	        }
	    };

	    // 모달 닫기
	    function closeModal() {
	        var modal = document.getElementById("modal");
	        modal.style.display = "none";
	    }
	
}


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

$('.alarm').click(function alarmList() {
	location.href = 'alarmList.go';
});

</script>
</html>