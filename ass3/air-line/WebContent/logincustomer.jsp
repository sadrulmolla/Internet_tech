<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>Welcome to Travel Thru Air</h1>
<h2>Customer Portal</h2>
Want to go back to registration page? <a href="http://localhost:8090/air-line/registercustomer.jsp">Customer Registration</a>
<br>

<form action="logincustomer" method="post" style="position: absolute;width: 50%; height: 300px; left: 50%; top:100px; margin: 0 0 0 -25%">
<h3>Login here!</h3>
<pre>
    Username: <input type="text" name="username" placeholder="Enter username here" required/>
    
    Password: <input type="text" name="password" placeholder="Enter password here" required/>
    
              <input type="submit" value="LOGIN"/>
</pre>
</form>
</body>
</html>