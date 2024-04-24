<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"> </script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style> 
	#showlist {
		position : relative;
	    border-collapse: collapse;
	    width: 100%; /* 테이블 셀 경계를 병합하여 구분선이 하나만 나타나도록 설정 */
		max-width: 800px;
	}
	
	#showList th, #showList td {
	    border: 1px solid #dddddd; /* 셀 테두리 색상 설정 */
	    padding: 8px; /* 셀 내부 여백 설정 */
	    text-align: left; /* 텍스트를 왼쪽 정렬 */
	}
	
	#showList tr:nth-child(even) {
	    background-color: #f2f2f2; /* 짝수 행 배경색 설정 */

	}
	
	#showList th {
	    background-color: #dddddd; /* 헤더 배경색 설정 */
	    color: #333333; /* 헤더 텍스트 색상 설정 */
	}
	#divvv{
		display: flex;
		left: -400px;
		width: 500px;
	}
	.nidx{
		width: 30px;
	}
	.nid{
		width: 100px;
	}
	.nbhit{
		width: 50px;
	}
	.ndate{
		width: 100px;
	}
	.ntitle{
		width: 100px;	
	}
	.nchb{
		width: 100px;
	}
	#container{
		max-width: 600px;
	}
</style>
</head>
<body>
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
            <c:if test="${loginName != null}">
                <tr>
                    <c:if test="${alarmCount > 0}">
                        <th><img src="resources/img/alarm_on.png" class="miniimg"></th>
                    </c:if>
                    <c:if test="${alarmCount == 0}">
                        <th><img src="resources/img/alarm.png" class="miniimg"></th>
                    </c:if>
                    <th><img src="resources/img/basic_user.png" class="miniimg"></th>
                    <th><div>${loginName}</div></th>
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
    
    <div id = "divvv">
    <div id="wrapper">
            <div id="adminside">
                <h3>관리자 페이지</h3>
                <hr/>
                <a href="#">관리자 페이지</a>
                <a href="#">회원 관리</a>
                <a href="#">강의 관리</a>
                <a href="#">공지사항 관리</a>
                <a href="#">faq 관리</a>
                <a href="#">건의사항 관리</a>
                <a href="#">리뷰 관리</a>
                <a href="#">신고 관리</a>
                <a href="#">회원 정지 이력</a>
            </div>
            <div id="content">
                ${msg}
            </div>
        </div>
        
     	<div>    	  
	     	<h3>공지사항 리스트 </h3> 
	     	<!-- 검색기능  -->
	     	<select id="searchType">
			  <option value="title">제목</option>
			  <option value="content">내용</option>
			</select>
	     	<input type="text" name = "searchText">
	     	<button type="button" onclick="noticeSearch()">검색하기</button>
	     	<!-- 검색기능 끝 -->
		   <table id ="showlist">
		   	<thead>
		      <tr class="listhead">
		         <th class="nchb"><input type="checkbox" id="all"/></th>
		         <th class="nidx">글번호</th>
		         <th class="ntitle">제목</th>
		         <th class="nid">작성자</th>
		         <th class="ndate">날짜</th>
		         <th class="nbhit">조회수</th>
		        
		      </tr>
		     </thead>
		     <tbody id="list" class="listhead"></tbody>
				<tr>
					<td colspan="7" id = "paging">
						<div class="container">                           
		               		<nav aria-label="page navigation" style="text-align:center">
		                 	 <ul class="pagination" id="pagination"></ul>
		               		</nav> 
		               		<hr>              
		            	</div>
					</td>
				</tr>
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

