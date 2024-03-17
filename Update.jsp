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
<title>Update Profile</title>
</head>
<body>
<h1>Update Profile</h1>

<%
try {
    if(request.getParameter("sid") != null && Integer.parseInt(request.getParameter("sid")) > 0) {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
        PreparedStatement sel = con.prepareStatement("select * from student where id  = ?");
        sel.setInt(1, Integer.parseInt(request.getParameter("sid")));

        ResultSet rs = sel.executeQuery();
        if(rs.next()) {
%>
    <form action="update.jsp?sid=<%= rs.getInt("id") %>" method="post">
        Name : <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
        Email : <input type="email" name="email" value="<%= rs.getString("email") %>"><br>
        Pass : <input type="password" name="pass" value="<%= rs.getString("pass") %>"><br>
        <input type="submit" name="update" value="Update"><br>
    </form>
<%
        }
        con.close();
        rs.close();
    }

    if(request.getParameter("update") != null) {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
        PreparedStatement update = con.prepareStatement("update student set name = ?, email = ?, pass = ? where id = ?");

        update.setString(1, request.getParameter("name"));
        update.setString(2, request.getParameter("email"));
        update.setString(3, request.getParameter("pass"));
        update.setInt(4, Integer.parseInt(request.getParameter("sid")));

        int u = update.executeUpdate();

        if(u > 0) {
            response.sendRedirect("dash.jsp");
        } else {
            out.print("Something went Wrong!");
        }
        con.close();
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("Error: " + e.getMessage());
}
%>

</body>
</html>
