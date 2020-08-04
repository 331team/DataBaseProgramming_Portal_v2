<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분반 조회</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 부트스트랩 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <!-- 커스텀 CSS 추가하기 -->
    <link rel="stylesheet" href="./css/custom.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="../CSS/custom.css">
	
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String usrID = null;
	
	if(session.getAttribute("user") != null){
		usrID = (String) session.getAttribute("user");
	}
	
	if(usrID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요.');");
		script.println("location.href = 'login.jsp';");
		script.println("</script>");
		script.close();
		return ;
	}
	int courseNo = -1;
	int classNo = -1;
	int year = -1;
	int semester = -1;
	
	if(request.getParameter("courseNo") != null) {
		System.out.println("courseNo");
		try {
			courseNo = Integer.parseInt(request.getParameter("courseNo"));
		} catch(Exception e){
			System.out.println("강의번호 데이터 오류");
		}
		
	}
	
	
	if(courseNo == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 강의입니다.')");
		script.println("location.href='insertionCourse.jsp'");
		script.println("</script>");
		
	}
	CourseDTO course = new CourseDAO().viewCourse(courseNo);
%>
<body>
	<%@ include file="./top.jsp" %>
	<section class="container mt-3" style="max-width:560px;">
    	<div class="row">
    		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    			<thead>
    				<tr>
    					<th colspan = "3" style="background-color: #eeeeee; text-align: center;">분반 조회</th>
    				</tr>
    			</thead>
    			<tbody>
    				<tr>
    					<td style="width: 20%">강의번호</td>
    					<td colspan="2"><%= course.getCourseNo() %>
    				</tr>
    				<tr>
    					<td style="width: 20%">강의명</td>
    					<td colspan="2"><%= course.getCourseName() %>
    				</tr>
    				<tr>
    					<td style="width: 20%">강의 구분</td>
    					<td colspan="2"><%= course.getCategory() %>
    				</tr>
    				<tr>
    					<td style="width: 20%">주관 학과</td>
    					<td colspan="2"><%= course.getMajor() %></td>
    				</tr>
    				<tr>
    					<td style="width: 20%">학점</td>
    					<td colspan="2"><%= course.getCredit() %></td>
    				</tr>
    				<tr>
    					<td style="width: 20%">PF</td>
    					<td>
							<%if(course.getPF() == 1) { %>
								<input type="checkbox" name="PF" value="online" checked="checked" disabled="disabled"/>
								<% } else { %>
								<input type="checkbox" name="PF" value="offline" disabled="disabled"/>
							<% } %>
						</td>
    				</tr>
    				<tr>
    					<td style="width: 20%">사이버</td>
    					<td>
							<%if(course.getCyber() == 1) { %>
								<input type="checkbox" name="cyber" value="online" checked="checked" disabled="disabled"/>
							<% } else { %>
								<input type="checkbox" name="cyber" value="offline" disabled="disabled"/>
							<% } %>
						</td>
    				</tr>
    			</tbody>	
    		</table>
    		<a href="insertionCourse.jsp" class="btn btn-primary">강의 목록</a>
    		<%
    			if(usrID != null){
       		%>
       				<a class="btn btn-primary" href="modifyCourse.jsp?courseNo=<%=course.getCourseNo()%>">수정</a>
    		<%
    			}
    		%>
    	</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>