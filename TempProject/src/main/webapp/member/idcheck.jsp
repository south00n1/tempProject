<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
	margin-top: 30px;
}

.row {
	width: 350px;
	margin: 0px auto;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){
	$('#okBtn').hide();
	$('#idBtn').on('click', function(){
		let id = $('#id').val() // 입력한값 가져온다
		if(id.trim() == "") {
			$('#id').focus;
			return
		}
		let idRegExp = /^[a-zA-z0-9]{4,8}$/;
		if (!idRegExp.test(id.trim())) {
            $('#result').html("<font color=red>아이디는 영문 대소문자와<br> 숫자 4~8자리로 입력해야합니다!</font>");
            $('#id').val("");
        	$('#id').focus;
        	return
        }
		
		
		$.ajax({
			type: 'post', // get, post
			url: '../member/idcheck_result.do', // Model을 거쳐야해 (MVC Model=자바파일을 거친다)
			data:{"id":id},
			// 실행된 JSP파일을 읽어온다 ==> 1. HTML, 2. JSON
			success:function(result){ // 콜백: 시스템에 의해 자동 호출
				let res = Number(result.trim()); // 정수형 변경
				if(res === 0) {
					$('#result').html('<font color=blue>'+id+"는(은) 사용 가능한 아이디입니다</font>");
					$('#okBtn').show();
				} else {
					$('#result').html('<font color=red>'+id+"는(은) 이미 사용중인 아이디입니다</font>");
					$('#okBtn').hide();
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.join_frm.id.value=$('#id').val(); // join.jsp에서 띄웠다
		parent.Shadowbox.close()
	})
})
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table text-center">
				<tr>
					<td>ID:<input type="text" name=id id=id size=15
						class="input-sm"> <input type="button" value="아이디중복체크"
						class="btn btn-sm btn-primary" id="idBtn">
					</td>
				</tr>
				<tr>
					<td><span id="result"></span></td>
				</tr>
				<tr>
					<td class="text-center"><input type="button" value="확인"
						class="btn btn-sm btn-success" id="okBtn"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>