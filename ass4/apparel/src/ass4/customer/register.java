package ass4.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String type="both";
		String gender =request.getParameter("gender");
		try {
			String query = "select * from customer where username =?";
			Connection conn = null;
			conn=(Connection)getServletConfig().getServletContext().getAttribute("key2");
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1,username);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next())
			{
				out.println("<h1>Customer already exists in the database. Please login.</h1>");
				out.println("Want to go to login page? \r\n" + 
						"<a href=\"http://localhost:8090/apparel/index.jsp\">Login Here</a> ") ;
			}
			else
			{
				query = "insert into customer values(?, ?, ?, ?, ?)";
				statement = (PreparedStatement) conn.prepareStatement(query);
				statement.setString(1,username);
				statement.setString(2,password);
				statement.setString(3,name);
				statement.setString(4,type);
				statement.setString(5,gender);
				statement.executeUpdate();
				out.println("<h1>The customer has been registered!</h1>");
				out.println("Want to go to home page? \r\n" + 
						"<a href=\"http://localhost:8090/apparel/register.jsp\">Home Page</a> ") ;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
