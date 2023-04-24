<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    $(function(){
    	var xhrd = new XMLHttpRequest();
        var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03'; 
        var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D'; 
        queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('타이레놀');
        queryParamsd += '&' + encodeURIComponent('prduct') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
        queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('20'); 
        queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
        xhrd.open('GET', urld + queryParamsd);
        xhrd.onreadystatechange = function () {
            if (this.readyState == 4) {
                console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
                var tt1 = JSON.parse(this.responseText)
                console.log(tt1.body.items)
                
            }
        };

        xhrd.send('');
    })
        /* function itemDataSearch() {
        	if(document.frm.selectKnd.value == '') {
        		alert("분류를 선택해주세요.")
        		return false
        	} 
        	 if(document.frm.searchName.value == '') {
        		alert("검색어를 선택해주세요.")
        		return false
        	} 
        	console.log(document.frm.searchName.value)
        	console.log(document.frm.selectKnd.value)
            document.frm.action = '/searchDrugList';
            document.frm.submit()

        }  */
        
        /* function searchEvt(){
        	if(document.frm.selectKnd.value == '') {
        		alert("분류를 선택해주세요.")
        		return false
        	}
        	if(document.frm.searchName.value == '') {
        		alert("분류를 선택해주세요.")
        		return false
        	}
        	
        	document.frm.action = '/searchDrugList';
            document.frm.submit()
        } */
        
        function searchDrugName(){
        	location.href = "/searchDrugName"
        }
        
        function searchDrugShape(){
        	location.href = "/searchDrugShape"
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
        <%-- <!-- ======= Header ======= -->
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
                        <!-- 세션값 있는 경우 마이페이지/로그아웃 -->
                        <li> <a href="mypage"> <%=id %> 님 안녕하세요. 나의 정보</a> </li>
                        <li> <a class="get-a-quote" href="logout">로그아웃</a> </li>
                    </ul>
                </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->
        <!-- End Header --> --%>
        <!-- ======= Hero Section ======= -->
        <section id="hero" class="hero d-flex align-items-center">
            <div class="container">
                <div class="row gy-4 d-flex justify-content-between" style="margin-top:auto; padding-top:">
                    <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
                        <h2 data-aos="fade-up"> 안전하게 복약하세요.</h2>
                        <p data-aos="fade-up" data-aos-delay="100">
                            드시고 계신 약의 정확한 성분을 알고 계시나요?
                        </p>

                        <form id="frm" name="frm" method="post" data-aos="fade-up" data-aos-delay="200"> 
 
                            <div class="form-search d-flex align-items-stretch" style="justify-content: space-around;">
                                <button type="button" class="btn btn-primary" onclick="searchDrugName() " style="width: 40%;"> 검색</button>
                                <button type="button" class="btn btn-primary" onclick="searchDrugShape()" style="width: 40%;"> 모양</button>
                            </div>
                        </form>

                        <div class="row gy-4" data-aos="fade-up" data-aos-delay="400">

                            <div class="col-lg-3 col-6">
                                <div class="stats-item text-center w-100 h-100">
                                    <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"> </span>
                                    <p> 종류</p>
                                </div>
                            </div><!-- End Stats Item -->
                            <div class="col-lg-3 col-6">
                                <div class="stats-item text-center w-100 h-100">
                                    <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"> </span>
                                    <p> 성분</p>
                                </div>
                            </div><!-- End Stats Item -->
                        </div>
                    </div>

                    <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                        <img src="resources/img/hero-img.png" class="img-fluid mb-3 mb-lg-0" alt="">
                    </div>

                </div>
            </div>
        </section><!-- End Hero Section -->
        <main id="main">

        </main>

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
