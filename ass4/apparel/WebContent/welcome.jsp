<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1{
text-align: center;
}
</style>
</head>
<body>
<h1>Welcome to Apparel Store</h1>
Want to logout? <a href="http://localhost:8090/apparel/logout.jsp">Logout</a><br><br>
<form name="searchform" action="show.jsp" method="post">
	New or Discounted : <select name="selection">
			<option value="discounted">Discounted</option>
			<option value="new arrival">New Arrival</option>
			</select><br><br>
	Types : <select name="type">
			<option value="formal">Formal</option>
			<option value="sportswear">Sports wear</option>
			<option value="outerwear">Outer wear</option>
			<option value="Others">Others</option>
			</select><br><br>
		<input type="submit" value="SEARCH">
</form><br><br>
</body>
<table border="1">
<tbody>
<tr>
<td>NAME</td>
<td>TYPE</td>
<td>GENDER</td>
<td>PRICE</td>
<td>Dis Or New</td>
</tr>
<%
String username= (String) session.getAttribute("username");
Connection conn = null;
conn=(Connection)getServletConfig().getServletContext().getAttribute("key2");
String query="select * from customer where username='"+username+"'";
PreparedStatement statement = conn.prepareStatement(query);
ResultSet resultset = statement.executeQuery();
if(resultset.next())
{
	String gender=resultset.getString("gender");
	String selec=resultset.getString("type");
	//response.getWriter().println(gender);
	if(selec.equals("both"))
	{
		query = "select * from items where cloth_gender ='"+gender+"'";
	}
	else
	{
		query= "select * from items where cloth_gender ='"+gender+"' and selection='"+selec+"'"; 
	}
	statement = conn.prepareStatement(query);
	resultset = statement.executeQuery();
	while(resultset.next())
	{
	%>
	<tr>
		<td><%=resultset.getString("cloth_name") %></td>
		<td><%=resultset.getString("cloth_type") %></td>
		<td><%=resultset.getString("cloth_gender") %></td>
	    <td><%=resultset.getInt("cloth_price") %></td>
	    <td><%=resultset.getString("selection") %></td>
	</tr>
	<%
	}
}
%>
</tbody>
</table>
</html>