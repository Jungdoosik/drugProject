<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

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
    	
    	/* var xhr1 = new XMLHttpRequest();
        var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnInq04'; 
        var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; 
        queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
        queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
        queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
        queryParamsd += '&' + encodeURIComponent('induty') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('spclty_pblc') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('prdlst_Stdr_code') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('prduct_prmisn_no') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('안중환'); 
        queryParamsd += '&' + encodeURIComponent('entp_seq') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('entp_no') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('item_ingr_name') + '=' + encodeURIComponent(''); 
        xhr1.open('GET', urld + queryParamsd);
        xhr1.onreadystatechange = function () {
            if (this.readyState == 4) {
                var tt1 = JSON.parse(this.responseText)
                console.log("04")
                console.log(tt1.body.items)
                
            }
        }; 

        xhr1.send('');
        
        
    	var xhr2 = new XMLHttpRequest();
        var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03'; 
        var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; 
        queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
        queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
        queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
        queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('안중환');
        queryParamsd += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('item_permit_date') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('entp_no') + '=' + encodeURIComponent(''); 
        queryParamsd += '&' + encodeURIComponent('bar_code') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('start_change_date') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('end_change_date') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('atc_code') + '=' + encodeURIComponent('');
        xhr2.open('GET', urld + queryParamsd);
        xhr2.onreadystatechange = function () {
            if (this.readyState == 4) {
                var tt1 = JSON.parse(this.responseText)
                console.log("pr03")
                console.log(tt1.body.items)
                
            }
        };

        xhr2.send('');
         
        
        var xhr3 = new XMLHttpRequest();
        var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtMcpnDtlInq03'; 
        var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; 
        queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
        queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); 
        queryParamsd += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json');  
        queryParamsd += '&' + encodeURIComponent('Entrps_prmisn_no') + '=' + encodeURIComponent('');
        queryParamsd += '&' + encodeURIComponent('Prduct') + '=' + encodeURIComponent('안중환');
        queryParamsd += '&' + encodeURIComponent('Entrps') + '=' + encodeURIComponent(''); 
        xhr3.open('GET', urld + queryParamsd);
        xhr3.onreadystatechange = function () {
            if (this.readyState == 4) {
                var tt1 = JSON.parse(this.responseText)
                console.log("mc03")
                console.log(tt1.body.items)
                
            }
        };

        xhr3.send('');
        
        var xhr4 = new XMLHttpRequest();
        var urld = 'http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01'; 
        var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; 
        queryParams += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent(''); 
        queryParams += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent(''); 
        queryParams += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
        queryParams += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
        queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('85'); 
        queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('300'); 
        queryParams += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); 
        queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); 
        xhr4.open('GET', urld + queryParams);
        xhr4.onreadystatechange = function () {
            if (this.readyState == 4) {
                var tt1 = JSON.parse(this.responseText)
                console.log("List01")
                console.log(tt1.body.items)
                
            }
        };

        xhr4.send(''); */
    })
         
    
    
   	    function searchDrugName() {
            if(document.frm.searchName.value == '') {
        		alert("검색어를 입력해주세요.")
        		return false
        	} 
            document.frm.action = '/searchDrugNameList';
            document.frm.submit()

        }
        
        function searchEvt(){
        	if(document.frm.searchName.value == '') {
        		alert("검색어를 입력해주세요.")
        		return false
        	}
        	
        	document.frm.action = '/searchDrugNameList';
            document.frm.submit()
        }
        
        function data(){
        	var xhr4 = new XMLHttpRequest();
            var urld = 'http://apis.data.go.kr/1471000/MdcinGrnIdntfcInfoService01/getMdcinGrnIdntfcInfoList01'; 
            var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D'; 
            queryParams += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent(''); 
            queryParams += '&' + encodeURIComponent('entp_name') + '=' + encodeURIComponent(''); 
            queryParams += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
            queryParams += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
            queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('33'); 
            queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('300'); 
            queryParams += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); 
            queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); 
            xhr4.open('GET', urld + queryParams);
            xhr4.onreadystatechange = function () {
                if (this.readyState == 4) {
                    /* console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText); */
                    var tt1 = JSON.parse(this.responseText)
                    console.log("List01  33")
                    console.log(tt1.body.items[0])
                    console.log(tt1.body.items.length)
                    
                    var params = {}
                    
                    for(var i = 0; i < tt1.body.items.length; i++){
                    	params['itemSeq'+i] = tt1.body.items[i].ITEM_SEQ
                    	params['itemName'+i] = tt1.body.items[i].ITEM_NAME
                    	params['entpSeq'+i] = tt1.body.items[i].ENTP_SEQ
                    	params['entpName'+i] = tt1.body.items[i].ENTP_NAME
                    	params['chart'+i] = tt1.body.items[i].CHART
                    	params['itemImage'+i] = tt1.body.items[i].ITEM_IMAGE
                    	params['printFront'+i] = tt1.body.items[i].PRINT_FRONT
                    	params['printBack'+i] = tt1.body.items[i].PRINT_BACK
                    	params['drugShape'+i] = tt1.body.items[i].DRUG_SHAPE
                    	params['colorClass'+i] = tt1.body.items[i].COLOR_CLASS1
                    	params['colorClasss'+i] = tt1.body.items[i].COLOR_CLASS2
                    	params['lineFront'+i] = tt1.body.items[i].LINE_FRONT
                    	params['lineBack'+i] = tt1.body.items[i].LINE_BACK
                    	params['lengLong'+i] = tt1.body.items[i].LENG_LONG
                    	params['lengShort'+i] = tt1.body.items[i].LENG_SHORT
                    	params['thick'+i] = tt1.body.items[i].THICK
                    	params['imgRegistTs'+i] = tt1.body.items[i].IMG_REGIST_TS
                    	params['classNo'+i] = tt1.body.items[i].CLASS_NO
                    	params['className'+i] = tt1.body.items[i].CLASS_NAME
                    	params['etcOtcName'+i] = tt1.body.items[i].ETC_OTC_NAME
                    	params['itemPermitDate'+i] = tt1.body.items[i].ITEM_PERMIT_DATE
                    	params['formCodeName'+i] = tt1.body.items[i].FORM_CODE_NAME
                    	params['markCodeFrontAnal'+i] = tt1.body.items[i].MARK_CODE_FRONT_ANAL
                    	params['markCodeBackAnal'+i] = tt1.body.items[i].MARK_CODE_BACK_ANAL
                    	params['markCodeFrontImg'+i] = tt1.body.items[i].MARK_CODE_FRONT_IMG
                    	params['markCodeBackImg'+i] = tt1.body.items[i].MARK_CODE_BACK_IMG
                    	params['changeDate'+i] = tt1.body.items[i].CHANGE_DATE
                    	params['markCodeFront'+i] = tt1.body.items[i].MARK_CODE_FRONT
                    	params['markCodeBack'+i] = tt1.body.items[i].MARK_CODE_BACK
                    	params['itemEngName'+i] = tt1.body.items[i].ITEM_ENG_NAME
                    	params['edlCode'+i] = tt1.body.items[i].EDI_CODE
                    }
                    
                    console.log(params)
                    $.ajax({
                    	type: 'post',
                        url : '/dataGogo',
                        data: params,
                        success : function(data){
                        }
                    })
                }
            };

            xhr4.send('');
        }
        
        
    </script>

</head>

<body>

<form id="aa" name="aa" method="post">
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
</form>

<%
// 세션값 가져오기
String id = (String) session.getAttribute("phone"); // Object 타입이므로 다운캐스팅
%>

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
            <button type="button" onclick="data()">데이타 넣기</button>
                <form id="frm" name="frm" method="post" data-aos="fade-up" data-aos-delay="200">
                    <div class="form-search d-flex align-items-stretch">
                        <input type="text" name="searchName" class="form-control" placeholder="검색어를 입력하세요." onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}">
                        <button type="button" class="btn btn-primary" onclick="searchDrugName()"> 검색</button>
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
