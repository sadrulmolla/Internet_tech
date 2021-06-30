package ass3.travel.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registercustomer")
public class registercustomerservlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registercustomerservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String query = "select * from customers where username =?";
			Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
			PreparedStatement statement = conn.prepareStatement(query);
			statement.setString(1,username);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next())
			{
				out.println("<h1>Customer already exists in the database. Please login.</h1>");
				out.println("Want to go to login page? \r\n" + 
						"<a href=\"http://localhost:8090/air-line/logincustomer.jsp\">Customer Login</a> ") ;
			}
			else
			{
				query = "insert into customers values(?, ?, ?)";
				statement = conn.prepareStatement(query);
				statement.setString(1,username);
				statement.setString(2,password);
				statement.setString(3,name);
				statement.executeUpdate();
				out.println("<h1>The customer has been registered!</h1>");
				out.println("Want to go to home page? \r\n" + 
						"<a href=\"http://localhost:8090/air-line/registercustomer.jsp\">Customer Home Page</a> ") ;
			}
		}
			
		catch (Exception e) {
			response.getWriter().println("username can be at most 10 letters");
			e.printStackTrace();
		}
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
