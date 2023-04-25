<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				
			}
		})
	}
</script>
<style>
body, html {
	min-width: 0px;
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

</style>
</head>
<body>
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
					<h2>상세정보</h2>
				</div>
				<div class="title">
					<h4 class="popupConTitle">
						<strong>제품명 : ${list.itemName }</strong> <br>
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
					<div class="info_box" id="_ee_doc1" style="line-height: 30px;">
						<span class="content-text"><strong>제품명</strong> : ${list.itemName }</span> 
						<span class="content-text"><strong>성상</strong> : ${body1.items[0].CHART }</span>
						<span class="content-text"><strong>업체명</strong> : ${body1.items[0].ENTP_NAME }</span>
						<span class="content-text"><strong>위탁제조업체</strong> :</span>
						<span class="content-text"><strong>전문/일반</strong> : ${body1.items[0].ETC_OTC_CODE }</span>
						<span class="content-text"><strong>허가일</strong> : ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,0,4) } - ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,4,6) } - ${fn:substring(body1.items[0].ITEM_PERMIT_DATE,6,8) }</span>
						<span class="content-text"><strong>품목기준코드</strong> : ${body1.items[0].ITEM_SEQ }</span>
						<span class="content-text"><strong>표준코드</strong> : ${body1.items[0].BAR_CODE }</span>
					</div>
				</div>
				<div class="explan_img" id="scroll_98">
					<!--이미지 있음 -->
					<div class="explan_left">
						<!--<p class="subj"></p>-->
						<p class="note">&quot;MedicineSearch&quot;는 일반소비자 눈높이에 맞춘 이해하기
							쉬운 의약품 정보 제공을 위해 마련된 의약품개요정보입니다. 의약품에 관한 모든 내용을 담고 있지 않으며 자세한 사항은
							식약처 의약품안전나라의 &quot;의약품상세정보&quot;를 참고하시기 바랍니다. 본 정보는 법적 효력을 가지는 것이
							아닙니다.</p>
					</div>
					<div class="explan_right">
						<!-- <img th:src="@{/resources/images/contents/sample.jpg}" th:alt="|${item.itemName} 낱알이미지|" /> -->
						<%-- <img width="220" height="130" src=${list.itemImage } alt=${list.itemName }/> --%>
					</div>
				</div>
				<!-- / 문항2 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">약 사용법</h3>
					</div>
					<div class="info_box" id="_ee_doc2">
						<button type="button" onclick="drugUse(${list.itemSeq})" >e약은요</button>
					</div>
				</div>
				<!-- <script>
                        $(function() {
                            $(window).on('load', function() {
                                explanImg();
                            });

                            $(window).on('resize', function() {
                                explanImg();
                            });
                        });

                        function explanImg() {
                            if ($(document).width() <= 768) {
                                var explanLeft = $('.explan_img .explan_left');
                                explanLeft.each(function() {
                                    $(this).parent('.explan_img').append(explanLeft);
                                });
                            } else {
                                var explanRight = $('.explan_img .explan_right');
                                explanRight.each(function() {
                                    $(this).parent('.explan_img').append(explanRight);
                                });
                            }
                        }
                    </script> -->
				<!-- ==========================================================  이미지 샘플 End -->
				<!-- / 문항1 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_02">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">원료약품 및 분량</h3>
						<!-- </div> -->
					</div>
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
                            <tr>
                                <th>순번</th>
                                <th>성분명</th>
                                <th>분량</th>
                                <th>단위</th>
                                <th>규격</th>
                                <th>성분정보</th>
                                <th>비교</th>
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
	                                <td style="text-align: left">${material2[2] }</td>
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
				<!-- / 문항2 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">효능효과</h3>
					</div>
					<div class="info_box" id="_ee_doc2">
					<c:set var="data1" value='${body1.items[0].EE_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
					<c:set var="eeDocData" value='${data1.replaceAll("효능효과"," ")}' />
						<p>${eeDocData }</p>
					</div>
				</div>
				<!-- / 문항2 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">용법용량</h3>
					</div>
					<div class="info_box" id="_ee_doc2">
					<c:set var="data2" value='${body1.items[0].UD_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
					<c:set var="udDocData" value='${data2.replaceAll("용법용량"," ")}' />
						<p>${udDocData }</p>
					</div>
				</div>
				<!-- / 문항3 / -->
				<!-- / 문항4 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_05">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">사용상의주의사항</h3>
					</div>
					<div class="info_box" id="_ee_doc4">
					<c:set var="data3" value='${body1.items[0].NB_DOC_DATA.replaceAll("[^가-힣]"," ")}' />
					<c:set var="nbDocData" value='${data3.replaceAll("사용상의주의사항"," ")}' />
						<p>${nbDocData }</p>
					</div>
				</div>
				<!-- / 문항5 / -->
				<!-- / 문항6 / -->
				<!-- / 문항7 / -->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_08">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">재심사, RMP, 보험, 기타정보</h3>
					</div>
					<div class="info_box" id="_ee_doc1" style="line-height: 30px;">
						<span class="content-text"><strong>저장방법</strong> : ${body1.items[0].STORAGE_METHOD }</span> 
						<span class="content-text"><strong>사용기간</strong> : ${body1.items[0].VALID_TERM }</span>
						<span class="content-text"><strong>재심사대상</strong> : ${body1.items[0].REEXAM_TARGET }</span>
						<span class="content-text"><strong>RMP대상</strong> :</span>
						<span class="content-text"><strong>포장정보</strong> : ${body1.items[0].PACK_UNIT }</span>
						<span class="content-text"><strong>보험약가</strong> : </span>
						<span class="content-text"><strong>ATC코드</strong> : ${body1.items[0].ATC_CODE }</span>
					</div>
				</div>
			</div>
			</section>
			<!-- //content -->
		</div>
		<!-- //drug_container -->

		<div class="btn_area" style="text-align: center; margin-top: 10px;">
			<button type="button" class="btn_normal btn_base btn_point3 s-bb"
				title="닫기" onclick="javascript:closeDrugInfoPopup()">
				<span>닫기</span>
			</button>
		</div>
	</div>
</body>
</html>