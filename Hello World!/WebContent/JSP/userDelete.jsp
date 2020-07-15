<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="java.util.ArrayList" %>
    
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
	String search = "";
	int pageNumber = 0;
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
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">전공</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">인증여부</th>
						<th style="background-color: #eeeeee; text-align: center;">수정하기</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
					userList = new UserDAO().getList();
						for(int i = 0; i < userList.size(); i++){
					%>
					<tr>
						<td><%= userList.get(i).getUsrID() %></td>
						<td><%= userList.get(i).getUsrPW() %></td>
						<td><%= userList.get(i).getName() %></td>
						<td><%= userList.get(i).getMajor() %></td>
						<td><%= userList.get(i).getUsrEmail() %></td>
						<td><%= userList.get(i).getUsrEmailChecked() %></td>
						<td>
							<button class="btn btn-outline-secondary btn-sm">
							<a onclick="return confirm('삭제하시겠습니까?')" href="./userDeleteAction.jsp?usrID=<%=userList.get(i).getUsrID()%>">삭제</a>
							</button>
						</td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
		
	<%@ include file="./bottom.jsp" %>
</body>
</html>