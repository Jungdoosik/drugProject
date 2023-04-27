<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
// 세션값 가져오기
String id = (String) session.getAttribute("phone");
String subScribe = (String) session.getAttribute("subScribe");
%>
<style>
body {
	background: #0e1d34;
}
</style>

<!-- ======= Header ======= -->
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

                <a href="index" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="resources/img/logo.png" alt="" > -->
                    <h1> MedicineSearch</h1>
                </a>

                <i class="mobile-nav-toggle mobile-nav-show bi bi-list"> </i>
                <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"> </i>
                <nav id="navbar" class="navbar">
                    <ul>
                    	<!-- 세션값 없는 경우 서비스소개/로그인 -->
                        <c:if test="${empty phone }">
	                        <li> <a class="get-a-quote" href="login">로그인</a> </li>
                        </c:if>
                        <!-- 세션값 있는 경우 마이페이지/로그아웃 -->
                        <c:if test="${not empty phone }">
                        	<li style="display: flex;"> <a href="index"> ${phone } 님 안녕하세요.</a> <a class="get-a-quote" href="logout" style="width: fit-content;">로그아웃</a></li>
                        </c:if>
                        <c:if test="${not empty phone }">
                        	<li class="dropdown"><a href="#"><span> 나의 정보</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
					            <ul>
					              <li><a href="modify">정보 수정</a></li>
					              <li><a href="calendar">캘린더</a></li>
					            </ul>
					          </li>
                        </c:if>
                        <c:if test="${not empty phone }">
                        	<li class="dropdown"><a href="#"><span>문의하기</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
					            <ul>
					              <li><a href="question">1:1 문의</a></li>
					             <!--  <li><a href="memberWithdrawal">회원탈퇴 문의</a></li> -->
					              <li><a href="cancel">서비스해지 문의</a></li>
					            </ul>
					          </li>
                        </c:if>

                        <li> <a href="services"> 서비스 소개</a> </li>
                        <li> <a href="servicesJoin"> 서비스 가입</a> </li>
                        <li> <a href="enquireAdmin"> 관리자-문의(TEST)</a> </li>
                    </ul>
                </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->
        <!-- End Header -->