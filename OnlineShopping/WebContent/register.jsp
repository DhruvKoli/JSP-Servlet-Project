<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
		function myfunction(textbox)
		{
			var val=textbox.value;
			var id=textbox.id;
			var url="ValidateServlet?v="+val+"&id="+id;
			
			 var xhttp = new XMLHttpRequest();
			 
			  xhttp.onreadystatechange = function() 
			  {
			    if (this.readyState == 4 && this.status == 200) 
			    {
			     	document.getElementById("msg"+id).innerHTML = this.responseText;
			    }
			  };
			  
			  xhttp.open("GET", url);
			  xhttp.send();
		}
</script>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<form action="RegisterServlet" method="post">
					
					<div class="form-group row">
						<label for="username" class="col-sm-2 col-form-label">Username</label>
						<div class="col-sm-7">
							<input type="text"  id="username" onkeyup="myfunction(this)" class="form-control" name="username" placeholder="Enter Username">
						</div>
					</div>	
					
					<div class="form-group row">
						<label for="email" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="email"  id="email" onkeyup="myfunction(this)" placeholder="Enter Email">
						</div>
					</div>
					
					<div class="form-group row">
						<label for="password" class="col-sm-2 col-form-label">Password</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" name="password" placeholder="Enter Username">
						</div>
					</div>		
				
				<button type="submit" class="btn btn-primary">Register</button>
				<button type="reset" class="btn btn-danger">Reset</button>
				</form>	
			
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>