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
<title>회원 탈퇴</title>
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
String courseNo = null; 

if(request.getParameter("courseNo") != null) {
	courseNo = request.getParameter("courseNo");
	System.out.println(courseNo);
}

%>
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
	<section class="container mt-3" style="max-width:560px;">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
					<h5 class="modal-title" id="modal">분반 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./insertionTeachAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
							<label>강의명</label>
							<select name="courseName" class="form-control">
							<%
								ArrayList<CourseDTO> courseList = new ArrayList<CourseDTO>();
								courseList = new CourseDAO().getList(category, major, search, pageNumber);
								for(int i = 0; i < courseList.size(); i++){
							%>
									<option value="<%= courseList.get(i).getCourseName() %>"><%= courseList.get(i).getCourseName() %></option>
							<%
								}
							%>
							</select>
							</div>
							<div class="form-group col-sm-6">
								<label>교수명</label>
								<input type="text" name="prof" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-group">
								<label>요일</label>
								<br>
								<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="class_day" id="day" value="mon"><label>월</label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="tue"><label>화 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="wed"><label>수 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="thu"><label>목 </label>
	               				</div>
	               				<div class="form-check form-check-inline">
	               				<input class="form-check-input" type="checkbox" name="class_day" id="day" value="fri"><label>금 </label>
       				        	</div>
       				        </div>
       				       <div class="form-row">
       				        <div class="form-group col-sm-6">
								<label>장소</label>
								<select name="room" class="form-control">
									<option value="명신관">명신관</option>
									<option value="순헌관">순헌관</option>
									<option value="과학관">과학관</option>
								</select>
							</div>
							<div class="form-group col-sm-6">
								<label>시간</label>
								<table>
								<td align="center">
                  <input type="text" name="class_st_h" id="time" style="font-size: 1em; width:25pt;" placeholder="09">
                  :
                  <input type="text" name="class_st_m" id="time" style="font-size: 1em; width:25pt;" placeholder="00">
                  ~
                  <input type="text" name="class_end_h" id="time" style="font-size: 1em; width:25pt;" placeholder="10">
                  :
                  <input type="text" name="class_end_m" id="time" style="font-size: 1em; width:25pt;" placeholder="00">
            </td> 
            </table>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-4">
								<label>년도</label>
								<select name="year" class="form-control">
									<%for(int i=2011; i< 2022; i++){ %>
									<option value="<%=i%>"><%=i%></option>
									<%} %>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>학기</label>
								<select name="semester" class="form-control">
									<option value="1" selected>1학기</option>
									<option value="2">여름학기</option>
									<option value="3">2학기</option>
									<option value="4">겨울학기</option>
								</select>
							</div>
							<div class="form-group col-sm-4">
								<label>인원</label>
								<input type="text" name="num" class="form-control" maxlength="20">
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
	</section>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>