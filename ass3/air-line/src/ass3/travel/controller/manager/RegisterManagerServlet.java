package ass3.travel.controller.manager;

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

/**
 * Servlet implementation class RegisterManagerServlet
 */
@WebServlet("/registermanager")
public class RegisterManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			
			String query = "select * from managements where username='" + username +"'" ;
			Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
			PreparedStatement statement = conn.prepareStatement(query);
			ResultSet resultset = statement.executeQuery();
			if (resultset.next()) {
				out.println("<h1>Manager already exists in the database. Please login.</h1>");
				out.println("Want to go to login page? \r\n" + 
						"<a href=\"http://localhost:8090/air-line/loginmanager.jsp\">Manager Login</a> ") ;
			} else {
				query = "insert into managements values('"+username+"','"+password+"','"+name+"')";
				statement = conn.prepareStatement(query);
				statement.execute();
				out.println("<h1>The manager has been registered!</h1>");
				out.println("Want to go to home page? \r\n" + 
						"<a href=\"http://localhost:8090/air-line/registermanager.jsp\">Manager Home Page</a> ") ;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
