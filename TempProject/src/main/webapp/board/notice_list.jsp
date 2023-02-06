<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GO OUT DISPLAY</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="../img/favicon.ico" rel="icon">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/animate/animate.min.css" rel="stylesheet">
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
</script>
    
</head>
<body>

<!-- ### -->
	<div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">공지사항</h1>
                    
	<div>
		<h5 style="color: white">GOD 공지사항입니다. 서비스와 관련된 모든 공지사항을 전달해드립니다.</h5>
    	<div style="height: 10px"></div>
		  <form method=post action="../board/notice_list.do" id=ss_frm>
			<input type=text id="search" name=ss value="${ss }" size=30 placeholder="검색어를 입력하세요" style="border-radius: 20px;border: none"/>
			<button type=submit id="sBtn" style="border: none;background: none;color: white;"><i class="fa fa-search"></i></button>
		  </form>
    </div>
    <div style="height: 10px"></div>
    <div style="height: 30px"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- ### -->

<!-- 게시판 start -->

<div class="wrapper row3">
 <main class="container clear">


  
  <div style="height: 5px"></div>
  <hr>
  <div style="height: 20px"></div>
  
  <!--  
  <div>
  	<table class="pull-right">
	<tr>
	<td><select name="notice_type" id="notice_type">
			<option value="0">전체</option>
			<option value="1">서비스소식</option>
			<option value="2">서비스오픈</option>
			<option value="3">서비스종료</option>
			<option value="4">서비스점검</option>
			<option value="5">안내</option>
	</select></td>
	</tr>
	</table>
  </div>
  -->
  <div style="height: 10px;"></div>
  
  <div class="notice_find" style="height: auto;">
  <table class="table">
    <tr>
      <th width=10% class="text-center">NO.</th>
      <th width=20% class="text-center">분류</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">등록일</th>
      <th width=10% class="text-center">조회</th>
    </tr>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.gnbno}</td><%-- vo.getNo() = {} getXxx() --%>
        <td width="20%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.prefix}</td>
        <td width="45%" height="50px" style="vertical-align: middle;" class="notice-table" >
         <a href="../board/notice_detail.do?gnbno=${vo.gnbno }">${vo.subject}</a>&nbsp;
         <c:if test="${vo.dbday==today }">
           <sup><img src="../board/image/new.gif"></sup>
         </c:if>
        </td>
        <td width="15%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.dbday }</td>
        <td width="10%" height="50px" style="vertical-align: middle;" class="text-center notice-table">${vo.hit }</td>
      </tr>
    </c:forEach>
  </table>
  </div>
  

  
        <!-- pagination start -->
   <nav class="pagination">
        <ul>
         <c:if test="${startPage>1 }">
          <li><a href="../board/notice_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
         </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <li ${i==curpage?"class=current":"" }><a href="../board/notice_list.do?page=${i }">${i }</a></li>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li><a href="../board/notice_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
        <!-- pagination end -->
        <!-- 검색바 start -->
        <div class="board_search">
        <div class="container">
		<div class="row">
		 <form method="post" name="search" action="../board/notice_list.do" class="inline">
			<table class="pull-right">
			 <tr>
			  <td><input type="text" id="search" value="${ss }"
					placeholder="검색어 입력" name="ss" maxlength="100"></td>
			  <td><button type="submit" class="btn btn-success">검색</button></td>
			 </tr>
			</table>
		 </form>
		</div>
	</div>
	</div>
        <!-- 검색바 end -->
        
      </nav>
  </main>
</div>

<!-- 게시판 end -->

    


     <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>