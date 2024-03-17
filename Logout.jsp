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
	session.removeAttribute("email");

	session.invalidate();
	response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
	
	response.sendRedirect("log.jsp");


%>

</body>
</html>
