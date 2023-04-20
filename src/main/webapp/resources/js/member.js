var dupVal = false;

/*
 * 아이디 중복 체크
 */
function dupCkh() {
	var phone = $("#phone").val();
	var idStatus = "no";

	if (phone == '') {
		alert("휴대전화번호를 입력해주세요.");
		return false;
	} 
	
	$.ajax({
		url: "joinChk.do",
		type: "POST",
		async: false,
		data: {
			phone: phone
		},
		success: function(data) {
			if (data == 0) {
				idStatus = "ok";
				alert("사용가능한 번호입니다.");
				dupVal = true;
			} else if (data == 2) {
				idStatus = "del";
				alert("탈퇴한 번호입니다.(사용불가)");
				dupVal = false;
			} else {
				idStatus = "no";
				alert("중복된 번호입니다.");
				dupVal = false;
			}
		}
	});
}



/*
 * 회원가입
 */

function joinChk() {


	var form = $("#joinFrm");
	var val = true;
	
	//var authReq = $("#authReq").val();
	//var authChk = $("#authChk").val();
	var phone = $("#phone").val();
	var pwd = $("#pwd").val();
	var pwdChk = $("#pwdChk").val();
	var email = $("#email").val();

	var val_phone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
	var val_pwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/;
	var val_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	

/*if (authReq== '' || authChk== '' || authReq== '0' || authChk== '0') {
	alert("휴대전화번호 인증 확인을 하셔야 가입이 진행됩니다.");
	val = false;
} else*/ 
	
	if (dupVal == false ) {
		alert("휴대전화번호 중복 체크를 진행해주시기 바랍니다.");
		val = false;
	} else if (phone == '' || pwd == '' || pwdChk == '' || email == '') {
		alert("모든 항목을 빈칸없이 작성해 주시기 바랍니다.");
		val = false;
	} else if (!val_phone.test(phone)) {
		alert("전화번호 양식에 맞춰 작성해 주시기 바랍니다.");
		val = false;
	} else if (!val_pwd.test(pwd)) {
		alert("비밀번호는 영문,숫자 포함 4글자 이상이어야 합니다.(특수문자/공백/한글 사용 금지)");
		val = false;
	} else if (!val_email.test(email)) {
		alert("이메일 양식에 맞춰 작성해 주시기 바랍니다.");
		val = false;
	} else if (pwd != pwdChk) {
		alert("입력하신 비밀번호와 비밀번호 확인이 상이합니다. 다시 확인하여 주시기 바랍니다.");
		val = false;
	}

	if (val == false) {
		return false;
	} else {
		  if (!confirm("작성한 내용으로 가입이 진행됩니다. 계속하시겠습니까? ")){ // 아니오
			    //history.go( -1 );
			 }else { // 예
				form.submit();
			}
	}
}

/*
 * 인증번호 발송
 */
function requestAuth(){
	
/*	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	
	var searchflag = $('#searchflag').val();*/
	var phone = $("#phone").val();
	
	if(phone.trim() == '') {
			 alert("핸드폰번호를 입력해주세요.");
			 return false;
		 } 
	
	
	var idStatus = "no";
	var val = true;
	// 휴대전화번호 중복(가입여부) 확인
	$.ajax({
		url: "joinChk.do",
		type: "POST",
		async: false,
		data: {
			phone: phone
		},
		success: function(data) {
			if (data == 0) {
				idStatus = "ok";
			} else if (data == 2) {
				idStatus = "del";
			} else {
				idStatus = "no";
			}
		}
	});
	
	if (idStatus == "no") {
		alert("중복된 아이디입니다.");
		val = false;
	} else if (idStatus == "del") {
		alert("탈퇴한 아이디입니다.(사용불가)");
		val = false;
	}
	
	if (val == false) {
		return false;
	} else {
		
		$.ajax({
			type : 'POST', 
			url : "/phoneCheck",
			data : {
				phone : phone,
			},
			success : function(result) {
				alert("인증번호가 문자로 발송되었습니다.");
				num = result;
				$('#authReq').attr('value', "1");
			},
			error : function() {
				alert("문자발송 error");
				//$('#authReq').attr('value', "0");
				$('#authReq').attr('value', "1");
				num = '0000';
			}
		});
		
	}
	
}

/*
 * 인증번호 확인
 */
function confirmAuth(){
	
/*	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	var certificate = $('#input-certificate').val();
	
	var searchflag = $('#searchflag').val();*/
	var authReq = $("#authReq").val();
	var phone = $("#phone").val();
	var authNum = $("#authNum").val();
	
	if (authReq== '' || authReq== '0') {
		alert("인증 요청 후 진행하시기 바랍니다.");
		return false;
	}else if (authNum.trim() == '') {
		alert("인증번호를 입력하세요.");
		return false;
	} 
	
	if (authNum == num){
		alert("인증번호가 정상적으로 확인되었습니다.");
		$('#authChk').attr('value', "1");
	}else {
		alert("인증번호가 다릅니다.");
		return false;
	}
}