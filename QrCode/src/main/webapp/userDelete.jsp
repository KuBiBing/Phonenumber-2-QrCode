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
<title>QR�߱� �ý���</title>
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
					<b><%=session.getAttribute("userID")%></b>�� ȯ���մϴ�.
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					�޴�
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogout.jsp">�α׾ƿ�</a>
						<a class="dropdown-item" href="mypage.jsp">����������</a>
					</div>
				</li>
			</ul>
						 <% 
						} else { id = request.getParameter("id");%>
			<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">����ȭ��</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
					�޴�
					</a>
						<%
						}
						%>
						

					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">ȸ������</a>
						<a class="dropdown-item" href="userLogin.jsp">�α���</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	
	<section class="container mt-3" style="max-width: 560px;">
		<h2>ȸ�� Ż��</h2>
		<h5>���̵�� ��й�ȣ�� �Է����ּ���.</h5>
			<form action="userDeleteAction.jsp" method="post">
				<div class="form-group">
					<label>���̵� :</label><input type="text" name="userID" class="form-control">
					<label>��й�ȣ :</label><input type="password" name="pw" class="form-control"><br/>
								  <input type="submit" value="Ȯ��">
	
				</div>	
			</form>
	</section>
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>