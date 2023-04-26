<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>MedicineSearch - 서비스가입</title>
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

    <!-- =======================================================
    * Template Name: Logis
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
<style>
html,
body {
	width: 100%;
	height: 100%;
}

.index_container {
	width: 100%;
	height: 100%;
	background: #0e1d34;
}
.a-pay, .a-pay:hover {
	float: right;
	width: 200px;
	text-align: center;
	padding: 20px;
	display: block;
	background-color: #0e1d34;
	color: #fff;
	font-weight: 600;
}

/* 반응형, 테이블 */
@media (min-width: 768px) {
	.table-default {
		background-color: #eee;
	}
}

.table-default {
	text-align: left;
	background-color: #fff;
	overflow-x: initial;
	padding: 20px 0;
	margin: 30px auto;
}

.table-default > table > tbody {
	border-top: 0px solid !important;
	margin: 0;
	padding: 0;
}

@media (max-width: 768px) {
	#pay {
		background-color: #d6deeb;
	}
	.table-default > table > tbody > tr {
		display: grid;
  }
}

.table-default > table > tbody > tr:not(:last-child) {
	border-bottom: solid 1px #eee;
}

.table-default > table > tbody > tr > td {
	padding: 20px;
	border: none;
}

.table-default > table > tbody > tr > td:nth-child(1) {
	font-weight: bold;
	min-width: 160px;
}



</style>
<script>
function itemDataSearch() {
    document.frm.action = '/searchDrug';
    document.frm.submit()
}
</script>
</head>
<body>
	<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("member"); // Object 타입이므로 다운캐스팅
	%>
	<div class="index_container">
	<jsp:include page="common/header.jsp" />
        
    <main id="main">

	<!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote" style="background-color: #0e1d34;">
		<div class="container" data-aos="fade-up" style="background-color: #ffffff; padding-top:50px;">

			<img src="resources/img/features-1.jpg" style="margin:10px auto 20px auto; display:block;" class="img-fluid">
			<h1> <%= id %> 님 서비스 가입을 진심으로 환영합니다.</h1>
        
	</div>
    </section><!-- End Get a Quote Section -->
  	</main><!-- End #main -->


		<a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>
        
        
		<jsp:include page="common/footer.jsp" />
	</div>
    <div id="preloader"> </div>
    <!-- Vendor JS Files -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <script src="resources/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script type="text/javascript" src="resources/js/main.js"></script>
    <script type="text/javascript" src="resources/js/subscribe.js"></script>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<!-- 빌링키 사용을 위한 셋팅 -->	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>

</html>
