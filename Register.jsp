<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>JSP Regi</title>
</head>
<body>

<form action="Register.jsp" method="Post">
    Name : <input type="text" name="name"> <br>
    Email : <input type="text" name="email"> <br>
    pass : <input type="password" name="pass"> <br>

    <input type="submit" name="register" value="Submit">
</form>
<%
    response.setContentType("text/html");

    PrintWriter prin = response.getWriter(); // Keep this line

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");

        if (request.getParameter("register") != null) {
            // insert data code
            PreparedStatement ps = con.prepareStatement("insert into emp values(?,?,?)");

            ps.setString(1, request.getParameter("email"));
            ps.setString(2, request.getParameter("name"));
            ps.setString(3, request.getParameter("pass"));

            int insert = ps.executeUpdate();
            if (insert > 0) {
            	response.sendRedirect("login.jsp");

//            	prin.print("Registered Successfully");
            } else {
            	prin.print("Fail ....");
            }
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>

</body>
</html>
