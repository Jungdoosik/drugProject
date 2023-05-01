<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>상세보기</title>
<!-- style css -->
<link rel="stylesheet" type="text/css" href="resources/css/druginfo.css">

<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
   
   <!-- Vendor CSS Files -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="resources/vendor/aos/aos.css" rel="stylesheet">
   
   <!-- Template Main CSS File -->
    <link href="resources/css/main.css" rel="stylesheet">
   

<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   /* 팝업닫기 */
   function closeDrugInfoPopup() {
      //window.close();
      history.go(-1);
   }
   function decomposeFontSize($container) {
      var fontSize = $container.css('fontSize');
      return /([0-9.]+)([a-zA-Z]+)/g.exec(fontSize);
   }
   var scaleLevel = 3;
   function toggleFontSelector() {
      var $ele = $('.fontsize-selector');
      if ($ele.is(':visible')) {
         $ele.hide();
      } else {
         $ele.show();
      }
   }
   function scaleFontSizeOf(ele, selector, level) {
      var $ele = $(ele);
      $('.fontsize-selector a').removeClass('font-select');
      $ele.addClass('font-select');
      var scale = 1;
      if (level === 3) {
         var $container = $(selector);
         $container.find('*').each(function() {
            $(this).css({
               fontSize : '',
               lineHeight : ''
            });
         });
         $('.fontsize-selector').hide();
         return;
      }
      if (scaleLevel > level) {
         scale = scaleLevel - level;
         reduceFontSizeOf(selector, scale);
      } else if (scaleLevel < level) {
         scale = level - scaleLevel;
         enlargeFontSizeOf(selector, scale);
      }
      scaleLevel = level;
      $('.fontsize-selector').hide();
   }

   function enlargeFontSizeOf(selector, scale) {
      var $container = $(selector);
      $container.find('*').each(function() {
         var fs = decomposeFontSize($(this));
         if (fs[1] < 1) {
            return;
         }
         var sizeNum = Number(fs[1]) + scale * 2;
         $(this).css({
            fontSize : sizeNum + fs[2],
            lineHeight : sizeNum * 1.4 + fs[2]
         });
      });
   }

   function reduceFontSizeOf(selector, scale) {
      var $container = $(selector);
      $container.find('*').each(function() {
         var fs = decomposeFontSize($(this));
         if (fs[1] < 1) {
            return;
         }
         var sizeNum = Number(fs[1]) - scale * 2;
         $(this).css({
            fontSize : sizeNum + fs[2],
            lineHeight : sizeNum * 1.4 + fs[2]
         });
      });
   }
   
   function drugUse(itemSeq){
      
      
      $.ajax({
         url: "/drugUse",
         type: "POST",
         data: $('#drugUseForm').serialize(),
         success: function(data) { 
            
            if(data.result == 'Y'){
               var eDrugItem = data.list.items[0]
               document.eDrugForm.entpName.value = eDrugItem.entpName
               document.eDrugForm.itemName.value = eDrugItem.itemName
               document.eDrugForm.itemSeq.value = eDrugItem.itemSeq
               document.eDrugForm.efcyQesitm.value = eDrugItem.efcyQesitm
               document.eDrugForm.useMethodQesitm.value = eDrugItem.useMethodQesitm
               document.eDrugForm.atpnWarnQesitm.value = eDrugItem.atpnWarnQesitm
               document.eDrugForm.atpnQesitm.value = eDrugItem.atpnQesitm
               document.eDrugForm.intrcQesitm.value = eDrugItem.intrcQesitm
               document.eDrugForm.seQesitm.value = eDrugItem.seQesitm
               document.eDrugForm.depositMethodQesitm.value = eDrugItem.depositMethodQesitm
               document.eDrugForm.openDe.value = eDrugItem.openDe
               document.eDrugForm.updateDe.value = eDrugItem.updateDe
               document.eDrugForm.itemImage.value = eDrugItem.itemImage
               document.eDrugForm.action = '/eDrugDetail'
               document.eDrugForm.submit()
            }else{
               alert('데이터가 없습니다.')
            }
         }
      })
   }
</script>
<style>
body, html {
   min-width: 0px;
}
h3{
	color: #233c98;
	font-weight: bold;
}
.sec_top .cont_title2, .info_sec .cont_title2, .popAnchor_title h2 {
	color: #233c98;
}

.nav-down .main_title {
   display: none;
}

.nav-down .dr_warn_list {
   display: none;
}

#url-qrcode-wrap {
   position: relative;
   text-align: left;
   padding: 0;
   display: inline-block;
   min-width: 30px;
   height: 30px;
   line-height: 28px;
   vertical-align: middle;
}

