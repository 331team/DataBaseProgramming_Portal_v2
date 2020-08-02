<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="teach.TeachDAO" %>
<%@ page import="teach.TeachDTO" %>
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
	
	if(request.getParameter("classNo") != null) {
		System.out.println("classNo");
		try {
			classNo = Integer.parseInt(request.getParameter("classNo"));
		} catch(Exception e){
			System.out.println("분반 번호 데이터 오류");
		}
		
	}
	if(request.getParameter("year") != null) {
		System.out.println("year");
		try {
			year = Integer.parseInt(request.getParameter("year"));
		} catch(Exception e){
			System.out.println("년도 데이터 오류");
		}
		
	}
	
	if(request.getParameter("semester") != null) {
		System.out.println("semester");
		try {
			semester = Integer.parseInt(request.getParameter("semester"));
		} catch(Exception e){
			System.out.println("학기 데이터 오류");
		}
		
	}
	if(classNo == -1 || courseNo == -1 || semester == -1 || year == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 분반입니다.')");
		script.println("location.href='insertionTeach.jsp'");
		script.println("</script>");
		
	}
	TeachDTO teach = new TeachDAO().getTeach(courseNo, semester, year, classNo);
	String day = teach.getDay();
	String startTime = teach.getStartTime();
	String class_st_h = startTime.substring(0,2);
	String class_st_m = startTime.substring(2);	
	String endTime = teach.getEndTime();
	String class_end_h = endTime.substring(0,2);
	String class_end_m = endTime.substring(2);
	String time = day + " " + startTime.substring(0,2) + ":" + startTime.substring(2) + " ~ " + endTime.substring(0,2) + ":" + endTime.substring(2);
%>

<body>
	<section class="container mt-3" style="max-width:560px;">
    	<div class="row">
    		<form action="./modifyTeachAction.jsp?courseName=<%= teach.getCourseName() %>" method="post">
    			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
    				<thead>
    					<tr>
    						<th colspan = "3" style="background-color: #eeeeee; text-align: center;">분반 수정</th>
    					</tr>
    				</thead>
    				<tbody>
    					<tr>
							<td style="width: 20%">강의명</td>
    						<td colspan="2"><%= teach.getCourseName() %></td>
    					</tr>
    					<tr>
							<td style="width: 20%">분반 번호</td>
    						<td colspan="2"><%= teach.getClassNo() %></td>
    					</tr>
    					<tr>
							<td style="width: 20%">교수명</td>
    						<td colspan="2"><input type="text" name="prof" class="form-control" maxlength="20" value = "<%= teach.getProf() %>"></td>
    					</tr>
    					<tr>
    						<td style="width: 20%">요일</td>
    						<td colspan="2">
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="mon" <%if(day.contains("월")){ %> checked<%} %>><label>월</label>
	      						</div>
	               				<div class="form-check form-check-inline">	               				
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="tue" <%if(day.contains("화")){ %> checked<%} %>><label>화 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="wed" <%if(day.contains("수")){ %> checked<%} %>><label>수 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="thu" <%if(day.contains("목")){ %> checked<%} %>><label>목 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="fri" <%if(day.contains("금")){ %> checked<%} %>><label>금 </label>
       				        	</div>
       				        </td>
       				    </tr>
       				    <tr>
       				    	<td style="width: 20%">장소</td>
    						<td colspan="2">
								<select name="room" class="form-control" id = "room">
									<option value="명신관" <%if (teach.getRoom().equals("명신관")) %> selected>명신관</option>
									<option value="순헌관" <%if (teach.getRoom().equals("순헌관")) %> selected>순헌관</option>
									<option value="과학관" <%if (teach.getRoom().equals("과학관")) %> selected>과학관</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 20%">시간</td>
    						<td colspan="2">
								<table>
								<td align="center">
				                  <input type="text" name="class_st_h" id="time" style="font-size: 1em; width:25pt;" value="<%=class_st_h%>">
				                  :
				                  <input type="text" name="class_st_m" id="time" style="font-size: 1em; width:25pt;" value="<%=class_st_m%>">
				                  ~
				                  <input type="text" name="class_end_h" id="time" style="font-size: 1em; width:25pt;" value="<%=class_end_h%>">
				                  :
				                  <input type="text" name="class_end_m" id="time" style="font-size: 1em; width:25pt;" value="<%=class_end_m%>">
				            	</td> 
            					</table>
            				</td>
						</tr>
						<tr>
							<td style="width: 20%">연도</td>
    						<td colspan="2">
								<select name="year" class="form-control">
									<%for(int i=2011; i< 2022; i++){ %>
									<option value="<%=i%>" <%if(i == year) %> selected><%=i%></option>
									<%} %>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 20%">학기</td>
    						<td colspan="2">
								<select name="semester" class="form-control">
									<option value="1" <%if (semester == 1) %> selected>1학기</option>
									<option value="2" <%if (semester == 2) %> selected>여름학기</option>
									<option value="3" <%if (semester == 3) %> selected>2학기</option>
									<option value="4" <%if (semester == 4) %> selected>겨울학기</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="width: 20%">인원</td>
    						<td colspan="2">
								<input type="text" name="num" class="form-control" maxlength="20" value = "<%= teach.getNum()%>">
							</td>
						</tr>
					</tbody>
				</table>
				<input type = "submit" class="btn btn-primary pull-right" value="수정하기">
			</form>
		</div>
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>