<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ass3.travel.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400);
body
{
	background-color:skyblue;
}
h1{
text-align:center;
}
</style>
</head>
<body>
<% 
User user = (User) session.getAttribute("user");
if(user != null) {
	if(user.getUsertype() == "customer") response.sendRedirect("welcomecustomer.jsp");
	else if(user.getUsertype() == "manager") response.sendRedirect("welcomemanager.jsp");
	return;
} 
%>
<h1>Welcome to Travel Thru Air</h1>
<h3>
Are you from management department?
<a href="http://localhost:8090/air-line/registermanager.jsp">Management Portal</a>
</h3>
<br> <br>
<h3>
Are you a customer?
<a href="http://localhost:8090/air-line/registercustomer.jsp">Customer Portal</a>
</h3>
</body>
</html>