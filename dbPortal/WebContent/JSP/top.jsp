<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String session_id = (String)session.getAttribute("user");
Boolean isStudent = true;
if(session.getAttribute("student")!= null)
	isStudent = (Boolean)session.getAttribute("student");
String url = "http://localhost:8020/dbPortal/JSP/";
%>
<!DOCTYPE html>
<html>
<head>
	<title>숙명여자대학교 수강신청</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="/dbPortal/CSS/bootstrap.min.css">
    <link rel="stylesheet" href="/dbPortal/CSS/custom.css">
    
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
    	<a class="navbar-brand" href= <%=url + "index.jsp"%>>숙명여자대학교 수강신청</a>
    	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav mr-auto">
			<% if(isStudent){ %>
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "courseTimetable/enrollCourse.jsp" %>>수강신청</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "index.jsp"%>>시간표</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href=<%= url + "courseEvaluation.jsp"%>>강의평가</a>
				</li>
			<% }  else { %>
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "courseTimetable/enrollCourse.jsp" %>>신규강의</a>
				</li>
				<li class="nav-item active">
					<a class="nav-link" href= <%=url + "index.jsp"%>>강의정보</a>
				</li>
			<% } %>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">
						회원 관리
					</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<%if(session_id == null){ %>
							<a class="dropdown-item" href= <%=url + "login.jsp"%>>로그인</a>
							<a class="dropdown-item" href= <%=url + "userManage/userJoin.jsp"%>>회원가입</a>
						<%} %>
						<% if(session_id !=null){ %>
							<a class="dropdown-item" href= <%=url + "userManage/updateUserInfo.jsp"%>>정보수정</a>
							<a class="dropdown-item" href= <%=url + "logout.jsp"%>>로그아웃</a>
						<%} %>
					</div>
				</li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
			</form>
		</div>
    </nav>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
    <script src="/dbPortal/JS/jquery.min.js"></script>
    <!-- Popper 자바스크립트 추가하기 -->
    <script src="/dbPortal/JS/popper.min.js"></script>
    <!-- 부트스트랩 자바스크립트 추가하기 -->
    <script src="/dbPortal/JS/bootstrap.min.js"></script>
	
</body>
</html>