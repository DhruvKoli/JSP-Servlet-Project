import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/UpdateServlet")
@MultipartConfig(maxFileSize=99999999999L)
public class UpdateServlet extends HttpServlet 
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int productid=Integer.parseInt(req.getParameter("productid"));
		String productname=req.getParameter("productname");
		float price=Float.parseFloat(req.getParameter("price"));
		String category=req.getParameter("category");
		String description=req.getParameter("description");
		Part part=req.getPart("image");
		InputStream is=part.getInputStream();
		
		HttpSession hs=req.getSession();
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/shopping","root","root");
			PreparedStatement ps=con.prepareStatement("update products set productname=?,price=?,category=?,description=?,images=? where productid=?" );
			ps.setString(1, productname);
			ps.setFloat(2, price);
			ps.setString(3, category);
			ps.setString(4, description);
			ps.setBlob(5, is); 
			ps.setInt(6, productid);
			
			ps.execute();
			PrintWriter out=resp.getWriter();
			
			hs.setAttribute("msg", "Product Updated Successfully!!!");
			hs.setAttribute("pagename", "products.jsp");
			hs.setAttribute("type", "success");
			resp.sendRedirect("popup.jsp");
			
		/*	out.println("<script>"
					+ "alert('Product Updated Successfully!!!');"
					+ "window.location='products.jsp'"
					+ "</script>");  */
				
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
	
	
	}

}
