<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
String type = (String) request.getParameter("type");
String selection = (String) request.getParameter("selection");
String username= (String) session.getAttribute("username");


Connection conn = null;
conn=(Connection)getServletConfig().getServletContext().getAttribute("key2");
String query="select * from customer where username='"+username+"'";
PreparedStatement statement = conn.prepareStatement(query);
ResultSet resultset = statement.executeQuery();
if(resultset.next())
{
	String gender=resultset.getString("gender");
	//response.getWriter().println(gender);
	query = "select * from items where selection='"+selection+"' and cloth_type='"+type+"' and cloth_gender ='"+gender+"'";
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
	query="update customer set type='"+selection+"' where username='"+username+"'";
	statement = conn.prepareStatement(query);
	statement.executeUpdate();
}
%>
</tbody>
</table>
</body>
</html>