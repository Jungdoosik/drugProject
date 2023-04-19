<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 세션값 가져오기
String id = (String) session.getAttribute("member"); // Object 타입이므로 다운캐스팅
%>

<!-- ======= Header ======= -->
        <header id="header" class="header d-flex align-items-center fixed-top">
            <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

                <a href="index.html" class="logo d-flex align-items-center">
                    <!-- Uncomment the line below if you also wish to use an image logo -->
                    <!-- <img src="resources/img/logo.png" alt="" > -->
                    <h1> MedicineSearch</h1>
                </a>

                <i class="mobile-nav-toggle mobile-nav-show bi bi-list"> </i>
                <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"> </i>
                <nav id="navbar" class="navbar">
                    <ul>
                    	<!-- 세션값 없는 경우 서비스소개/로그인 -->
                        <li> <a href="services"> 서비스 소개</a> </li>
                        <li> <a class="get-a-quote" href="login">로그인</a> </li>
                        <!-- 세션값 있는 경우 마이페이지/로그아웃 -->
                        <li> <a href="mypage"> <%=id %> 님 안녕하세요. 나의 정보</a> </li>
                        <li> <a class="get-a-quote" href="logout">로그아웃</a> </li>
                    </ul>
                </nav><!-- .navbar -->
            </div>
        </header><!-- End Header -->
        <!-- End Header -->