<%@ page language="java" import="java.sql.*"%>
<html>
<head>
<title>Connection String: JSP-SQLSERVER</title>
</head>
<body bgcolor="white">
<%
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=db_rent","nurahman","dataon");
	Statement stmt = conn.createStatement();
	Statement st = conn.createStatement();
%>
</body>
</html>