</body>
<script>

	var showPage =1;
	var searchRemain = false;
	
	$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
		listCall(showPage);
	});

	$('#pagePerNum').on('change',function(){
		//페이지당 보여줄 게시물의 숫자를 변경하면 전체 페이지 수의 변화가 생기므로
		// 페이징 처리 객체를 파괴하고 다시 만들도록 해야 한다.
		
		$('#[pagination]').twbsPagination('destroy');
		if(searchRemain){
			noticeSearch(showPage);
		}else{
			listCall(showPage);
			
		}
	});
	
	function remainSearch(){
		var searchType = $('select[id="searchType"]').val();
		var serachText = $('input[name="searchText"]').val();
	}
	
	function noticeSearch(showpage,serachText,searchType){
		var searchType = $('select[id="searchType"]').val();
		var serachText = $('input[name="searchText"]').val();
		searchRemain = true;
		console.log(searchType);
		console.log(serachText);
		
		
		$.ajax({
		       type:'get',
		       url:'noticeManagementlist.ajax',
		       data:{
		    	   'page':showPage,
		    	   'searchType':searchType,
		    	   'serachText':serachText
		       },
		       dataType:'json',
		       success:function(data){
		          drawList(data.list);
		          
		          
		       // 플러그인 추가
		       	$('#pagination').twbsPagination({
		    		startPage:data.currPage, // 시작 페이지
		    		totalPages:data.totalPages, // 총 페이지 갯수
		    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
		    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
		    			console.log(evt); // 이벤트 객체
		    			console.log(pg); //클릭한 페이지 번호 의미
		        		showPage = pg;
		        		noticeSearch(pg,data.serachText,data.searchType);
		    			
		    		}
		       	});
		       
		       },
		       error:function(error){
		          console.log(error)
		       }
		    });
		
		
	}
	
	
	
	
	
	
	
	
	function listCall(page){
	    $.ajax({
	       type:'get',
	       url:'noticeManagementlist.ajax',
	       data:{
	    	   'page':page,
	    	
	       },
	       dataType:'json',
	       success:function(data){
	          drawList(data.list);
	          
	          
	       // 플러그인 추가
	       	$('#pagination').twbsPagination({
	    		startPage:data.currPage, // 시작 페이지
	    		totalPages:data.totalPages, // 총 페이지 갯수
	    		visiblePages:5,  // 보여줄 페이지 수[1][2][3][4][5]
	    		onPageClick:function(evt,pg){ // 페이지 클릭시 실행 함수
	    			console.log(evt); // 이벤트 객체
	    			console.log(pg); //클릭한 페이지 번호 의미
	        		showPage = pg;
	        		listCall(pg);
	    			
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
		    content += '<tr>';
		    content += '<td class="nchb"><input type="checkbox" name="del" value="' + item.notice_idx +'"/></td>';
		    content += '<td class="nidx">' + item.notice_idx + '</td>';
		    content += '<td class="ntitle"><a href="게시물_페이지_주소?idx=' + item.notice_idx + '">' + item.notice_title + '</a></td>'
		    content += '<td class="nid">' + item.admin_id + '</td>';
		    
		    //java.sql.Date 는 javascript에서는 밀리세컨드로 변환하여 표시한다.
		    //방법 1. Back-end : DTO의 반환 날짜 타입을 문자열로 변경 (서버를 껐다 켜야하니 웬만하면 프론트에서 해야햄)
		    //content += '<td>' + item.reg_date + '</td>';
		    //방법 2. Front-end : js에서 직접 변환
		    var date = new Date(item.notice_reg_date);
		    var dateStr = date.toLocaleDateString("ko-KR"); //en-US
		    content += '<td class="ndate">' + dateStr + '</td>';
		    
		    content += '<td class="nbhit">' + item.notice_bhit +'</td>';

		    content += '</tr>';

	 	}
	 
	 	$('#list').html(content);
	}

	function del() {
		var delArr = [];
	    $("input[name='del']").each(function(index, item) {
	      	if ($(item).is(":checked")) {
			var val = $(this).val();
	        console.log(val);
	        delArr.push(val);
	      }
	   });
	     $.ajax({
	         type:'post' // method 방식
	         ,url:'./del.ajax' // 요청할 주소 // 파라미터 
	         ,data:{delList:delArr}
	         ,dataType:'json' // 기본 데이터 타입은 JSON 이다
	         ,success:function(data){
	         	if(data.cnt>0){
	           		alert('선택하신'+data.cnt+'개의 클이 삭제되었습니다.');
	            	$('#list').empty();
	            	listCall();
	            }
	        	console.log(data);
	         } 
	         ,error:function(error){ // 통신 실패한 경우
	         	console.log(error);
	         }
	     });
	}

	$('#all').on('click',function(){
		var $chk = $('input[name="del"]');
		// attr : 정적 속성 : 처음부터 그려져 있거나 JSP에서 그린 내용
		// prop : 동적 속성 : 자바스크렙트로 나중에 그려진 내용 ※ 초보자들 시점 문제가 큼 : 
		// -> 렛갈림 시행 할려는 내용이 그려지는것보다 먼저면 attr 사용하면 안됨  
		if($(this).is(":checked")){
			$chk.attr('checked',true);	
		}else{
			$chk.attr('checked',false);
		}
		
	});
</script>
</html>