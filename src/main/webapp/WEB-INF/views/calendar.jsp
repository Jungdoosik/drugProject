<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.btn-1 {
    background: var(--color-primary);
    border: 0;
    padding: 10px 30px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
}

.btn-2 {
    background: #660099;
    border: 0;
    padding: 10px 30px;
    color: #fff;
    transition: 0.4s;
    border-radius: 4px;
}
</style>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>MedicineSearch Calendar</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <!-- Vendor CSS Files -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
    <link href="resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="resources/vendor/aos/aos.css" rel="stylesheet">
    <!-- Template Main CSS File -->
    <link href="resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
   <script src="resources/js/member.js"></script>
    <!-- =======================================================
    * Template Name: Logis
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
   
   <!--    타임픽커 -->
   <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
   <script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>

</head>

<body>
    <div class="index_container">
    <jsp:include page="common/header.jsp" />
      <div class='rap'>
         <div class="header">
         <div class="btn prevDay"></div>
            <h2 class='dateTitle'></h2>
            <div class="btn nextDay"></div>
         </div>
         <div class="grid dateHead">
            <div>일</div>
            <div>월</div>
            <div>화</div>
            <div>수</div>
            <div>목</div>
            <div>금</div>
            <div>토</div>
         </div>
         <div class="grid dateBoard"></div>
      </div>
        <main id="main"></main>
      <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>
    </div>
    <div id="preloader"> </div>
    
   <!--       시간예약 start -->
      <div id="modalWrap">
     <div id="modalContent">
       <div id="modalBody">
         <span id="closeBtn">&times;</span>
         <div id="info">*예약시간에 맞춰 문자 알림이 전송됩니다.</div></br>
         <div>
         시간예약:
         <select class="form-select" id="time1" aria-label="Default select example">
             <option value="00:00">00:00</option>
             <option value="00:30">00:30</option>
             <option value="01:00">01:00</option>
             <option value="02:00">02:00</option>
             <option value="02:30">02:30</option>
             <option value="03:00">03:00</option>
             <option value="04:00">04:00</option>
             <option value="05:00">05:00</option>
             <option value="05:30">05:30</option>
             <option value="06:00">06:00</option>
             <option value="06:30">06:30</option>
             <option value="07:00">07:00</option>
             <option value="07:30">07:30</option>
             <option value="08:00">08:00</option>
             <option value="08:30">08:30</option>
             <option value="09:00">09:00</option>
             <option value="09:30">09:30</option>
             <option value="10:00">10:00</option>
             <option value="10:30">10:30</option>
             <option value="11:00">11:00</option>
             <option value="11:30">11:30</option>
             <option value="12:00">12:00</option>
             <option value="12:30">12:30</option>
             <option value="13:00">13:00</option>
             <option value="13:30">13:30</option>
             <option value="14:00">14:00</option>
             <option value="14:30">14:30</option>
             <option value="15:00">15:00</option>
             <option value="15:30">15:30</option>
             <option value="16:00">16:00</option>
             <option value="16:30">16:30</option>
             <option value="17:00">17:00</option>
             <option value="17:30">17:30</option>
             <option value="18:00">18:00</option>
             <option value="18:30">18:30</option>
             <option value="19:00">19:00</option>
             <option value="19:30">19:30</option>
             <option value="20:00">20:00</option>
             <option value="20:30">20:30</option>
             <option value="21:00">21:00</option>
             <option value="21:30">21:30</option>
             <option value="22:00">22:00</option>
             <option value="23:30">23:30</option>
             <option value="24:00">24:00</option>
         </select>
         </div>
            <div>
         메모:<input type="text" class="form-control mediMemo" style="width:200px;">
         <button type="button" class="btn btn-primary enroll" onclick="enroll()">등록</button>
         </div>
       </div>
     </div>
   </div>
   <!--       시간예약 end  -->
   <!-- 시간 수정 start -->
    <div id="modalWrap_modify">
     <div id="modalContent">
       <div id="modalBody">
         <span id="closeBtn" onclick="closeModal()">&times;</span>
         <div class="info">*변경 혹은 삭제된 일정은 복구할 수 없습니다.</div></br>
            *예약시간선택</br>
           <div id="modify_select_area">
         </div>
         <div id="modify_area">
         </div>
            <div>
         </br><button type="button" class="btn btn-primary enroll" onclick="addMore()">추가등록</button>
         </div>
       </div>
     </div>
   </div>
   <!-- 시간 수정 end -->
   
    
    <!-- Vendor JS Files -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <script src="resources/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>
   <script src="resources/js/calendar.js"></script>
   <!--    타임픽커 -->
   <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>

