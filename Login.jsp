<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello this is login</h1>
	
	
<form action="login.jsp" method="Post">
  
    Email : <input type="email" name="email"> <br>
    pass : <input type="password" name="pass"> <br>

    <input type="submit" name="login" value="Submit">
</form>

	
	<%
	response.setContentType("text/html");
		
	PrintWriter pri = response.getWriter();
		
	try{
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
		
		if(request.getParameter("login") != null){
			
			PreparedStatement select = con.prepareStatement("SELECT * FROM emp WHERE email=? and pass=?");
			
			select.setString(1,request.getParameter("email"));
			select.setString(2,request.getParameter("pass"));
			
			ResultSet rs = select.executeQuery();
			
			if(rs.next()){
				if(request.getParameter("email") != null && request.getParameter("pass") != null ){
					response.sendRedirect("dashboard.jsp");
				}
			}
			
			 
		}
		
		
	}
	catch(Exception e)
	{
		pri.print("Error : " + e);
		
	}
	
	
	%>
	
	
</body>
</html>
