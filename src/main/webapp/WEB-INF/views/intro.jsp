<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>intro</title>
<script th:src="@{/js/member/memberJoin.js}"></script>
<!-- <script type="text/javascript" href="resources/js/intro/intro.js"></script> -->
<!-- <link rel="stylesheet" href="resources/css/intro/intro.css"> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
.all {
	text-align: center;
	width: 100%;
	accent-color: #536dfe;
	padding-top: 30%;
}

.event_btn1 {
	color: white;
	text-align: center;
	background-color: rgb(237, 28, 36);
	border-radius: 10px;
	box-shadow: 0 0 0.1em 0.1em white;
	font-size: 50px;
	height: 100px;
	width: 650px;
	margin: 50px 10px;
	border: 0;
}

.event_btn1:hover {
	color: white;
	background-color: rgb(255, 152, 17);
}

.align-self-center text-center {
	text-align: center;
	margin: 100px;
}

.termsTitle {
	text-decoration-line: none;
	color: black;
	font-size: 25px;
}

.titlePont {
	color: rgb(237, 28, 36);
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var cuid;
	$("#agree_all").click(function() {
		if($("#agree_all").is(":checked")) $('input:checkbox').prop('checked',true);
		else $('input:checkbox').prop('checked',false);
	});
	
	$('.termsAlert').on('click',function(e){
		e.preventDefault();
		var id = $(this).attr('name');
		var title = $(this).attr('title');
		var question = $(this).attr('question');
		
		alertData(title,question,'동의').then(function(resolvedData){
			if(resolvedData) $(id).prop('checked',true);
		});
	});
	
	$('#goBtn').on('click',function(e){
		e.preventDefault();
		
		if(!($('#agree1').is(':checked') && $('#agree2').is(':checked') && $('#agree3').is(':checked') && $('#agree4').is(':checked'))){
			alert('필수 약관에 동의하시기 바랍니다.');
			return;
		}
		
			iamport();
				
	})
});

function openReg(cuid, muid, price, title){
		document.frm.cuid.value = cuid
		document.frm.muid.value = muid
		document.frm.price.value = price
		document.frm.title.value = title
		document.frm.action = "/join"
		document.frm.submit()
}

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

