<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtill" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.userDAO" %>
<%@ page import="user.userDTO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	userDAO UserDAO = new userDAO();
	String userID = null;
	String pw = null;
	
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
	
	if(request.getParameter("userID") != ""){
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("pw") != ""){
		pw = (String) request.getParameter("pw");
	}
	
	int check = UserDAO.login(userID, pw);
	boolean result = UserDAO.deleteUser(userID);
	
	if(check == 1){
		if(result == true){
			session.invalidate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 탈퇴 완료')");
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
			script.close();
			return;
		}else if(result == false) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원 탈퇴 실패')");
			script.println("location.href = 'mypage.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
		
	}else if(check == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("location.href = 'userDelete.jsp';");
		script.println("</script>");
		script.close();
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