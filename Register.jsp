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

	<form action="regi.jsp" method="post">
		
		Name : <input name="name" type="text"> <br> 
		Email : <input name="email" type="email"> <br> 
		Pass : <input name="pass" type="password"> <br> 
		
		Gender : <input name="gender" type="radio" value="Male"> Male  		
   				 <input name="gender" type="radio" value="Female"> Female
   				 <br>
   				 
   		Subject : <select name="subject">
	   				<option value = "Maths" name="Maths" >Maths</option>
	   				<option value = "FOP" name="FOP" >FOP</option>
	   				<option value = "DBA" name="DBA" >DBA</option>
	   		</select>
	   	Skills  : <input type="checkbox" value = "C#" name="skill"> C#
	   			<input type="checkbox" value = "C++" name="skill"> C++
	   			<input type="checkbox" value = "C" name="skill"> C
	   			
	   			<br>
	   			
	   			<input type="submit" value="Submit" name="regi">
	</form>
	
	<%
	
	if(request.getParameter("regi") != null){
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
		
		PreparedStatement ps = con.prepareStatement("insert into employee (name,email,pass,gender,subject,skill) values(?,?,?,?,?,?)");
		
		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("email"));
		ps.setString(3, request.getParameter("pass"));
		ps.setString(4, request.getParameter("gender"));
		ps.setString(5, request.getParameter("subject"));
		
		String skil[] = request.getParameterValues("skill");
		
		ps.setString(6,String.join(",", skil));
		
		int insert = ps.executeUpdate();
		if(insert > 0){
			response.sendRedirect("login.jsp");
		}
		else{
			out.print("Registration Failed");
		}
	}else{
		
	}
		 
	
	
	%>

</body>
</html>
