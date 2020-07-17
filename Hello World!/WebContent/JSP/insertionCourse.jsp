<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="course.CourseDAO" %>
<%@ page import="course.CourseDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="../CSS/custom.css">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String category = "전체";
	String major = "전체";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("category") != null) {
		category = request.getParameter("category");
	}
	if(request.getParameter("major") != null) {
		major = request.getParameter("major");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch(Exception e){
			System.out.println("검색 페이지 번호 오류");
		}
	}
	
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch(Exception e){
			System.out.println("검색 페이지 번호 오류");
		}
	}
%>
	<%@ include file="./top.jsp" %>
	<br>
	<div class="container">
		<form method="get" action="./insertionCourse.jsp" class="form-inline mt-3">
			<select name="category" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="전공필수" <%if(category.equals("전공필수")) out.println("selected");%>>전공필수</option>
				<option value="전공선택" <%if(category.equals("전공선택")) out.println("selected");%>>전공선택</option>
				<option value="교양" <%if(category.equals("교양")) out.println("selected");%>>교양</option>
			</select>
			<select name="major" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="컴퓨터과학전공" <%if(major.equals("컴퓨터과학전공")) out.println("selected");%>>컴퓨터과학전공</option>
				<option value="경영학부" <%if(major.equals("경영학부")) out.println("selected");%>>경영학부</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
			<button type = "submit" class = "btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">등록하기</a>
		</form>
		<br>
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">강의번호</th>
						<th style="background-color: #eeeeee; text-align: center;">강의명</th>
						<th style="background-color: #eeeeee; text-align: center;">강의구분</th>
						<th style="background-color: #eeeeee; text-align: center;">주관학과</th>
						<th style="background-color: #eeeeee; text-align: center;">학점</th>
						<th style="background-color: #eeeeee; text-align: center;">PF</th>
						<th style="background-color: #eeeeee; text-align: center;">사이버</th>
						<th style="background-color: #eeeeee; text-align: center;">삭제</th>
						
						
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
					courseList = new CourseDAO().getList(category, major, search, pageNumber);
					if(courseList != null)
						for(int i = 0; i < courseList.size(); i++){
							if(i == 10) break;
							CourseDTO course = courseList.get(i);
					%>
					<tr>
						<td><%= course.getCourseNo() %></td>	
						<td><%= course.getCourseName() %></td>
						<td><%= course.getCategory() %></td>
						<td><%= course.getMajor() %></td>
						<td><%= course.getCredit() %></td>
						<td>
							<%if(course.getCyber() == 1) { %>
								<input type="checkbox" name="cyber" value="online" checked="checked" disabled="disabled"/>
							<% } else { %>
								<input type="checkbox" name="cyber" value="offline" disabled="disabled"/>
							<% } %>
						</td>
						<td>
							<%if(courseList.get(i).getPF() == 1) { %>
								<input type="checkbox" name="cyber" value="online" checked="checked" disabled="disabled"/>
								<% } else { %>
								<input type="checkbox" name="cyber" value="offline" disabled="disabled"/>
							<% } %>
						</td>
						<td>
							<a onclick="return confirm('삭제하시겠습니까?')" href="./courseDeleteAction.jsp?courseNo=<%=course.getCourseNo()%>">삭제</a>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
<%
	if(pageNumber <= 0){
%>		
	<a class="page-link disabled">이전</a>
<%
	} else {	
%>
	<a class="page-link" href="./insertionCourse.jsp?category=<%=URLEncoder.encode(category, "UTF-8") %>&major=
		<%=URLEncoder.encode(major, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=
		<%=pageNumber - 1%>">이전</a>
<%
	}
%>
		</li>
		<li>
<%
	if(courseList.size() < 11){
%>		
	<a class="page-link disabled">다음</a>
<%
	} else {	
%>
	<a class="page-link" href="./insertionCourse.jsp?category=<%=URLEncoder.encode(category, "UTF-8") %>&major=
		<%=URLEncoder.encode(major, "UTF-8")%>&search=<%=URLEncoder.encode(search, "UTF-8")%>&pageNumber=
		<%=pageNumber + 1%>">다음</a>
<%
	}
%>	
		</li>
	</ul>	
		</div>
		<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
					<h5 class="modal-title" id="modal">평가 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./insertionCourseAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>주관 학과</label>
								<select name="major" class="form-control">
									<option value="컴퓨터과학전공" selected>컴퓨터과학전공</option>
									<option value="소프트웨어학부">소프트웨어학부</option>
									<option value="경영학부">경영학부</option>
									<option value="겨울학기">겨울학기</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<label>강의 구분</label>
								<select name="category" class="form-control">
									<option value="전공필수">전공필수</option>
									<option value="전공선택">전공선택</option>
									<option value="교양">교양</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>강의명</label>
							<input type="text" name="courseName" class="form-control" maxlength="20">
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>학점</label>
								<select name="credit" class="form-control">
									<option value="1" selected>1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>PF</label>
								<select name="PF" class="form-control">
									<option value="0" selected>X</option>
									<option value="1">O</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>사이버</label>
								<select name="cyber" class="form-control">
									<option value="0" selected>X</option>
									<option value="1">O</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
		
	<%@ include file="./bottom.jsp" %>
</body>
</html>