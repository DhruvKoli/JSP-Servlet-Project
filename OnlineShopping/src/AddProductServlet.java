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
import javax.servlet.http.Part;
@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize=99999999999L)
public class AddProductServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String productname=req.getParameter("productname");
		float price=Float.parseFloat(req.getParameter("price"));
		String category=req.getParameter("category");
		String description=req.getParameter("description");
		Part part=req.getPart("image");
		InputStream is=part.getInputStream();
		
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/shopping","root","root");
			PreparedStatement ps=con.prepareStatement("insert into products (productname,price,category,description,images) values(?,?,?,?,?)");
			ps.setString(1, productname);
			ps.setFloat(2, price);
			ps.setString(3, category);
			ps.setString(4, description);
			ps.setBlob(5, is);
			ps.executeUpdate();
			PrintWriter out=resp.getWriter();
			out.println("<script>"
					+"alert('Product Added Succcessfully!!!');"
					+"window.location='products.jsp'"
					+"</script>");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
	
	}

}
