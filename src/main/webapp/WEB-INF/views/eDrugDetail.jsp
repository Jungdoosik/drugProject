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
		
		/* var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList';
		var queryParams = '?' + encodeURIComponent('serviceKey') + '=wGR4f0Ag6dwaYjwXL5SgUnGgAEM2A24RAQeFZZBxvTfoWyadY%2B4h6x6LOkro%2FjqYv%2BwMfTiSW9vIrwGwrfjlKw%3D%3D';
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('100'); 
		queryParams += '&' + encodeURIComponent('entpName') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('itemName') + '=' + encodeURIComponent("${list.itemName}"); 
		queryParams += '&' + encodeURIComponent('itemSeq') + '=' + encodeURIComponent("${list.itemSeq}"); 
		queryParams += '&' + encodeURIComponent('efcyQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('useMethodQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('atpnWarnQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('atpnQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('intrcQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('seQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('depositMethodQesitm') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('openDe') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('updateDe') + '=' + encodeURIComponent(''); 
		queryParams += '&' + encodeURIComponent('type') + '=' + encodeURIComponent('json'); 
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		        
		        var tt1 = JSON.parse(this.responseText)
                console.log("04")
                console.log(tt1.body.items)
		    }
		};

		xhr.send(''); */
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
					<h2>e약은</h2>
				</div>
				<div class="title">
					<h4 class="popupConTitle">
						<strong>제품명 : ${list.itemName }</strong> <br>
						<strong>업체명 : ${list.entpName }</strong> <br>
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
				<div class="explan_img" id="scroll_98">
					<!--이미지 있음 -->
					<c:if test="${not empty list.itemImage }">
						<div class="explan_right">
							<!-- <img th:src="@{/resources/images/contents/sample.jpg}" th:alt="|${item.itemName} 낱알이미지|" /> -->
							<img style="width: 100%; heigth:100%;" src=${list.itemImage } alt=${list.itemName }/>
						</div>
					</c:if>
					<%-- <c:if test="${empty list.itemImage }">
						
					</c:if> --%>
					<div class="explan_left">
						<!--<p class="subj"></p>-->
						<p class="note">&quot;MedicineSearch&quot;는 일반소비자 눈높이에 맞춘 이해하기
							쉬운 의약품 정보 제공을 위해 마련된 의약품개요정보입니다. 의약품에 관한 모든 내용을 담고 있지 않으며 자세한 사항은
							식약처 의약품안전나라의 &quot;의약품상세정보&quot;를 참고하시기 바랍니다. 본 정보는 법적 효력을 가지는 것이
							아닙니다.</p>
					</div>
				</div>
				<!-- / 문항2 / -->
				<script>
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
                    </script>
				<!-- ==========================================================  이미지 샘플 End -->
				<c:if test="${not empty list.efcyQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_02">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">약의 효능</h3>
						</div>
						<div class="sec_top fr-on div_fr _preview_ee" style="padding-top: 15px;">
							<p>${list.efcyQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.useMethodQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">약의 사용법</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.useMethodQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.atpnWarnQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">사용전 알아야할 내용</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.atpnWarnQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.atpnQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">사용시 주의사항</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.atpnQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.intrcQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">사용기간 동안 주의할 점</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.intrcQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.seQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">나타날 수 있는 이상반응</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.seQesitm }</p>
						</div>
					</div>
				</c:if>
				<c:if test="${not empty list.depositMethodQesitm }">
					<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
						<div class="sec_top fr-on div_fr _preview_ee">
							<h3 class="cont_title2 fl">보관법</h3>
						</div>
						<div class="info_box" id="_ee_doc2">
							<p>${list.depositMethodQesitm }</p>
						</div>
					</div>
				</c:if>
			</div>
			</section>
			<!-- //content -->
		</div>
		<!-- //drug_container -->

		<div class="btn_area" style="text-align: center; margin-top: 10px;">
			<button type="button" class="btn btn-primary"
				title="닫기" onclick="history.back();">
				<span>닫기</span>
			</button>
		</div>
	</div>
</body>
</html>