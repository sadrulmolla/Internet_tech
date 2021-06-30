<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apparel Store</title>
<style type="text/css">
h1{
text-align: center;}
</style>
</head>
<body>
<h1>Welcome to Apparel Store</h1>

Already registered? <a href="http://localhost:8090/apparel/index.jsp">Customer Login</a>
<br>
<form action="register" method="post" style="position: absolute; /*or fixed*/; width: 50%; height: 300px; left: 50%; top:100px; margin: 0 0 0 -25%">
<h3>Register here!</h3>
<pre>
	Username: <input type="text" name="username" placeholder="Enter username here" required/>

	Password: <input type="text" name="password" placeholder="Enter password here" required/>
	
	Name:     <input type="text" name="name" placeholder="Enter name here" required/>
	
			<select name="gender" >
			<option value="male">Male</option>
			<option value="female">Female</option>
			</select>
			<input type="submit" value="REGISTER"/>
    
</pre>
</form>
</body>
</html>