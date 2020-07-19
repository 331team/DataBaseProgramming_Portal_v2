<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
<%@ page import = "java.io.BufferedReader" %>
<%@ page import = "java.io.FileNotFoundException" %>
<%@ page import = "java.io.IOException" %>
<%@ page import = "java.nio.charset.Charset" %>
<%@ page import = "java.nio.file.Files" %>
<%@ page import = "java.nio.file.Paths" %>
<%@ page import = "teach.TeachDAO" %>
<%@ page import = "teach.TeachDTO" %>
<%@ page import="java.io.PrintWriter" %>
<%
    request.setCharacterEncoding("EUC-KR");
    // getParameter()는 바이너리 형태의 자료를 수신할 수 없다.
    // String upload = request.getParameter("upload");
    
    // 바이너리 형태의 자료 수신하는 방법
    String cotentType = request.getContentType();
    Enumeration e = request.getHeaderNames();
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

파일 업로드 결과 : 
<%
String filePath = "/home/seryoung/Documents/DBProject/dbPortal/WebContent/FILE/" + "test.csv";
    //헤더 정보 
    DataInputStream fos    = new DataInputStream(request.getInputStream());

    //서버의 디스크에 파일 저장
    FileOutputStream fs
    = new FileOutputStream(filePath);
    int data;
    while((data=fos.read()) != -1) {
        fs.write(data);
        fs.flush();
    }
    fs.close();
%>
<%
BufferedReader br = null;
try{
    br = Files.newBufferedReader(Paths.get(filePath));
    //Charset.forName("UTF-8");
    String line = "";
    
    while((line = br.readLine()) != null){
        String array[] = line.split(",");
        // prof, room, day, startTime, endTime, year, semester, courseNo, classNo, num
        // csv 순서
        // year, semester, courseNo, classNo, day, startTime, endTime, prof, room, num
        try{
            TeachDTO teach = new TeachDTO(array[7], array[8], array[4], array[5], array[6], Integer.parseInt(array[0]), Integer.parseInt(array[1]), Integer.parseInt(array[2]), Integer.parseInt(array[3]), Integer.parseInt(array[9]));
    		System.out.println(teach.getCourseName());
            new TeachDAO().write(teach);
        } catch(Exception ee){
        	System.out.println(array[0]);
        	continue;
        }
    }
}catch(FileNotFoundException ee){
    ee.printStackTrace();
}catch(IOException ee){
    ee.printStackTrace();
}finally{
    try{
        if(br != null){
            br.close();
        }
    }catch(IOException ee){
        ee.printStackTrace();
    }
}
PrintWriter script = response.getWriter();
script.println("<script>");
script.println("alert('추가 완료!');");
script.println("location.href = 'insertionCourse.jsp';");
script.println("</script>");
script.close();
%>
</body>
</html>