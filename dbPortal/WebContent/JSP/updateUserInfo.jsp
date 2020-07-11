<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = null;
	String major = null;
	String password = null;
	UserDAO userDAO = new UserDAO();
	ArrayList<String> result = userDAO.getInfo(session_id);
	if(result != null){
		name = result.get(0);
		major = result.get(1);
		password = result.get(2);
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다. 다시 시도해주세요');");
		script.println("history.back();");
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
	<section class="container mt-3" style="max-width:560px;">
	<form method="post" action="./updateUserVerify.jsp">
		<div class="form-group">
			<label for="inputEmail3">학  번</label>
			<input type="text" class="form-control" id="inputEmail3" name="usrID" value="<%=session_id %>" disabled>
		</div>
		<div class="form-group">
			<label for="inputEmail3">이  름</label>
			<input type="text" class="form-control" id="inputEmail3" name="usrID" value="<%=name%>" disabled>
		</div>
		<div class="form-group">
			<label for="inputEmail3">전  공</label>
			<input type="text" class="form-control" id="inputEmail3" name="usrID" value="<%=major%>" disabled>
		</div>
		<div class="form-group">
			<label for="inputPassword3" >비밀번호</label>
			<input type="password" class="form-control" id="inputPassword3" name="usrPW" placeholder="Password">
		</div>
	  	<div class="form-group"> 
			<button type="submit" class="btn btn-default">Update</button>
		</div>	    
	</form>
	</section>
	<%@ include file="./bottom.jsp" %>
</body>
</html>