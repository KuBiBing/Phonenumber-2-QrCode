<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDAO" %>
<%@ page import="user.userDTO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> QR발급 시스템 </title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>
body{
background-image:url('background.jpg');
}
.atag{
	text-align: center;
}

.container img {
  max-width: 100%;
  height: auto;
  display: block;
}
h3{
color:#000000;
}
</style>
<body>


<%
/*
	String userID = null;
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}

if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.')");
	script.println("location.href = 'userLogin.jsp';");
	script.println("</script>");
	script.close();
	return;
}

boolean emailCheck = new userDAO().getUserEmailChecked(userID);
if(emailCheck == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.')");
		script.println("location.href = 'emailSendConfirm.jsp';");
		script.println("</script>");
		script.close();
		return;
}

*/
%>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	
					<%
						if (session.getAttribute("userID") != null) { 
					%>
					<b><%=session.getAttribute("userID")%></b>님 환영합니다.
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					메뉴
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<a class="dropdown-item" href="mypage.jsp">마이페이지</a>
					</div>
				</li>
			</ul>
						 <% 
						} else { id = request.getParameter("id");%>
			<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
			
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" float:right>
					메뉴
					</a>
						<%
						}
						%>
					
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
					</div>
				</li>
				<a class="navbar-brand" href="index.jsp">QR발급 시스템</a>
			</ul>
		
			
	
		</div>
	</nav>
	<br><br><br><br><br><br>
	<div class="container">
	<h1> QR발급 시스템이란?</h1>
	<br><br><br><br><br>
	
	<h3> 오늘날 자동차 전면부 유리창에 차 주인 자신의 전화번호를 붙이고 다니는 모습을 흔히 볼 수</h3>
	<h3> 있습니다. 비상시 연락을 위한 조치라곤 하나 이로 인해 차 주인의 전화번호가 쉽게 노출됩니다.</h3>
	
	<br><br><br><br><br><br>
	<li>
		<img src="scanning.png">
	</li>
	<br><br><br><br>
	<h3> 저희 시스템은 이를 방지하고자 전화번호를 QR코드화 시켜</h3>
	<h3> 연락은 기존처럼 쉽게, 전화번호는 숨길 수 있는 서비스를 제공합니다</h3>
	</div>
	
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>