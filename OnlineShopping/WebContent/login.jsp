<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%-- JSP Comments --%>
	<!-- Scriplet Tag -->
	<%
		session.removeAttribute("role");
		session.invalidate();
	
		String username="",password="",checkbox="";
		
		Cookie ck[]=request.getCookies();
		
		for(Cookie c:ck)
		{
			if(c.getName().equals("un"))
			{
				username=c.getValue();
			}
			else if(c.getName().equals("pwd"))
			{
				password=c.getValue();
			}
			else if(c.getName().equals("check"))
			{
				checkbox=c.getValue();
			}
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<form action="LoginServlet" method="post" >
					
					<div class="form-group row">
						<label for="username" class="col-sm-2 col-form-label">Username</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="username" value="<%out.println(username);%>" placeholder="Enter Username">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="password" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" name="password" value="<%=password%>" placeholder="Enter Password">
						</div>
					</div>
					<div class="form-group ">
				<%
					if(checkbox.equals("rememberme"))
					{
				%>
				<input type="checkbox" name="rememberme" value="remember" checked="checked"> Remember Me
				<%
					}
					else
					{
				%>
					<input type="checkbox" name="rememberme" value="remember"> Remember Me
				<%
					}
				%>
			</div>
					
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Reset</button>
				</form>
			</div>
		</div>
	</div>
	
	
</body>
</html>