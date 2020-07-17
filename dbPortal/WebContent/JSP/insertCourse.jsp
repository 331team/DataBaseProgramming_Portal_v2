<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Courses</title>
</head>
<body>
<div>
	<a href="downloadCSV.jsp">양식 다운받기</a>
</div>
<form action="uploadCSV.jsp" method="post" enctype="multipart/form-data">
	파일: <input type="file" name="upload"/>
	<input type="submit" />
</form>

</body>
</html>