#url-qrcode {
   height: 100%;
}
.content-text{
   display:block;
   margin-bottom:10px;
}

table{
	table-layout: fixed;
    word-wrap: break-word;
}

table th {
	word-wrap: inherit;
}

.thth{
	padding:0;
}

</style>
</head>
<body>
   <form id="eDrugForm" name="eDrugForm" method="post">
      <input type="hidden" name="entpName" value="">
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
   
   <form id="drugUseForm" name="drugUseForm" method="post">
      <input type="hidden" name="itemSeq" value="${list.itemSeq }">
      <input type="hidden" name="itemName" value="${list.itemName }">
   </form> 
   <!-- drug_wrap -->
   <div class="drug_wrap">
      <!-- drugHeader -->
      <div class="drug_header drug_header_2" id="gnb">
         <div class="inner">
            <div class="main_title_wrap">
               <h3>재품상세정보</h3>
            </div>
            <div class="title">
               <h4 class="popupConTitle">
                  <strong>제품명 : ${list.itemName }<%-- ${fn:substringBefore(list.itemName, '(수출')} --%></strong> <br>
               </h4>
            </div>
         </div>
      </div>
      <!-- //drugHeader -->
      <div class="drug_container" id="content" style="padding-top: 0px;">
         <!-- content -->
         <section class="drug_content"> <!-- ==========================================================  컨텐츠 시작  -->
         <div class="drug_info_mid">
            <!--div class="info_sec notPkInfo scroll_00 pt35" id="scroll_98"-->
            <div class="info_sec _preview notPkInfo scroll_03" id="scroll_02">
	               <div class="sec_top fr-on div_fr _preview_ee">
	                  <h2 class="cont_title2 fl">기본정보</h2>
	               </div>
	               
             	  <details open>
						<summary></summary>
							<p>
									<div class="info_box" id="_ee_doc1" style="line-height: 30px;">
										<span class="content-text"><strong>제품명</strong> : ${list.itemName }<%-- ${fn:substringBefore(list.itemName, '(수출')} --%></span> 
										<span class="content-text"><strong>성상</strong> : ${body1.items[0].CHART }</span>
										<span class="content-text"><strong>업체명</strong> : ${body1.items[0].ENTP_NAME }</span>
										<span class="content-text"><strong>위탁제조업체</strong> :</span>
										<span class="content-text"><strong>전문/일반</strong> : ${body1.items[0].ETC_OTC_CODE }</span>
										<span class="content-text"><strong>허가일</strong> : ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,0,4) } - ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,4,6) } - ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,6,8) }</span>
										<span class="content-text"><strong>품목기준코드</strong> : ${body1.items[0].ITEM_SEQ }</span>
										<span class="content-text"><strong>표준코드</strong> : ${body1.items[0].BAR_CODE }</span>
										<%-- <span class="content-text"><strong>표준코드</strong> : ${Arrays.toString(fn:split(list.BAR_CODE, ','))}</span> --%>
								</div>
							</p>
					</details>
				</div>
				
            
				<!-- / 문항 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">효능효과</h3>
					</div>
					
					<details open>
					<summary></summary>
						<p>
							<div class="info_box" id="_ee_doc2">
									<c:set var="data1" value='${body1.items[0].EE_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
									<c:set var="eeDocData" value='${data1.replaceAll("효능효과"," ")}' />
									<p>${eeDocData }</p>
							</div>
						</p>
					</details>
				</div>
            
           	<!-- / 문항 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">용법용량</h3>
					</div>
					<details>
						<summary></summary>
								<p>
									<div class="info_box" id="_ee_doc2">
											<c:set var="data2" value='${body1.items[0].UD_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
											<c:set var="udDocData" value='${data2.replaceAll("용법용량"," ")}' />
										<p>${udDocData }</p>
									</div>
								</p>
					</details>
				</div>
				
            
        
            
            <!-- / 문항1 / -->
           <div class="info_sec _preview notPkInfo scroll_03" id="scroll_02">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">원료약품 및 분량</h3>
						<!-- </div> -->
					</div>
					<details>
						<summary></summary>
							<p>
								<div class="sec_top fr-on div_fr _preview_ee" style="padding-top: 15px;">
										<c:set var="materialTitle" value="${fn:split(body1.items[0].MATERIAL_NAME ,';')}" />
										<c:set var="material" value="${fn:split(materialTitle[0] ,'|')}" />
										<c:set var="amount" value="${fn:split(material[0] ,' ')}" />
										<strong>${amount[2] }</strong>
								</div>
							
					
					
					<div class="info_box" id="_ee_doc1" style="margin-top:0px;">
						<table class="tb_base">
                            <colgroup>
                                <col style="width:5%;"> <!--순번-->
                                <col style="width:20%;"> <!--성분명-->
                                <col style="width:10%;"> <!--분량-->
                                <col style="width:15%;"> <!--단위-->
                                <col style="width:10%;"> <!--규격-->
                                <col style="width:20%;"> <!--성분정보-->
                                <col style="width:20%;"> <!--비교-->
                            </colgroup>
                            <thead>
                            <tr style="text-align: center;">
                                <th class="thth" style="padding:0px;">순번</th>
                                <th class="thth" style="padding:0px;">성분명</th>
                                <th class="thth" style="padding:0px;">분량</th>
                                <th class="thth" style="padding:0px;">단위</th>
                                <th class="thth" style="padding:0px;">규격</th>
                                <th class="thth" style="padding:0px;">성분정보</th>
                                <th class="thth" style="padding:0px;">비교</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="materialName" value="${fn:split(body1.items[0].MATERIAL_NAME ,';')}" />
                            <c:forEach var="materialName" items="${materialName}" varStatus="g">
                            <c:set var="materialNam" value="${fn:split(materialName ,'|')}" />
                            <c:set var="material1" value="${fn:split(materialNam[0] ,' ')}" />
                            <c:set var="material2" value="${fn:split(materialNam[1] ,' ')}" />
                            <c:set var="material3" value="${fn:split(materialNam[2] ,' ')}" />
                            <c:set var="material4" value="${fn:split(materialNam[3] ,' ')}" />
                            <c:set var="material5" value="${fn:split(materialNam[4] ,' ')}" />
                            <c:set var="material6" value="${fn:split(materialNam[5] ,' ')}" />
                            <c:set var="material7" value="${fn:split(materialNam[6] ,' ')}" />
	                            <tr>
	                                <td style="text-align: center">${g.count }</td>
	                                <td style="text-align: center">${material2[2] }</td>
	                                <td style="text-align: center">${material3[2] }</td>
	                                <td style="text-align: center">${material4[2] }</td>
	                                <td style="text-align: center">${material5[2] }</td>
	                                <td style="text-align: left">${material6[2] }</td>
	                                <td style="text-align: left">${material7[2] }</td>
	                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
					</div>
					<div style="margin-top:10px;">
						<strong>첨가제 : ${body1.items[0].INGR_NAME }</strong>
					</div>
				</div>
				</p>
				</details>
            
            
           <!-- / 문항 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_05">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">사용상의주의사항</h3>
					</div>
					
					<details>
						<summary></summary>
							<p>
								<div class="info_box" id="_ee_doc4">
										<c:set var="data3" value='${body1.items[0].NB_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
										<c:set var="nbDocData" value='${data3.replaceAll("사용상의주의사항"," ")}' />
										<p>${nbDocData }</p>
								</div>
							</p>		
					</details>
				</div>
				
            <!-- / 문항 / -->
						<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
								<div class="sec_top fr-on div_fr _preview_ee">
										<h3 class="cont_title2 fl">약 사용법</h3>
								</div>
									<div class="info_box" id="_ee_doc2">
					                 	 <button type="button" class="btn btn-primary" onclick="drugUse(${list.itemSeq})" >e약은요</button>
					               </div>
						</div>
			
					<!-- / 문항 / -->
					<!-- <div class="explan_img" id="scroll_98">
						<div class="explan_left">
						<details>
						<summary><strong>주의사항</strong></summary>
										<p >
										일반적으로 의약품에 동봉된 첨부문서에는 ‘원료약품 및 그 분량’, ‘효능·효과’, ‘용법·용량’, ‘사용상의 주의사항’ 등 여러 가지 의약품 안전사용에 대한 내용이 기재되어 있으므로 의약품을 복용하기 전에 꼼꼼히 읽어보고 해당사항이 있는지를 체크해야 합니다.<br>
										<br>
										첨부문서의 내용에서 ‘사용상의 주의사항’ 등은 개인의 상황에 따라 달라질 수 있으므로 의문점이 있는 경우 전문가와 상의하는 것이 좋습니다.<br>
										<br>
										의약품을 보관 할 때는 반드시 외부 포장(용기)과 첨부문서를 반드시 함께 보관해야 합니다. 만약 의약품의 첨부문서를 잃어버린 경우 제품명, 성분명 등의 검색을 통해 효능효과, 용법용량, 사용상의 주의사항 등 해당 내용을 확인할 수 있습니다.<br>
										<br>
										의약품 낱알상태에서 육안으로 다른 의약품과 구별할 수 있도록 모양, 색깔, 마크, 문자 등으로 구분할 수 있는 정보를 검색할 수 있습니다.<br>
										<br>
										<br>
										<strong>▣ 의약품 첨부문서 기재내용</strong><br>
										<br>
										 <strong>▴ 원료약품 및 분량</strong><br>
										<br>
										  - 제형의 최소 단위에 포함된 성분과 그 함유량으로 정제, 캡슐제 등은 1정/1캡슐당, 액제 등은 100mL당 들어있는 각각의 성분의 양이 표시됩니다.<br>
										  - 주성분으로 표기된 성분은 직접 효능·효과를 나타내는 것이며 한가지 또는 두가지 이상일 수 있습니다.<br>
										  - 주성분 외 첨가되는 성분들은 주로 안정화, 착색 등의 목적으로 의약품에 첨가하는 것입니다.<br>
										<br>
										 <strong>▴ 성상</strong><br>
										<br>
										  - 의약품의 외형적인 모습을 표기한 것으로 색, 형상, 제형을 나타냅니다.<br>
										  - 실제 성상이 표기 내용과 다른 의약품은 이상이 있거나 변질된 것일 수 있으므로 의약품은 복용해서는 안 됩니다.<br>
										<br>
										 <strong>▴ 효능효과</strong><br>
										<br>
										  - 의약품의 효능효과를 나타내는 대상 질환이나 증상을 의미합니다.<br>
										<br>
										 <strong>▴ 용법용량</strong><br>
										<br>
										  - 의약품을 안전하게 사용하기 위하여 복용해야 하는 양 또는 방법을 나타낸 것입니다. 일부 의약품은 나이나 체중에 따라 가감해서 사용토록 상세히 표시하고 있으므로 이러한 내용에 해당하는 경우 반드시 따라야 합니다.<br>
										<br>
										 <strong>▴ 사용상의 주의사항</strong><br>
										<br>
										  - 사용상 주의사항은 다음의 순서로 기재되어 있습니다.<br>
										<br> 
										  <strong> ☞ 경고</strong>, 투여하지 않아야 하는 경우, 신중히 투여해야 하는 경우, 부작용(이상반응), 일반적 주의사항, 상호작용, 임부 및 수유부에 대한 투여, 소아에 대한 투여, 과량 투여시 처치, 적용상의 주의사항, 보관·취급상의 주의사항 등<br>
										  - 자신에게 해당하는 경우 의사 또는 약사와 상담하시기 바랍니다.<br>
										<br>
										<strong> ▴ 저장방법</strong><br>
										<br>
										  - 의약품 유통 중에 품질을 유지하기 위한 보관조건 및 저장방법이 기재되어 있습니다. 특히, 냉장보관 의약품은 냉장의 조건 보관하도록 주의하여야 합니다.<br>
										  - 가정 내 의약품을 보관하는 경우에도 저장방법을 지켜 품질을 유지해야 합니다.<br>
										<br>
										</p>
									</details>
							<div>
									<details>
				            		<summary><strong>알아둬야 할 점</strong></summary>
				            		<p>
					            		많은 정보가 공유되는 요즘에도 약은 무조건 ‘하루 세 번, 식사 후에’라고 생각해 잘못된 용법과 횟수대로 의약품을 복용하는 사람을 자주 봅니다. 그러나 의약품에 따라서는 식사 후에 먹어야 하는 경우, 식사 전에 먹어야 하는 경우, 공백(배 속에 음식물이 비어있는 경우)에 먹어야 하는 경우, 일정한 시간 간격을 두고 먹어야 하는 경우 등 다양하며 전문가의 도움과 지시에 따라 복용시간을 엄수해야 효과를 최대한 발휘할 수 있습니다.<br>
										<br>
										의약품이 우리 몸에 들어가고 나오는 과정을 4단계로 분류할 수 있는데 이를 ‘흡수-분포-대사-배설’과정이라고 부릅니다. 의약품을 삼키면 우리 몸은 흡수하기 쉽게 받아들이고, 필요한 곳으로 옮겨주는 배분작용을 합니다. 그 다음 기능이 제대로 발휘 할 수 있도록 대사작용을 거치고 역할을 모두 마치면 몸 밖으로 빠져나옵니다. 그런데 이 과정이 진행되는 시간은 의약품마다 다릅니다. 그래서 어떤 의약품은 하루에 세 번 먹어야 하고, 어떤 의약품은 하루에 한 번만 먹으면 되는 차이점이 생깁니다.<br>
										<br>
										의약품을 통한 치료율 향상을 위하여 의약품을 안전하게 사용하기 위해 의약품 복용법을 정확하게 숙지하는 것이 필요합니다. 만약 복용을 잊었다가 뒤늦게 생각나는 경우엔 대부분 즉시 복용하는 것이 좋으나 한번에 2회분을 복용하는 것은 절대 금물입니다. 만약 복용 시간에 가까워졌다면 이미 놓친 양은 생략을 하고 규칙적으로 다시 시작점을 잡는 것이 바람직합니다.<br>
										<br>
										<strong>▣ 일반적인 의약품 복용시간</strong><br>
										<br>
										 <strong>▴ 식사 후 복용 (식사 후 30분)</strong><br>
										<br>
										  - 섭취한 음식이 위점막을 보호하여 속쓰림이 덜하기 때문에, 위장장애를 일으킬 수 있는 의약품의 경우 식사 후에 복용하도록 합니다.<br>
										  - 하루에 3번 복용하는 의약품의 겨웅, ‘식사 후 30분’을 기본 복용법으로 하는 것은 일정 시간대를 정해 놓아 규칙적으로 의약품을 복용하고, 복용을 잊지 않기 위해서 식사 기간을 이용하는 것이기도 합니다.<br>
										  - 식사 후 30분에 복용해야 하는 의약품을 소염진통제, 복합소화제(식사 후 또는 공복), 일부 비타민제 등이 있습니다.<br>
										<br>
										 <strong>▴ 식사 후 즉시 복용</strong><br>
										<br>
										  - 위장장애가 있는 의약품이나, 음식과 함께 흡수 될 때 더 좋은 효과를 나타내는 의약품, 식사직후의 위 상태에서 흡수가 더 잘 되는 의약품은 식사직후에 복용합니다.<br>
										  - 철분제제 및 항진균제 등은 식사 직후 즉시 복용하는 것이 좋습니다.<br>
										<br>
										 <strong>▴ 공복 시 복용 (식사와 식사 사이, 식사 후 2~3시간 후 위가 비어있는 경우)</strong><br>
										<br>
										  - 음식과의 상호작용으로 흡수에 영향을 받는 의약품의 경우 약효가 감소되는 것을 최소화하고 약효를 빨리 나타나게 하는 경우에는 공복에 복용합니다.<br>
										  - 이런 의약품들은 다른 의약품을 감싸고 흡착하는 성질이 있어 공복에 복용하여야 하며, 다른 의약품과 함께 복용해서는 안 됩니다.<br>
										  - 제산제 또는 액제로 된 지사제는 식사 후 한두 시간 뒤 공복에 복용하는 것이 가장 효과가 좋습니다.<br>
										<br>
										 <strong>▴ 식사 전 복용 (식사 30분~60분 전)</strong><br>
										<br>
										  - 식사에 의해 흡수가 방해되는 의약품이나 식사 전에 복용할 때 더 좋은 효과를 나타내는 의약품은 식사 전에 복용하여야 합니다.<br>
										  - 당뇨병 약 중 인슐린 분비를 촉진하는 약, 식용촉진제, 식용억제제, 구토억제제 및 정장제, 구충제, 위산분비억제제 등은 식사 전에 복용합니다.<br>
										<br>
										 <strong>▴ 일정시간 간격으로 복용</strong><br>
										<br>
										  - 식사의 여부와 상관없이 인체 내 약물농도가 일정하게 유지되어야 하는 의약품으로 일정간격으로 복용해야 하는 의약품으로 항생제, 화학요법제 등의 항암제, 항균제 등이 해당합니다.<br>
										<br>
										<strong> ▴ 필요시 복용</strong><br>
										<br>
										  - 증상이 나타날 때에만 복용이 필요한 의약품으로 해열제, 수면제, 진통제, 항불안약, 항협심증약 등이 있습니다.<br>
									</p>
		            	</details>
		            	</div>
					</div>
				<div>
				</div>
				
					</div> -->
            
            	<!-- / 문항 / -->
            	
         </div>
         </section>
         <!-- //content -->
      </div>
      <!-- //drug_container -->

      <div class="btn_area" style="text-align: center; margin-top: 10px;">
         <button type="button" class="btn btn-primary"
            title="닫기" onclick="history.back()">
            <span>닫기</span>
         </button>
      </div>
      <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>
   </div>
   <div id="preloader"> </div>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>
   
</body>
</html>