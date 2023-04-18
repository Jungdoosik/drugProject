<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap css -->
<!-- <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"> -->
<!-- style css -->
<link rel="stylesheet" type="text/css" href="resources/css/style.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.detail_section {
    width: 100%;
    float: left;
    padding: 20px;
}
/* div {
  border: 3px solid #4CAF50;
  padding: 5px;
} */

.detail_img {
  float: right;
}

.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

</style>
<title>약성분</title>
</head>
<body>
<!-- 모달창으로 보여주려면,
https://ssoonidev.tistory.com/61
https://blog.naver.com/PostView.nhn?blogId=alpine_knotweed&logNo=221757331295&parentCategoryNo=&categoryNo=28&viewDate=&isShowPopularPosts=true&from=search
 -->
    
	<div class="detail_section">
		<div class="container">
			<h2 style="clear:right">상세 정보</h2>
			<!-- <p>소제목?</p> -->
			
			<div class="clearfix">
			  <img class="detail_img" src="resources/images/img-1.jpg" alt="약" width="170" height="170">
			  <h5>약 이름</h3>
			</div>
		
			<!-- content 시작 -->
			<div class="contact_section layout_padding" id="abcde">
			    <table>
		    		<tr>
			    		<th>제품명</th>
			    		<td>${list.itemName }</td>
			    	</tr>
		    		<tr>
			    		<th>품목기준코드</th>
			    		<td>${list.itemSeq }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약의 효능은 무엇입니까?</th>
			    		<td>${list.efcyQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약은 어떻게 사용합니까?</th>
			    		<td>${list.useMethodQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약을 사용하기 전에 반드시 알아야 할 내용은 무엇입니까?</th>
			    		<td>${list.atpnWarnQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약의 사용상 주의사항은 무엇입니까?</th>
			    		<td>${list.atpnQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?</th>
			    		<td>${list.intrcQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약은 어떤 이상반응이 나타날 수 있습니까?</th>
			    		<td>${list.seQesitm }</td>
			    	</tr>
			    	<tr>
			    		<th>이 약은 어떻게 보관해야 합니까?</th>
			    		<td>${list.depositMethodQesitm }</td>
			    	</tr>
		   			
	  			</table>
	  		</div>
	  		<!-- content 끝 -->
		</div>
	</div>
	
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
</html>