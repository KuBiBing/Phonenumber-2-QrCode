<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.userDTO" %> 
<%@ page import="user.userDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	userDAO UserDAO = new userDAO();
	String userID = null;
	String pw = null;
	
	// 만약 요청한 userID가 null값이 아닐 경우 userID = 입력한 값
	if(request.getParameter("userID") != null){
		userID = (String) request.getParameter("userID");
	}
	// 만약 요청한 userPW가 null값이 아닐 경우 userPW = 입력한 값
	if(request.getParameter("pw") != null){
		pw = (String) request.getParameter("pw");
	}

	// 만약 userID나 PW가 null값이라면 오류문 출력
	if(userID == null || pw == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	boolean check = UserDAO.getchecked(userID);
	int result = UserDAO.login(userID, pw);
	
	if (result == -1){ // 아이디가 없을 시 -1
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == 0){ // 비밀번호 틀릴 시 result = 0
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	else if (result == 1){ // 로그인 성공 시 result = 1
		if (check == false){
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('문자 인증을 해주십시오.')");
			script.println("location.href = 'PhoneSendAction.jsp';");
			script.println("</script>");
			script.close();
			return;
		}
		else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
		}
	}

	else if (result == -2){ // 데이터 베이스 오류 시 -2
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생하였습니다.')");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
