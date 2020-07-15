<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	String usrID = null;
	
	if(request.getParameter("usrID") != null){
		usrID = request.getParameter("usrID");
	}
	System.out.println(usrID);
	UserDAO userDAO = new UserDAO();
	int result = userDAO.delete(usrID);
	if(result == -1){
		System.out.println(usrID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB오류 입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		userDAO.delete(usrID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('해당 회원의 탈퇴가 완료되었습니다.');");
		script.println("window.close();");
		script.println("location.href='./userDelete.jsp'");
		script.println("</script>");
	}
%>