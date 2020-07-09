<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String session_id = (String)session.getAttribute("user");
boolean isStudent = true;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstra-theme.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="../CSS/body.css">

</head>
<body>
	<div class="container">
		<h1>숙명여자대학교 수강신청</h1>
		<div class="row">
			<div class="col-xs-12 col-md-8"></div>
			<% if(session_id == null){ %>
				<div class="col-xs-6 col-md-4"><a href="./login.jsp">로그인</a></div>
			<% } else {
				isStudent = ((Boolean) session.getAttribute("student")).booleanValue();
			%>
				<div class="col-xs-6 col-md-4"><%= session_id %>님 / <a href="./logout.jsp">로그아웃</a></div>
			<% } %>
		</div>
		<div class="row">
			<% if(isStudent) { %>
				<div class="col-md-4"><a href="./enrollCourse.jsp">수강신청</a></div>
				<div class="col-md-4"><a href="">시간표</a></div>
				<div class="col-md-4"><a href="">회원정보 수정</a></div>
			<% } else { %>
				<div class="col-md-4"><a href="">강의개설</a></div>
				<div class="col-md-4"><a href="">시간표</a></div>
				<div class="col-md-4"><a href="">회원정보 수정</a></div>
			<% } %>
		</div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>