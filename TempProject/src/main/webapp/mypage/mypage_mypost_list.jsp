<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.post_delBtn').hover(function(){
		$(this).css('cursor', 'pointer')
	})
	
	$('.post_delBtn').click(function(){
		let no = $(this).attr('data-no')
		$.ajax({
			type:'post',
			url:'../mypage/mypage_mypost_delete.do',
			data:{"no": no},
			success:function(response){
				$('.mypage_home_div').html(response)
			}
		})
	})	
})
</script>
<style type="text/css">
.mypage_home_title {
	margin: 0px;
	margin-bottom: 10px;
	padding-bottom: 15px;
	border-bottom: 2px solid #E2E2E2;
}
.mypage_home_content {
	margin: 0px;
}
.mypage_home_subtitle {
	color: #27375C;
}
.rst {
	width:70px;
	hiegh:30px;
	color: #fff;
	border-radius: 5px;
	font-size: 15px;
	padding: 5px 7px;;
}
</style>
</head>
<body>
		<div class="col-11 mypage_home_title">
			<h4 class="mypage_home_subtitle">내가 쓴 게시글</h4>
		</div>
		<div class="col-11 mypage_home_content">
			<table class="table">
				<tr>
					<th width="10%" class="text-center">no</th>
					<th width="40%" class="text-center">제목</th>
					<th width="10%" class="text-center">작성자</th>
					<th width="10%" class="text-center">작성일</th>
					<th width="10%" class="text-center">조회</th>
					<th width="20%" class="text-center">삭제여부</th>
				</tr>
				<c:forEach var="vo" items="${list }">
				<tr style="vertical-align: middle;">
					<td width="10%" class="text-center" >${vo.no }</td>
					<td width="40%" class="text-center">${vo.subject }</td>
					<td width="10%" class="text-center">${vo.name }</td>
					<td width="10%" class="text-center">${vo.regdate }</td>
					<td width="10%" class="text-center">${vo.hit }</td>
					<td width="20%" class="text-center">
						<span data-no="${vo.no }" class="rst post_delBtn" style="background-color: gray;">삭제</span>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html>