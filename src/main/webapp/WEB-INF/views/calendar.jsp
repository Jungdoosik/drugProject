<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.btn-1 {
    background: var(--color-primary);
    border: 0;
    padding: 10px 30px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
}

.btn-2 {
    background: #660099;
    border: 0;
    padding: 10px 30px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
}
</style>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>MedicineSearch Calendar</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="resources/vendor/aos/aos.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="resources/js/member.js"></script>
    <!-- =======================================================
    * Template Name: Logis
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
	
	<!-- 	타임픽커 -->
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>

</head>

<body>

    <div class="index_container">
    <jsp:include page="common/header.jsp" />
		<div class='rap'>
			<div class="header">
			<div class="btn prevDay"></div>
				<h2 class='dateTitle'></h2>
				<div class="btn nextDay"></div>
			</div>
			<div class="grid dateHead">
				<div>일</div>
				<div>월</div>
				<div>화</div>
				<div>수</div>
				<div>목</div>
				<div>금</div>
				<div>토</div>
			</div>
			<div class="grid dateBoard"></div>
		</div>
        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>
    </div>
    <div id="preloader"> </div>
    
	<!--    	약 예약 메모 시작 -->
   	<div id="modalWrap">
	  <div id="modalContent">
	    <div id="modalBody">
	      <span id="closeBtn">&times;</span>
	      <div>
			<input type="text" id="time1" name="time1" class="form-control" style="width:200px;">
	      </div>
   	      <div>
			<input type="text" class="form-control mediMemo" style="width:200px;">
			<button type="button" class="btn btn-primary enroll" onclick="enroll()">등록</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!--    	약 예약 메모 끝  -->
    
    <!-- Vendor JS Files -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <script src="resources/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>
	<script src="resources/js/calendar.js"></script>
	<!-- 	타임픽커 -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>

</html>


<style>

/* 달력 */
h2 {
 color: #eee;
}
.rap {
	margin-top: 10%;
	padding: 20px 20px;
}
.dateHead div {
  background: #1b7de3;
  color: #fff;
  text-align: center;
  border-radius: 5px;
}
 
.grid {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  grid-gap: 2px;
}

.grid div {
  padding: .6rem;
  font-size: .9rem;
  cursor: pointer;
}

.dateBoard div {
  color: #222;
  font-weight: bold;
  min-height: 6rem;
  border-radius: 5px;
  border: 1px solid #eee;
  background: #eee;
}

.noColor {
  background: #eee;
}

.header {
  display: flex;
  justify-content: space-between;
  padding: 1rem 2rem;
}

/* 좌우 버튼 */
.btn {
 display: block;
 width: 20px;
 height: 20px;
 border: 3px solid #eee;
 border-width: 3px 3px 0 0;
 cursor: pointer;
}

.prevDay {
  transform: rotate(-135deg);
}

.nextDay {
  transform: rotate(45deg);
}

/* 약 메모 css */
/* 모달팝업을 감싸고 있는 최상위 부모 */
#modalWrap {
  position: fixed; /* Stay in place */
  display:none;
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* 모달 팝업창 */
#modalBody {
  width: 500px;
  height: 300px;
  padding: 30px 30px;
  margin: 0 auto;
  border: 1px solid #777;
  background-color: #fff;
}

/* 닫기 버튼 */
#closeBtn {
  float:right;
  font-weight: bold;
  color: #777;
  font-size:25px;
  cursor: pointer;
}
.enroll{
  width:40%;
  height:50px;
}

.mediMemo{
  margin-top:10px;
  margin-bottom:10px;
}
</style>
