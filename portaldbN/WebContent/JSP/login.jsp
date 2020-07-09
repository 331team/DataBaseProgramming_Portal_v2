<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="top.jsp" %>
	<br>
	<form class="form-horizontal" method="post" action="./loginVerify.jsp">
		<div class="col-sm-offset-4">
			<div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">학  번</label>
			  <div class="col-sm-2">
			      <input type="text" class="form-control" id="inputEmail3" name="usrID" placeholder="ID Number">
			  </div>
			</div>
			<div class="form-group">
			  <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
			    <div class="col-sm-2">
			      <input type="password" class="form-control" id="inputPassword3" name="usrPW" placeholder="Password">
				</div>
			</div>
		</div>
	  	<div class="form-group"> 
		  <button type="submit" class="btn btn-default">Sign in</button>
		</div>	    
	</form>

</body>
</html>