$(function(){
	//서비스 해지
	$('.serviceCancel').on('click',function(){
		var csrfHeaderName = $('#csrfHeaderName').val();
		var csrfTokenValue = $('#csrfTokenValue').val();

		var id = $(this).val();
		
		var seq = $(this).attr('seq');
		//여기다가 서비스 해지 함수
		$.ajax({
			type : 'GET', 
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			header : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "GET" 
			},
			contentType : "application/json",
			url : "/member/adminSubCancel",
			data : {
				"id" : id
			},
			async : false,
			success : function(result){
				if(result == 'SUCCESS'){
					$('#seq').val(seq);
					answer1('서비스 해지 및 답변 등록이 완료되었습니다.','CS');
				}
			}
		});
	})
	
});

//목록 버튼 클릭시 
function golist(){
	 $("#list").show();   //목록 화면 
	 $('#detail').hide(); //상세 화면 
	 $('#regform').hide(); //답변하기 화면 
}

//상세 보기
function detail(seq){
	var url = '/detail/';
 	
 	 var str = "";
 	 var str1 = "";
 	 
	$.getJSON(url + seq, function(data){
		
		if(data.delyn == 'Y'){
			basicModal("현재 게시글은 삭제된 게시글입니다.");
			return;
		}
		
		if(!data.answer){
			str += "※ 현재 등록된 답변이 없습니다. ※";
			str1 += "<input type='text' class='form-control-sm' value='처리중' style='font-weight:bold;color:red;text-align:center;' readonly>"
			
			$("#answer").text(str);
			$("#result").html(str1);
		} else{
			
			str1 += "<input type='text' class='form-control-sm' value='답변완료' style='font-weight:bold;color:blue;text-align:center;' readonly>"
			
			$("#answer").html(data.answer);
			$("#result").html(str1);
		}

		$("#etitle").val(data.title);
		$("#eqdate").val(data.qdate);
		$("#question").html(data.question);
		
		$("#list").hide();
 		$('#detail').show();
	});
};

//답변하기 
function regist(seq){
	var url = '/detail/';
	
	$.getJSON(url + seq, function(data){
		console.log(data);
		if(data.delyn == 'Y'){
			basicModal("현재 게시글은 삭제된 게시글입니다.");
			return false;
		}
		
		$("#seq").val(seq);
		$("#title").val(data.title);
		$("#writer").val(data.writer);
		$("#rquestion").text(data.question);
		
		$("#list").hide();
		$('#regform').show();
	});
}

function answer1(message,type){
	
	var url = '';
	var answer='';
	
	if(type =='CS'){
		url = '/answerCS/';
		answer = '서비스 해지가 완료되었습니다';
		
	} 
	else if(type =='ENQ'){
		url = '/answer/';
		answer = $('textarea[name=answer]').val();
	} 
	
	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	
	var seq = $('#seq').val();
	
	if(answer.trim() == ''){
		alert('답변을 작성해주십시오');
		return false;
	}
	
	alert(url + seq);
	$.ajax({
		type : 'PATCH', 
		url : url + seq,
		header : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PATCH" 
		},
		contentType : "application/json",
		data : JSON.stringify({
			answer:answer
			}),
		dataType : 'text',
		success : function(result){
			alert(' 답변 쓰기 성공');
			if(result == 'SUCCESS'){
				basicModal(message,function(){location.reload();});
			}
		}
	});		
	
	alert('2222');
}
// 문의삭제 기능 
function eDelete(seq){
	var url = '/delete/';
	
	var csrfHeaderName = $('#csrfHeaderName').val();
	var csrfTokenValue = $('#csrfTokenValue').val();
	
	$.ajax({
		type : 'patch', 
		url : url + seq,
		beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
		header : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PATCH" 
		},
		contentType : "application/json",
		data : JSON.stringify({
			seq:seq
			}),
		dataType : 'text',
		success : function(result){
			if(result == 'SUCCESS'){
				basicModal("문의글이 삭제되었습니다.");
			}
		}
	});	
	
}

function paylist(id){
	
	let popOption = "width= 650px, height=350px, top=300px, left=300px, scrollbars=yes";
	let openUrl = '/paylist/' + id;
	
	window.open(openUrl, 'pop', popOption);
}
