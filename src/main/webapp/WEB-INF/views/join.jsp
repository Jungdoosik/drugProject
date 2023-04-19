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
<script>

</script>
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
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="resources/js/member.js"></script>
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
    </script>

</head>

<body>

    <div class="index_container">
        <!-- ======= Header ======= -->
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="resources/img/logo.png" alt="" > -->
                    <h1> MedicineSearch</h1>
                </a>

                <i class="mobile-nav-toggle mobile-nav-show bi bi-list"> </i>
                <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"> </i>
                <nav id="navbar" class="navbar">
                    <ul>
                        <!-- <li> <a href="index.html" class="active"> Home</a> </li> -->
                        <li> <a href="services"> 서비스 소개</a> </li>
<!--                         <li> <a href="pricing.html"> Pricing</a> </li>
                        <li> <a href="contact.html"> Contact</a> </li> -->
                        <li> <a class="get-a-quote" href="get-a-quote.html">로그인</a> </li>
                    </ul>
                </nav><!-- .navbar -->
            </div>
        </header>
        <!-- End Header -->
        </section><!-- End Hero Section -->
        <main id="main">

    <!-- ======= join Section ======= -->
    <section id="get-a-quote" class="get-a-quote">
      <div class="container" data-aos="fade-up">

        <div class="row g-0">

          <div class="col-lg-5 quote-bg" style="background-image: url(resources/img/quote-bg.jpg);"></div>

		  <!-- Start join Form -->
          <div class="col-lg-7">
            <form id="joinFrm" name="joinFrm" action="joinDo" method="post" class="php-email-form">
				<div>
                
                <div class="col-md-12">
                <h3>휴대전화번호</h3>
                <div style="display:flex;">
                  <input type="text" id="phone" name="phone" class="form-control" maxlength="11" placeholder="'-' 제외하고 번호만 입력" style="margin-bottom:10px;">
                  <button type="button" style="margin-bottom:10px;">인증요청</button>
                  </div>
                </div>
                
                <div class="col-md-12 " >
                <h3>인증번호</h3>
                <div style="display:flex;">
                  <input type="text" class="form-control" name="email" placeholder="인증번호 입력" style="margin-bottom:10px;">
                  <button type="button" style="margin-bottom:10px;">인증확인</button>
                </div>
                </div>
                
                <div class="col-md-12">
                <h3>비밀번호</h3>
                  <input type="password" id="pwd" name="pwd" class="form-control" placeholder="비밀번호 입력" style="margin-bottom:10px;">
                </div>

                <div class="col-md-12">
                <h3>비밀번호확인</h3>
                  <input type="password" id="pwdChk" name="pwdChk" class="form-control" placeholder="비밀번호 확인" style="margin-bottom:10px;">
                </div>

				<div class="col-md-12">
                <h3>이메일 주소</h3>
                  <input type="email" id="email" name="email" class="form-control" placeholder="이메일 입력" style="margin-bottom:10px;">
                </div>
                
                <div style="text-align: -webkit-center">
                  <button type="button" class="btn-2" onclick="joinChk()">회원가입</button>
                  <a href="login" class="btn-2">취소</a>
            </div>

              </div>
            </form>
          </div><!-- End join Form -->

        </div>

      </div>
    </section><!-- End join Section -->

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
    <script src="resources/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>

</body>

</html>
