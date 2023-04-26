<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

    <title>MedicineSearch - Index</title>
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
    </style>
    <script>
        function itemDataSearch() {
            document.frm.action = '/searchDrug';
            document.frm.submit()

        }
        
        function joinPage(){
        	document.joinForm.action = "/join"
        	document.joinForm.submit();
        }
    </script>

</head>

<body>
	<form id="joinForm" name="joinForm" method="post">
		<input type="hidden" name="joinPath" value="1">
	</form>

<%--     <div class="index_container">
    	<section>
    	<jsp:include page="common/header.jsp" />
        </section><!-- End Hero Section -->
        <main id="main"> --%>

    <div class="index_container">
    <jsp:include page="common/header.jsp" />
    <main id="main">
    
    <!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote">
      <div class="container" data-aos="fade-up" style="padding-top: 40px;">

        <div class="row g-0">

          <div class="col-lg-5 quote-bg" style="background-image: url(resources/img/quote-bg.jpg);"></div>

          <div class="col-lg-7">
            <!-- <form id="frm" name="frm" method="post" class="php-email-form" action="memberLogin"> -->
            <form id="loginFrm" name="loginFrm" action="loginDo" method="post" class="php-email-form">
                <div class="col-md-12">
                <h3>아이디</h3>
                  <input type="text" id="phone" name="phone" class="form-control" value="" placeholder="아이디 입력" maxlength="11" style="margin-bottom:10px;">
                </div>

                <div class="col-md-12">
                <h3>비밀번호</h3>
                  <input type="password" id="pwd" name="pwd" class="form-control" value="" placeholder="Password 입력" style="margin-bottom:10px;">
                </div>
                
                <div style="text-align: -webkit-center">
                  <button type="submit" class="btn-1">로그인</button>
                  <button type="button" class="btn-2" onclick="joinPage()">회원가입</button>
            	</div>
            </form>
            
          </div><!-- End Quote Form -->

        </div>

      </div>
    </section><!-- End Get a Quote Section -->

  </main><!-- End #main -->


        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>

    </div>
    <div id="preloader"> </div>
    <!-- Vendor JS Files -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>

</body>

</html>
