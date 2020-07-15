<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file="top.jsp" %>
	<section class="container mt-3" style="max-width:560px;">
	<form method="post" action="./loginVerify.jsp">
		<div class="form-group">
			<label for="inputEmail">아이디</label>
			<input type="text" class="form-control" id="inputEmail" name="usrID" placeholder="ID">
		</div>
		<div class="form-group">
			<label for="inputPassword" >비밀번호</label>
			<input type="password" class="form-control" id="inputPassword" name="usrPW" placeholder="Password">
		</div>
	  	<div class="form-group"> 
			<button type="submit" class="btn btn-default">Sign in</button>
		</div>	    
	</form>
	</section>
	<%@ include file="./bottom.jsp" %>
</body>
</html>