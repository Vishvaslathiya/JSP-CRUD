<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
</head>
<body>
    <h3>Edit Profile</h3>

    <%
        String ename = request.getParameter("ename");
        if (ename != null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
                PreparedStatement select = con.prepareStatement("SELECT * FROM emp WHERE name = ?");
                select.setString(1, ename);
                ResultSet rs = select.executeQuery();
                if (rs.next()) {
    %>
                    <form action="edit.jsp" method="POST">
                        <input type="hidden" name="ename" value="<%= rs.getString("name") %>">
                        Name: <input type="text" name="name" value="<%= rs.getString("name") %>"><br>
                        Email: <input type="text" name="email" value="<%= rs.getString("email") %>"><br>
                        Password: <input type="password" name="pass" value="<%= rs.getString("pass") %>"><br>
                        <input type="submit" name="update" value="Update">
                    </form>
    <%
                }
                rs.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        if (request.getParameter("update") != null) {
            String updatedName = request.getParameter("name");
            String updatedEmail = request.getParameter("email");
            String updatedPass = request.getParameter("pass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp", "root", "root");
                PreparedStatement update = con.prepareStatement("UPDATE emp SET email = ?, name = ?, pass = ? WHERE name = ?");
                update.setString(1, updatedEmail);
                update.setString(2, updatedName);
                update.setString(3, updatedPass);
                update.setString(4, ename); // Previous name to identify the record to update
                int up = update.executeUpdate();
                if (up > 0) {
                    response.sendRedirect("dashboard.jsp");
                } else {
                    out.println("<h3>Something went wrong!</h3>");
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
