<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>EVENT_페이지</title>

<!-- <link rel="stylesheet" href="/resources/css/index.css"> -->

</head>
<style>
body {
  /* background-color: #f1ebe5; 
  background-color:white; */
  text-align: center;
}

h4 {
  /* margin: 20px; */
  font-family: "Paytone One";
  color: #202020;
  text-transform: uppercase;
  letter-spacing: -2px;
}
.text-font{
 text-align:center; 
 margin-top:10px;
 margin-right:10px; 
 margin-bottom:15px;
}

.text-bold{
	font-size:30px;
	color: red;
}

.home_btn{
	margin-top: 1.5em;
	width: 600px;
	height:60px;
	margin-bottom: 2em;
	border-radius: 8px; 
	border: 1px solid white; 
	margin-bottom:15px;
}
.event_btn{
	color:white;
  	background-color:rgb(237 28 36);
  	border-radius:10px;
  	box-shadow: 0 0 0.1em 0.1em white;
  	font-size:30px;
  	height:60px;
  	width: 500px;
  	margin:30px;
  	border: 0;
}

.event_btn:hover {
  	color: white;
  	 background-color:rgb(255 205 0); 
}

.main {
	text-align: center;
	margin: 100px;	
}
.all{
padding: 40% 10% 40% 10%;
}
</style>
<script>
	function joinMember(){
		document.frm.action = '/join'
		document.frm.submit()
	}
</script>
<body>
<form id="frm" name="frm" method="post">
	<input type="hidden" name="joinPath" value="1">
</form>
	<!-- <div class="eventImg">
		<img  src="resources/img/free-icon-mobile-phone-4875709.png" ><br><br>
		<input id="join" type="button" value="참여하고 캐시받기" onClick="location.href='eventJoin'" style="background-color: yellow;font-weight: bold;font-size:20px;">	
	</div> -->	
<div class="all">
	<div class="main">
		<div class="event-content">
		<img src="resources/img/free-icon-mobile-phone-4875709.png">
		<div class="text-font">
		회원가입 하면 <strong class="text-bold">+10000캐시</strong>지급!
		</div>
		<button class="event_btn" type="button" 
		 onclick="location.href='intro'">+10000 캐시받기 가입하기</button>
		</div>
		<div class="home-main">
		<button class="event_btn" type="button"  
		onclick="joinMember()">보상받지않고 가입하기</button>
	</div>
	</div>
	
</div>
</body>
</html>