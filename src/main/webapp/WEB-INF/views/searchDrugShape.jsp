<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	.icoAll {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-검사-확인란-2-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
	    }
	.ico1 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-타원-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
	    }
	.ico2 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-채워진-원-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico3 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/free-icon-semicircle-649747.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico4 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-삼각형-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico5 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-둥근-사각-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico6 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-마름모-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico7 {
	display: block;
	    margin: 0 auto;
	    /* background-image: url(/resources/img/shape/icons8-채워진-원-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center; */
	    border: 1px solid grey;
	    margin-top:10px;
	    width: 35px;
     	height: 20px;
     	border-radius:10px;
     	background-color:black;
	    
    }
	.ico8 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-오각형-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico9 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-육각형-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
	.ico10 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-팔각형-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
    .ico11 {
	display: block;
	    height: 30px;
	    margin: 0 auto;
	    background-image: url(/resources/img/shape/icons8-expand-menu-section-navigate-option-setting-interface-32.png);
	    background-repeat: no-repeat;
	    background-position-x: center;
    }
    
    .icoColor{
    	display:block;
   		margin: 0 auto;
    	border: 1px solid grey;
	    margin-top:10px;
	    width: 35px;
     	height: 20px;
     	border-radius:10px;
    }
    
    
    
    .liArea li {
    width: 70px;
    height: 50px;
    display: inline-block;
    color: #fff;
    font-size: 16px;
    line-height: 28px;
    text-align: center;
    }
    
    
    .textDiv1 {
    	color: black;
    	text-align: center;
    	border: 1px solid grey;
    }
    
    .textDiv2 {
    	color: black;
    	text-align: center;
    	border: 1px solid grey;
    }
    .textDiv3 {
    	color: black;
    	text-align: center;
    	border: 1px solid grey;
    }
    .textDiv4 {
    	color: black;
    	text-align: center;
    	border: 1px solid grey;
    }
/*     .textDiv1:hover{
    	background-color:#d3d3d3;
    }
    .textDiv2:hover{
    	background-color:#d3d3d3;
    } */
</style>
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
    	
    })
        function itemDataSearch() {
        	console.log(document.searchForm.selectShape.value)
        	console.log(document.searchForm.selectColor.value)
        	console.log(document.searchForm.selectDrugForm.value)
        	console.log(document.searchForm.selectLine.value)
        	
            document.searchForm.action = '/searchDrugShapeList';
            document.searchForm.submit()

        } 
        
        
        
        function searchShape(e){
        	console.log($(e).children().eq(1).text())
        	document.searchForm.selectShape.value = $(e).children().eq(1).text() 
        	$('.textDiv1').css('background-color','white')
        	$(e).css('background-color','#d3d3d3')
        }
        
        function searchColor(e){
        	console.log($(e).children().eq(1).text())
        	document.searchForm.selectColor.value = $(e).children().eq(1).text()
        	$('.textDiv2').css('background-color','white')
        	$(e).css('background-color','#d3d3d3')
        	
        }
        function searchDrugForm(e){
        	console.log($(e).children().eq(0).text())
        	document.searchForm.selectDrugForm.value = $(e).children().eq(0).text()
        	$('.textDiv3').css('background-color','white')
        	$(e).css('background-color','#d3d3d3')
        }
        function searchLine(e){
        	console.log($(e).children().eq(0).text())
        	document.searchForm.selectLine.value = $(e).children().eq(0).text()
        	$('.textDiv4').css('background-color','white')
        	$(e).css('background-color','#d3d3d3')
        }
        
        function resetSearch(){
        	$('.textDiv1').css('background-color','white')
        	$('.textDiv2').css('background-color','white')
        	$('.textDiv3').css('background-color','white')
        	$('.textDiv4').css('background-color','white')
        	document.searchForm.selectShape.value = ''
        	document.searchForm.selectColor.value = ''
        	document.searchForm.selectDrugForm.value = ''
        	document.searchForm.selectLine.value = ''
        	
        }
    </script>

</head>

<body>

<%
// 세션값 가져오기
String id = (String) session.getAttribute("phone"); // Object 타입이므로 다운캐스팅
%>

