<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<style type="text/css">
body{
  font-family: 'Open Sans', sans-serif;
  background:white;
  margin: 0 auto 0 auto;
  width:100%; 
  text-align:center;
  margin: 40px 0px 0px 0px;
  font-size:14px;
}

p{
  font-size:12px;
  text-decoration: none;
  color:#ffffff;
}

h1{
  font-size:1.5em;
  color:#525252;
}

.box{
  background:white;
  width:300px;
  border-radius:6px;
  margin: 0 auto 0 auto;
  padding:0px;
  border: none; 
}

.email{
  background:#ecf0f1;
  border: #ccc 1px solid;
  box-sizing: border-box;
  border-bottom: #ccc 2px solid;
  padding: 8px;
  width:250px;
  color:#AAAAAA;
  margin-top:10px;
  font-size:1em;
  border-radius:4px;
}

.password{
  border-radius:4px;
  background:#ecf0f1;
  border: #ccc 1px solid;
  padding: 8px;
  width:250px;
  font-size:1em;
}

.btn{
  background:#27375C;
  width:250px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27375C 1px solid;
  
  margin-top:15px;
  margin-bottom:20px;
  margin-left: 25px;
  float:left;
  font-weight:800;
  font-size:0.8em;
}

.btn:hover{
  background:#27375C;
  opacity: 0.8;
}

#btn2{
  background:#27375C;
  width:250px;
  padding-top:5px;
  padding-bottom:5px;
  color:white;
  border-radius:4px;
  border: #27375C 1px solid;
  
  margin-top:15px;
  margin-bottom:20px;
  margin-left: 25px;
  float:left;
  font-weight:800;
  font-size:0.8em;
}

#btn2:hover{ 
background:#27375C;
opacity: 0.8;
}
    * {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#ok-btn').hide();
	
	$('#id-find-btn').click(function(){
		let name = $('#name').val();
		if(name.trim() == "") {
			$('#name').focus();
			return;
		}
		
		let id = $('#id').val();
		if(id.trim() == "") {
			$('#id').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../member/pwfind_result.do',
			data:{"name":name, "id":id},
			success: function(result) {
				let res = result.trim();
				if (res == 'no') {
					$('#pwd-find-result').html('<font color=red>해당 정보로 계정이 존재하지 않습니다.</font>');
				} else {
					$.ajax({
                        type : 'post',
                        url : '../member/pwfind2.do',
                        data : {
                        	"id" : id,
                        	"question" : result
                        },
                        success : function(result2) {
                        	$('#pwd-find-result').html(result2);
                        }
                    })
				$('#id-find-btn').hide();
				}
			}
		})
		$('#ok-btn').click(function(){
			parent.Shadowbox.close();
		})
	})
})

</script>
</head>
<body>

<div class="box">
<h1>비밀번호 찾기</h1>

<input type="text" id="name" placeholder="이름을 입력해주세요"  class="email" />
<input type="id" id="id" placeholder="아이디를 입력해주세요" class="email" />
 
<br>
<span id="pwd-find-result"></span>
<a href="#" id=id-find-btn><div class="btn">비밀번호 찾기</div></a> <!-- End Btn -->
<a href="#" id=ok-btn><div id="btn2">확인</div></a> <!-- End Btn2 -->
  
</div>
  
</body>
</html>