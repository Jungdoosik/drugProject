
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

	/*$.ajax({
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
	});*/

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
