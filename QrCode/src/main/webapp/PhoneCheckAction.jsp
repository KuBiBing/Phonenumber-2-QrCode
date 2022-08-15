<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.userDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<% 
request.setCharacterEncoding("UTF-8");
String checknum = null;

if(request.getParameter("checknum") != null){
	checknum = (String) request.getParameter("checknum");
}

userDAO UserDAO = new userDAO();
String userID = null;


if(session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}

if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 해주세요.')");
	script.println("location.href = 'userLogin.jsp'");
	script.println("</script>");
	script.close();
	return;
}


boolean isRight = (UserDAO.getchecknum(userID).equals(checknum)) ? true : false;

if(isRight == true){
	UserDAO.setchecked(userID);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('문자 인증이 성공하였습니다.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

else {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('문자 인증이 실패하였습니다. 다시 확인해주세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
	script.close();
	return;
}

%>