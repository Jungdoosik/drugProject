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
</style>
</head>

<script>
   $(function(){
	   if (window.innerWidth <= 800) {
	      $('#topTitle').css('display', 'none')
	      $('#middleTitle').css('padding-top', '15%')
	    }else if(window.innerWidth > 800){
	    	$('#topTitle').css('display', 'block')
	    	$('#middleTitle').css('padding-top', '0%')
	    	
	    }
	   
	// 페이지(page) 버튼 클릭 이벤트 처리
     const pageButtons = document.querySelectorAll('.page-item');
     pageButtons.forEach(function(button) {
       button.addEventListener('click', function(e) {
         const activePage = document.querySelector('.page-item.active');
         if (button !== activePage) {
           activePage.classList.remove('active');
           button.classList.add('active');
         }
       });
     });
      /*var xhrd = new XMLHttpRequest();
      var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03'; 
      var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D'; 
      queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('영신단'); 
      queryParamsd += '&' + encodeURIComponent('prduct') + '=' + encodeURIComponent('');  
      queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
      queryParamsd += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
      queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
      queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
      queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); 
      queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
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
      document.detailData.entpName.value = $('input[name="entpName' +itemSeq+ '"]').val()
      document.detailData.itemPermitDate.value = $('input[name="itemPermitDate' +itemSeq+ '"]').val()
      document.detailData.induty.value = $('input[name="induty' +itemSeq+ '"]').val()
      document.detailData.prdlstStdrCode.value = $('input[name="prdlstStdrCode' +itemSeq+ '"]').val()
      document.detailData.spcltyPblc.value = $('input[name="spcltyPblc' +itemSeq+ '"]').val()
      document.detailData.prductType.value = $('input[name="prductType' +itemSeq+ '"]').val()
      document.detailData.prductPrmisnNo.value = $('input[name="prductPrmisnNo' +itemSeq+ '"]').val()
      document.detailData.itemIngrName.value = $('input[name="itemIngrName' +itemSeq+ '"]').val()
      document.detailData.itemIngrCnt.value = $('input[name="itemIngrCnt' +itemSeq+ '"]').val()
      document.detailData.permitKindCode.value = $('input[name="permitKindCode' +itemSeq+ '"]').val()
      document.detailData.cancelDate.value = $('input[name="cancelDate' +itemSeq+ '"]').val()
      document.detailData.cancelName.value = $('input[name="cancelName' +itemSeq+ '"]').val()
      document.detailData.bigPrdtImgUrl.value = $('input[name="bigPrdtImgUrl' +itemSeq+ '"]').val()
      document.detailData.entpSeq.value = $('input[name="entpSeq' +itemSeq+ '"]').val()
      document.detailData.entpNo.value = $('input[name="entpNo' +itemSeq+ '"]').val()
      document.detailData.ediCode.value = $('input[name="ediCode' +itemSeq+ '"]').val()
      document.detailData.itemEngName.value = $('input[name="itemEngName' +itemSeq+ '"]').val()
      document.detailData.entpEngName.value = $('input[name="entpEngName' +itemSeq+ '"]').val()
      
      document.detailData.action = '/drugDetail'
      document.detailData.submit()
      
   }
   
   function searchDrugName() {
       document.searchForm.action = '/searchDrugNameList';
       document.searchForm.submit()

   }
   
   function clickPageNum(p, cntPerPage){
	   console.log(p)
	   console.log(cntPerPage)
	   
	   var params = {}
	   params['cntPerPage'] = cntPerPage
	   params['nowPage'] = p
	   params['searchName'] = document.searchForm.searchName.value
	   console.log(params)
	   $.ajax({
		   url: "/searchDrugNameListP",
			type: "POST",
			data: params,
			success: function(data) { 
				
				var body = ''
				var pageBody = ''
				var listArea = $('#listArea').children()
				var pageArea = $('#pageArea').children()
				listArea.remove()
				pageArea.remove()
				var item = data.list.items
				var paging = data.paging
				
				for(var i in item){
				   var list = item[i]
				   body = '<tr onclick="drugDetail(\'' + list.ITEM_SEQ  + '\')">'
				   body += '<td>' + list.ITEM_NAME + '</td>'
				   body += '<td style="text-align:center;">' + list.ITEM_SEQ + '</td>'
				   body += '</tr>'
				   body += '<input type="hidden" name="itemName' +list.ITEM_SEQ+ '" value="'+list.ITEM_NAME+'">'
				   body += '<input type="hidden" name="itemSeq' +list.ITEM_SEQ+ '" value="' +list.ITEM_SEQ+ '">'
				   body += '<input type="hidden" name="entpName' +list.ITEM_SEQ+ '" value="' +list.ENTP_NAME+ '">'
				   body += '<input type="hidden" name="itemPermitDate' +list.ITEM_SEQ+ '" value="' +list.ITEM_PERMIT_DATE+ '">'
				   body += '<input type="hidden" name="induty' +list.ITEM_SEQ+ '" value="' +list.INDUTY+ '">'
				   body += '<input type="hidden" name="prdlstStdrCode' +list.ITEM_SEQ+ '" value="' +list.PRDLST_STDR_CODE+ '">'
				   body += '<input type="hidden" name="spcltyPblc' +list.ITEM_SEQ+ '" value="' +list.SPCLTY_PBLC+ '">'
                   body += '<input type="hidden" name="prductType' +list.ITEM_SEQ+ '" value="' +list.PRDUCT_TYPE+ '">'
               	   body += '<input type="hidden" name="prductPrmisnNo' +list.ITEM_SEQ+ '" value="' +list.PRDUCT_PRMISN_NO+ '">'
           		   body += '<input type="hidden" name="itemIngrName' +list.ITEM_SEQ+ '" value="' +list.ITEM_INGR_NAME+ '">'
       			   body += '<input type="hidden" name="itemIngrCnt' +list.ITEM_SEQ+ '" value="' +list.ITEM_INGR_CNT+ '">'
  				   body += '<input type="hidden" name="permitKindCode' +list.ITEM_SEQ+ '" value="' +list.PERMIT_KIND_CODE+ '">'
  				   body += '<input type="hidden" name="cancelDate' +list.ITEM_SEQ+ '" value="' +list.CANCEL_DATE+ '">'
  				   body += '<input type="hidden" name="cancelName' +list.ITEM_SEQ+ '" value="' +list.CANCEL_NAME+ '">'
  				   body += '<input type="hidden" name="bigPrdtImgUrl' +list.ITEM_SEQ+ '" value="' +list.BIG_PRDT_IMG_URL+ '">'
  				   body += '<input type="hidden" name="entpSeq' +list.ITEM_SEQ+ '" value="' +list.ENTP_SEQ+ '">'
  				   body += '<input type="hidden" name="entpNo' +list.ITEM_SEQ+ '" value="' +list.ENTP_NO+ '">'
  				   body += '<input type="hidden" name="ediCode' +list.ITEM_SEQ+ '" value="' +list.EDI_CODE+ '">'
  				   body += '<input type="hidden" name="itemEngName' +list.ITEM_SEQ+ '" value="' +list.ITEM_ENG_NAME+ '">'
  				   body += '<input type="hidden" name="entpEngName' +list.ITEM_SEQ+ '" value="' +list.ENTP_ENG_NAME+ '">'
  				   
  					 $('#listArea').append(body)
				}
				pageBody =  '<ul class="pagination" style="justify-content: center; padding-top: 20px;">'
				if(paging.startPage != 1){
					pageBody += '<li class="page-item">'
					pageBody += ' <a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum(\'' + (paging.startPage-1) + '\', \'' + paging.cntPerPage + '\')" >&lt;</a>'<!-- href="/searchDrugList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"  -->
					pageBody += ' </li>'
				}
				for(var i = paging.startPage; i <= paging.endPage; i++){
					if(i == paging.nowPage){
						pageBody += '<li class="page-item  active"><a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum(\'' + i + '\' , \'' + paging.cntPerPage + '\')" >'+i+'</a></li>'
					}
					if(i != paging.nowPage){
						pageBody += '<li class="page-item" aria-current="page">'
						pageBody += '<a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum(\'' + i + '\' , \'' + paging.cntPerPage + '\')" >'+i+'</a>'
						pageBody += '</li>'
					}
				}
				if(paging.endPage != paging.lastPage){
					pageBody += '<li class="page-item">'
					pageBody += '<a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum(\'' + (paging.endPage+1) + '\' , \'' + paging.cntPerPage + '\')" >&gt;</a>' <!-- href="/searchDrugList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" -->
					pageBody += '</li>'
				}
				pageBody += '</ul>'
				
				$('#pageArea').append(pageBody)
				
			}
	   });
   }
</script>

<body>
	
	<form id="detailData" name="detailData" method="post">
      <input type="hidden" name="itemName" value="">
      <input type="hidden" name="itemSeq" value="">
      <input type="hidden" name="entpName" value="">
      <input type="hidden" name="itemPermitDate" value="">
      <input type="hidden" name="induty" value="">
      <input type="hidden" name="prdlstStdrCode" value="">
      <input type="hidden" name="spcltyPblc" value="">
      <input type="hidden" name="prductType" value="">
      <input type="hidden" name="prductPrmisnNo" value="">
      <input type="hidden" name="itemIngrName" value="">
      <input type="hidden" name="itemIngrCnt" value="">
      <input type="hidden" name="permitKindCode" value="">
      <input type="hidden" name="cancelDate" value="">
      <input type="hidden" name="cancelName" value="">
      <input type="hidden" name="bigPrdtImgUrl" value="">
      <input type="hidden" name="entpSeq" value="">
      <input type="hidden" name="entpNo" value="">
      <input type="hidden" name="ediCode" value="">
      <input type="hidden" name="itemEngName" value="">
      <input type="hidden" name="entpEngName" value="">
   </form>
	
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
                       <input type="text" name="searchName" class="form-control" placeholder="검색어를 입력하세요." value="${params.searchName }">
                       <button type="button" class="btn btn-primary" onclick="searchDrugName()"> Search</button>
                   </div>
               </form>
          </div><br>
       <div class="" id="abcde">
        <div class="row gy-4 d-flex justify-content-between">
          <table>
	          <colgroup>
			    <col width="60%" />
			    <col width=""  />
			  </colgroup>
          	  <thead>
		          <tr>
		            <th class="title">제품명</th>
		            <th class="title">번호</th>
		          </tr>
	          </thead>
	          <tbody id="listArea">
              <c:forEach var="list" items="${list.items }" varStatus="status">
	                <tr onclick="drugDetail(${list.ITEM_SEQ })">
	                   <c:choose>
					  	<c:when test = "${fn:contains(list.ITEM_NAME, '(수출명')}">
					  		<c:set var="itemName" value="${fn:substringBefore(list.ITEM_NAME,'(수출명')}" />
					  		<td>${itemName }</td>
					  	</c:when>
					  	<c:otherwise>
					  		<td>${list.ITEM_NAME }</td>
					  	</c:otherwise>
					  </c:choose>
	                   <td style="text-align:center;">${list.ITEM_SEQ }</td>
	                </tr>
                   <input type="hidden" name="itemName${list.ITEM_SEQ }" value="${list.ITEM_NAME }">
                   <input type="hidden" name="itemSeq${list.ITEM_SEQ }" value="${list.ITEM_SEQ }">
                   <input type="hidden" name="entpName${list.ITEM_SEQ }" value="${list.ENTP_NAME }">
                   <input type="hidden" name="itemPermitDate${list.ITEM_SEQ }" value="${list.ITEM_PERMIT_DATE }">
                   <input type="hidden" name="induty${list.ITEM_SEQ }" value="${list.INDUTY }">
                   <input type="hidden" name="prdlstStdrCode${list.ITEM_SEQ }" value="${list.PRDLST_STDR_CODE }">
                   <input type="hidden" name="spcltyPblc${list.ITEM_SEQ }" value="${list.SPCLTY_PBLC }">
                   <input type="hidden" name="prductType${list.ITEM_SEQ }" value="${list.PRDUCT_TYPE }">
                   <input type="hidden" name="prductPrmisnNo${list.ITEM_SEQ }" value="${list.PRDUCT_PRMISN_NO }">
                   <input type="hidden" name="itemIngrName${list.ITEM_SEQ }" value="${list.ITEM_INGR_NAME }">
                   <input type="hidden" name="itemIngrCnt${list.ITEM_SEQ }" value="${list.ITEM_INGR_CNT }">
                   <input type="hidden" name="permitKindCode${list.ITEM_SEQ }" value="${list.PERMIT_KIND_CODE }">
                   <input type="hidden" name="cancelDate${list.ITEM_SEQ }" value="${list.CANCEL_DATE }">
                   <input type="hidden" name="cancelName${list.ITEM_SEQ }" value="${list.CANCEL_NAME }">
                   <input type="hidden" name="bigPrdtImgUrl${list.ITEM_SEQ }" value="${list.BIG_PRDT_IMG_URL }">
                   <input type="hidden" name="entpSeq${list.ITEM_SEQ }" value="${list.ENTP_SEQ }">
                   <input type="hidden" name="entpNo${list.ITEM_SEQ }" value="${list.ENTP_NO }">
                   <input type="hidden" name="ediCode${list.ITEM_SEQ }" value="${list.EDI_CODE }">
                   <input type="hidden" name="itemEngName${list.ITEM_SEQ }" value="${list.ITEM_ENG_NAME }">
                   <input type="hidden" name="entpEngName${list.ITEM_SEQ }" value="${list.ENTP_ENG_NAME }">
             </c:forEach>
             <c:if test="${empty list.items }">
             	<tr style="text-align:center;">
             		<td colspan="2" >검색결과가 없습니다.</td>
             	</tr>
             </c:if>
             </tbody>
            </table>
       	</div>
      </div>
      <div style="display: block; text-align: center;" id="pageArea">		
		  <ul class="pagination" style="justify-content: center; padding-top: 20px;">
		  <c:if test="${paging.startPage != 1 }">
		    <li class="page-item disabled">
		      <a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum('${paging.startPage-1 }', '${paging.cntPerPage }')" tabindex="-1" aria-disabled="true">&gt;</a><!-- href="/searchDrugList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}"  -->
		    </li>
		    </c:if>
		    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
				    	<li class="page-item  active"><a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum('${p }', '${paging.cntPerPage }')" >${p }</a></li>
				    </c:when>
				    <c:when test="${p != paging.nowPage }">
					    <li class="page-item" aria-current="page">
					      <a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum('${p }', '${paging.cntPerPage }')" >${p }</a>
					    </li>
				    </c:when>
			    </c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
			    <li class="page-item">
			      <a class="page-link" style="cursor: pointer; padding: 5px 5px" onclick="clickPageNum('${paging.endPage+1 }', '${paging.cntPerPage }')" >&gt;</a><!-- href="/searchDrugList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" -->
			    </li>
		    </c:if>
		  </ul>
		</div>
		
      </div>
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