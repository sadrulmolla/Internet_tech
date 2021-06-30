<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apparel Store</title>
<style>
h1{
	text-align : center;
}
</style>
</head>
<body>
<h1>Welcome to Apparel strore</h1>
New customer ? <a href="http://localhost:8090/apparel/register.jsp">Register Here</a><br><br>
<form action="login" method="post" style="position: absolute;width: 50%; height: 300px; left: 50%; top:100px; margin: 0 0 0 -25%">
<h3>Login here!</h3>
<pre>
    Username: <input type="text" name="username" placeholder="Enter username here" required/>
    
    Password: <input type="text" name="password" placeholder="Enter password here" required/>
    
              <input type="submit" value="LOGIN"/>
</pre>
</form>
</body>
</html>