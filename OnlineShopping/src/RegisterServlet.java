import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String username=req.getParameter("username");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/shopping","root","root");
			PreparedStatement ps=con.prepareStatement("insert into customers (username,email,password,role) values (?,?,?,?)");
			ps.setString(1,username);
			ps.setString(2,email);
			ps.setString(3,password);
			ps.setString(4,"customer");
			ps.executeUpdate();
			
			Email e=new Email(email, "Registered Sucessfully!!!", "Welcome to Fashion For All");
			e.sendEmail();
			
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+ "alert('Registered Successfully!!!');"
					+ "window.location='login.jsp'"
					+ "</script>");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	
	}

}
