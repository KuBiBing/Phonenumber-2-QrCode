<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import="util.DatabaseUtill" %>
 <%@ page import="java.io.PrintWriter"%>
<%@ page import="user.userDAO" %>
<%@ page import="user.userDTO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	userDAO UserDAO = new userDAO();
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
	    PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('�α����� ���ּ���.');");
	    script.println("location.href = 'userLogin.jsp'");
   		script.println("</script>");
   		script.close();
   	return;
}

	String id = UserDAO.userID(userID);
	String name = UserDAO.name(userID);
	String pw = UserDAO.pw(userID);
	String ph1 = UserDAO.search1(userID);
	String ph2 = UserDAO.search2(userID);
	String ph3 = UserDAO.search3(userID);
	String addr = UserDAO.addr(userID);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>QR�߱� �ý���</title>
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
<script language="javascript">
function showPopup(){
	window.open("userQRcode.html","QR�ڵ� ����","width=500, height=700, left=700, top=400");
}
</script>

<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">QR�߱� �ý���</a>
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
			</ul> <% 
						} else {id = request.getParameter("id");%>
						<script type="text/javascript">
						location.href = "index.jsp";
						</script>
						<%
						}
						%>
	</nav>
	<section class="container mt-3" style="max-width: 560px;">
	<h3>��������</h3>
		<form action="userinfo_update.jsp" method="post">
		<div class="form-group">
			���̵� :<input type="text" name="userID" value="<%=userID %>" class="form-control" readonly><br/>
			�̸� :<input type="text" name="name" value="<%=name %>" class="form-control" readonly><br/> 
			��й�ȣ :<input type="password" name="pw" class="form-control"><br/>
			�̸��� :<input type="text" name="addr" value="<%=addr%>" class="form-control"><br/>
			��ȭ��ȣ :<input type="text" name="ph1" maxlength ="3" value="<%=ph1 %>" class="form-control"><br/>
					<input type="text" name="ph2" maxlength = "4" value="<%=ph2 %>" class="form-control"><br/>
					<input type="text" name="ph3" maxlength = "4" value="<%=ph3%>"class="form-control"><br/>
				<input type="submit" value="����">
			</div>
				</form>
	</section>
	<script src="./js/jquery.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	
	

</body>
</html>