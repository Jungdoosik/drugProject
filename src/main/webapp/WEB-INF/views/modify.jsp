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
<script>

</script>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>MedicineSearch - Index</title>
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


    <style>
        html,
        body {
            width: 100%;
            height: 100%;
        }

        .index_container {
            width: 100%;
            height: 100%;
            background: #0e1d34;
        }
        .btn-3 {
		    background: #495057;
		    border: 0;
		    padding: 10px 30px;
		    color: #fff;
		    transition: 0.4s;
		    border-radius: 4px;
		}
    </style>
    <script>


        function itemDataSearch() {
            document.frm.action = '/searchDrug';
            document.frm.submit()

        }

        function cancelChk() {
        	if (!confirm("작성한 내용이 모두 삭제됩니다. 계속하시겠습니까? ")){ // 아니오
			    //history.go( -1 );
			 }else { // 예
				 history.go( -1 );
			}
        }
        
        
    </script>

</head>

<body>
<%
	if(session.getAttribute("phone") == null) {
%>

	<script language="JavaScript">
		alert("로그인 후 이용가능합니다.");
	</script>
<%
		response.sendRedirect("login");
	}
%>
    <div class="index_container">
    <section>
    	<jsp:include page="common/header.jsp" />
	</section>
    <main id="main">

    <!-- ======= join Section ======= -->
    <section id="get-a-quote" class="get-a-quote">
      <div class="container" data-aos="fade-up">

        <div class="row g-0">

          <div class="col-lg-5 quote-bg" style="background-image: url(resources/img/quote-bg.jpg);"></div>

		  <!-- Start join Form -->
          <div class="col-lg-7">
            <form id="modifyFrm" name="modifyFrm" method="post" class="php-email-form">
				<div>
	                <div class="col-md-12">
	                <h3>휴대전화번호</h3>
	                  <input type="text" id="phone" name="phone" class="form-control" disabled value="${memberinfo.phone }" readonly style="margin-bottom:10px;">
	                </div>

	                <div class="col-md-12">
	                <h3>비밀번호</h3>
	                  <input type="password" id="pwd" name="pwd" class="form-control"  value="${memberinfo.pwd }" placeholder="비밀번호 입력" style="margin-bottom:10px;">
	                </div>

	                <div class="col-md-12">
	                <h3>비밀번호확인</h3>
	                  <input type="password" id="pwdChk" name="pwdChk" class="form-control" placeholder="비밀번호 확인" style="margin-bottom:10px;">
	                </div>

					<div class="col-md-12">
	                <h3>이메일 주소</h3>
	                  <input type="email" id="email" name="email" class="form-control" value="${memberinfo.email }"  placeholder="이메일 입력" style="margin-bottom:10px;">
	                </div>

	                <div style="text-align: -webkit-center">
	                  <button type="button" class="btn-2" onclick="modifyChk()">정보수정</button>
	                  <button type="button" class="btn-3" onclick="cancelChk()">취소</button>
	            	</div>
              	</div>
            </form>
          </div><!-- End join Form -->
 <script type="text/javascript">
 /*
  * 회원수정
  */

 function modifyChk() {
 	// alert("회원수정 버튼 클릭.");
   
    var formData = $("#modifyFrm").serialize();
    var val = true;
    
    var pwd = $("#pwd").val();
    var pwdChk = $("#pwdChk").val();
    var email = $("#email").val();
    
    var val_phone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;
    var val_pwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,25}$/;
    var val_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    
    
    if (pwd == '' || pwdChk == '' || email == '') {
       alert("모든 항목을 빈칸없이 작성해 주시기 바랍니다.");
       val = false;
    }  else if (!val_pwd.test(pwd)) {
       alert("비밀번호는 영문,숫자 포함 4글자 이상이어야 합니다.(특수문자/공백/한글 사용 금지)");
       val = false;
    } else if (pwd != pwdChk) {
       alert("입력하신 비밀번호와 비밀번호 확인이 상이합니다. 다시 확인하여 주시기 바랍니다.");
       val = false;
    } else if (!val_email.test(email)) {
        alert("이메일 양식에 맞춰 작성해 주시기 바랍니다.");
        val = false;
    }
    if (val == false) {
       return false;
    } else {
         if (!confirm("작성한 내용으로 정보슈종 진행됩니다. 계속하시겠습니까? ")){ 
        	 // 아니오
        	 history.go( -1 );
           }else { // 예
           //form.submit();
           // 회원정보 수정 업데이트: ajax
             $.ajax({
                 type: 'post',
                 async: false ,
                 url : 'modifyDo.do',
                 data: formData,
                 success : function(data) {
                     if (data == "success") {
                         alert("회원정보 수정이 완료되었습니다.");
                         location.href = "/index"; //메인화면
                     }
                 },
                 error: function (request, status, error) {
                         alert("회원정보 수정이 실패하였습니다.");
                         console.log("code: " + request.status)
                         console.log("message: " + request.responseText)
                         console.log("error: " + error);
                     }
             });
           
          }
    }
 }
 </script>
        </div>

      </div>
    </section><!-- End join Section -->

  </main><!-- End #main -->


        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"> <i class="bi bi-arrow-up-short"> </i> </a>

    </div>
    <div id="preloader"> </div>
    <!-- Vendor JS Files -->
    <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="resources/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="resources/vendor/aos/aos.js"></script>
    <script src="resources/vendor/php-email-form/validate.js"></script>
    <!-- Template Main JS File -->
    <script src="resources/js/main.js"></script>

</body>

</html>
