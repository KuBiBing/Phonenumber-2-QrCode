<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>QR발급 시스템</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
<script src="generate.js"></script>
</head>
<style>
body{
background-image:url('background2.png');
}
h3{
color:#FAFAD2;
}
label{

color:#FAFAD2;
}
</style>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
							
			
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
							메뉴
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
											<!-- <a class="dropdown-item" href="userJoin.jsp">회원가입</a>  -->
						<a class="dropdown-item active" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					</div>
				</li>
				<a class="navbar-brand" href="index.jsp" text-align:center;>QR발급 시스템</a>
			</ul>
		</div>
</nav>
<div id="form-wrapper" style="width:46%; float:left; border:5px solid rgba(255,255,255,0.6); margin-top:20px; padding:10px">
    <form id="generator">     
        <input type="text" size="50" placeho lder="URL주소를 입력하세요" style="margin-top:20px" autocomplete="off"/ >
        <br>
        <button type="button" id="codeData" onclick="makeQr()">QR코드 생성하기</button>
    </form>
</div>

<div style="float:right;">
	<div id="image" style="margin:auto"></div>
</div>
  
  
<script>
function makeQr() {
	   <%
	   String usercode="123";
	   %>
	   var usercode=<%=usercode%>;
	   var data = "http://121.167.64.232:8081/graduation_porject/Send/TypeMSG02.jsp?personalID="+usercode;
	   var size = 248;
	 
	   if(data != "") {
	      if( $("#image").is(':empty')) {
	         
	            $("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
	            
	            $("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
	            return false;
	   }
	      else {
	         $("#image").html("");
	         $("#link").html("");
	         $("#code").html("");
	         $("#image").append("<img src='http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "' alt='qr' />");
	         $("#code").append("<p style='color:#fff;'><strong>Image Link:</strong> http://chart.apis.google.com/chart?cht=qr&chl=" + data + "&chs=" + size + "</p>");
	     
	        return false;
	        }
	      }
	   }
</script>
</body>
</html>