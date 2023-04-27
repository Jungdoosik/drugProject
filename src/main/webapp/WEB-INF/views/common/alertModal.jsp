<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> </title>
</head>
<!-- 알림 기본 모달 창 -->
		<div fragment="modal" >
			<div class="modal fade alert" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="basicTitle">알림</h5>
			        <div class="close" data-dismiss="modal" aria-label="Close">
			          <img src="resources/img/close.png" width="15px" height="15px">
			        </div>
			      </div>
			      <div class="modal-body" id="basic-modal-body">
			      </div>
			      <div class="modal-footer" id="basic-modal-footer">
			      		<button type='button' id="close_btn" class='btn btn-secondary close'>닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
		
			<!-- 회원탈퇴 컨펌 모달 창 -->
			<div class="modal fade alert" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="confirmTitle"></h5>

			      </div>
			      <div class="modal-body" id="confirmBody">
			      <!-- 콘텐츠 들어갈 자리 -->
			      </div>
			      <div class="modal-footer" id="confirmFooter">
			      		<button type='button' id="ok_btn" class='btn btn-primary'>확인</button>
			      		<button type='button' id="no_btn" class='btn btn-danger'>취소</button>
			      </div>
			    </div>
			  </div>
			</div>
		</div>