<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Class.forName("com.mysql.jdbc.Driver");
String myUrl = "jdbc:mysql://localhost/portalDB";
Connection conn = DriverManager.getConnection(myUrl, "db17331", "ora");
%>
<html>
연동
</html>