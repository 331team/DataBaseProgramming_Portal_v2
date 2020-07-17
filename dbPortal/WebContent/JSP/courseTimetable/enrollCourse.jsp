<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
if(session.getAttribute("user") == null){
	response.sendRedirect("/dbPortal/JSP/login.jsp");
} else {
String selected = request.getParameter("type");
if(selected == null){
	selected = "major";
}
String major = request.getParameter("major");
if(major == null){
	major = new UserDAO().getMajor((String)session.getAttribute("user"));
}
int year = 2020;
if(session.getAttribute("year") != null){
	year = (Integer) session.getAttribute("year");
}
if(request.getParameter("year")!=null){
	year = Integer.parseInt(request.getParameter("year"));
	session.setAttribute("year", year);
}
int semester = 1;
if(session.getAttribute("semester") != null){
	semester = (Integer) session.getAttribute("semester");
}
if(request.getParameter("semester")!=null){
	semester = Integer.parseInt(request.getParameter("semester"));
	session.setAttribute("semester", semester);
}
String majors[] = {"경영학부", "소프트웨어융합전공", "컴퓨터과학전공", "화공생명공학과"};
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../../CSS/tab.css">
<title>Insert title here</title>
	<script type="text/javascript">
		function showPopup(search) { window.open("/dbPortal/JSP/courseEvaluation.jsp?search="+search, "강의평", "width=600, height=500, left=300, top=200"); }
	</script>
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="container ">
		<div class = "col-md-offset-1 col-md-15">
			<div class="form-row justify-content-between container">
				<h3 class="mt-2">신청한 강의</h3>
				<form action="enrollCourse.jsp" method="get">
				<div class="row ">
					<div class="form-group mt-2">
						<select name="year" class="form-control">
						<%for(int i=2011; i< 2022; i++){ %>
							<option value="<%=i%>" <%if(i==year){%> selected <%}%>><%=i %></option>
						<%} %>
						</select>
					</div>					
					<div class="form-group mx-1 mt-2">
						<select name="semester" class="form-control">
							<option value="1" <%if(semester==1){%> selected <%}%>>1학기</option>
							<option value="2" <%if(semester==2){%> selected <%}%>>여름학기</option>
							<option value="3" <%if(semester==3){%> selected <%}%>>2학기</option>
							<option value="4" <%if(semester==4){%> selected <%}%>>겨울학기</option>
						</select>
					</div>
					<div class="mt-2">
						<button type="submit" class="btn btn-primary">검색</button>
					</div>
				</div>
				</form>
			</div>
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
							courseList = new CourseDAO().enrolled(session_id, year, semester);
							
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
									<button class="btn btn-outline-secondary btn-sm" onClick ="location.href='./dropCourseVerify.jsp?courseNo=<%=course.getCourseNo()%>&classNo=<%=course.getClassNo()%>&year=<%=course.getYear()%>&semester=<%=course.getSemester()%>'">취소</button>
								</td>
							</tr>
						<%} %>
					</tbody>
				</table>
			</div>
		
			<div>
				<h3>개설 강의</h3>
				<form action="enrollCourse.jsp" method="get">
				<div class="row justify-content-between container">
					<div class="tab_wrap mt-1">
					  <div class="tab_menu_container">
					    <a href="enrollCourse.jsp?type=major&year=<%=year %>&semester=<%=semester %>" class="tab_menu_btn" id="major">전공</a>
					    <a href="enrollCourse.jsp?type=gen&year=<%=year %>&semester=<%=semester %>" class="tab_menu_btn" id="gen">교양</a>
					    <a href="enrollCourse.jsp?type=pf&year=<%=year %>&semester=<%=semester %>" class="tab_menu_btn" id="pf">PF</a>
					    <a href="enrollCourse.jsp?type=cyber&year=<%=year %>&semester=<%=semester %>" class="tab_menu_btn" id="cyber">사이버</a>
					    <div id="selected" value="<%=selected %>"></div>
					  </div>
					</div>
					<% if(selected.equals("major")){ %>
					<div class="row">
						<div class="form-group">
							<select name="major" class="form-control">
							<%for(int i=0; i< majors.length; i++){ %>
								<option value="<%=majors[i]%>" <%if(major.equals(majors[i])){%> selected <%}%>><%=majors[i] %></option>
							<%} %>
							</select>
						</div>
						<div>
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</div>
					<%} %>
				</div>
				</form>
				<table class="table table-striped table-hover mt-1">
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
							<th>신청</th>
						</tr>
					</thead>
					<tbody>
					<% 
					if(selected.equals("major"))
						courseList = new CourseDAO(session_id).getMajorCourse(major, year, semester);
					else if(selected.equals("gen"))
						courseList = new CourseDAO(session_id).getGenCourse(year, semester);
					else if(selected.equals("pf"))
						courseList = new CourseDAO(session_id).getPfCourse(year, semester);
					else
						courseList = new CourseDAO(session_id).getCyberCourse(year, semester);
					
					if(courseList != null)
						for(int i = 0; i < courseList.size(); i++){
							CourseDTO course = courseList.get(i);
							String day = course.getDay();
							String startTime = course.getStartTime();
							String endTime = course.getEndTime();
							String time = day + " " + startTime.substring(0,2) + ":" + startTime.substring(2) + " ~ " + endTime.substring(0,2) + ":" + endTime.substring(2);
					%>
					<tr>
							<td><%=course.getCategory() %></td>
							<td><%=course.getCourseNo() %></td>
							<td><%=course.getClassNo() %></td>
							<td onClick="showPopup('<%=(course.getCourseName() + course.getProf()) %>');"><%=course.getCourseName() %></td>
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
								<button class="btn btn-outline-secondary btn-sm" onClick ="location.href='./enrollCourseVerify.jsp?courseNo=<%=course.getCourseNo()%>&classNo=<%=course.getClassNo()%>&classNo=<%=course.getClassNo()%>&year=<%=course.getYear()%>&semester=<%=course.getSemester()%>'">신청</button>
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
<% }%>