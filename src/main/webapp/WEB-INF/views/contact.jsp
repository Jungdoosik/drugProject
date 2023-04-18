<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
   <!-- basic -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- mobile metas -->
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="initial-scale=1, maximum-scale=1">
   <!-- site metas -->
   <title>About</title>
   <meta name="keywords" content="">
   <meta name="description" content="">
   <meta name="author" content="">
   <!-- bootstrap css -->
   <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
   <!-- style css -->
   <link rel="stylesheet" type="text/css" href="resources/css/style.css">
   <!-- Responsive-->
   <link rel="stylesheet" href="resources/css/responsive.css">
   <!-- fevicon -->
   <link rel="icon" href="resources/images/fevicon.png" type="image/gif" />
   <!-- Scrollbar Custom CSS -->
   <link rel="stylesheet" href="resources/css/jquery.mCustomScrollbar.min.css">
   <!-- Tweaks for older IEs-->
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <!-- fonts -->
   <link href="https://fonts.googleapis.com/css?family=Poppins:400,700|Righteous&display=swap" rel="stylesheet">
   <!-- owl stylesheets -->
   <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
   <link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
      media="screen">
</head>

<body>
    <!-- header section start -->
	<jsp:include page="common/header.jsp" />
    <!-- header section end -->
    <!-- contact section start -->
    <div class="contact_section layout_padding">
        <div class="container">
            <h1 class="contact_taital">1:1 문의</h1>
            <div class="email_text">
                <div class="form-group">
                    <input type="text" class="email-bt" placeholder="Name" name="Email">
                </div>
                <div class="form-group">
                    <input type="text" class="email-bt" placeholder="Phone Numbar" name="Email">
                </div>
                <div class="form-group">
                    <input type="text" class="email-bt" placeholder="Email" name="Email">
                </div>
                <div class="form-group">
                    <textarea class="massage-bt" placeholder="Massage" rows="5" id="comment" name="Massage"></textarea>
                </div>
                <div class="send_btn"><a href="#">SEND</a></div>
            </div>
        </div>
    </div>
    <!-- contact section end -->
    <!-- footer section start -->
    <jsp:include page="common/footer.jsp" />
    <!-- footer section end -->
    <!-- Javascript files-->
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/jquery-3.0.0.min.js"></script>
    <script src="resources/js/plugin.js"></script>
    <!-- sidebar -->
    <script src="resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="resources/js/custom.js"></script>
    <!-- javascript -->
    <script src="resources/js/owl.carousel.js"></script>
    <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
</body>

</html>