</html>


<style>

/* 달력 */
h2 {
   color: #eee;
}
.rap {
   margin-top: 10%;
   padding: 20px 20px;
}
.dateHead div {
   background: #1b7de3;
   color: #fff;
   text-align: center;
   border-radius: 5px;
}
 
.grid {
   display: grid;
   grid-template-columns: repeat(7, 1fr);
   grid-gap: 2px;
}

.grid div {
   /* padding: .6rem; */
   font-size: .9rem;
   cursor: pointer;
}

.dateBoard div {
   color: #222;
   font-weight: bold;
   height:8rem;
   border-radius: 5px;
   border: 1px solid #eee;
   background: #eee;
   overflow: scroll;
}

.noColor {
   background: #eee;
}

.header {
   display: flex;
   justify-content: space-between;
   padding: 1rem 2rem;
}

/* 좌우 버튼 */
.btn {
   display: block;
   width: 20px;
   height: 20px;
   border: 3px solid #eee;
   border-width: 3px 3px 0 0;
   cursor: pointer;
}

.prevDay {
   transform: rotate(-135deg);
}

.nextDay {
   transform: rotate(45deg);
}

/* 약 메모 css */
/* 모달팝업을 감싸고 있는 최상위 부모 */
#modalWrap {
   position: fixed; /* Stay in place */
   display:none;
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

#modalWrap_modify {
   position: fixed; /* Stay in place */
   display:none;
   z-index: 1; /* Sit on top */
   padding-top: 100px; /* Location of the box */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* 모달 팝업창 */
#modalBody {
   width: 500px;
   padding: 30px 30px;
   margin: 0 auto;
   border: 1px solid #777;
   border-radius: 10px;
   background-color: #fff;
}
#modalBody info {
   color: #red;
}
/* 닫기 버튼 */
#closeBtn {
   float:right;
   font-weight: bold;
   color: #777;
   font-size:25px;
   cursor: pointer;
}
.enroll{
   width:40%;
   height:50px;
}

.mediMemo{
   margin-top:10px;
   margin-bottom:10px;
}
.bi{
   margin:5px;
   /* background-color:#eee */
}
#modalContent{
   z-index:999999;
}
#modify_select_area{
   display: inline-block;
}
#modify_area{
   width: 99%;
   display: inline-block;
   margin-left: 7px;
}
#modifyIcon{
   background-color: #blue
}
#deleteIcon{
   background-color: #red
}
.memo{
   margin-left:10px;
   display: inline-block;
}
.time2{
   display: inline-block;
   width: 22%;
   margin-top:10px;
}
#drawDiv{
   width: 100%;
}
/* .overflow-ellipsis{ */
/*       width:71%; */
/*       padding:0 5px; */
/*       overflow:hidden; */
/*       text-overflow:ellipsis; */
/*       white-space:nowrap; */
/*       max-width:22px; */
/* } */
@media(min-width:375px){
   .dateBoard div{
      max-width:46.14px;
      height:8rem;
      overflow:scroll;
   }
}
@media(min-width:425px){
   .dateBoard div{
      max-width:102.28px;
      height:8rem;
      overflow:scroll;
   }

}
@media(min-width:768px){
   .dateBoard div{
      max-width:138.86px;
      height:8rem;
      overflow:scroll;
   }
   .overflow-ellipsis{
      width:71%;
      padding:0 5px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      max-width:111px;
   }
}
@media(min-width:1024px){
   .dateBoard div{
      max-width:198.86px;
      height:8rem;
      overflow:scroll;
   }
}
@media(min-width:1440px){
   .dateBoard div{
      max-width:358.86px;
      height:8rem;
      overflow:scroll;
   }
}
</style>