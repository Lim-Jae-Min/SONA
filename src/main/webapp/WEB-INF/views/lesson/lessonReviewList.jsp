<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="resources/css/common.css?after" type="text/css">
<style>
</style>
</head>
<body>
	<%@ include file="layout/header.jsp" %>
	<%@ include file="layout/lessonheader.jsp" %>
	<div style="text-align: center;">
    <div style="display: inline-block; border: 2px solid #BEE6FF; border-radius: 15px; padding: 10px;">
        <img src="resources/img/review.png" id="review">강의 리뷰
        <table style="border-collapse: collapse; width: 100%;">
            <thead>
                <tr>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">만족도</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">리뷰 제목</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성자</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">수강 기간</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">사진</th>
                    <th style="border-bottom: 2px solid #BEE6FF; padding: 8px;">작성일자</th>
                </tr>
            </thead>
            <tbody id="list"></tbody>
            <tr>
                <td colspan="7" id="paging">
                    <div class="container">
                        <nav aria-label="Page navigation" style="text-align:center">
                            <ul class="pagination" id="pagination"></ul>
                        </nav>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
	
	<%@ include file="layout/footer.jsp" %>
</body>
<script>
var showPage = 1;

$(document).ready(function(){ // html 문서가 모두 읽히면 되면(준비되면) 다음 내용을 실행 해라
	listCall(showPage);
});

function listCall(page){
    $.ajax({
       type:'get',
       url:'./list.ajax',
       data:{
          'page':page,
          'cnt': 5
       },
       dataType:'json',
       success:function(data){
          drawList(data.list);
          console.log(data);
			
          $('#pagination').twbsPagination({
        	  startPage:startPage, //시작페이지
        	  totalPages:data.totalPages, //총 페이지 갯수
        	  visiblePages:5, //보여줄 페이지 수 [1][2][3][4][5]
         	  onPageClick:function(evt, pg){//페이지 클릭시 실행 함수
        		  console.log(evt); // 이벤트 객체
        		  console.log(pg); //클릭한 페이지 번호
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
	    content += '<td>' + item.score + '</td>';
	    content += '<td>' + item.subject + '</td>';
	    content += '<td>' + item.user_name + '</td>';
	    content += '<td>' + item.study_date +'</td>';
	    content += '<td>';
	    var img = item.img_cnt > 0 ?'image.png' : 'no_image.png';
	    content += '<img class="icon" src="resources/img/' + img + '"/>';
	    content += '</td>';
	    //java.sql.Date 는 javascript에서는 밀리세컨드로 변환하여 표시한다.
	    //방법 1. Back-end : DTO의 반환 날짜 타입을 문자열로 변경 (서버를 껐다 켜야하니 웬만하면 프론트에서 해야햄)
	    //content += '<td>' + item.reg_date + '</td>';
	    //방법 2. Front-end : js에서 직접 변환
	    var date = new Date(item.reg_date);
	    var dateStr = date.toLocaleDateString("ko-KR"); //en-US
	    content += '<td>' + dateStr + '</td>';
	    content += '</tr>';
	 }
	 
	 $('#list').html(content);
	 
	}



</script>
</html>