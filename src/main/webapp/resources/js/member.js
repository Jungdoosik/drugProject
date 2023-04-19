
/*
 * 회원가입
 */

function joinChk() {


	var form = $("#joinFrm");

	var phone = $("#phone").val();
	var pwd = $("#pwd").val();
	var pwdChk = $("#pwdChk").val();
	var email = $("#email").val();


	var val_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	var val_phone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
	var idStatus = "no";
	var val = true;

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

	if (phone == '' || pwd == '' || pwdChk == '' || email == '') {
		alert("모든 항목을 빈칸없이 작성해 주시기 바랍니다.");
		val = false;
	} else if (!val_phone.test(phone)) {
		alert("전화번호 양식에 맞춰 작성해 주시기 바랍니다.");
		val = false;
	} else if (!val_email.test(email)) {
		alert("이메일 양식에 맞춰 작성해 주시기 바랍니다.");
		val = false;
	} else if (pwd != pwdChk) {
		alert("입력하신 비밀번호와 비밀번호 확인이 상이합니다. 다시 확인하여 주시기 바랍니다.");
		val = false;
	} /*else if (idStatus == "no") {
		alert("중복된 아이디입니다.");
		val = false;
	} else if (idStatus == "del") {
		alert("탈퇴한 아이디입니다.(사용불가)");
		val = false;
	}*/

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
	
	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	
	var searchflag = $('#searchflag').val();
	var phone = $('#input-phone').val();
	
	if(phone.trim() == '') {
			 alert("핸드폰번호를 입력해주세요.");
			 return false;
		 } 
	
	$.getJSON("/member/nullCk/" + phone, function(data){
		
		console.log(data);
		
		if(data == 0){
			alert("가입된 회원이 아닙니다. 회원가입 먼저 하시기바랍니다.");
			return false;
		} else{
			$.ajax({
				type : 'Get', 
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET" 
				},
				contentType : "application/json",
				url : "/member/userFind",
				data : {
					searchflag : searchflag,
					phone : phone,
				},
				success : function(result){
					alert("인증번호가 문자로 발송되었습니다.");
					num = result;
				}
			});
		}
		
	});
	
	
}

/*
 * 인증번호 확인
 */
function confirmAuth(){
	
	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	var certificate = $('#input-certificate').val();
	
	var searchflag = $('#searchflag').val();
	var phone = $('#input-phone').val();
	
	var str;
	
	if(certificate.trim() == '') {
		 alert("인증번호를 입력하세요.");
		 return false;
	 } 
	
	if(searchflag == 'ID'){
		str = "가입하신 이메일이 문자로 발송되었습니다.";
	}else if (searchflag == 'PW'){
		str = "새로운 임시 비밀번호가 문자로 발송되었습니다.";
	}
	
	if(certificate == num){
			$.ajax({
				type : 'Get', 
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "GET" 
				},
				contentType : "application/json",
				url : "/member/userEmail",
				data : {
					searchflag : searchflag,
					phone : phone,
				},
				success : function(result){
					alert(str);
					window.close();
				}
			});
		
	}else {
		alert("인증번호가 다릅니다.");
		return false;
	}
}