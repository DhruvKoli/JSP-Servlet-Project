import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String username=req.getParameter("username");
		String password=req.getParameter("password");
		String checkbox=req.getParameter("rememberme");
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/shopping","root","root");
			PreparedStatement ps = con.prepareStatement("select * from customers where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2,password);
			
			ResultSet rs=ps.executeQuery();
			
			resp.setContentType("text/html");
			PrintWriter out=resp.getWriter();
			HttpSession hs=req.getSession();
			
			if(rs.next())
			{
				HttpSession hs1=req.getSession();
				hs1.setAttribute("role", rs.getString("role"));
				
				if(checkbox!=null)
				{
					Cookie ck1=new Cookie("un", username);
					Cookie ck2=new Cookie("pwd", password);
					Cookie ck3=new Cookie("check", "rememberme");
				
					ck1.setMaxAge(60*60);
					ck2.setMaxAge(60*60);
					ck3.setMaxAge(60*60);
				
					resp.addCookie(ck1);
					resp.addCookie(ck2);
					resp.addCookie(ck3);
				}
				else
				{
					Cookie ck1=new Cookie("un", "");
					Cookie ck2=new Cookie("pwd", "");
					Cookie ck3=new Cookie("check", "");
					
					ck1.setMaxAge(-1);
					ck2.setMaxAge(-1);
					ck3.setMaxAge(60*60*60);
					
					resp.addCookie(ck1);
					resp.addCookie(ck2);
					resp.addCookie(ck3);
				}
				
				hs1.setAttribute("msg", "Login Successfully!!!");
				hs1.setAttribute("pagename", "home.jsp");
				hs1.setAttribute("type", "success");
				resp.sendRedirect("popup.jsp");
			}
			else
			{
			/*	out.println("<script>"
						+"alert('Welcome "+username+"');"
						+"window.location='home.jsp'"
						+"</script>");  */ 
				
				hs.setAttribute("msg", "Incorrect Username or Password");
				hs.setAttribute("pagename", "home.jsp");
				hs.setAttribute("type", "error");
				resp.sendRedirect("popup.jsp"); 
			}	
				 
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
	
	
	}

}
