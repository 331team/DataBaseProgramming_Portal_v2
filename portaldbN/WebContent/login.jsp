<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
	<title>숙명여자대학교 수강신청</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<%@ include file="top.jsp" %>


	<section class="container mt-3" style="max-width:560px;">
		<form method="post" action="./loginVerify.jsp">
			<div class="form-group">
				<label>학 번</label>
				<input type="text" name="usrID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="usrPW" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">로그인</button>
		</form>
	</section>
    <%@ include file="bottom.jsp" %>
</body>
</html>