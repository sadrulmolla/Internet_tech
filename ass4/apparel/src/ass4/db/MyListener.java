package ass4.db;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.*;

@WebListener
public class MyListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();
		String connString = sc.getInitParameter("key1");
		//sc.setAttribute("key2", connString);
		
		String connUser = sc.getInitParameter("key1User");
		sc.setAttribute("key3", connUser);
		
		String connPwd = sc.getInitParameter("key1Pwd");
		//sc.setAttribute("key4", connPwd);
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
				connString,connUser,connPwd);  
			sc.setAttribute("key2",con);
 
		}catch(Exception e){ System.out.println(e);}
		
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		//ServletContext sc = sce.getServletContext();
		//sc.removeAttribute("key1");
		//sc.removeAttribute("key2");
		
		System.out.println("Value deleted from context.");
	}
} 