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
	<div class="index_container">
	<jsp:include page="common/header.jsp" />
        
    <main id="main">

	<!-- ======= Get a Quote Section ======= -->
    <section id="get-a-quote" class="get-a-quote" style="background-color: #0e1d34; padding-top:70px;">
		<div class="container" data-aos="fade-up" style="background-color: #ffffff;">

		<c:if test="${not empty phone && subScribe eq 'Y'}"><!-- 서비스 기가입시 -->
			<img src="resources/img/features-1.jpg" style="margin:10px auto 20px auto; display:block;" class="img-fluid">
			<h1>${phone } 님 서비스 가입하여 이용중입니다.</h1>
		</c:if>

		<c:if test="${empty subScribe || subScribe eq 'N'}"><!-- 서비스 미가입시 -->
			<img src="resources/img/features-1.jpg" style="margin:10px auto 20px auto; display:block;" class="img-fluid">
			<div class="container-fluid" align="center" style="margin-bottom:15px;">
			
				<h1>가입하고 싶으신 서비스를 선택 후 결제하여<br>MedicineSearch를 이용해 보세요</h1>
			</div>
	        <div id="pay" class="table-responsive table-default" style="border-radius:1rem;">
	            <table class="table">

	                <tbody>
	                <tr>
	                    <td>7일 100원 결제 체험 후 월정액</td>
	                    <td>7일 100원 결제 체험 서비스를 통해  MedicineSearch 이용</td>
	                    <td>
	                        <div class="form-check checkbox-plan">
	                        	<input class="form-check-input checkbox-plan" type="checkbox" name="check-link" dataid="100" value="100" onclick="checkLink(this);" id="check-0">
	                        	<label class="form-check-label" for="check-0"><del>9,900/월</del></label>
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
	                    <td>월정액 서비스</td>
	                    <td>매월 MedicineSearch 컨텐츠 이용</td>
	                    <td>
	                        <div class="form-check checkbox-plan">
	                        	<input class="form-check-input checkbox-plan" type="checkbox" name="check-link" value="9900" onclick="checkLink(this);" id="check-1">
	                        	<label class="form-check-label" for="check-1">9,900/월</label>
	                        </div>
	                    </td>
	                </tr>
	                </tbody>
	            </table>
	        </div>
	        <div class="table-responsive table-default">
	            <table class="table">
	            	<colgroup>
						<col width="80%">
						<col width="*">
					</colgroup>
	                <tbody>
	                <tr style="border-bottom: solid 0px rgba(0,0,0,0);">
	                    <td style="padding:0;">
	                            <span>
	                                [홈페이지에서 가입하는 경우]<br>
	                                1. 100원 결제 7일 무료체험(168시간) 이용요금은 무료체험 종료 후 9,900원이 자동 결제됩니다.<br>
	                                <br>
	                                [홈페이지가 아닌 타 채널을 통해 보상을 받으시고 7일 무료체험을 가입하신 경우]<br>
	                                1. 가입 이후 72시간 이용하는 조건으로 보상을 지급하고 있습니다. (72시간 이후 서비스 해지 가능)<br>
	                                2. 서비스 해지 없이 무료체험 기간(168시간) 경과 후 결제가 이뤄지면 최초 한달간 이용 조건으로 보상을 지급합니다. (한달 의무 사용 약정)<br><br>
	                                * 보상을 받으시고 가입하신 경우 최초 한달은 약정기간으로 의무사용이 적용되니 신중히 가입하시기를 부탁드립니다.</span>
                        </td>
	                    <td style="padding:0;">
	                        <a id="a-pay" class="a-pay" href="#pay" onclick="iamport();" style="margin-top:100px;padding:auto;">카드결제</a>
	                    </td>
	                </tr>
	                </tbody>
	            </table>
	        </div>
		
		</c:if>

        
        
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
