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

<title>MedicineSearch - 회원탈퇴 문의하기 리스트</title>
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

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- Template Main CSS File -->
<link href="resources/css/main.css" rel="stylesheet">
<!--<script type="text/javascript" th:src="@{/js/enquire/enquireWrite.js}"></script>   화면에 정리 -->

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
table{
   width: 100%;
   color: #ffffff;
   border-top: 1px solid #ffffff;
   border-collapse: collapse;
}
th, td {
  border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
}
.title{
   border-top: 3px solid #ffffff;
   border-bottom: 3px solid #ffffff;
   text-align: center;
} th:first-child, td:first-child {
  border-left: none;
 text-align: center;
} 
searchPag {
   center
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
    text-align: center;
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
#dd{
    background: #f3f6fc;
}
.from-get-a-quote{
    background: #f3f6fc;
    padding: 40px;
    height: 100%
}

/* 버튼 테두리 padding 처리  */
.btnclss{
 padding: 5%;
 /*  테이블 공통 padding  강제  표 수정  222  */
}
</style>

<script type="text/javascript">
/* 문의하기  bnt  문의하기 화면   */
function eMDBnt() {
	location.href = "/memberWithdrawalView"; //문의 리스트 url 		
};
</script>
<script type="text/javascript">
   		const urlParams = new URL(location.href).searchParams;
   		const numsPerPage = urlParams.get('numsPerPage');
   		$('#numsPerPage').val(numsPerPage).attr('selected', 'selelcted');
   		const page = urlParams.get('page');
   		var paging = document.getElementById("page" + page);
   		if($('#page' + page).text() == page || $('#page2'+page).text() == page) {
   			paging.className = 'page-item active';
   		} else {
   			for (var i = 1; i < 6; i++) {
   				paging.classList.remove('active');
   			}
   		}
   		const keyword = urlParams.get('keyword');
   		const category = urlParams.get('category');
   		function selectChange() {
   			if(keyword != null){
				location = 'question?page=' + page + '&numsPerPage=' + $('#numsPerPage').val() + '&keyword=' + keyword + '&category=' + category;
   			} else {
   				location = 'question?page=' + page + '&numsPerPage=' + $('#numsPerPage').val();
   			}
		}
   		
   		function enquireDetail(seq){
   			document.enquireDetailForm.seq.value = seq
   			document.enquireDetailForm.action = '/enquireDetail'
   			document.enquireDetailForm.submit()
   		}
   		
   		function delMemberE(){
   			console.log('탈퇴문의한다')
   		}
   </script>


</head>

<body>
<form id="enquireDetailForm" name="enquireDetailForm" method="post">
	<input type="hidden" name="seq" value="">
