package ass4.customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;
@WebServlet("/login")
public class login extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException
	{
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			String query = "select * from customer where username =?";
			Connection conn = null;
			conn=(Connection)getServletConfig().getServletContext().getAttribute("key2");
			PreparedStatement statement = (PreparedStatement) conn.prepareStatement(query);
			statement.setString(1,username);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next())
			{
				if (resultset.getString("password").equals(password))
				{
					request.getSession().setAttribute("username", username);
					response.sendRedirect("welcome.jsp");
				}
				else
				{
					out.println("<h1>Invalid Password for the given username!</h1>");
					out.println("Want to go to home page? \r\n" + 
							"<a href=\"http://localhost:8090/apparel/index.jsp\">Home Page</a> ") ;
				}
			}
			else
			{
				out.println("<h1>Customer does not exist in the database!</h1>");
				out.println("Want to go to home page? \r\n" + 
						"<a href=\"http://localhost:8090/apparel/index.jsp\">Home Page</a> ") ;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
