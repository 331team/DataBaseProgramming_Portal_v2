<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
String selected = request.getParameter("type");
if(selected == null){
	selected = "gen";
}
String major = request.getParameter("major");
if(major == null){
	major = new UserDAO().getMajor((String)session.getAttribute("user"));
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../CSS/tab.css">
<title>Insert title here</title>
	<script type="text/javascript">
		function showPopup(search) { window.open("/dbPortal/JSP/courseEvaluation.jsp?search="+search, "회원탈퇴", "width=600, height=500, left=300, top=200"); }
	</script>
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
				<div class="tab_wrap">
				  <div class="tab_menu_container">
				    <a href="enrollCourse.jsp?type=major" class="tab_menu_btn" id="major">전공</a>
				    <a href="enrollCourse.jsp?type=gen" class="tab_menu_btn on" id="gen">교양</a>
				    <a href="enrollCourse.jsp?type=pf" class="tab_menu_btn" id="pf">PF</a>
				    <a href="enrollCourse.jsp?type=cyber" class="tab_menu_btn" id="cyber">사이버</a>
				    <div id="selected" value=<%=selected %>></div>
				  </div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr class="bg-primary">
							<th>분류</th>
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
					if(selected.equals("major"))
						courseList = new CourseDAO().getMajorCourse(session_id, 2020, 1);
					else if(selected.equals("gen"))
						courseList = new CourseDAO().getGenCourse(2020, 1);
					else if(selected.equals("pf"))
						courseList = new CourseDAO().getPfCourse(2020, 1);
					else
						courseList = new CourseDAO().getCyberCourse(2020, 1);
					
					if(courseList != null)
						for(int i = 0; i < courseList.size(); i++){
							CourseDTO course = courseList.get(i);
							String day = course.getDay();
							String startTime = course.getStartTime();
							String endTime = course.getEndTime();
							String time = day + " " + startTime.substring(0,2) + ":" + startTime.substring(2) + " ~ " + endTime.substring(0,2) + ":" + endTime.substring(2);
					%>
					<tr onClick="showPopup('<%=(course.getCourseName() + course.getProf()) %>');">
							<td><%=course.getCategory() %></td>
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
								<button class="btn btn-outline-secondary btn-sm">신청</button>
							</td>
					</tr>
					<%} %>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<%@ include file="../bottom.jsp" %>
	<script src="../../JS/tabMenu.js"></script>
</body>
</html>