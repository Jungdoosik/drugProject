<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
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
   <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
      media="screen">
</head>

<script>
	$(function(){
		 
		
		
		var xhrd = new XMLHttpRequest();
		var urld = 'http://apis.data.go.kr/1471000/DrugPrdtPrmsnInfoService04/getDrugPrdtPrmsnDtlInq03'; /*URL*/
		var queryParamsd = '?' + encodeURIComponent('serviceKey') + '='+'yokAkHtjTw0vyvU9zRTnifTovmWD2Zl8cR57jk85VMqARcRRe%2Fdbu%2B1Agt%2BN%2FU7SXynB4NukTFd4qE4k5%2FMGRQ%3D%3D'; /*Service Key*/
		queryParamsd += '&' + encodeURIComponent('item_name') + '=' + encodeURIComponent('영신단');
		/* queryParamsd += '&' + encodeURIComponent('prduct') + '=' + encodeURIComponent('');  */
		/* queryParamsd += '&' + encodeURIComponent('item_seq') + '=' + encodeURIComponent(''); 
		queryParamsd += '&' + encodeURIComponent('img_regist_ts') + '=' + encodeURIComponent(''); 
		queryParamsd += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
		queryParamsd += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
		queryParamsd += '&' + encodeURIComponent('edi_code') + '=' + encodeURIComponent(''); */
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
	
	function drugDetail(itemSeq){
		console.log("asdasd")
		console.log("asdasd")
		console.log("asdasd")
		console.log("asdasd")
		console.log("asdasd")
		console.log("asdasd")
		console.log("asdasd")
		/* return false */
		document.frm.itemName.value = $('input[name="itemName' +itemSeq+ '"]').val()
		document.frm.itemSeq.value = $('input[name="itemSeq' +itemSeq+ '"]').val()
    	document.frm.efcyQesitm.value = $('input[name="efcyQesitm' +itemSeq+ '"]').val()
    	document.frm.useMethodQesitm.value = $('input[name="useMethodQesitm' +itemSeq+ '"]').val()
    	document.frm.atpnWarnQesitm.value = $('input[name="atpnWarnQesitm' +itemSeq+ '"]').val()
    	document.frm.atpnQesitm.value = $('input[name="atpnQesitm' +itemSeq+ '"]').val()
    	document.frm.intrcQesitm.value = $('input[name="intrcQesitm' +itemSeq+ '"]').val()
    	document.frm.seQesitm.value = $('input[name="seQesitm' +itemSeq+ '"]').val()
    	document.frm.depositMethodQesitm.value = $('input[name="depositMethodQesitm' +itemSeq+ '"]').val()
    	document.frm.openDe.value = $('input[name="openDe' +itemSeq+ '"]').val()
    	document.frm.updateDe.value = $('input[name="updateDe' +itemSeq+ '"]').val()
    	document.frm.itemImage.value = $('input[name="itemImage' +itemSeq+ '"]').val()
		document.frm.action = "/detail"
		document.frm.submit()
		
	}
</script>

<body>
    <!-- header section start -->
	<jsp:include page="common/header.jsp" />
    <!-- header section end -->
    <!-- contact section start -->
    <form id="frm" name="frm" method="post">
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
    
	    <div class="contact_section layout_padding" id="abcde">
		    <table>
		    	<c:forEach var="list" items="${list.items }" varStatus="status">
		    		<tr onclick="drugDetail(${list.itemSeq })">
			    		<th>제품명</th>
			    		<td>${list.itemName }</td>
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
    <!-- contact section end -->
    <!-- footer section start -->
    <jsp:include page="common/footer.jsp" />
    <!-- footer section end -->
    <!-- Javascript files-->
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.0.0.min.js"></script>
    <script src="resources/js/plugin.js"></script>
    <!-- sidebar -->
    <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="resources/js/custom.js"></script>
    <!-- javascript -->
    <script src="resources/js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
</body>

</html>