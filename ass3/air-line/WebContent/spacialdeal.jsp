<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, ass3.travel.dao.*"
    import="ass3.travel.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h3{
text-align:center;
}
</style>
</head>
<body>
Want to logout? 
<a href="http://localhost:8090/air-line/logout.jsp">Logout</a>
<br> <br>
<h3>Current Special Deals</h3>
<table border="1">
	<tbody>
		<%
			Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
			DealDAO dealDAO = new DealDAO();
			String query = "select * from spacialdeal";
			List<Deal> deals = dealDAO.find(query, conn);
		%>
		<%
			int si=deals.size();
			//out.println(si);
			if(si != 0)
			{
		%>
				<tr>
					<th>DEPARTURE CITY</th>
					<th>ARRIVAL CITY</th>
					<th>COST</th>
				</tr>
		<%
			}
			for(Deal f : deals)
			{
		%>
			<tr>
				<th><%=f.getDeparturecity() %></th>
				<th><%=f.getArrivalcity() %></th>
				<th><%="only Rs. "+f.getCost() %></th>
			</tr>
		<%
			}
			if(si == 0) out.println("No special deals to display currently");
		%>
	</tbody>
</table>
</body>
</html>