<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="java.util.ArrayList" %>
<% if(session.getAttribute("user") == null) response.sendRedirect("/dbPortal/JSP/login.jsp"); %>    
<% int year = 2020;
if(request.getParameter("year")!=null){
	year = Integer.parseInt(request.getParameter("year"));
	session.setAttribute("year", year);
}
int semester = 1;
if(request.getParameter("semester")!=null){
	semester = Integer.parseInt(request.getParameter("semester"));
	session.setAttribute("semester", semester);
}
String color[] = {"#00d0ff", "#00a9ff", "#0083ff", "#0061ff", "#002aff", "#3b00ff", "#00ffff", "#2252d6"};
%>
<%!
public int getDayValue(String str){
   if(str.equals("월"))
      return 0;
   else if(str.equals("화"))
      return 1;
   else if(str.equals("수"))
      return 2;
   else if(str.equals("목"))
      return 3;
   else if(str.equals("금"))
      return 4;
   else return -1;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<link rel="stylesheet" href="/dbPortal/CSS/body.css">
</head>
<body>
	<%@ include file="../top.jsp" %>
	<div class="container col-md-offset-1 col-md-15">
		<div class="row justify-content-between container">
			<h3 class="mx-1 mt-2">시간표</h3>
			<form action="timeTable.jsp">
			<div class="row">
				<div class="form-group mx-1 mt-2">
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
				<div class="form-group mx-1 mt-2">
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
			</div>
			</form>
		</div>
		<div class="wrap">
			<table class="table">
				<thead>
					<tr class="bg-primary">
				   		<th width="5px"></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>
				   	</tr>
			   	</thead>
			   	<tbody>
			   		<%
			   		int y = 0;
			   		for(int i=9; i<=17; i++){%>
					   <tr height="80px">
					   		<td><%=i %>
					   <%
					      y += 80;
					   %>
					   		</td>
					   		<td></td>
					   		<td></td>
					   		<td></td>
					   		<td></td>
					   		<td></td>
					   	</tr>
					   <%
					}
			   		%>
			   	</tbody>
			   
			</table>
		</div>
		<div class="schedule">
		<%
		   int endHr = 14;
		   int totalEnrolledClass = 0, totalEnrolledCredit = 0;
		   String day = null, startTime = null, endTime = null, where = null;
		   ArrayList<CourseDTO> enroll = new CourseDAO().enrolled(session_id, year, semester);
		   for(int i=0;i<enroll.size();i++){
		      day =  enroll.get(i).getDay();
		      startTime =  enroll.get(i).getStartTime();
		      endTime =  enroll.get(i).getEndTime();
		      where =  enroll.get(i).getRoom();
		      //시작시간 : 시
		      int hr = Integer.parseInt(startTime.substring(0,2))*60;
		      //시작시간 : 분
		      int min = Integer.parseInt(startTime.substring(2,4));
		      int startTimeAll = (hr+min-540)/15;
		      
		      if(endHr < hr/60)
		         endHr = hr/60 + 3;
		      hr = Integer.parseInt(endTime)/100*60;
		      min = Integer.parseInt(endTime)%100;
		      int endTimeAll = (hr+min-540)/15;
		      
		      int startPos = (startTimeAll)*20;
		      int height = (endTimeAll - startTimeAll)*20;
		      
		      int len = day.length();
		      for(int j=0; j<len; j+=1){
		         int dayPos = 42 + 213*getDayValue(day.substring(j, j+1));
		         %><div class="course" style="top:<%=-721 + startPos%>px; left:<%=dayPos%>px; height:<%=height%>px; width: 214px; 
		         background-color:<%=color[totalEnrolledClass%8]%>">
		            <br><%=enroll.get(i).getCourseName()%><br><%=where%>
		         </div>
		         
		         <%
		      }
		      totalEnrolledClass += 1;
		      totalEnrolledCredit += enroll.get(i).getCredit();
		   }
			%> 
		</div>
	</div>
</body>
</html>