</script>
</head>
<body>
	<form id="frm" name="frm" method="post">
		<input type="hidden" name="cuid" value="">
		<input type="hidden" name="muid" value="">
		<input type="hidden" name="price" value="">
		<input type="hidden" name="title" value="">
		<input type="hidden" name="joinPath" value="2">
	</form>
	<div class="container my-fade-in"> 
		<!-- 아임포트 모4듈 -->
		<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
			type="text/javascript"></script>
		<div class="all">
			<div class="row">
			
				<div class="align-self-center text-center" style="margin-top: 50px;">
					<h1 class="title">
						<span class="titlePont">"MedicineSearch"</span>에서 <span
							class="titlePont">10,000캐시 </span> 받고 <br>일주일동안 <span
							class="titlePont"> "무료"</span>로 약성분을 확인하자
					</h1>

					<div class="korea mb-4">
                        <img style="padding:10%;" src="resources/img/free-icon-drug-4667352.png">	
       				</div><!-- 이미지end -->

					<div class="terms">
						<label for="agree_all" style="font-size: 20px;"> 
							<input  type="checkbox" name="agree_all" id="agree_all"> 
								<span class="agree_all_click" style="font-size: 25px; color: red">
								   전체 동의
								 </span>
						</label> 
						<br> 
						<label> 
							<input type="checkbox" id="agree1" name="agree" value="1"> 
								<span>
									<a class="termsTitle" href="#ex1" rel="modal:open">
									    이용약관 동의<strong>(필수)</strong>
									 </a>
								 </span>
							<div id="ex1" class="modal">
								<p>
									<strong> 이용약관 동의 </strong>
									 <br> 
									 <br> 
									 <span>제1조(목적)
									 <br>
										이 약관은 업체 회사(전자상거래 사업자)가 운영하는 업체 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷
										관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을
										목적으로 합니다.<br> ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는
										한 이 약관을 준용합니다.」<br> <br> 제2조(정의)<br> ① “몰”이란 업체
										회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여
										재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도
										사용합니다.<br> ② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는
										회원 및 비회원을 말합니다.<br> ③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로
										“몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br> ④ ‘비회원’이라 함은 회원에
										가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br> <br> 제3조
										(약관 등의 명시와 설명 및 개정)<br> ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소
										소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소,
										사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기
										서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
										② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은
										중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야
										합니다.<br> ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한
										법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호
										등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이
										약관을 개정할 수 있습니다.<br> ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여
										현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게
										불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은
										개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br> ⑤ “몰”이
										약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된
										계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의
										적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은
										경우에는 개정약관 조항이 적용됩니다.<br> ⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에
										관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는
										「전자상거래 등에서의 소비자 보호지침」 및 관계법령 또는 상관례에 따릅니다.<br> <br>
										제4조(서비스의 제공 및 변경)<br> ① “몰”은 다음과 같은 업무를 수행합니다.<br>
										1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br> 2. 구매계약이 체결된 재화 또는
										용역의 배송<br> 3. 기타 “몰”이 정하는 업무<br> ② “몰”은 재화 또는 용역의 품절
										또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수
										있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을
										게시한 곳에 즉시 공지합니다.<br> ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을
										재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로
										즉시 통지합니다.<br> ④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만,
										“몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
									</span>
								</p>
								<a href="#" rel="modal:close">닫기</a>
							</div><!-- 모달 끝 -->
						</label> 
						<br> 
						<label> 
							<input type="checkbox" id="agree2" name="agree" value="2"> 
								<span>
									  <a class="termsTitle" href="#ex2" rel="modal:open">
									     개인정보 수집, 이용 동의<strong>(필수)</strong>
									  </a>
								  </span>
							<div id="ex2" class="modal">
								<p>
									<br> 
									<span> 
									<strong>개인정보처리방침</strong> 
									<br> <br>
										1. 총칙<br> <br> 본 업체 사이트는 회원의 개인정보보호를 소중하게 생각하고, 회원의
										개인정보를 보호하기 위하여 항상 최선을 다해 노력하고 있습니다.<br> 1) 회사는 「정보통신망
										이용촉진 및 정보보호 등에 관한 법률」을 비롯한 모든 개인정보보호 관련 법률규정을 준수하고 있으며, 관련 법령에
										의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.<br> 2) 회사는
										「개인정보처리방침」을 제정하여 이를 준수하고 있으며, 이를 인터넷사이트 및 모바일 어플리케이션에 공개하여
										이용자가 언제나 용이하게 열람할 수 있도록 하고 있습니다.<br> 3) 회사는 「개인정보처리방침」을
										통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가
										취해지고 있는지 알려드립니다.<br> 4) 회사는 「개인정보처리방침」을 홈페이지 첫 화면 하단에
										공개함으로써 귀하께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.<br> 5) 회사는
										「개인정보처리방침」을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br>
										<br> 2. 개인정보 수집에 대한 동의<br> 귀하께서 본 사이트의 개인정보보호방침 또는
										이용약관의 내용에 대해 「동의 한다」버튼 또는 「동의하지 않는다」버튼을 클릭할 수 있는 절차를 마련하여, 「동의
										한다」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br> <br> 3.
										개인정보의 수집 및 이용목적<br> 본 사이트는 다음과 같은 목적을 위하여 개인정보를 수집하고
										있습니다.<br> 서비스 제공을 위한 계약의 성립 : 본인식별 및 본인의사 확인 등<br>
										서비스의 이행 : 상품배송 및 대금결제<br> 회원 관리 : 회원제 서비스 이용에 따른 본인확인, 개인
										식별, 연령확인, 불만처리 등 민원처리<br> 기타 새로운 서비스, 신상품이나 이벤트 정보 안내<br>
										단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및
										본적지, 정치적 성향 및 범죄기록, 건강상태 등)는 수집하지 않습니다.<br> <br>
										4.수집하는 개인정보 항목<br> 본 사이트는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은
										개인정보를 수집하고 있습니다. <br> 2) 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID ,
										비밀번호 , 전화번호 , 주소 , 휴대전화번호 , 이메일 , 주민등록번호 , 접속 로그 , 접속 IP 정보 ,
										결제기록
									</span><br>
								</p>
								<a href="#" rel="modal:close">닫기</a>
							</div>
						</label> 
						<br> 
						<label> 
							<input type="checkbox" id="agree3" name="agree" value="3"> 
								<span class="termsAlert" name="#agree3">
									<a class="termsTitle" href="#ex3" rel="modal:open">
									   개인정보 이용 동의 <strong>(필수)</strong>
									</a>
								</span>
							<div id="ex3" class="modal">
								<p>
									<span> 
									<strong>개인정보 제공</strong> 
									<br> <br> 
									        회사는이용자의 개인정보를 원칙적으로 외부에 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br>
										- 이용자들이 사전에 동의한 경우<br> - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진
										절차와 방법에 따라 수사기관의 요구가 있는 경우<br> <br> 수집한 개인정보의 위탁<br>
										회사는 서비스 제공 및 향상을 위하여 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약시
										개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.<br> <br> 이용자
										및 법정대리인의 권리와 그 행사방법<br> 이용자 및 법정 대리인은 언제든지 등록되어 있는 자신 혹은
										당해 만 14세 미만아동의 개인정보를 조회하거나 수정할 수 있으며 가입해지를 요청할 수도 있습니다. 이용자 혹은
										만 14세 미만 아동의 개인정보 조회,수정을 위해서는 ‘개인정보변경’(또는 ‘회원정보수정’ 등)을
										가입해지(동의철회)를 위해서는 “회원탈퇴”를 클릭하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가
										가능합니다.혹은 개인정보관리책임자에게 서면, 전화 또는 이메일로 연락하시면 지체없이 조치하겠습니다.<br>
										귀하가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는
										제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체없이
										통지하여 정정이이루어지도록 하겠습니다.<br>
									</span><br>
								</p>
								<a href="#" rel="modal:close">닫기</a>
							</div>
						</label> 
						<br> 
						<label> 
							<input type="checkbox" id="agree4" name="agree" value="5"> 
								<span>
									  <a class="termsTitle" href="#ex4" rel="modal:open">
									       서비스 안내사항<strong>(필수)</strong> 
									  </a>
								</span>
							<div id="ex4" class="modal">
								<p>
									<span> 
									<strong>MedicineSearch 서비스란</strong> 
									<br> <br>
										<div>
											<span> 본 서비스는 MedicineSearch 에서 운영합니다. <br>고객센터
												info@example.com 대표번호 : 02-1234-5678 <br> 7일(168시간)
												무료체험 종료 후 서비스 정상금액 9,900원이 매월 결제됩니다. <br> 해당 상품의 해지 신청은
												대표번호로 전화 후 상담 시 해지해드립니다. <br> (72시간 저희 서비스를 이용하시는 조건으로
												보상을 지급합니다.) <br>무료기간이 끝나 결제가 진행되면 최초 한달은 의무사용 약정이 적용되어
												취소/환불이 진행되지 않습니다.</br>
											</span> <span style="line-height: 60px;"> 서비스 해지와 문의는 홈페이지 상단
												'서비스해지''문의'를 통해 가능합니다. <br>
											</span>
										</div> <br>
								</p>
								<a href="#" rel="modal:close">닫기</a>
							</div>
						</label> 
						<br> 
						<label> 
							<input type="checkbox" id="agree5" name="agree" value="4"> 
									<span class="termsAlert" name="#agree5"> 
										<a class="termsTitle" href="#ex5" rel="modal:open">
										   이벤트,혜택정보 수신동의<strong class="select_disable">(선택)</strong>
										</a>
									</span>
							<div id="ex5" class="modal">
								<p>
									<span> <strong>이벤트 응모를 위한 개인정보 수집 이용 동의서</strong> <br>
										<br> 본인은 귀사의 마케팅 활동 참여를 위해 귀사가 본인의 개인 정보를 수집이용하고자 하는 경우
										개인정보보호법 제15조, 제22조에 따라 동의를 얻어야 합니다. 이에 이벤트 응모 및 경품 지급을 위하여 아래와
										같이 개인정보를 수집 이용 및 제공하고자 합니다. 내용을 자세히 읽으신 후 동의 여부를 결정하여 주십시오.<br>
										<br> 개인정보 수집 이용 내역<br> 항목 : 이벤트 응모 내용(이름,휴대폰번호,예약번호)<br>
										수집 및 이용 목적 : 이벤트 당첨자 본인 확인, 경품 수령 조건 확인, 경품 지급<br> 보유기간 :
										경품 지급 완료 후 최대 3개월(지급 내용 및 관련 문의 응대 완료 후 폐기)<br> <br>
										당사는 이벤트 진행 및 경품 지급을 위하여 아래와 같이 업무를 처리 합니다<br> 수탁사 : 한국비앤시<br>
										목적 : 경품발송<br> 위의 개인정보 수집 이용에 대한 동의를 거부할 권리가 있습니다. 그러나,
										동의를 거부할 경우 이벤트 진행 및 서비스 제공 대상에서 제외됨을 알려드립니다.<br>
									</span> <br>
								</p>
								<a href="#" rel="modal:close">닫기</a>
							</div>
                        </label>
							<div class="intro-btn">
								<button class="event_btn1" id="goBtn">가입하고 보상받기</button>
							</div>
					</div>
				</div>
			</div> <!-- row  end -->
			
		</div><!-- all end -->
	</div><!--container my-fade-in  end -->
	
</body>
</html>