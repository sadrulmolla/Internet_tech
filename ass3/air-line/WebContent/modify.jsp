<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="ass3.travel.model.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Want to logout? 
<a href="http://localhost:8090/air-line/logout.jsp">Logout</a>
<br>
Want to go back to Manager Home Page? 
<a href="http://localhost:8090/air-line/welcomemanager.jsp">Home Page</a>
<br> <br>
<%
String query;
String typeu= (String) request.getParameter("typeu");
String departurecity=(String) request.getParameter("departurecity");
String arrivalcity=(String) request.getParameter("arrivalcity");
if(typeu.equals("delete"))
{
	query = "DELETE FROM spacialdeal WHERE departurecity =? AND arrivalcity =? AND cost= ?";
}
else
{
	query = "INSERT INTO spacialdeal VALUES (?, ?, ?)";
}
try
{
	Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
	PreparedStatement statement = conn.prepareStatement(query);
	statement.setString(1,departurecity);
	statement.setString(2,arrivalcity);
	statement.setInt(3,Integer.valueOf(request.getParameter("cost")));
	statement.execute();
	if(typeu.equals("add"))out.println("<b>Spacial deal added!</b>");
	else out.println("<b>Spacial deal deleted!</b>");
}
catch(Exception e)
{
	out.println("<b>please enter valid input!</b>");
}
%>
</body>
</html>