<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, ass3.travel.dao.*"
    import="ass3.travel.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management Portal</title>
<style type="text/css">
h1,h2{
text-align:center;
}
</style>
</head>
<body>
<h2>Management Portal</h2>
Want to logout? 
<a href="http://localhost:8090/air-line/logout.jsp">Logout</a><br><br>
Show all the spacial deal .<a href="http://localhost:8090/air-line/spacialdeal.jsp">Spacial Deal</a><br><br>
	<form name = "addform"action="modify.jsp" onsubmit="return validate()">
	<pre>
	Departure City: <select name="departurecity" >
						<option value="Bangalore">Bangalore</option>
						<option value="Delhi">Delhi</option>
						<option value="Kolkata">Kolkata</option>
						<option value="Mumbai">Mumbai</option>
					</select>
					<br>
	Arrival City: <select name="arrivalcity" >
						<option value="Bangalore">Bangalore</option>
						<option value="Delhi">Delhi</option>
						<option value="Kolkata">Kolkata</option>
						<option value="Mumbai">Mumbai</option>
					</select>
					<br>
	Cost : <input type="text" name="cost" placeholder="Enter Cost here" style="height:30px;width:100px" required>
	<br>
	Add or Delete : <select name="typeu" >
					<option value="add">Add</option>
					<option value="delete">Delete</option>
					</select>
					<br>
	<input type="submit"/>
	</pre>
	</form>
</body>
<script>
function validate() {
	var departurecity = document.forms["addform"]["departurecity"].value;
	var arrivalcity = document.forms["addform"]["arrivalcity"].value;
    if(departurecity == arrivalcity) {
    	alert("Departure city and arrival city cannot be same!");
    	return false;
    }
	return true;
}
</script>
</html>