<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<h1>Login Page</h1>
	
	<form action="login.jsp" method="post">
		
		 
		Email : <input name="email" type="email"> <br> 
		Pass : <input name="pass" type="password"> <br> 
		
		<input type="submit" value="Login" name="login">
		
		
		</form>
		
		
		<%
	
	if(request.getParameter("login") != null){
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
		
		PreparedStatement ps = con.prepareStatement("select * from employee where email=?  and pass=?");
		ps.setString(1, request.getParameter("email"));
		ps.setString(2, request.getParameter("pass"));
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
			response.sendRedirect("Dashboard.jsp");
			session.setAttribute("email", request.getParameter("email"));
		}
		 
	}else{
		out.print("Invalid Login");
		
		
	}
		 
	
	
	%>
		

</body>
</html>
