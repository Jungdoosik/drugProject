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

    <title>MedicineSearch - 문의상세  </title>
    <meta content="" name="description">
    <meta content="" name="keywords">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

<style type="text/css">
.btn{
    background: #0d42ff;
    border: 0;
    padding: 10px 30px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
}
 .askTop {
	display: flex;
	width: 120px;
	font-size: 22px;
	margin: 20px auto;	
	z-index: 999;
} 
/* 버튼 테두리 padding 처리  */
.btnclss{
 padding: 5%;
}
</style>
<!--<script type="text/javascript" th:src="@{/js/enquire/enquireWrite.js}"></script>   화면에 정리 -->                
</head>

<body>
<div class="index_container">
   <section>
    <jsp:include page="../common/header.jsp" />
   </section><!-- End Hero Section -->
    <main id="main">
        <!-- ======= Get a Quote Section ======= -->
        <section id="get-a-quote" class="get-a-quote">
            <div class="container" data-aos="fade-up">
                <div class="row g-0">
                    
                    <div class="col-lg-5 quote-bg" style="background-image: url(resources/img/enquireDetail.jpg);">
                    </div>
                        <div class="col-lg-7">
                                <form  method="post" class="php-email-form" id="frmAsk" >
                                    <div class="col-lg-12">
                                        <h2 class="askTop">문의내역</h2>
                                        <input type="hidden" name="phone" value="${phone}" /> 
                                        <input type="hidden" id="serviceCode" value="MS">
                   <!--                      <h4>고객센터는 평일 오전 9시부터 저녁 6시까지 운영됩니다.
                                        <br>문의 남겨주시면 최대한 빠르게 답변드리겠습니다.<h4> -->
                                    </div>
                                                    <%-- <div class="col-md-12 ">
                                                    <span class="input-group-text">작성자</span>
                                                    <input class="form-control" type="text" name="writer"  id="writer" required>${phone}
                                                    </div> --%> 
                                        <div class="col-md-12">
                                                <span class="input-group-text">제목</span>
                                                <input  type="text" name="title" id="askTitle" style="background-color: #fff;" class="form-control" disabled value="${eVo.title}"placeholder="※ 무엇을 문의하시겠습니까?" required>
                                        </div>
                                        <div class="col-md-12">
                                            <span class="input-group-text">내용</span>
                                            <textarea class="form-control" style="background-color: #fff;" name="question" id="askContent" rows="6"  disabled placeholder="※ 내용을 입력하세요.&#13;&#10;&#13;&#10;수정 / 삭제 불가하오니 신중히 문의하시기 바랍니다." required>${eVo.question }</textarea>
                                        </div>
                                        <c:if test="${not empty eVo.answer }">
	                                        <div class="col-md-12">
	                                            <span class="input-group-text">답변</span>
	                                            <textarea class="form-control"  style="background-color: #fff;"name="question" id="askContent" rows="6"  disabled required>${eVo.answer}</textarea>
	                                        </div>
                                        </c:if>
                                                <div class="col-md-12 text-center">
                                                        <div class="loading">Loading</div>
                                                        <div class="error-message"></div>
                                                        <div class="sent-message">정상적으로 게시되었습니다.</div>
                                               <div class="btnclss"> 
                                                <button type="button" class="btn"  onclick="history.back()" >목록으로</button>
                                               </div>
                                        </div>
                                </form>
                       </div><!-- End Quote Form -->
                </div>
            </div>
        </section><!-- End Get a Quote Section -->

    </main><!-- End #main -->

			<div>
				<a href="#" class="scroll-top d-flex align-items-center justify-content-center"> 
	            <i class="bi bi-arrow-up-short"> </i> 
	            </a>
			</div>
         
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
