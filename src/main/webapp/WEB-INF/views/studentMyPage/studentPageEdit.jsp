<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
		#edit{
		font-weight: bold;
		}
		
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
		<form action="./studentPage.edit" method="POST"  enctype="multipart/form-data">
            <table style="width: 100%;">           
                <thead>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
						<input type="hidden" name="photo_category" value="userInfo">
					    <c:choose>
					        <c:when test="${empty userInfo.new_filename}">
					            <td colspan="1" id="imgRow" style="width: 15%; height: 20%; margin-right: 50px;">
					                등록된 사진이 없습니다.
					            </td>
					        </c:when>
					        <c:otherwise>
					            <td colspan="1" id="imgRow" style="width: 15%; height: 20%; margin-right: 50px;">
					                <img class="myPageImg" style="width: 200px; height: 200px;" src="/photo/${userInfo.new_filename}">
					            </td>
					        </c:otherwise>
					    </c:choose>
	        			
	        			
 	        			<td colspan="1">
	        				<input type="file" name="photos" id="imgUpload"/>
	        			</td>  	        			
	        			
	                   
	        		</td>
	        		</tr>
					<tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
	        		<tr>

                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이름
                           <span class="contents" style="margin-left: 61px; width: 200px; display: inline-block;">

                      <input type="text" name="user_name" value="${userInfo.user_name}"  style="margin-left: 86px; display: block; width: 550px; height: 45px; font-size:20px">
                   </td>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;새 비밀번호 
                            <span class="contents" style="margin-left: 61px; width: 200px; display: inline-block;">
                            <input type="password" value="${userInfo.user_pass}" id="newPassword" style="margin-left: 26px; display: block; width: 550px; height: 45px; font-size:20px">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인 
                            <span class="contents" style="margin-left: 42px; width: 200px; display: inline-block;">
                            <input type="password" value="${userInfo.user_pass}" id="user_pass" name="user_pass" style="margin-left: 26px; display: block; width: 550px; height: 45px; font-size:20px">
                            </span>
							<button type = "button" id="confirmation" onclick="confirmPw()" style="margin-left: 390px; width : 50px; height : 35px;">확인</button>
                        </td>
                    </tr>
            
                    <tr>
                        <td class="trash" style="font-size: small; white-space: nowrap;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호는 8자 이상 포함되어야 합니다.
                        </td>
                    </tr>
                    <tr>
                        <td class="trash" style="font-size: small; white-space: nowrap;">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호는 영문자, 숫자, 특수문자가 최소 1개이상 포함되어 있어야합니다.
                        </td>
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 50%; text-align: left;">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 
                            <span class="contents" style="margin-left: 109px; width: 200px; display: inline-block;">
                            <input type="text" value="${userInfo.user_email}" name="user_email" style="margin-left: 24px; display: block; width: 550px; height: 45px; font-size:20px">
                            </span>
                        </td>
                    </tr>            
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화번호 
                            <span class="contents" style="margin-left: 89px; width: 200px; display: inline-block;">
                            <input type="text" value="${userInfo.user_phone}" name="user_phone" style="margin-left: 24px; display: block; width: 550px; height: 45px; font-size:20px">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 20px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    <tr>
                        <td class="main" colspan="2" style="width: 100%; text-align: left;">
                        
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계좌번호 
                            <span class="contents" style="margin-left: 89px; width: 200px; display: inline-block;">
                            <input type="text" value="${userInfo.user_accountnumber}" name="user_accountnumber" style="margin-left: 25px; display: block; width: 550px; height: 45px; font-size:20px">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>
                    
                    
                    <tr>
                        <td class="main" colspan="2" style="width: 50%; margin-left: 50px; text-align: left; margin-top : 53px; height : 60px;">
                  		    <span style = "margin-top : 30px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;은행 </span>&nbsp;&nbsp;&nbsp;
                    		<select style="height : 30px; width : 450px; margin-left : 133px; margin-top : 10px; font-size :18px;"name="user_bank" id="user_bank" style="margin-left: 24px; display: block; width: 550px; height: 45px; font-size:20px">
		                        <option value="국민은행">국민은행</option>
		                        <option value="신한은행">신한은행</option>
		                        <option value="우리은행">우리은행</option>
		                        <option value="하나은행">하나은행</option>
		                        <option value="기업은행">기업은행</option>
		                        <option value="농협은행">농협은행</option>
		                        <option value="카카오뱅크">카카오뱅크</option>
                     		</select>
                       </td>
                    </tr>
                    <tr>   
                       <td style="text-align : right; margin-right : 400px;">
							<button style=" width : 80px; text-align : center; background-color:skyblue; margin-right : 400px;" type="button" onclick="studentEdit()">정보 수정</button>
                       </td>
                    </tr>
                    
                    <tr>
                        <td colspan="2" style="height: 30px;"></td> <!-- 줄바꿈을 위한 빈 셀 추가 -->
                    </tr>                   
                  
                    	
                           
                </tbody>
            </form>
              		<table>
					    <tr>
					        <td>
								<a href="./studentPageApplyEdit.go" id = "edit">수강신청서 수정</a>
					        </td>
					    </tr>
					</table>
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


	$('#logo').click(function main(){
			   if ('${sessionScope.user_type}' == '관리자') {
			      location.href = 'adminMain.go';
			   }else {
			      location.href = '/main';   
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
	
	function studentEdit() {
	    var $name = $('input[name="user_name"]');
	    var $pw = $('input[name="user_pass"]');
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
	    } else {
	        // 전화번호가 숫자만 포함하는지 확인
	        var accountNumberValue = $accountNumber.val();
	        var regExp = /^[0-9]+$/;
	        if (!regExp.test(accountNumberValue)) {
	            alert('계좌번호는 숫자만 입력해 주세요!');
	            $accountNumber.val('');
	            $accountNumber.focus();
	            return false;
	        }

	        // 수정 확인 알림 표시
	        if (confirm('정보를 수정하시겠습니까?')) {
	            // 확인을 선택한 경우 폼을 제출합니다.
	            $('form').submit(); // 폼 제출
	        } else {
	            // 취소를 선택한 경우 아무 작업도 수행하지 않습니다.
	            // 사용자가 취소를 선택하면 아무런 동작도 하지 않습니다.
	        }
	    }
	}

	// Add a button to trigger the edit
	$(document).ready(function() {
	    $('body').append('<button onclick="studentEdit()">수정하시겠습니까?</button>');
	});

</script>
</html>