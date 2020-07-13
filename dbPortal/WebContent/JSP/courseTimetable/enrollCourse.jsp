<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="../CSS/custom.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="container">
		<div class = "col-md-offset-1 col-md-15">
			<div>
				<h3>신청한 강의</h3>
				<table class="table table-striped table-hover">
					<thead>
						<tr class="bg-primary">
							<th>과목코드</th>
							<th>분반</th>
							<th>과목명</th>
							<th>학점</th>
							<th>강의시간</th>
							<th>강의실</th>
							<th>교수명</th>
							<th>사이버</th>
							<th>P/F</th>
							<th>취소</th>
						</tr>
					</thead>
					<tbody>
						<% 
							ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
							courseList = new CourseDAO().enrolled(session_id, 2020, 1);
							
							if(courseList != null)
								for(int i = 0; i < courseList.size(); i++){
									if(i == 5) break;
									CourseDTO course = courseList.get(i);
									String day = course.getDay();
									String startTime = course.getStartTime();
									String endTime = course.getEndTime();
									String time = day + " " + startTime.substring(0,2) + ":" + startTime.substring(2) + " ~ " + endTime.substring(0,2) + ":" + endTime.substring(2);
						%>
							<tr>
								<td><%=course.getCourseNo() %></td>
								<td><%=course.getClassNo() %></td>
								<td><%=course.getCourseName() %></td>
								<td><%=course.getCredit() %></td>
								<td><%=time %></td>
								<td><%=course.getRoom() %></td>
								<td><%=course.getProf() %></td>
								<td>
									<%if(course.getCyber() == 1) { %>
										<input type="checkbox" name="cyber" value="online" checked="checked" disabled="disabled"/>
									<% } else { %>
										<input type="checkbox" name="cyber" value="offline" disabled="disabled"/>
									<% } %>
								</td>
								<td>
									<%if(course.getPF() == 1) { %>
										<input type="checkbox" name="cyber" value="online" checked="checked" disabled="disabled"/>
									<% } else { %>
										<input type="checkbox" name="cyber" value="offline" disabled="disabled"/>
									<% } %>
								</td>
								<td>
									<button class="btn btn-outline-secondary btn-sm">취소</button>
								</td>
							</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		
			<div>
				<h3>개설 강의</h3>
			</div>
		</div>

	</div>
	

</body>
</html>