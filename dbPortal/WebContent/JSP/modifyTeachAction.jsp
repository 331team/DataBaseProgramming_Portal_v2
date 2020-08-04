
 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="teach.TeachDTO"%>
<%@ page import="teach.TeachDAO"%>
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
	
	
	String prof = null;
	String room = null;
	String class_day = null;
	String startTime = null;
	String endTime = null;
	int year = -1;
	int semester = -1;
	int num = -1;
	String courseName = null;
	int classNo = -1;
	
	if(request.getParameter("prof") != null) {
		prof = request.getParameter("prof");
		System.out.println(prof);
	}
	
	if(request.getParameter("room") != null) {
		room = request.getParameter("room");
		System.out.println(room);
	}
	
	if(request.getParameterValues("class_day") != null) {
		
		String[] days=request.getParameterValues("class_day");
		
		class_day="";
		for (String day : days){
			switch(day){
			case "mon" :
				day = "월";
				break;
			case "tue" :
				day = "화";
				break;
			case "wed" :
				day = "수";
				break;
			case "thu" :
				day = "목";
				break;
			case "fri" :
				day = "금";
				break;
			}
			if(day==days[0])
				class_day = day;
			else
				class_day = class_day + day;
		}
		System.out.println(class_day);
	}
	if(request.getParameter("class_st_h") != null &&
			request.getParameter("class_st_m") != null) {
		String start_h = request.getParameter("class_st_h");
		String start_m = request.getParameter("class_st_m");
		startTime = start_h + start_m;
		System.out.println(startTime);
	}
	
	if(request.getParameter("class_end_h") != null &&
			request.getParameter("class_end_m") != null) {
		String end_h = request.getParameter("class_end_h");
		String end_m = request.getParameter("class_end_m");
		endTime = end_h + end_m;
		System.out.println(endTime);
	}
	
	if(request.getParameter("courseName") != null) {
		courseName = request.getParameter("courseName");
		System.out.println("input : " + courseName);
	}
	if(request.getParameter("year") != null) {
		try {
			year = Integer.parseInt(request.getParameter("year"));
		} catch(Exception e){
			System.out.println("연도 데이터 오류");
		}
		System.out.println(year);
	}
	
	if(request.getParameter("semester") != null) {
		
		try {
			semester = Integer.parseInt(request.getParameter("semester"));
		} catch(Exception e){
			System.out.println("학기 데이터 오류");
		}
		System.out.println(semester);
	}
	
	if(request.getParameter("num") != null) {
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch(Exception e){
			System.out.println("인원 수 데이터 오류");
		}
		System.out.println(num);
	}
	
	if(request.getParameter("classNo") != null) {
		try {
			classNo = Integer.parseInt(request.getParameter("classNo"));
		} catch(Exception e){
			System.out.println("분반 번호 데이터 오류");
		}
		System.out.println(classNo);
	}
	if (courseName == null || prof == null || class_day == null || 
			startTime == null || endTime == null || year == -1 ||
			semester == -1 || num == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return ;
	}  else {
		TeachDAO teachDAO = new TeachDAO();
		int courseNo = teachDAO.getCourseInfo(courseName);
		int result = teachDAO.modify(new TeachDTO(prof, room, class_day, startTime, endTime, year, semester, courseNo, classNo, num));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('분반 수정 실패');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} 
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('중복 강의 존재');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		}	else {
			session.setAttribute("usrID", usrID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'insertionTeach.jsp';");
			script.println("</script>");
			script.close();
		}
	}
%>