</form>
<div class="index_container">
	   <section>
	    <jsp:include page="common/header.jsp" />
	   </section><!-- End Hero Section -->
	<!-- =======End Header =======--> <!-- End Hero Section -->
	<main id="main">
	 <!-- ======= Get a Quote Section ======= --> 
	 <section  id="get-a-quote" class="get-a-quote">
		<div class="container" data-aos="fade-up">
			<div class="row g-0" id="dd">
				<div class="col-lg-5 quote-bg" style="background-image: url(resources/img/question.jpg);">
				</div>
				<div class="col-lg-7" >
				<!--1 enquireListView 시작 -->
				<div  id ="enquireListView" class="get-a-quote">
					<div class="col-lg-12">
						<p class="askTop">회원탈퇴 문의내역</p>
					</div>
					<div class="col-md-12"><!-- 테이블 + bnt 시작  -->
						<div class="btnclss" >
							<button type="button" class="btn" onclick="eMDBnt();">탈퇴문의</button>
						</div>
						<input type="hidden" name="page" value="1">
		                <input type="hidden" name="numsPerPage" value="${pageMaker.criteria.numsPerPage}">
						<input type="hidden" id="keyword" name="keyword">
					 <table class="table table-hover">
					      <thead>
					         <tr style="padding:5px; text-align: center; ">
								    <th style="padding:5px; text-align: center;">NO</th>
								    <th style="padding:5px;">결과</th>
								    <th style="padding:5px;">문의제목</th>
									<th style="padding:5px;">문의일</th>
									<th style="padding:5px;">처리일</th>
							  </tr>
							</thead>
							<tbody>
									
										<c:forEach items="${List}" var="ask" varStatus="status">
											<tr style="padding:5px; text-align: center;" >
												<td style="padding:5px;">
													<a onclick="enquireDetail('${ask.seq}')" style="cursor:pointer;"><c:out value="${(pageMaker.totalCount-status.index)-((pageMaker.criteria.page-1)*pageMaker.criteria.numsPerPage)}"/> </a>
												</td>
												<c:if test="${ask.adate ne null}">
													<td style="padding:5px;"><font color="blue">답변완료</font></td>
												</c:if>
												<c:if test="${ask.adate eq null}">
													<td style="padding:5px;"><font color="red">처리중</font></td>
												</c:if>
												<td style="padding:5px;">${ask.title}</td>
												<td style="padding:5px;">${ask.qdate}</td>
												<td style="padding:5px;">${ask.adate}</td>
											</tr>
										</c:forEach>
							</tbody>
					
						</table>
					</div><!-- 테이블 + end  -->
				  <div class="pasgbody"><!-- 페이징 시작 -->
					  <br>
					   	<c:choose>
						   	<c:when test="${pageMaker.criteria.keyword eq null}">
							   	<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.hasPrev }">
										<li class="page-item"><a class="page-link" href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&lt;</a></li>
									</c:if>
									<c:forEach begin="${pageMaker.startPageNo }"
										end="${pageMaker.endPageNo }" var="num">
										<li id="page${num}" class="page-item"><a class="page-link" href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}">${num }</a></li>
									</c:forEach>
									<c:if test="${pageMaker.hasNext }">
										<li class="page-item"><a class="page-link" href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}">&gt;</a></li>
									</c:if>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="pagination justify-content-center">
									<c:if test="${pageMaker.hasPrev }">
										<li class="page-item">
											<a class="page-link" href="question?page=${pageMaker.startPageNo - 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">&lt;</a>
										</li>
									</c:if>
									<c:forEach begin="${pageMaker.startPageNo }"
										end="${pageMaker.endPageNo }" var="num">
										<li id="page${num}" class="page-item">
											<a class="page-link" id="page2${num}" href="question?page=${num }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}">${num }</a>
										</li>
									</c:forEach>
									<c:if test="${pageMaker.hasNext }">
										<li class="page-item">
											<a class="page-link" href="question?page=${pageMaker.endPageNo + 1 }&numsPerPage=${pageMaker.criteria.numsPerPage}&keyword=${pageMaker.criteria.keyword}&category=${pageMaker.criteria.category}}">&gt;</a>
										</li>
									</c:if>
								</ul>
							</c:otherwise>
						</c:choose>	
		             </div> <!-- 페이징 end -->
		         </div><!-- End enquireListView -->
	<script type="text/javascript">
	$(document).ready(function() {
		/* 처음 로딩시 화면  */
		$('#enquireDetail').hide();
	
	});
	/* 목록 버튼 누르면 list 화면 보이고, 디테일  숨기기   */
	function enquireListBnt(){
		 $("#enquireListView").show();
		 $('#enquireDetail').hide();
	}    
	
	</script> 	       
		      
		   <!--2 enquireDetail 시작 --> 
		       <div id ="enquireDetail" class="get-a-quote">
					<div class="col-lg-12">
						<p class="askTop">1:1 문의 상세</p>
					</div>
						<div class="col-md-12"><!-- 상세  시작  -->
							<div class="btnclss" >
								<button type="button" class="btn" onclick="enquireListBnt();">목록</button>
							</div>
							
							
							
			            </div> <!-- 상세 end -->
			            
			            
		          </div><!-- End enquireDetail -->
		          
		          
            </div><!-- End col-lg-7 리스트 +상세 -->
	    </div> <!-- row g-0 end -->
   </div><!-- container end -->
				
			</div>

    
   </section> <!-- End Get a Quote Section --> 
</main><!-- End #main -->

			<div>
				<a href="#"
					class="scroll-top d-flex align-items-center justify-content-center">
					<i class="bi bi-arrow-up-short"> </i>
				</a>
			</div>
			<div id="preloader"></div>
</div>
	
	<!-- Vendor JS Files --> 
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script> 
	<script src="resources/vendor/php-email-form/validate.js"></script> <!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>
</body>

</html>
