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
   
   function drugShapeDetail(itemSeq){
	  document.detailData.itemSeq.value = $('input[name="itemSeq' +itemSeq+ '"]').val()
      document.detailData.itemName.value = $('input[name="itemName' +itemSeq+ '"]').val()
      document.detailData.entpSeq.value = $('input[name="entpSeq' +itemSeq+ '"]').val()
      document.detailData.entpName.value = $('input[name="entpName' +itemSeq+ '"]').val()
      document.detailData.chart.value = $('input[name="chart' +itemSeq+ '"]').val()
      document.detailData.itemImage.value = $('input[name="itemImage' +itemSeq+ '"]').val()
      document.detailData.printFront.value = $('input[name="printFront' +itemSeq+ '"]').val()
      document.detailData.printBack.value = $('input[name="printBack' +itemSeq+ '"]').val()
      document.detailData.drugShape.value = $('input[name="drugShape' +itemSeq+ '"]').val()
      document.detailData.colorClass1.value = $('input[name="colorClass1' +itemSeq+ '"]').val()
      document.detailData.colorClass2.value = $('input[name="colorClass2' +itemSeq+ '"]').val()
      document.detailData.lineFront.value = $('input[name="lineFront' +itemSeq+ '"]').val()
	  document.detailData.lineBack.value = $('input[name="lineBack' +itemSeq+ '"]').val()
      document.detailData.lengLong.value = $('input[name="lengLong' +itemSeq+ '"]').val()
      document.detailData.lengShort.value = $('input[name="lengShort' +itemSeq+ '"]').val()
      document.detailData.thick.value = $('input[name="thick' +itemSeq+ '"]').val()
      document.detailData.imgRegistTs.value = $('input[name="imgRegistTs' +itemSeq+ '"]').val()
      document.detailData.classNo.value = $('input[name="classNo' +itemSeq+ '"]').val()
      document.detailData.className.value = $('input[name="className' +itemSeq+ '"]').val()
      document.detailData.etcOtcName.value = $('input[name="etcOtcName' +itemSeq+ '"]').val()
      document.detailData.itemPermitDate.value = $('input[name="itemPermitDate' +itemSeq+ '"]').val()
      document.detailData.formCodeName.value = $('input[name="formCodeName' +itemSeq+ '"]').val()
      document.detailData.markCodeFrontAnal.value = $('input[name="markCodeFrontAnal' +itemSeq+ '"]').val()
      document.detailData.markCodeBackAnal.value = $('input[name="markCodeBackAnal' +itemSeq+ '"]').val()
      document.detailData.markCodeFrontImg.value = $('input[name="markCodeFrontImg' +itemSeq+ '"]').val()
      document.detailData.markCodeBackImg.value = $('input[name="markCodeBackImg' +itemSeq+ '"]').val()
      document.detailData.changeDate.value = $('input[name="changeDate' +itemSeq+ '"]').val()
      document.detailData.markCodeFront.value = $('input[name="markCodeFront' +itemSeq+ '"]').val()
      document.detailData.markCodeBack.value = $('input[name="markCodeBack' +itemSeq+ '"]').val()
      document.detailData.itemEngName.value = $('input[name="itemEngName' +itemSeq+ '"]').val()
      document.detailData.edlCode.value = $('input[name="edlCode' +itemSeq+ '"]').val()
      
      console.log(document.detailData.nowPage.value)
      console.log(document.detailData.cntPerPage.value)
      console.log(document.detailData.selectShape.value)
      console.log(document.detailData.selectColor.value)
      console.log(document.detailData.selectDrugForm.value)
      console.log(document.detailData.selectLine.value)
      
      //window.open('about:blank', 'winName', 'menubar=no, toolbar=no, location=no, scrollbars=yes, resizable=yes, top=, left=, width=800, height=850')
      document.detailData.action = '/drugShapeDetail'
	  //document.detailData.target='winName';
      document.detailData.submit()
      
   }
   
   function clickPageNum(p, cntPerPage){
	   console.log(p)
	   console.log(cntPerPage)
	  
	   var params = {}
	   params['cntPerPage'] = cntPerPage
	   params['nowPage'] = p
	   params['selectShape'] = '${params.selectShape}'
	   params['selectColor'] = '${params.selectColor}'
	   params['selectDrugForm'] = '${params.selectDrugForm}'
	   params['selectLine'] = '${params.selectLine}'
	   document.detailData.nowPage.value=p
	   document.detailData.cntPerPage.value=cntPerPage
	   
	   $.ajax({
		   url: "/searchDrugShapeListP",
			type: "POST",
			data: params,
			success: function(data) { 
				
				var body = ''
				var pageBody = ''
				var imgArea = $('#imgArea').children()
				var pageArea = $('#pageArea').children()
				imgArea.remove()
				pageArea.remove()
				var item = data.list
				var paging = data.paging
				
				for(var i in item){
				   var list = item[i]
				   	body = '<div onclick="drugShapeDetail(\'' + list.itemSeq  + '\')">'
			   		body += '<div style="width: 100%;">'
				   	body += '<img style="width: 100%; height: 100%;" src="' +list.itemImage+ '" alt="' +list.itemName+ '"/>'
				   	body += '</div>'
			   		body += '<div style="height: 50px; width: 100%; text-align: center; background: lightcoral; display: flex; justify-content: center; align-items: center;color: #eee;">' +list.itemName+ '</div>'
			        	
			        
		   			body += '<input type="hidden" name="itemSeq' +list.itemSeq+ '" value="' +list.itemSeq+'">'
	   				body += '<input type="hidden" name="itemName' +list.itemSeq+ '" value="'+list.itemName+'">'
   					body += '<input type="hidden" name="entpSeq' +list.itemSeq+ '" value="'+list.entpSeq +'">'
					body += '<input type="hidden" name="entpName' +list.itemSeq+ '" value="'+list.entpName +'">'
					body += '<input type="hidden" name="chart' +list.itemSeq+ '" value="'+list.chart +'">'
					body += '<input type="hidden" name="itemImage' +list.itemSeq+ '" value="'+list.itemImage +'">'
					body += '<input type="hidden" name="printFront' +list.itemSeq+ '" value="'+list.printFront +'">'
					body += '<input type="hidden" name="printBack' +list.itemSeq+ '" value="'+list.printBack +'">'
					body += '<input type="hidden" name="drugShape' +list.itemSeq+ '" value="'+list.drugShape +'">'
					body += '<input type="hidden" name="colorClass1' +list.itemSeq+ '" value="'+list.colorClass1 +'">'
					body += '<input type="hidden" name="colorClass2' +list.itemSeq+ '" value="'+list.colorClass2 +'">'
					body += '<input type="hidden" name="lineFront' +list.itemSeq+ '" value="'+list.lineFront +'">'
					body += '<input type="hidden" name="lineBack' +list.itemSeq+ '" value="'+list.lineBack +'">'
					body += '<input type="hidden" name="lengLong' +list.itemSeq+ '" value="'+list.lengLong +'">'
					body += '<input type="hidden" name="lengShort' +list.itemSeq+ '" value="'+list.lengShort +'">'
					body += '<input type="hidden" name="thick' +list.itemSeq+ '" value="'+list.thick +'">'
					body += '<input type="hidden" name="imgRegistTs' +list.itemSeq+ '" value="'+list.imgRegistTs +'">'
					body += '<input type="hidden" name="classNo' +list.itemSeq+ '" value="'+list.classNo +'">'
					body += '<input type="hidden" name="className' +list.itemSeq+ '" value="'+list.className +'">'
					body += '<input type="hidden" name="etcOtcName' +list.itemSeq+ '" value="'+list.etcOtcName +'">'
					body += '<input type="hidden" name="itemPermitDate' +list.itemSeq+ '" value="'+list.itemPermitDate +'">'
					body += '<input type="hidden" name="formCodeName' +list.itemSeq+ '" value="'+list.formCodeName +'">'
					body += '<input type="hidden" name="markCodeFrontAnal' +list.itemSeq+ '" value="'+list.markCodeFrontAnal +'">'
					body += '<input type="hidden" name="markCodeBackAnal' +list.itemSeq+ '" value="'+list.markCodeBackAnal +'">'
					body += '<input type="hidden" name="markCodeFrontImg' +list.itemSeq+ '" value="'+list.markCodeFrontImg +'">'
					body += '<input type="hidden" name="markCodeBackImg' +list.itemSeq+ '" value="'+list.markCodeBackImg +'">'
					body += '<input type="hidden" name="changeDate' +list.itemSeq+ '" value="'+list.changeDate +'">'
					body += '<input type="hidden" name="markCodeFront' +list.itemSeq+ '" value="'+list.markCodeFront +'">'
					body += '<input type="hidden" name="markCodeBack' +list.itemSeq+ '" value="'+list.markCodeBack +'">'
					body += '<input type="hidden" name="itemEngName' +list.itemSeq+ '" value="'+list.itemEngName +'">'
					body += '<input type="hidden" name="edlCode' +list.itemSeq+ '" value="'+list.edlCode +'">'
					body += '</div>'
  				   
  					 $('#imgArea').append(body)
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
   
   function searchDrugShape(){
	   location.href = "/searchDrugShape"
   }
</script>

<body>
	
	<form id="detailData" name="detailData" method="post">
      <input type="hidden" name="itemSeq" value="">
	<input type="hidden" name="itemName" value="">
	<input type="hidden" name="entpSeq" value="">
	<input type="hidden" name="entpName" value="">
	<input type="hidden" name="chart" value="">
	<input type="hidden" name="itemImage" value="">
	<input type="hidden" name="printFront" value="">
	<input type="hidden" name="printBack" value="">
	<input type="hidden" name="drugShape" value="">
	<input type="hidden" name="colorClass1" value="">
	<input type="hidden" name="colorClass2" value="">
	<input type="hidden" name="lineFront" value="">
	<input type="hidden" name="lineBack" value="">
	<input type="hidden" name="lengLong" value="">
	<input type="hidden" name="lengShort" value="">
	<input type="hidden" name="thick" value="">
	<input type="hidden" name="imgRegistTs" value="">
	<input type="hidden" name="classNo" value="">
	<input type="hidden" name="className" value="">
	<input type="hidden" name="etcOtcName" value="">
	<input type="hidden" name="itemPermitDate" value="">
	<input type="hidden" name="formCodeName" value="">
	<input type="hidden" name="markCodeFrontAnal" value="">
	<input type="hidden" name="markCodeBackAnal" value="">
	<input type="hidden" name="markCodeFrontImg" value="">
	<input type="hidden" name="markCodeBackImg" value="">
	<input type="hidden" name="changeDate" value="">
	<input type="hidden" name="markCodeFront" value="">
	<input type="hidden" name="markCodeBack" value="">
	<input type="hidden" name="itemEngName" value="">
	<input type="hidden" name="edlCode" value="">
	
	<input type="hidden" name="cntPerPage" value="10">
	<input type="hidden" name="nowPage" value="1">
	<input type="hidden" name="selectShape" value="${params.selectShape}">
	<input type="hidden" name="selectColor" value="${params.selectColor}">
	<input type="hidden" name="selectDrugForm" value="${params.selectDrugForm}">
	<input type="hidden" name="selectLine" value="${params.selectLine}">
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
                   <%-- <div class="form-search d-flex align-items-stretch mb-3">
                       <input type="text" name="searchName" class="form-control" placeholder="검색어를 입력하세요." value="${params.searchName }">
                       <button type="button" class="btn btn-primary" onclick="itemDataSearch()"> Search</button>
                   </div> --%>
               </form>
          </div><br>
       <div class="" id="abcde">
        	<div class="row gy-4 d-flex justify-content-between" id="imgArea">
        	<c:forEach var="list" items="${list }" varStatus="status">
        	<div onclick="drugShapeDetail(${list.itemSeq })">
		        <div style="width: 100%;">
		        	<img style="width: 100%; height: 100%;" src=${list.itemImage } alt=${list.itemName }/>
		        </div>
		        <div style="height: 50px; width: 100%; text-align: center; background: lightcoral; display: flex; justify-content: center; align-items: center;color: #eee;">
		        	${list.itemName }
		        </div>
                <input type="hidden" name="itemSeq${list.itemSeq }" value="${list.itemSeq }">
				<input type="hidden" name="itemName${list.itemSeq }" value="${list.itemName }">
				<input type="hidden" name="entpSeq${list.itemSeq }" value="${list.entpSeq }">
				<input type="hidden" name="entpName${list.itemSeq }" value="${list.entpName }">
				<input type="hidden" name="chart${list.itemSeq }" value="${list.chart }">
				<input type="hidden" name="itemImage${list.itemSeq }" value="${list.itemImage }">
				<input type="hidden" name="printFront${list.itemSeq }" value="${list.printFront }">
				<input type="hidden" name="printBack${list.itemSeq }" value="${list.printBack }">
				<input type="hidden" name="drugShape${list.itemSeq }" value="${list.drugShape }">
				<input type="hidden" name="colorClass1${list.itemSeq }" value="${list.colorClass1 }">
				<input type="hidden" name="colorClass2${list.itemSeq }" value="${list.colorClass2 }">
				<input type="hidden" name="lineFront${list.itemSeq }" value="${list.lineFront }">
				<input type="hidden" name="lineBack${list.itemSeq }" value="${list.lineBack }">
				<input type="hidden" name="lengLong${list.itemSeq }" value="${list.lengLong }">
				<input type="hidden" name="lengShort${list.itemSeq }" value="${list.lengShort }">
				<input type="hidden" name="thick${list.itemSeq }" value="${list.thick }">
				<input type="hidden" name="imgRegistTs${list.itemSeq }" value="${list.imgRegistTs }">
				<input type="hidden" name="classNo${list.itemSeq }" value="${list.classNo }">
				<input type="hidden" name="className${list.itemSeq }" value="${list.className }">
				<input type="hidden" name="etcOtcName${list.itemSeq }" value="${list.etcOtcName }">
				<input type="hidden" name="itemPermitDate${list.itemSeq }" value="${list.itemPermitDate }">
				<input type="hidden" name="formCodeName${list.itemSeq }" value="${list.formCodeName }">
				<input type="hidden" name="markCodeFrontAnal${list.itemSeq }" value="${list.markCodeFrontAnal }">
				<input type="hidden" name="markCodeBackAnal${list.itemSeq }" value="${list.markCodeBackAnal }">
				<input type="hidden" name="markCodeFrontImg${list.itemSeq }" value="${list.markCodeFrontImg }">
				<input type="hidden" name="markCodeBackImg${list.itemSeq }" value="${list.markCodeBackImg }">
				<input type="hidden" name="changeDate${list.itemSeq }" value="${list.changeDate }">
				<input type="hidden" name="markCodeFront${list.itemSeq }" value="${list.markCodeFront }">
				<input type="hidden" name="markCodeBack${list.itemSeq }" value="${list.markCodeBack }">
				<input type="hidden" name="itemEngName${list.itemSeq }" value="${list.itemEngName }">
				<input type="hidden" name="edlCode${list.itemSeq }" value="${list.edlCode }">
		    </div>
		   	</c:forEach>
		   	<c:if test="${empty list }">
		   		<div style="text-align:center; color:#ffffff;">
	             	<div >
	             		검색결과가 없습니다.
	             	</div>
	             	<button type="button" class="btn btn-primary" onclick="searchDrugShape()" style="width: 50%; margin-top:20px;">모양검색</button>
             	</div>
            </c:if>
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