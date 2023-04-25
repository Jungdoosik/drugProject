$(document).ready(function(){
});
	
if( $("check-link").is(":checked") == true ){
	var checkVal = $(this).val();
	log.info(checkVal);
}

//check
function checkLink(element) {
	//alert(element);
	const checkboxes = document.getElementsByName("check-link");
	for (var i = 0; i < checkboxes.length; i++) {
		checkboxes[i].checked = false;
	}
	element.checked = true;
}

function iamport(){
	//valid
	const query				= 'input[name="check-link"]:checked';
	const selectedEls		= document.querySelectorAll(query);
	// 선택된 목록에서 value 찾기
	let result = '';
	selectedEls.forEach((el) => {
		result += el.value + ' ';
	});
	/* 출력 */
	console.log("result : " + result);
	if (result == undefined || result == "") {
	return alert("결제하실 상품을 선택해주세요.");
	}
		
	var itemPrice = result;
	var itemTitle = "";
	if(result == 9900) {
		itemTitle		= "월정액 서비스";
		//rqstPeriod		= 30;
	} else if(result == 100) {
		itemTitle		= "7일 100원 결제 체험 서비스";
		//rqstPeriod		= 7;
	}
	
	d = new Date();
	var customer_uid = "cuid_" + d.getTime();
	var merchant_uid = "order" + d.getTime();
	
	IMP.init('imp28027601');
	IMP.request_pay({
		pg : 'danal_tpay.9810030929',
		pay_method : 'card',
		merchant_uid : merchant_uid,
		customer_uid : customer_uid,
		name : itemTitle,
		amount : itemPrice
	}, function(rsp) {
		if ( rsp.success ) {
			console.log(rsp)
			pass(rsp);
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
	});
}

/**
 * 결제 데이터 DB 저장
 */
function pass(rsp) {
	$.ajax({
		type: "post",
		url: "/paymentOk",
		data: {
			muid : rsp.merchant_uid,
			itemPrice : rsp.paid_amount,
			itemTitle : rsp.name
		},
		success: function (data) {
			console.log(data);
			if (data==1){
				// 실질적인 결제 및 정액제 유료회원 처리
				location.href='servicesJoinOk';
			}else {
				console.log("결제 정보 저장 실패");
				location.href='servicesJoin';
			}
		}
	});
}

// intro - iamport()
function iamport1(){
	
	var itemPrice = 100;
	var itemTitle = "MedicineSearch 이벤트인증";
	
	d = new Date();
	var customer_uid = "cuid_" + d.getTime();
	var merchant_uid = "order" + d.getTime();
	
	IMP.init('imp28027601');
	IMP.request_pay({
		pg : 'danal_tpay.9810030929',
		pay_method : 'card',
		merchant_uid : merchant_uid,
		customer_uid : customer_uid,
		name : itemTitle,
		amount : itemPrice
	}, function(rsp) {
		if ( rsp.success ) {
			console.log(rsp)
			var cuid = customer_uid
			var muid = merchant_uid
			var price = itemPrice
			var title = itemTitle
			openReg(cuid, muid, price, title);
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			basicModal(msg);
		}
	});
} 
