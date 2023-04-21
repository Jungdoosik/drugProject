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


   <!-- basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- mobile metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- site metas -->
   <title>About</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- bootstrap css -->
   <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
   <!-- style css -->
   <link rel="stylesheet" type="text/css" href="resources/css/style.css">
   <!-- Responsive-->
   <link rel="stylesheet" href="resources/css/responsive.css">
   <!-- fevicon -->
   <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
   <!-- Scrollbar Custom CSS -->
   <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
   <!-- Tweaks for older IEs-->
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <!-- fonts -->
   <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Righteous&display=swap" rel="stylesheet">
   <!-- owl stylesheets -->
   <link rel="stylesheet" href="resources/css/owl.carousel.min.css">

 </head>

<script>
	$(function(){
		
		var xhrd = new XMLHttpRequest();
		var urld = 'http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01'; /*URL*/
		var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; /*Service Key*/
		queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('');
		queryParamsd += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent('');
		queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent('');
		queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1');
		queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent('');
		/* queryParamsd += '&' + encodeURIComponent('prduct') + '=' + encodeURIComponent('');  */
		queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
		xhrd.open('GET', urld + queryParamsd);
		xhrd.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		        var tt1 = JSON.parse(this.responseText)
		        console.log(tt1.body.items[0].ITEM_NAME)
		    }
		};

		xhrd.send('');
		
	})
	
	 $(function(){
	   if (window.innerWidth <= 800) {
	      $('#topTitle').css('display', 'none')
	      $('#middleTitle').css('padding-top', '15%')
	    }else if(window.innerWidth > 800){
	    	$('#topTitle').css('display', 'block')
	    	$('#middleTitle').css('padding-top', '0%')
	    	
	    }
      
   })
	
	function drugDetail(itemSeq){
		
		document.frm.item_name.value = $('input[name="item_name' +itemSeq+ '"]').val()
		document.frm.entp_name.value = $('input[name="entp_name' +itemSeq+ '"]').val()
    	document.frm.item_seq.value = $('input[name="item_seq' +itemSeq+ '"]').val()
    	document.frm.pageNo.value = $('input[name="pageNo' +itemSeq+ '"]').val()
    	document.frm.edi_code.value = $('input[name="edi_code' +itemSeq+ '"]').val()
    	/* 
    	document.frm.depositMethodQesitm.value = $('input[name="depositMethodQesitm' +itemSeq+ '"]').val()
    	document.frm.openDe.value = $('input[name="openDe' +itemSeq+ '"]').val()
    	document.frm.updateDe.value = $('input[name="updateDe' +itemSeq+ '"]').val()
    	document.frm.itemImage.value = $('input[name="itemImage' +itemSeq+ '"]').val() */
		document.frm.action = "/searchDrug"
		document.frm.submit()
		
	}
</script>

<body>
    <!-- header section start -->
    <!-- header section end -->
    <!-- contact section start -->
    <form id="frm" name="frm" method="post">
    	<input type="hidden" name="item_name" value="">
    	<input type="hidden" name="item_seq" value="">
    	<input type="hidden" name="pageNo" value="">
    	<input type="hidden" name="edi_code" value="">
    </form>
    
	    <%-- <div class="contact_section layout_padding" id="abcde">
		    <table id="tblTodo">
		    <tbody>
		    	 <c:forEach var="list" items="${list.items }" varStatus="status">
		    		<tr onclick="drugDetail(${list.ITEM_NAME })">
				    		<th>제품명</th>
				    		<th>제품번호</th>
			    	</tr>
				    		<td>${list.ITEM_NAME}</td>
				    		<td>${list.ENTP_SEQ}</td> 
			    	
				    		<input type="hidden" name="item_name${list.itemSeq }" value="${list.item_name }">
					    	<input type="hidden" name="insupTp${list.itemSeq }" value="${list.item_seq }">
					    	<input type="hidden" name="pageNo${list.itemSeq }" value="${list.pageNo }">
		    	</c:forEach>
		    	</tbody> 
		   	</table>
	    </div> --%>
	    
	    <div class="index_container">
      <!-- ======= Header ======= -->
        <jsp:include page="common/header.jsp" />
        <!-- End Header -->
           <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center" style="color:#ffffff">
               <h2 data-aos="fade-up" id="topTitle"> 안전하게 복약하세요.</h2>
               <p data-aos="fade-up" data-aos-delay="100" id="middleTitle">
                      드시고 계신 약의 정확한 성분을 알고 계시나요?
               </p>
               <form id="searchForm" name="searchForm" method="post" data-aos="fade-up" data-aos-delay="200">
                   <div class="form-search d-flex align-items-stretch mb-3">
                       <select id="selectKnd" name="selectKnd" class="form-control">
                           <option value=""> 분류 ▼</option>
                           <option value="1" <c:if test="${params.selectKnd eq '1' }">selected</c:if>> 성분</option>
                           <option value="2" <c:if test="${params.selectKnd eq '2' }">selected</c:if>> 사용법</option>
                       </select>
                       <input type="text" name="searchName" class="form-control" placeholder="검색어를 입력하세요." value="${params.searchName }">
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
                <tr onclick="drugDetail(${list.ITEM_NAME })">
                   <td>${list.ITEM_NAME }</td>
                   <td>${list.ENTP_SEQ }</td>
                </tr>
                   			<input type="hidden" name="item_name${list.itemSeq }" value="${list.item_name }">
					    	<input type="hidden" name="insupTp${list.itemSeq }" value="${list.item_seq }">
					    	<input type="hidden" name="pageNo${list.itemSeq }" value="${list.pageNo }">
             </c:forEach>
            </table>
       	</div>
      </div>
      <div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/searchDrugList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a onclick="clickPageNum('${p }', '${paging.cntPerPage }')" >${p }</a><!-- href="/searchDrugList?nowPage=${p }&cntPerPage=${paging.cntPerPage}" -->
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/searchDrugList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			
		</c:if>
	</div>
      </div>
      
	    
	    <div class="d-flex justify-content-center">
         <ul id="paging" class="pagination flex-wrap">
           
        </ul>
    </div>
	
    <!-- Javascript files-->
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