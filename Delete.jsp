<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		PrintWriter pri = response.getWriter();
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
		
		PreparedStatement delete = con.prepareStatement("delete from emp where name = ?" );
		
		delete.setString(1,request.getParameter("ename"));
		
		int d = delete.executeUpdate();
		
		if(d>0){
			response.sendRedirect("dashboard.jsp");
		}
		else {
			out.println("Something went Wrong!");
			}

	
	%>
	
</body>
</html>
