<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org"
   xmlns:layout="http://www.ultraq.net.nz/thymeleaf/layout"
     xmlns:sec="http://www.thymeleaf.org/extras/spring-security"
      layout:decorate="~{layouts/adminLayout}">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script><!-- jquery 사용시  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script><!-- query.modal 사용시  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /><!-- query.modal 사용시  -->

<link href="resources/css/enquire/enquireAdminView.css" rel="stylesheet"> 
<script type="text/javascript" src="resources/js/common/modal.js"></script>
<script type="text/javascript" src="resources/js/enquire/enquireAdminView.js"></script>

	<div fragment="content" class="layoutSidenav_content" id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<input type="hidden" id="csrfHeaderName" value="${_csrf.headerName}">
		    	<input type="hidden" id="csrfTokenValue" value="${_csrf.token}">
				<div class="hello">
					<h1 class="title mt-3 mb-3" id="title">문의내역관리</h1>
				</div>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card border-mustard border-left-mustard mb-4">
							<div class="card-body">
								<div class="row no-gutters align-items-center">
									<div class="col mr-2">
										<div class="text-xs font-weight-bold text-primary text-uppercase mb-3">
                                                                              대기 중인 문의내역
                                        </div>
                                     <div class="h5 mb-1 font-weight-bold text-gray-800">${untreatedCnt}</div>
                                 	</div>
                                 	<div class="col-auto">
                                     <i class="fas fa-comments fa-2x text-gray-300"></i>
                                 	</div>
                             	</div>
                         	</div>
						</div>
					</div>
				</div>
						
				<!-- list  관리자 목록-->
				<div class="card mb-4" id="list">
					<div class="card-header">
						<i class="fas fa-table me-1"></i>
                                          처리할 문의 내역
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>처리 여부</th>
 									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
									<th>답변/삭제</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
								    <th>처리 여부</th>
								    <th>제목</th>
								    <th>작성자</th>
								    <th>날짜</th>
								    <th>답변/삭제</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${List}" var="list">
								    <tr >
										<c:if test="${list.adate ne null}">
											<td><font color="blue">답변완료</font></td>
										</c:if>
										<c:if test="${ask.adate eq null}">
											<td ><font color="red">처리중</font></td>
										</c:if>
										<td>${list.title}</td>
										<td>${list.writer}</td>
										<td>${list.adate}</td>
										<td>
											<c:if test="${list.answer eq null}">
												<button class="btn btn-outline-primary" onclick="regist('${list.seq}')">답변하기</button>
											</c:if>
											<c:if test="${list.answer ne null}">
												<button class="btn btn-outline-secondary" onclick="detail('${list.seq}')">상세내용</button>
											</c:if>
											&nbsp;
											<c:if test="${list.delyn = 'N'}">
												<button class="btn-outline-danger" onclick="eDelete('${list.seq}')">삭제</button>
											</c:if>
											<c:if test="${list.delyn ='Y'}">
												<font color="red">삭제 됨</font>
											</c:if>
										</td>
								    </tr>
			  					</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- detail  상세 페이지 -->
				<div id="detail" style="display: none;">
					<br>
					<label class="form-label"><b>문의 제목 / 문의일</b></label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="etitle" value="" readonly>
						&nbsp;&nbsp;
						<span><input type="text" class="form-control-sm" id="eqdate" value="" readonly></span>
						&nbsp;&nbsp;
						<span id="result"></span>
					</div>
					<div class="mb-3">
						<label class="form-label"><b>문의</b></label>
						<textarea class="form-control" rows="3" id="question" readonly></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label"><b>답변</b></label>
						<textarea class="form-control" rows="3" id="answer" readonly></textarea>
					</div>
					<button class="btn btn-outline-secondary" onclick="golist()">목록</button>
				</div><!-- detail -->
					
				<!-- regform  답변 페이지 -->
				<div id="regform" style="display: none;">
				  <form>
					<div class="input-group">
						<span class="input-group-text">문의 사항</span>
						<input class="form-control w-25" type="text" id="title" name="title" value="" readonly>
						<input class="form-control w-5" type="text" id="writer" name="writer" value="" onclick="paylist(this.value)" readonly>
					</div>
						<br>
					<div class="input-group">
						<span class="input-group-text">문의 내용</span>
						<textarea class="form-control" name="rquestion" id="rquestion" readonly></textarea>
					</div>
						<br>
					<div class="input-group">
						<span class="input-group-text">답변 내용</span>
						<textarea class="form-control" name="answer" placeholder="※ 친절한 답변 부탁드리며 답변 작성하실 때 꼭 관리자명 남겨주세요.&#13;&#10;&#13;&#10;"></textarea>
					</div>
						<br>
					<div style="text-align: center;">
						<button type="button" class="btn btn-outline-dark btn-lg" onclick="answer1('답변 등록이 완료되었습니다.','ENQ')">답변등록</button>
						<button type="button" class="btn btn-outline-dark btn-lg" onclick="golist()">취소</button>
					</div>
					<input type="hidden" id="seq" value="">
				  </form>
				</div><!-- regform -->
			</div>                    
		</main>
	</div>
	<!--   공통모달 .jsp  설정  -->
	<jsp:include page="../common/alertModal.jsp"/>

</html>