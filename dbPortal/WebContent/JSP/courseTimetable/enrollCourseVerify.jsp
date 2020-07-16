<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="course.CourseDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<%
int courseNo = 0, classNo = 0, year = 0, semester = 0;
if(request.getParameter("courseNo") != null) {
	courseNo = Integer.parseInt(request.getParameter("courseNo"));
}
if(request.getParameter("classNo") != null) {
	classNo = Integer.parseInt(request.getParameter("classNo"));
}
if(request.getParameter("year") != null) {
	year = Integer.parseInt(request.getParameter("year"));
}
if(request.getParameter("semester") != null) {
	semester = Integer.parseInt(request.getParameter("semester"));
}

int result = new CourseDAO().insert((String)session.getAttribute("user"), courseNo, classNo, year, semester);
if(result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('오류가 발생하였습니다. 잠시후 다시 시도해주세요.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
}
else if(result == -2) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 신청한 강의와 시간이 겹칩니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
}
else {
	response.sendRedirect("enrollCourse.jsp?&year=" + year + "&semester=" + semester);
}
%>

<body>
<%@ include file="../top.jsp" %>

</body>
</html>