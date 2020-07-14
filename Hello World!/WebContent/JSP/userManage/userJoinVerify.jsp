<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
String userID = null;
String userPassword = null;
String userEmail = null;
String userName = null;
String userMajor = null;
if(request.getParameter("usrID") != null) {
	userID = (String) request.getParameter("usrID");
}
if(request.getParameter("usrPW") != null) {
	userPassword = (String) request.getParameter("usrPW");
}
if(request.getParameter("usrEmail") != null) {
	userEmail = (String) request.getParameter("usrEmail");
}
if(request.getParameter("usrName") != null) {
	userName = (String) request.getParameter("usrName");
}
if(request.getParameter("usrMajor") != null) {
	userMajor = (String) request.getParameter("usrMajor");
}

if (userID == null || userPassword == null || userEmail == null || userName == null || userMajor == null) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력이 안 된 사항이 있습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
} else {
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(userID, userPassword, userName, userMajor, 0, userEmail, SHA256.getSHA256(userEmail));
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		session.setAttribute("user", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendAction.jsp';");
		script.println("</script>");
		script.close();
	}
}
%>