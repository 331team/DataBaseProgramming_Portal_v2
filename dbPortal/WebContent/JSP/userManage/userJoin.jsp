<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<section class="container mt-3" style="max-width:560px;">
	<form method="post" action="./userJoinVerify.jsp">
		<div class="form-group">
			<label for="inputId">아이디</label>
			<input type="text" class="form-control" id="inputId" name="usrID" placeholder="ID">
		</div>
		<div class="form-group">
			<label for="inputPassword" >비밀번호</label>
			<input type="password" class="form-control" id="inputPassword" name="usrPW" placeholder="Password">
		</div>
		<div class="form-group">
			<label for="inputName">이름</label>
			<input type="text" class="form-control" id="inputName" name="usrName" placeholder="Name">
		</div>
		<div class="form-group">
			<label for="inputEmail" >이메일</label>
			<input type="email" class="form-control" id="inputEmail" name="usrEmail" placeholder="example@sookmyung.ac.kr">
		</div>
		<div class="form-group">
			<label for="inputMajor">전공</label>
			<input type="text" class="form-control" id="inputMajor" name="usrMajor" placeholder="Major">
		</div>
		<div class="form-group"> 
			<button type="submit" class="btn btn-default">Sign Up</button>
		</div>	    
	</form>
	</section>
	<%@ include file="../bottom.jsp" %>
</body>
</html>