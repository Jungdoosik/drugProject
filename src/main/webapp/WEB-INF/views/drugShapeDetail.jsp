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
	
	function drugDetail(itemSeq, itemName){
		  document.detailData.itemName.value = itemName	      
		  document.detailData.itemSeq.value = itemSeq
	      
	      document.detailData.action = '/drugDetail'
	      document.detailData.submit()
	      
	   
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
	
	<form id="detailData" name="detailData" method="post">
      <input type="hidden" name="itemName" value="">
      <input type="hidden" name="itemSeq" value="">
   </form>
	<!-- drug_wrap -->
	<div class="drug_wrap">
		<!-- drugHeader -->
		<div class="drug_header drug_header_2" id="gnb">
			<div class="inner">
				<div class="main_title_wrap">
					<h2>상세정보</h2>
				</div>
				<div class="title" style="width: 100%;">
					<h4 class="popupConTitle">
						<strong>제품명 : </strong> ${params.itemName }<br>
					</h4>
				</div>
			</div>
		</div>
		<!-- //drugHeader -->
		<div class="drug_container" id="content" style="padding-top: 0px;">
			<!-- content -->
			<section class="drug_content"> <!-- ==========================================================  컨텐츠 시작  -->
			<div class="drug_info_mid">
				<div class="explan_right">
					<img style="width:100%; height:100%;" src="${params.itemImage }" alt="${params.itemName }"/>
				</div>
				<!--div class="info_sec notPkInfo scroll_00 pt35" id="scroll_98"-->
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_02">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h2 class="cont_title2 fl">기본정보</h2>
					</div>
					<div class="info_box" id="_ee_doc1" style="line-height: 30px;">
						<span class="content-text"><strong>제품명</strong> : ${params.itemName }</span> 
						<span class="content-text"><strong>업체명</strong> : ${params.entpName }</span>
						<span class="content-text"><strong>성상</strong> : ${params.chart }</span>
						<span class="content-text"><strong>모양</strong> : ${params.drugShape }</span>
						<span class="content-text"><strong>색상</strong> : ${params.colorClass1 }</span>
						<span class="content-text"><strong>분할선</strong> : 앞 : ${params.lineFront }, 뒤 : ${params.lineBack }</span>
						<span class="content-text"><strong>전문/일반</strong> : ${params.etcOtcName }</span>
						<span class="content-text"><strong>허가일</strong> : ${fn:substring(params.itemPermitDate,0,4) } - ${fn:substring(params.itemPermitDate,4,6) } - ${fn:substring(params.itemPermitDate,6,8) }</span>
						<span class="content-text"><strong>품목기준코드</strong> : ${params.itemSeq }</span>
						<span class="content-text"><strong>장축크기</strong> : ${params.lengLong }mm</span>
						<span class="content-text"><strong>단축크기</strong> : ${params.lengShort }mm</span>
						<span class="content-text"><strong>두께</strong> : ${params.thick }mm</span>
					</div>
				</div>
				<div class="info_sec _preview notPkInfo scroll_03" id="scroll_03">
					<div class="sec_top fr-on div_fr _preview_ee">
						<h3 class="cont_title2 fl">약 사용법</h3>
					</div>
					<div class="info_box" id="_ee_doc2">
	                  <button type="button" class="btn btn-primary" onclick="drugDetail('${params.itemSeq}', '${params.itemName }')" >제품정보</button>
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
				</div>
				<!-- / 문항2 / -->
				
				<!-- ==========================================================  이미지 샘플 End -->
				<!-- / 문항1 / -->
				<!-- / 문항2 / -->
				<!-- / 문항2 / -->
				<!-- / 문항3 / -->
				<!-- / 문항4 / -->
				<!-- / 문항5 / -->
				<!-- / 문항6 / -->
				<!-- / 문항7 / -->
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