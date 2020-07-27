<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<section class="container mt-3" style="max-width:560px;">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
					<h5 class="modal-title" id="modal">강의 수정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./modifyCourseAction.jsp?courseNo=<%=courseNo %>" method="post">
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
							<button type="submit" class="btn btn-primary">수정하기</button>
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