<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style> 
    
</head>
<body>
    <h1>Dashboard</h1>
    
    <%
        response.setContentType("text/html");
    	Class.forName("com.mysql.jdbc.Driver");
        PrintWriter pri = response.getWriter();
        
        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
            PreparedStatement select = con.prepareStatement("select * from emp");

            ResultSet rs = select.executeQuery();
    %>
    
    <table>
        <tr> 
            <th>Name</th>
            <th>Email</th>
            <th>Password</th>
            <th>Action</th>
        </tr>
  
    <%
        if (rs.next()) {
            do {
    %>
        <tr>
            <td><%= rs.getString("email") %></td>  
            <td><%= rs.getString("name") %></td>   
            <td><%= rs.getString("pass") %></td>   
            <td><a href="edit.jsp?ename=<%= rs.getString("name") %>">Edit</a></td>
         
            <td><a href="delete.jsp?ename=<%= rs.getString("name") %>">Delete</a></td> 
        </tr>
    <%
            } while (rs.next());
        } else {
    %>
            <h3>No Records are Found!</h3>
    <%
        }
    %>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    </table>
</body>
</html>
