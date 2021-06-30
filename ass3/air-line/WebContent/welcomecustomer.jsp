<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="ass3.travel.model.*"
    import="ass3.travel.dao.*"
    import="java.sql.*" 
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
Want to logout? 
<a href="http://localhost:8090/air-line/logout.jsp">Logout</a>
<br> <br>
Show all the spacial deal .<a href="http://localhost:8090/air-line/spacialdeal.jsp">Spacial Deal</a><br><br>
<h3>Search flights</h3>
<form name = "searchform" action="viewflightlist.jsp" method="post" onsubmit="return validate()">
<pre>
          Departure City: <select name="departurecity" >
							<option value="Bangalore">Bangalore</option>
							<option value="Delhi">Delhi</option>
							<option value="Kolkata">Kolkata</option>
							<option value="Mumbai">Mumbai</option>
						</select>
          Arrival City: <select name="arrivalcity" >
							<option value="Bangalore">Bangalore</option>
							<option value="Delhi">Delhi</option>
							<option value="Kolkata">Kolkata</option>
							<option value="Mumbai">Mumbai</option>
						</select>
          Number of persons: <input type="number" name="persons" min="1" max="20" required>
          Expected Departure Time (Start) : <select name="starttime" >
							<option value="0000">0000 HRS</option>
							<option value="0100">0100 HRS</option>
							<option value="0200">0200 HRS</option>
							<option value="0300">0300 HRS</option>
							<option value="0400">0400 HRS</option>
							<option value="0500">0500 HRS</option>
							<option value="0600">0600 HRS</option>
							<option value="0700">0700 HRS</option>
							<option value="0800">0800 HRS</option>
							<option value="0900">0900 HRS</option>
							<option value="1000">1000 HRS</option>
							<option value="1100">1100 HRS</option>
							<option value="1200">1200 HRS</option>
							<option value="1300">1300 HRS</option>
							<option value="1400">1400 HRS</option>
							<option value="1500">1500 HRS</option>
							<option value="1600">1600 HRS</option>
							<option value="1700">1700 HRS</option>
							<option value="1800">1800 HRS</option>
							<option value="1900">1900 HRS</option>
							<option value="2000">2000 HRS</option>
							<option value="2100">2100 HRS</option>
							<option value="2200">2200 HRS</option>
							<option value="2300">2300 HRS</option>
							<option value="2359">2359 HRS</option>
						</select>
          Expected Departure Time (End) : <select name="endtime" >
							<option value="0000">0000 HRS</option>
							<option value="0100">0100 HRS</option>
							<option value="0200">0200 HRS</option>
							<option value="0300">0300 HRS</option>
							<option value="0400">0400 HRS</option>
							<option value="0500">0500 HRS</option>
							<option value="0600">0600 HRS</option>
							<option value="0700">0700 HRS</option>
							<option value="0800">0800 HRS</option>
							<option value="0900">0900 HRS</option>
							<option value="1000">1000 HRS</option>
							<option value="1100">1100 HRS</option>
							<option value="1200">1200 HRS</option>
							<option value="1300">1300 HRS</option>
							<option value="1400">1400 HRS</option>
							<option value="1500">1500 HRS</option>
							<option value="1600">1600 HRS</option>
							<option value="1700">1700 HRS</option>
							<option value="1800">1800 HRS</option>
							<option value="1900">1900 HRS</option>
							<option value="2000">2000 HRS</option>
							<option value="2100">2100 HRS</option>
							<option value="2200">2200 HRS</option>
							<option value="2300">2300 HRS</option>
							<option value="2359">2359 HRS</option>
						</select>
          
                   <input type="submit" value="SEARCH">

</pre>
</form>

<script>
function validate() {
	var departurecity = document.forms["searchform"]["departurecity"].value;
	var arrivalcity = document.forms["searchform"]["arrivalcity"].value;
	var starttime = document.forms["searchform"]["starttime"].value;
	var endtime = document.forms["searchform"]["endtime"].value;
	if(starttime > endtime) {
    	alert("Start time cannot be greater than end time!");
    	return false;
    }
    if(departurecity == arrivalcity) {
    	alert("Departure city and arrival city cannot be same!");
    	return false;
    }
	return true;
}
</script>
</body>
</html>