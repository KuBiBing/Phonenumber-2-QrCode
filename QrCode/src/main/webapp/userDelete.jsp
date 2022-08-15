<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtill" %>
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
<title>QR발급 시스템</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>
body{
background-image:url('background2.png');
}
h3{
color:#000000;
}
label{
color:#FAFAD2;
}
</style>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">Hello world!</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
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
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인화면</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
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
			</ul>
		</div>
	</nav>
	
	<section class="container mt-3" style="max-width: 560px;">
		<h2>회원 탈퇴</h2>
		<h5>아이디와 비밀번호를 입력해주세요.</h5>
			<form action="userDeleteAction.jsp" method="post">
				<div class="form-group">
					<label>아이디 :</label><input type="text" name="userID" class="form-control">
					<label>비밀번호 :</label><input type="password" name="pw" class="form-control"><br/>
								  <input type="submit" value="확인">
	
				</div>	
			</form>
	</section>
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>