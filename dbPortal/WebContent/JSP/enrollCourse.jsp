<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../CSS/body.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="top.jsp" %>
	<div class="container-fluid">
		<div class = "row">
		<div class = "col-md-offset-1 col-md-6">
			<div>
				<h3>신청한 강의</h3>
				<table class="table table-striped table-hover">
					<thead>
						<tr class="bg-primary">
							<th>과목코드</th>
							<th>분반</th>
							<th>과목명</th>
							<th>강의시간</th>
							<th>강의실</th>
							<th>사이버</th>
							<th>P/F</th>
						</tr>
					</thead>
					<tbody>
						<% //나중에 sql procedure로 변경가능
						%>
						<tr>
							<td>아</td>
						</tr>
						<% %>
					</tbody>
				</table>
			</div>
		
			<div>
				<h3>개설 강의</h3>
			</div>
		</div>
		
		<div class="col-md-4">
			<br><br><br>
			<table class="table table-striped">
						<thead>
							<tr class="bg-primary">
								<th>  </th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
							</tr>
						</thead>
						<tbody>
							<% %>
							<tr>
								<td>9</td>
							</tr>
							<% %>
						</tbody>
					</table>
			</div>
		</div>
	</div>
	

</body>
</html>