<form id="searchForm" name="searchForm" method="post">
	<input type="hidden" name="selectShape" value="">
	<input type="hidden" name="selectColor" value="">
	<input type="hidden" name="selectDrugForm" value="">
	<input type="hidden" name="selectLine" value="">
</form> 

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
			<form data-aos="fade-up" data-aos-delay="200">

				<div class="" style="display: flex;">
					<div style="color: black; width: 210px; text-align: center;">
						<span>모양검색</span>
					</div>
					<div style="width: 500px;">
					<ul class="liArea">
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="icoAll"></span> <span>전체</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico2"></span> <span>원형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico1"></span> <span>타원형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico3"></span> <span>반원형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico4"></span> <span>삼각형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico5"></span> <span>사각형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico6"></span> <span>마름모</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico7"></span> <span>장방형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico8"></span> <span>오각형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico9"></span> <span>육각형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico10"></span> <span>팔각형</span>
							</div>
						</li>
						<li>
							<div class="textDiv1" onclick="searchShape(this)">
								<span class="ico11"></span> <span>기타</span>
							</div>
						</li>
					</ul>
					</div>


					
				</div>
				<div class="" style="display: flex;">
					<div style="color: black; width: 210px; text-align: center;">
						<span>색상검색</span>
					</div>
					<div style="width: 500px;">
					<ul class="liArea">
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor"  style=""></span> <span>전체</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)" >
								<span class="icoColor" style="background-color:white;"></span> <span>하양</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#FFFF00 ;"></span> <span>노랑</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#ff7f00;"></span> <span>주황</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#ff3399;"></span> <span>분홍</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:red;"></span> <span>빨강</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#5c1a00;"></span> <span>갈색</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#6cff57;"></span> <span>연두</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:green;"></span> <span>초록</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#08728e;"></span> <span>청록</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:blue;"></span> <span>파랑</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#000080;"></span> <span>남색</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:#660099;"></span> <span>자주</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:violet;"></span> <span>보라</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:grey;"></span> <span>회색</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style="background-color:black;"></span> <span>검정</span>
							</div>
						</li>
						<li>
							<div class="textDiv2" onclick="searchColor(this)">
								<span class="icoColor" style=""></span> <span>투명</span>
							</div>
						</li>
					</ul>
				</div>

				</div>
				
				<div class="" style="display: flex;">
					<div style="color: black; width: 210px; text-align: center;">
						<span>제형선택</span>
					</div>
					<div style="width: 500px;">
					<ul class="liArea">
						<li>
							<div class="textDiv3" onclick="searchDrugForm(this)">
								<span>전체</span>
							</div>
						</li>
						<li>
							<div class="textDiv3" onclick="searchDrugForm(this)">
								<span>정제</span>
							</div>
						</li>
						<li>
							<div class="textDiv3" onclick="searchDrugForm(this)">
								<span>경질</span>
							</div>
						</li>
						<li>
							<div class="textDiv3" onclick="searchDrugForm(this)">
								<span>연질</span>
							</div>
						</li>
						<li>
							<div class="textDiv3" onclick="searchDrugForm(this)" >
								<span>기타</span>
							</div>
						</li>
					</ul>
				</div>

				</div>
				
				
				<div class="" style="display: flex;">
					<div style="color: black; width: 210px; text-align: center;">
						<span>분할선</span>
					</div>
					<div style="width: 500px;">
					<ul class="liArea">
						<li>
							<div class="textDiv4" onclick="searchLine(this)">
								<span>전체</span>
							</div>
						</li>
						<li>
							<div class="textDiv4" onclick="searchLine(this)">
								<span>+형</span>
							</div>
						</li>
						<li>
							<div class="textDiv4" onclick="searchLine(this)">
								<span>-형</span>
							</div>
						</li>
						<li>
							<div class="textDiv4" onclick="searchLine(this)" >
								<span>기타</span>
							</div>
						</li>
					</ul>
				</div>

				</div>

				<div  style="text-align:right;">
				<button type="button" class="btn btn-primary1" onclick="resetSearch()"> 검색초기화</button>
				<button type="button" class="btn btn-primary" onclick="itemDataSearch()"> 검색</button>
				</div>
			</form>


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
