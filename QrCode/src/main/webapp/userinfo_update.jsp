<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.userDAO" %>
<%@ page import="user.userDTO" %>
<%@ page import="java.util.*" %>
<% response.setCharacterEncoding("UTF-8"); %>

<%
userDAO UserDAO = new userDAO();
String userID = null;
if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
if(userID == null) {
    PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.');");
    script.println("location.href = 'userLogin.jsp'");
	script.println("</script>");
	script.close();
return;
}

String id = null;
String name = null;
String pw = null;
String ph1 = null;
String ph2 = null;
String ph3 = null;
String addr = null;

//만약 요청한 userID가 null값이 아닐 경우 userID = 입력한 값
	if(request.getParameter("name") != ""){
		name = (String) request.getParameter("name");
	}
	// 만약 요청한 userPW가 null값이 아닐 경우 userPW = 입력한 값
	if(request.getParameter("userID") != ""){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("pw") != ""){
		pw = (String) request.getParameter("pw");
	}
	if(request.getParameter("ph1") != ""){
		ph1 = (String) request.getParameter("ph1");
	}
	if(request.getParameter("ph2") != ""){
		ph2 = (String) request.getParameter("ph2");
	}
	if(request.getParameter("ph3") != ""){
		ph3 = (String) request.getParameter("ph3");
	}
	if(request.getParameter("addr") != ""){
		addr = (String) request.getParameter("addr");
	}


int result = UserDAO.update(userID, pw, addr, ph1, ph2, ph3);

if(result == 1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정 완료')");
	script.println("location.href = 'mypage.jsp';");
	script.println("</script>");
	script.close();
	return;
	
}

else if (result == -1){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정 실패')");
	script.println("location.href = 'userinfo.jsp';");
	script.println("</script>");
	script.close();
	return;
}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>