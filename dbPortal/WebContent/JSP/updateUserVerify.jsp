<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ include file="top.jsp" %>
<%
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
	int result = userDAO.update(session_id, usrPW);
	if(result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('PW을 확인하세요');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('변경 완료!');");
		script.println("location.href = 'index.jsp';");
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