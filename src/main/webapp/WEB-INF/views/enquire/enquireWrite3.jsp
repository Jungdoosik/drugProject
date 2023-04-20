<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MedicineSearch - 문의하기 리스트</title>
<meta content="" name="description">
<meta content="" name="keywords">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
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
html, body {
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
.btn {
	background: #0d42ff;
	border: 0;
	padding: 10px 30px;
	color: #fff;
	transition: 0.4s;
	border-radius: 4px;
}

.askTop {
	display: flex;
	width: 330px;
	font-size: 22px;
	margin: 20px auto;
	z-index: 999;
	top: 20px;
	position: relative;
	font-family: SUIT-SemiBold;
	font-size: 25px;
	font-weight: 500;
}

#gy-4 {
	PADDING: 5%;
}
</style>


<!--<script type="text/javascript" th:src="@{/js/enquire/enquireWrite.js}"></script>   화면에 정리 -->


</head>

<body>
	<section> <!-- ======= Header ======= --> <header id="header"
		class="header d-flex align-items-center fixed-top"> <jsp:include
		page="../common/header.jsp" /> </header> <!-- =======End Header =======--> <!-- End Hero Section -->
	<main id="main"> <!-- ======= Get a Quote Section ======= --> <section
		id="get-a-quote" class="get-a-quote">
	<div class="container" data-aos="fade-up">
		<div class="row g-0">
			<div class="col-lg-5 quote-bg"
				style="background-image: url(resources/img/question.jpg);"></div>

			<div class="col-lg-7">
				<div class="row gy-4" id="gy-4">
					<div class="col-lg-12">

						<p class="askTop">1:1 문의 내역</p>


					</div>
					<div class="col-md-12">
						<div>
							<button type="button" class="btn" onclick="eWVBnt();">문의하기</button>
						</div>
						<input type="hidden" name="page" value="1">
		                 <input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th>결과</th>
									<th>문의제목</th>
									<th>문의일</th>
									<th>처리일</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach items="${List}" var="ask" varStatus="status">
								  <input type="hidden" name="seq" value="${ask.seq}">
									<tr>
										<td>
											<c:out value="${(pageMaker.totalCount-status.index)-((pageMaker.criteria.page-1)*pageMaker.criteria.numsPerPage)}" /> 
										</td>
										<c:if test="${list.pdate ne null}">
											<td><font color="blue">답변완료</font></td>
										</c:if>
										<c:if test="${list.pdate eq null}">
											<td><font color="red">처리중</font></td>
										</c:if>
										<td>${ask.title}</td>
										<td>${ask.qdate}</td>
										<td>${ask.adate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- End Quote Form -->
						<script type="text/javascript">
							/* 문의하기  bnt  문의하기 화면   */
							function eWVBnt() {
								location.href = "/enquireWriteView"; //문의 리스트 url 		
							};
						</script>
						<div class="pasgbody">
							<c:choose>

								<c:when test="${pageMaker.criteria eq null}">
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.hasPrev }">
											<li class="page-item"><a class="page-link"
												href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&lt;</a></li>
										</c:if>
										<c:forEach begin="${pageMaker.startPageNo }"
											end="${pageMaker.endPageNo }" var="num">
											<li id="page${num}" class="page-item"><a
												class="page-link"
												href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}">${num }</a></li>
										</c:forEach>
										<c:if test="${pageMaker.hasNext }">
											<li class="page-item"><a class="page-link"
												href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&gt;</a></li>
										</c:if>
									</ul>
								</c:when>

								<c:otherwise>
									<ul class="pagination justify-content-center">
										<c:if test="${pageMaker.hasPrev }">
											<li class="page-item"><a class="page-link"
												href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}">&lt;</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPageNo }"
											end="${pageMaker.endPageNo }" var="num">
											<li id="page${num}" class="page-item"><a
												class="page-link" id="page2${num}"
												href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}">${num }</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.hasNext }">
											<li class="page-item"><a class="page-link"
												href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria}&category=${pageMaker.criteria}}">&gt;</a>
											</li>
										</c:if>
									</ul>
								</c:otherwise>

							</c:choose>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	</div>
	</section> <!-- End Get a Quote Section --> </main><!-- End #main -->

	<div>
		<a href="#"
			class="scroll-top d-flex align-items-center justify-content-center">
			<i class="bi bi-arrow-up-short"> </i>
		</a>
	</div>
	<div id="preloader"></div>
	<!-- Vendor JS Files --> <script
		src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script> <script
		src="resources/vendor/aos/aos.js"></script> <script
		src="resources/vendor/php-email-form/validate.js"></script> <!-- Template Main JS File -->
	<script src="resources/js/main.js"></script> </section>
</body>

</html>
