<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    
<style>
html,
body {
   width: 100%;
   height: 100%;
}
.index_container {
   width: 100%;
   background: #0e1d34;
   padding: 10% 10%;   
}
table {
   width: 100%;
   color: #ffffff;
   border-top: 1px solid #ffffff;
   border-collapse: collapse;
}
th, td {
  border-bottom: 1px solid #ffffff;
    border-left: 1px solid #ffffff;
    padding: 10px;
}
.title{
   border-top: 3px solid #ffffff;
   border-bottom: 3px solid #ffffff;
   text-align: center;
}
th:first-child, td:first-child {
  border-left: none;
}
searchPag {
   center
}
</style>
<script>
   function itemDataSearch() {
       document.frm.action = '/searchDrug';
       document.frm.submit()

   }
   
   $(window).on('resize', function(){

	    if (window.innerWidth <= 800) {
	      $('#topTitle').css('display', 'none')
	      $('#middleTitle').css('padding-top', '15%')
	    }else if(window.innerWidth > 800){
	    	$('#topTitle').css('display', 'block')
	    	$('#middleTitle').css('padding-top', '0%')
	    	
	    }
	});
</script>
    
</head>

<script>
   $(function(){
      
      /* var xhrd = new XMLHttpRequest();
      var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03'; 
      var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D'; 
      queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('영신단'); */
      /* queryParamsd += '&' + encodeURIComponent('prduct') + '=' + encodeURIComponent('');  */
      /* queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
      queryParamsd += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
      queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
      queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
      queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); */
      /* queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
      xhrd.open('GET', urld + queryParamsd);
      xhrd.onreadystatechange = function () {
          if (this.readyState == 4) {
              console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
              var tt1 = JSON.parse(this.responseText)
              console.log(tt1.body.items[0].ITEM_NAME)
          }
      };

      xhrd.send(''); */
      
   })
   
   function drugDetail(itemSeq){
      document.detailData.itemName.value = $('input[name="itemName' +itemSeq+ '"]').val()
      document.detailData.itemSeq.value = $('input[name="itemSeq' +itemSeq+ '"]').val()
       document.detailData.efcyQesitm.value = $('input[name="efcyQesitm' +itemSeq+ '"]').val()
       document.detailData.useMethodQesitm.value = $('input[name="useMethodQesitm' +itemSeq+ '"]').val()
       document.detailData.atpnWarnQesitm.value = $('input[name="atpnWarnQesitm' +itemSeq+ '"]').val()
       document.detailData.atpnQesitm.value = $('input[name="atpnQesitm' +itemSeq+ '"]').val()
       document.detailData.intrcQesitm.value = $('input[name="intrcQesitm' +itemSeq+ '"]').val()
       document.detailData.seQesitm.value = $('input[name="seQesitm' +itemSeq+ '"]').val()
       document.detailData.depositMethodQesitm.value = $('input[name="depositMethodQesitm' +itemSeq+ '"]').val()
       document.detailData.openDe.value = $('input[name="openDe' +itemSeq+ '"]').val()
       document.detailData.updateDe.value = $('input[name="updateDe' +itemSeq+ '"]').val()
       document.detailData.itemImage.value = $('input[name="itemImage' +itemSeq+ '"]').val()
      document.detailData.action = "/detail"
      document.detailData.submit()
      
   }
</script>

<body>
	
	<form id="detailData" name="detailData" method="post">
      <input type="hidden" name="itemName" value="">
      <input type="hidden" name="itemSeq" value="">
      <input type="hidden" name="efcyQesitm" value="">
      <input type="hidden" name="useMethodQesitm" value="">
      <input type="hidden" name="atpnWarnQesitm" value="">
      <input type="hidden" name="atpnQesitm" value="">
      <input type="hidden" name="intrcQesitm" value="">
      <input type="hidden" name="seQesitm" value="">
      <input type="hidden" name="depositMethodQesitm" value="">
      <input type="hidden" name="openDe" value="">
      <input type="hidden" name="updateDe" value="">
      <input type="hidden" name="itemImage" value="">
   </form>
	
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
           <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center" style="color:#ffffff">
               <h2 data-aos="fade-up" id="topTitle"> 안전하게 복약하세요.</h2>
               <p data-aos="fade-up" data-aos-delay="100" id="middleTitle">
                      드시고 계신 약의 정확한 성분을 알고 계시나요?
               </p>
               <form id="frm" name="frm" method="post" data-aos="fade-up" data-aos-delay="200">
                   <div class="form-search d-flex align-items-stretch mb-3">
                       <select id="inputState" class="form-control">
                           <option> 분류 ▼</option>
                           <option> 성분</option>
                           <option> 사용법</option>
                       </select>
                       <input type="text" class="form-control" placeholder="검색어를 입력하세요.">
                       <button type="button" class="btn btn-primary" onclick="itemDataSearch()"> Search</button>
                   </div>
               </form>
          </div><br>
       <div class="" id="abcde">
        <div class="row gy-4 d-flex justify-content-between">
          <table>
          <tr onclick="drugDetail(${list.itemSeq })">
            <th class="title">제품명</th>
            <th class="title">번호</th>
          </tr>
             <c:forEach var="list" items="${list.items }" varStatus="status">
                <tr onclick="drugDetail(${list.itemSeq })">
<!--                    <th>제품명</th> -->
                   <td>${list.itemName }</td>
<!--                    <th>번호</th> -->
                   <td>${list.itemSeq }</td>
                </tr>
                   <input type="hidden" name="itemName${list.itemSeq }" value="${list.itemName }">
                   <input type="hidden" name="itemSeq${list.itemSeq }" value="${list.itemSeq }">
                   <input type="hidden" name="efcyQesitm${list.itemSeq }" value="${list.efcyQesitm }">
                   <input type="hidden" name="useMethodQesitm${list.itemSeq }" value="${list.useMethodQesitm }">
                   <input type="hidden" name="atpnWarnQesitm${list.itemSeq }" value="${list.atpnWarnQesitm }">
                   <input type="hidden" name="atpnQesitm${list.itemSeq }" value="${list.atpnQesitm }">
                   <input type="hidden" name="intrcQesitm${list.itemSeq }" value="${list.intrcQesitm }">
                   <input type="hidden" name="seQesitm${list.itemSeq }" value="${list.seQesitm }">
                   <input type="hidden" name="depositMethodQesitm${list.itemSeq }" value="${list.depositMethodQesitm }">
                   <input type="hidden" name="openDe${list.itemSeq }" value="${list.openDe }">
                   <input type="hidden" name="updateDe${list.itemSeq }" value="${list.updateDe }">
                   <input type="hidden" name="itemImage${list.itemSeq }" value="${list.itemImage }">
             </c:forEach>
            </table>
       </div>
       <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>
      </div>
      <!-- <div class="searchPag" style="margin-top: 8%;">
         <nav aria-label="Page navigation example">
           <ul class="pagination" style="justify-content: center;">
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Previous">
                 <span aria-hidden="true">&laquo;</span>
               </a>
             </li>
             <li class="page-item"><a class="page-link" href="#">1</a></li>
             <li class="page-item"><a class="page-link" href="#">2</a></li>
             <li class="page-item"><a class="page-link" href="#">3</a></li>
             <li class="page-item">
               <a class="page-link" href="#" aria-label="Next">
                 <span aria-hidden="true">&raquo;</span>
               </a>
             </li>
           </ul>
         </nav>
      </div> -->
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