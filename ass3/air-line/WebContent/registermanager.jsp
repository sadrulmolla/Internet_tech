<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="ass3.travel.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1,h3{
text-align:center;
}
body
{
	background-color:skyblue;
}
input[type=text]{
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=submit] {
  width: 100%;
  background-color:brown;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
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
<h2>Management Portal</h2>

Already registered? <a href="http://localhost:8090/air-line/loginmanager.jsp">Management Login</a>
<br>
<form action="registermanager" method="post" style="position: absolute; width: 50%; height: 300px; left: 50%; top:100px; margin: 0 0 0 -25%">
<h3>Register here!</h3>
<pre>
    Username: <input type="text" name="username" placeholder="Enter username here" required/>
    
    Password: <input type="text" name="password" placeholder="Enter password here" required/>
    
    Name:     <input type="text" name="name" placeholder="Enter name here" required/>
	
              <input type="submit" value="REGISTER"/>
</pre>
</form>
</body>
</html>