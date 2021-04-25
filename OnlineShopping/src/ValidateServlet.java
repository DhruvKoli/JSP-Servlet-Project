import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String val=req.getParameter("v");
		String id=req.getParameter("id");
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/shopping","root","root");
			PreparedStatement ps=con.prepareStatement("select * from users where "+id+"=?");
			ps.setString(1, val);
			ResultSet rs=ps.executeQuery();
			
			PrintWriter out=resp.getWriter();
			
			if(rs.next())
			{
				out.print(id+ " already exist");
			}
			else
			{
				out.print("");
				
			}
			
		}
		catch (Exception e) 
		{
			
		}
	
	
	}

}
