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
<title> QR�߱� �ý��� </title>
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
	script.println("alert('�α����� ���ּ���.')");
	script.println("location.href = 'userLogin.jsp';");
	script.println("</script>");
	script.close();
	return;
}

boolean emailCheck = new userDAO().getUserEmailChecked(userID);
if(emailCheck == false){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� ���ּ���.')");
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
			
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown" float:right>
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
				<a class="navbar-brand" href="index.jsp">QR�߱� �ý���</a>
			</ul>
		
			
	
		</div>
	</nav>
	<br><br><br><br><br><br>
	<div class="container">
	<h1> QR�߱� �ý����̶�?</h1>
	<br><br><br><br><br>
	
	<h3> ���ó� �ڵ��� ����� ����â�� �� ���� �ڽ��� ��ȭ��ȣ�� ���̰� �ٴϴ� ����� ���� �� ��</h3>
	<h3> �ֽ��ϴ�. ���� ������ ���� ��ġ��� �ϳ� �̷� ���� �� ������ ��ȭ��ȣ�� ���� ����˴ϴ�.</h3>
	
	<br><br><br><br><br><br>
	<li>
		<img src="scanning.png">
	</li>
	<br><br><br><br>
	<h3> ���� �ý����� �̸� �����ϰ��� ��ȭ��ȣ�� QR�ڵ�ȭ ����</h3>
	<h3> ������ ����ó�� ����, ��ȭ��ȣ�� ���� �� �ִ� ���񽺸� �����մϴ�</h3>
	</div>
	
	
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
</body>
</html>