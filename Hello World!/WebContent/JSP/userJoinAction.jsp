<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
	String usrID = null;
	String usrPW = null;
	if(request.getParameter("usrID") != null) {
		usrID = (String) request.getParameter("usrID");
	}
	if(request.getParameter("usrPW") != null) {
		usrPW = (String) request.getParameter("usrPW");
	}
	if(usrID == null || usrPW == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 상황');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(usrID, usrPW, "a", "b", 0);
	if(result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입 성공');");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>