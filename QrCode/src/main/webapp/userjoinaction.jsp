<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.userDTO" %> 
<%@ page import="user.userDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%

	request.setCharacterEncoding("UTF-8");
	String name = null;
	String userID = null;
	String pw = null;
	String ph1 = null;
	String ph2 = null;
	String ph3 = null;
	String addr = null;
	int checknum = (int)Math.floor(Math.random()*899999)+100000;
	int uc = (int)Math.floor(Math.random()*899999)+100000;
	
	
	
	// 만약 요청한 userID가 null값이 아닐 경우 userID = 입력한 값
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
	
	// 만약 userID나 PW가 null값이라면 오류문 출력
	if(name == null || userID == null || pw == null || ph1 == null || ph2 == null || ph3 == null || addr == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	
	
	userDAO UserDAO = new userDAO();
//	int result = UserDAO.join(new userDTO(userID, userPassword, userEmail, userCall1, userCall2, userCall3)); // 회원가입 한 결과를 result에다 담기
	int result = UserDAO.join(new userDTO(name, userID, pw, ph1, ph2, ph3, checknum, false, addr, uc)); // 회원가입 한 결과를 result에다 담기
	if (result == -5){ // 회원가입 실패 시 result == -5
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입 실패')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}

//	else if (result == 1){  //회원가입 성공 시 result == 1
//		PrintWriter script = response.getWriter();
//		script.println("<script>");
//		script.println("alert('회원가입에 성공하였습니다.')");
//		script.println("location.href = 'index.jsp';");
//		script.println("</script>");
//		script.close();
//		return;
//	}

	
	else if (result == 1){ // 회원가입 성공 시 result == 1
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'PhoneSendAction.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	
%>
