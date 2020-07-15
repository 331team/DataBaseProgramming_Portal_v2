<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%
	String usrID = (String)session.getAttribute("user");
	request.setCharacterEncoding("UTF-8");
	String usrPW = null;
	if(request.getParameter("usrPW") != null) {
		usrPW = (String) request.getParameter("usrPW");
	}
	if(usrPW == null || usrPW.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 상황');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.login(usrID, usrPW);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		session.setAttribute("user", null);
		script.println("<script>");
		script.println("alert('PW을 잘못 입력하셨습니다');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		result = userDAO.leave(usrID, usrPW);
		System.out.println(result);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원탈퇴가 완료되었습니다.');");
		script.println("window.close();");
		session.setAttribute("user", null);
		script.println("javascript:parent.opener.location.href='../index.jsp'");
		script.println("</script>");
	}
%>