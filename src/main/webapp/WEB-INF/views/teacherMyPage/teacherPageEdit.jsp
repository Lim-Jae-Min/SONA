<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정	</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
		
		/* 테이블 스타일 */
		.user-info-table {
		    width: 80%;
		}
		
		
		/* 테이블 셀 간 여백 */
		.spacer {
		    height: 20px;
		}
		
		/* 사용자 정보 셀 스타일 */
		.user-info-cell {
		    width: 119px; /* 예시로 너비를 20%로 설정합니다. */
    		text-align: center; /* 가운데 정렬 */
		}
		
		/* 아이콘 이미지 스타일 */
		.icon {
		    display: inline-block;
		    vertical-align: middle;
		}
		
		/* 사용자 정보 입력란 스타일 */
		.user-info {
		    display: flex; /* 내용을 수평으로 정렬 */
		    flex-direction: column; /* 내용을 세로로 정렬 */
		    text-align: left; /* 왼쪽정렬 */
  			margin-left: 23px;
		}
		
		/* 사용자 이름 입력란 스타일 */
		.user-name-input {
		    width: 253px;
			height: 49px;
			margin-top: 10px; /* 위쪽 여백 추가 */
		}
		
		/* 비밀번호 입력란 스타일 */
		.password-input {
		    width: 400px;
		    height: 50px;
		    font-size: 20px;
		}
		
		/* 입력 컨테이너 스타일 */
		.input-container {
		    width: 100%; /* 너비를 부모 요소에 맞게 설정 */
		    margin-top: 10px; /* 위쪽 여백 추가 */
		}
		
		/* 확인 버튼 스타일 */
		.confirm-button {
		    margin-left: 20px;
		}
		
		/* 휴지통 아이콘 스타일 */
		.trash {
		    font-size: small;
		    white-space: nowrap;
		}
		
		/* 이메일 입력란 스타일 */
		.email-input {
		    width: 400px;
		    height: 50px;
		    font-size: 20px;
		}
		
		/* 전화번호 입력란 스타일 */
		.phone-input {
		    width: 400px;
		    height: 50px;
		    font-size: 20px;
		}
		
		/* 계좌번호 입력란 스타일 */
		.account-number-input {
		    width: 400px;
		    height: 50px;
		    font-size: 20px;
		}
		
		/* 은행 선택 드롭다운 스타일 */
		.bank-select {
		    height: 30px;
		    width: 200px;
		    font-size: 20px;
		    margin-left: 0px;
		    margin-top: 10px;
		}
		
		/* 저장 버튼 스타일 */
		.save-button {
		    width: 200px;
		    height: 50px;
		    font-size: 16px;
		    background-color: #007bff; /* 파란색 배경 */
		    color: #fff; /* 흰색 텍스트 */
		    border: none; /* 테두리 없음 */
		    cursor: pointer; /* 마우스 커서 포인터로 변경 */
		    margin-top: 20px; /* 버튼 위 여백 추가 */
		    border-radius: 5px;
		    margin-left: 495px;
		}
		
		/* 프로필 사진 및 로고 스타일*/
		.profile {
			width: 150px;
			height: 150px;
		}																																								
		
		
		
		/* 비밀번호 입력란 스타일 */
		.password-input,
		.email-input,
		.phone-input,
		.account-number-input{
		    width: 900px; /* 너비를 부모 요소에 맞게 설정 */
		    height: 50px;
		    margin-top: 10px; /* 위쪽 여백 추가 */
		}
		
		
		.input-container {
		    position: relative; /* 상대 위치 설정 */
		    display: inline-block; /* 인라인 블록 요소로 설정하여 요소가 서로 겹치지 않도록 함 */
		}
		
		.confirm-button {
		    position: static;
		    width: 99px;
		    height: 45px;
		    margin-left: -107px;
		}
				
		#sidemenu {
		    background-color: #F0FAFF;
		    color: black;
		    padding: 10px;
		    text-align: center;
		    width: 200px;
		    height: 122vh;
		}
		
		.button{
			width:200px
		}
		
		
		/*모서리 스타일*/
		.user-name-input,
		.password-input,
		.email-input,
		.phone-input,
		.account-number-input,
		.bank-select,
		.confirm-button {
		    border-radius: 5px; /* 5px 만큼의 모서리를 둥글게 설정합니다. */
		}
		
		#imgUpload {
	        margin-left: 23px;
  			margin-top: 10px;
	    }
	    
	    .myPageImg{
	     width: 200px; 
	     height:200px; 
	     margin-left : 30px;
	     border-radius: 5px;
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
                <a href="teacherPage.go">마이페이지</a>
                <a href="teacherPageEdit.go">개인 정보 수정</a>
                <a href="teacherLessonList.go">강의 관리</a>
                <a href="teacherStudentList.go">수강생 관리</a>
                <a href="teacherQnaList.go">강의 Q&A 관리</a>
                <a href="teacherPointList.go">포인트 내역</a>
                <a href="teacherReceivedList.go">내가 받은 리뷰</a>
                <a href="teacherWrittenList.go">내가 작성한 리뷰</a>
            </div>
 		<!-- HTML 코드 -->
<div id="content">
    <form action="./teacherPage.edit" method="POST" enctype="multipart/form-data">
        <table class="user-info-table">
            <thead>
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
                <input type="hidden" name="photo_category" value="userInfo">
                    <td class="user-info-cell">
						<c:if test="${photos.size() < 1}">
	        				등록된 사진이 없습니다.
	        			</c:if>
	        			<c:forEach items="${photos}" var="photo">
	        				<img class="myPageImg" src="/photo/${photo.new_filename}">
	        			</c:forEach>
					</td>
					<td>
                        <div class="user-info">
                            <input type="text" name="user_name" value="${userInfo.user_name}" class="user-name-input"></br>
                            ${userInfo.user_id}
                        </div>
                        <div><input type="file" name="photos" multiple="multiple" id="imgUpload"/></div>
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
                    <td class="main" colspan="2">
                        <br>
                        새 비밀번호 
                        <span class="input-container">
                            <input type="password" value="" id="newPassword" class="password-input">
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
				    <td class="main" colspan="2">
				        <br>
				        비밀번호 확인 
				        <div class="input-container">
				            <input type="password" value="" id="user_pass" name="user_pass" class="password-input">
				            <button type="button" id="confirmation" onclick="confirmPw()" class="confirm-button">확인</button>
				        </div>
				    </td>
				</tr>
                <tr>
                    <td class="trash" colspan="2">비밀번호는 8자 이상 포함되어야 합니다.</td>
                </tr>
                <tr>
                    <td class="trash" colspan="2">비밀번호는 영문자, 숫자, 특수문자가 최소 1개 이상 포함되어 있어야합니다.</td>
                </tr>
                <tr>
                    <td class="main" colspan="2">
                        <br>
                        이메일 
                        <span class="input-container">
                            <input type="text" value="${userInfo.user_email}" name="user_email" class="email-input">
                        </span>
                    </td>
                </tr>            
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
                    <td class="main" colspan="2">
                        <br>
                        전화번호 
                        <span class="input-container">
                            <input type="text" value="${userInfo.user_phone}" name="user_phone" class="phone-input">
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
                    <td class="main" colspan="2">
                        <br>
                        계좌번호 
                        <span class="input-container">
                            <input type="text" value="${userInfo.user_accountnumber}" name="user_accountnumber" class="account-number-input">
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="spacer"></td>
                </tr>
                <tr>
                    <td class="main" colspan="2">
                        </br>
                        은행 
                        </br>
                        <select name="user_bank" id="user_bank" class="bank-select">
                            <option value="국민은행">국민은행</option>
                            <option value="신한은행">신한은행</option>
                            <option value="우리은행">우리은행</option>
                            <option value="하나은행">하나은행</option>
                            <option value="기업은행">기업은행</option>
                            <option value="농협은행">농협은행</option>
                            <option value="카카오뱅크">카카오뱅크</option>
                        </select>
                        <button type="button" onclick="teacherEditConfirmation()" class="save-button">정보 수정</button>
                    </td>
                </tr>
            </tbody>
        </table>
        
    </form>
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





var overChk = false;



function confirmPw() {
    var newPassword = $('#newPassword').val();
    var user_pass = $('#user_pass').val();

    if (newPassword !== user_pass) {
        alert('입력하신 비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
        $('#user_pass').val('');
    } else {
        $.ajax({
            type:'POST',
        	url:'./confirmPw.ajax',
            data:{'newPassword':newPassword, 'user_pass':user_pass},
            success: function(response) {
                if (response) {
                    alert('비밀번호가 일치합니다.');
                    overChk= true;
                } else {
                    alert('입력하신 비밀번호가 일치하지 않습니다. 다시 확인해주세요.');
                    $('#user_pass').val('');
                }
            },
            error: function(request, status, error) {
                alert('서버와의 통신 중 문제가 발생했습니다. 다시 시도해주세요.');
                console.log("code: " + request.status)
                console.log("message: " + request.responseText)
                console.log("error: " + error);
                   overChk= true;

            }
        });
    }
}



function teacherEditConfirmation() {
    // 확인 창 표시
    var confirmation = confirm("정말로 수정하시겠습니까?");
    if (confirmation) {
        // 사용자가 확인을 선택한 경우
        teacherEdit(); // 정보 수정 함수 호출
    } else {
        // 사용자가 취소를 선택한 경우
        // 아무 동작도 수행하지 않음
    }
}


function teacherEdit() {
    var $name = $('input[name="user_name"]');
    var $pw = $('input[name="user_pass]');
    var $email = $('input[name="user_email"]');
    var $phoneNumber = $('input[name="user_phone"]');
    var $accountNumber = $('input[name="user_accountnumber"]');
    var $bank = $('select[name="user_bank"]');
   
   
    if (overChk == false) {
        alert('비밀번호 확인을 해주세요');
        $pw.focus();
    } else if ($name.val() == '') {
        alert('이름을 입력해주세요.');
        $name.focus();
    } else if ($pw.val() == '') {
        alert('비밀번호를 입력해주세요');
        $pw.focus();
    } else if ($email.val() == '') {
        alert('이메일을 입력해주세요');
        $email.focus();
    } else if ($phoneNumber.val() == '') {
        alert('전화번호를 입력해주세요');
        $phoneNumber.focus();
    } else if ($accountNumber.val() == '') {
        alert('계좌번호를 입력해주세요');
        $accountNumber.focus();
    } else if ($bank.val() == '') {
        alert('은행을 선택해주세요');
        $bank.focus();
    }  else {
        // 전화번호가 숫자만 포함하는지 확인
        var accountNumberValue = $accountNumber.val();
        var regExp = /^[0-9]+$/;
        if (!regExp.test(accountNumberValue)) {
            alert('계좌번호는 숫자만 입력해 주세요!');
            $accountNumber.val('');
            $accountNumber.focus();
            return false;
        }

        // 폼을 직접 제출
        $('form').submit();
    }
}

$('.alarm').click(function alarmList() {
	   location.href = 'alarmList.go';
	});



$('#logo').click(function main(){
	if ('${sessionScope.user_type}' == '관리자') {
		location.href = 'adminMain.go';
	}else {
		location.href = '/';	
	}
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
	
</script>
</html>