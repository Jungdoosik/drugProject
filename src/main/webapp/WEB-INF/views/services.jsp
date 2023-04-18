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
                        <li> <a class="get-a-quote" href="login">로그인</a> </li>
                    </ul>
                </nav><!-- .navbar -->
            </div>
        </header>
        <!-- End Header -->
        </section><!-- End Hero Section -->
         <main id="main">

<!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote" style="background-color: #0e1d34;">
      <div class="container" data-aos="fade-up" style="background-color: #ffffff; margin-top:50px;">



<!--     ======= Features Section =======
    <section id="features" class="features">
      <div class="container"> -->

        <div class="row gy-4 align-items-center features-item" data-aos="fade-up">

          <div class="col-md-5">
            <img src="resources/img/features-2.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-md-7">
            <h3>지금 먹고 있는 약 안전한걸까?</h3>
            <p class="fst-italic">
              	의약품의 정보를 일반소비자 눈높이에 맞춰 이해하기 쉽게 마련된 의약품개요정보입니다.
            </p>
            <ul>
              <li><i class="bi bi-check"></i> 제품명의 일부만 알고 있어도 OK!</li>
              <li><i class="bi bi-check"></i> 의약품의 제조업체만 알고 있어도 OK!</li>
              <li><i class="bi bi-check"></i> 성분이 궁금할 땐 MedicineSearch!</li>
            </ul>
          </div>
        </div><!-- Features Item -->

        <div class="row gy-4 align-items-center features-item" data-aos="fade-up">
          <div class="col-md-5 order-1 order-md-2" style="margin-bottom:20px;">
            <img src="resources/img/features-3.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-md-7 order-2 order-md-1">
            <h3>의약품 등 제품정보 검색</h3>
            <p class="fst-italic">
				It does not contain all the information on drugs, and for more information, please refer to the "Details of Drugs" of the Ministry of Food and Drug Safety's Drug Safety Country. This information has no legal effect.
            </p>
            <p>
              	의약품에 관한 모든 내용을 담고 있지 않으며 자세한 사항은 식약처 의약품안전나라의 "의약품상세정보"를 참고하시기 바랍니다. 본 정보는 법적 효력을 가지는 것이 아닙니다.
            </p>
          </div>
        </div><!-- Features Item -->

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
    <script src="resources/js/main.js"></script>

</body>

</html>
