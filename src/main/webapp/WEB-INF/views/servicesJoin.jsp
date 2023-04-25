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
    <script src="resources/js/subscribe.js"></script>

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
	<jsp:include page="common/header.jsp" />
        
    <main id="main">

	<!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote" style="background-color: #0e1d34;">
		<div class="container" data-aos="fade-up" style="background-color: #ffffff; padding-top:50px;">

<div class="col-lg-5" style="background-image: url(resources/img/features-1.jpg);"></div>
<img src="resources/img/features-1.jpg">
<div class="row gy-4 align-items-center features-item">
	<h1 class="display-4 fw-bolder mt-4 mb-2">가입하고 싶으신 서비스를 선택 후 결제하여 MedicineSearch를 이용해 보세요</h1>
</div>

         
        <div class="table-responsive table-default" style="border-radius:1rem;">
            <table class="table">
                <tbody>
                <tr>
                    <td>7일 100원 결제 체험 후 월정액<td>7일 100원 결제 체험 서비스를 통해  MedicineSearch 이용<td>
                        <div class="form-check checkbox-plan">
                        	<input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="0" onclick="checkLink(this);" id="check-0">
                        	<label class="form-check-label" for="check-0">9,900/월</label>
                        </div>
                    </td>
                </tr>
<!--                 <tr>
                    <td style="text-decoration:line-through; color: gray;">7일 100원 결제 체험 후 월정액<td style="text-decoration:line-through; color: gray;">7일 100원 결제 체험 서비스를 통해 MedicineSearch 서비스 이용<td>
                        <div class="form-check checkbox-plan">
                        	<input class="form-check-input checkbox-plan" type="checkbox" name="check-link" disabled>
                        	<label class="form-check-label" for="check-0"><del>9,900/월</del></label>
                        </div>
                    </td>
                </tr> -->
                <tr>
                    <td>월정액 서비스<td>언제 어디서나 MedicineSearch 이용<td>
                        <div class="form-check checkbox-plan">
                        	<input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="1" onclick="checkLink(this);" id="check-1">
                        	<label class="form-check-label" for="check-1">9,900/월</label>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="table-responsive table-default" style="max-width: 1200px;background-color: rgba(0,0,0,0);padding: 0;">
            <table class="table">
                <tbody>
                <tr style="border-bottom: solid 0px rgba(0,0,0,0);">
                    <td style="color:  rgb(73, 73, 73);padding: 0;">
                            <span>
                                [홈페이지에서 가입하는 경우]<br>
                                1. 100원 결제 7일 무료체험(168시간) 이용요금은 무료체험 종료 후 9,900원이 자동 결제됩니다.<br>
                                <br>
                                [홈페이지가 아닌 타 채널을 통해 보상을 받으시고 7일 무료체험을 가입하신 경우]<br>
                                1. 가입 이후 72시간 이용하는 조건으로 보상을 지급하고 있습니다. (72시간 이후 서비스 해지 가능)<br>
                                2. 서비스 해지 없이 무료체험 기간(168시간) 경과 후 결제가 이뤄지면 최초 한달간 이용 조건으로 보상을 지급합니다. (한달 의무 사용 약정)<br><br>
                                * 보상을 받으시고 가입하신 경우 최초 한달은 약정기간으로 의무사용이 적용되니 신중히 가입하시기를 부탁드립니다.</span></td>
                    <td style="padding: 0;">
                        <div class="form-check checkbox-plan" style="padding: 5px 20px; margin: 10px;"><input class="form-check-input" type="checkbox" id="check-card" onclick="checkCard(this);"><label class="form-check-label" for="check-card" style="font-weight: 500;color: gray;">카드결제</label></div>
                        <div id="div-free" class="form-check checkbox-plan" style="display:none;"><input class="form-check-input" type="checkbox" id="check-free"><label class="form-check-label" for="check-free" style="font-weight: 500;color: gray;">7일 100원 결제 체험 서비스 가입 동의</label></div>
                        <a id="a-pay" class="a-pay" href="javascript:basicModal('상품 선택 후 결제를 시도해주세요.');" style="width:230px;border-radius:1.5rem; margin-top: 80px; text-decoration-line: none;font-weight: 500; font-size:18px;">상품 선택 후<br>결제해주세요.</a></td>
                </tr>
                </tbody>
            </table>
        </div>
        
        
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
