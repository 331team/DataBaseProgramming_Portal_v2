<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="evaluation.EvaluationDTO"%>
<%@ page import="evaluation.EvaluationDAO"%>
<%@ page import="java.io.PrintWriter"%>

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
	
	String courseName = null;
	String professorName = null;
	int year = 0;
	String semester = null;
	String category = null;
	String evaluationTitle = null;
	String evaluationContent = null;
	String totalScore = null;
	String creditScore = null;
	String homeworkScore = null;
	String lectureScore = null;
	
	if(request.getParameter("courseName") != null) {
		courseName = request.getParameter("courseName");
		System.out.println("course");
	}

	if(request.getParameter("professorName") != null) {
		professorName = request.getParameter("professorName");
		System.out.println("pro");
	}

	if(request.getParameter("year") != null) {
		System.out.println("year");
		try {
			year = Integer.parseInt(request.getParameter("year"));
		} catch(Exception e){
			System.out.println("강의 연도 데이터 오류");
		}
		
	}
	
	if(request.getParameter("semester") != null) {
		System.out.println("seme");
		semester = request.getParameter("semester");
	}
	
	if(request.getParameter("category") != null) {
		System.out.println("cate");
		category = request.getParameter("category");
	}
	
	if(request.getParameter("evaluationTitle") != null) {
		System.out.println("title");
		evaluationTitle = request.getParameter("evaluationTitle");
	}

	if(request.getParameter("evaluationContent") != null) {
		System.out.println("content");
		evaluationContent = request.getParameter("evaluationContent");
	}
	
	if(request.getParameter("totalScore") != null) {
		System.out.println("total");
		totalScore = request.getParameter("totalScore");
	}

	if(request.getParameter("creditScore") != null) {
		System.out.println("cre");
		creditScore = request.getParameter("creditScore");
	}
	
	if(request.getParameter("homeworkScore") != null) {
		System.out.println("home");
		homeworkScore = request.getParameter("homeworkScore");
	}

	if(request.getParameter("lectureScore") != null) {
		System.out.println("lecture");
		lectureScore = request.getParameter("lectureScore");
	}

	if (courseName == null || professorName == null || year == 0 || semester == null || category == null ||
			evaluationTitle == null || evaluationContent == null ||
			totalScore == null || creditScore == null || homeworkScore == null || lectureScore == null ||
			evaluationTitle.equals("") || evaluationContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return ;
	} else {
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		int result = evaluationDAO.write(new EvaluationDTO(0, usrID, courseName, professorName, year,
				semester, category, evaluationTitle, evaluationContent,
				totalScore, creditScore, homeworkScore, lectureScore, 0));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('강의 평가 등록 실패');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("usrID", usrID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'courseEvaluation.jsp';");
			script.println("</script>");
			script.close();
		}

	}

%>