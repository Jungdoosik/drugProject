

				/*
					작성내용 : modal 공용 스크립트
				*/

				$(document).ready(function(){
						
						$('.modal').modal({backdrop: 'static', keyboard: false}) ; //모달창 밖에 화면 누를시에 꺼지지않게하는것
						modalClose();//모달창 닫기
				
				})
				

				/*
					작 성 내 용 : (공용) 모든 modal 창 닫기 버튼 
				*/
				function modalClose(){
						 $(".close").on("click",function(){
							 //해당 모달 창만 닫히도록 수정 / 2022-12-14
							 $('.alert').modal("hide");
						 })
				}
				
				/*
					작 성 내 용 : (공용)기본 modal창 띄우기 msg : 모달창안에 내용 넣기
				*/
				function basicModal(msg,event){
					//기본 모달 보여주기
					$('#basicModal').modal("show");
					//자식요소초기화
					$("#basic-modal-body").empty();
					//모달창 내용넣어주기
					$("#basic-modal-body").append("<span style='font-weight: bold;'>"+msg+"</span>");
					
					//닫기 버튼 클릭시 이벤트 추가
					if(event != undefined && event != ""){
						$(".close").on("click",function(){event()});
						$("#close_btn").on("click",function(){event()});
					}
				}				
				/*  
					작 성 내 용 : (공용) 모달 컨펌창
					매 개 변 수 : callback:콜백함수/title:타이틀/content:컨텐츠내용/btn_nm:버튼명
				*/
				function modalConfirm(callback,title,content,btn_nm,cancel_btn_nm){
					
					//모달창 열기
					$("#confirmModal").modal('show');
					
					//초기화
					$("#confirmTitle").html('');
					$("#confirmBody").empty;
					
					//모달창 내용넣어주기 - 타이틀/컨텐츠내용/버튼명
					$("#confirmTitle").html(title);
					$("#confirmBody").empty();
					$("#confirmBody").append("<span style='font-weight: bold;'>"+content+"</span>");
					//확인버튼
					if(btn_nm != "" && typeof btn_nm != "undefined"){
						$("#ok_btn").html(btn_nm);
					}else{
						$("#ok_btn").html("확인");
					} 
					if(cancel_btn_nm != "" && typeof cancel_btn_nm != "undefined"){
						$("#no_btn").html(cancel_btn_nm);
					}else{
						$("#no_btn").html("취소");
					} 
					
					$("#ok_btn").on("click",function(e){
						e.preventDefault();
						$('#confirmModal').modal("hide");
						callback(true);
					})
					
					$('#no_btn').click(function(e){
						e.preventDefault();
						$('#confirmModal').modal("hide");
						callback(false);
					});
					
				}

//위 modalConfirm 함수가 실행되는 횟수만큼 반복해서 보완하는 함수
function alertData(title,terms,btn_nm,cancel_btn_nm){
	return new Promise(function(resolve,reject){
		$("#confirmModal").modal('show');
					
					//초기화
		$("#confirmTitle").html('');
		$("#confirmBody").empty;
		
		//모달창 내용넣어주기 - 타이틀/컨텐츠내용/버튼명
		$("#confirmTitle").html(title);
		$("#confirmBody").empty();
		$("#confirmBody").append("<span style='font-weight: bold;'>"+terms+"</span>");
		//확인버튼
		if(btn_nm != "" && typeof btn_nm != "undefined"){
			$("#ok_btn").html(btn_nm);
		}else{
			$("#ok_btn").html("확인");
		} 
		if(cancel_btn_nm != "" && typeof cancel_btn_nm != "undefined"){
			$("#no_btn").html(cancel_btn_nm);
		}else{
			$("#no_btn").html("취소");
		} 
		
		$("#ok_btn").on("click",function(e){
			e.preventDefault();
			$('#confirmModal').modal("hide");
			resolve(true);
		})
		
		$('#no_btn').click(function(e){
			e.preventDefault();
			$('#confirmModal').modal("hide");
			resolve(false);
		});
	})
}								