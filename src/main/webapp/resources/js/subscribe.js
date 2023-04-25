function iamport(){
	
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



function payment(index){

    if ($("#check-card").is(":checked") == false) {
        alert("카드결제에 동의해주세요.");
        return;
    }
    
	if (index == "0" && $("#check-free").is(":checked") == false) {
        alert("7일 100원 결제 체험 서비스 가입 동의 후 진행해 주세요.");
        return;
    }
   
	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	
	var phone = $('#phone').val();
	
	if(index=="0"){
		var itemPrice = 100;
	}else if (index =="1"){
		var itemPrice = 4900;
	}
	var itemTitle = "날씨모아 이용권 구매";
	
	d = new Date();
	var merchant_uid = "order" + d.getTime();
	var customer_uid = "cuid_" + d.getTime();
	
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
			$.ajax({
				type:'post',
				url:'/member/order',
				beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				headers:{
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"POST"
				},
				dataType:"text",
				data: JSON.stringify({
					id : phone,
					itemname : itemTitle,
					merchant_uid : merchant_uid,
					amount : itemPrice,
					cuid : customer_uid
				}),
				success:function(){
					basicModal("구독되었습니다.",function(){location.href="/main";});
				},
			});
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			basicModal(msg);
		}
	});
}

//체크박스 하나만
function checkLink(element) {
    const checkboxes = document.getElementsByName("check-link");
    for (var i = 0; i < checkboxes.length; i++)
        checkboxes[i].checked = false;
    
    element.checked = true;
	if (element.value == 0){
		index = 0;
		setPay(index);
	}else if (element.value == 1){
		index=1;
    	setPay(index);
	}
   
}

//7일결제 100원체크박스
function checkFree(element) {
    if (index != -1){
		alert(element.value);
	}
    
       setPay(index);
}

//카드결제 체크박스
function checkCard(element) {
    setPay(index);
}

function setPay(selected_index) {
    index = selected_index;

    if (index == "0") {
        $("#a-pay").html("선택상품 : 날씨모아"  + "<br>" + "<span style='text-decoration: line-through;'>" + 4900 + "원</span> &gt; 100원 결제하기</a>");
        $("#div-free").show();
    }
    else if (index == "1"){
            $("#a-pay").html("선택상품 : 날씨모아"  + "<br>" + 4900 + "원 결제하기</a>");
        	$("#div-free").hide();
    }

    $("#check-free").prop('checked', false);
   $("#a-pay").attr("href", "javascript:payment('"+ index + "');");
}
