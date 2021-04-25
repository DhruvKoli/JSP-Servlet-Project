<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	<div class="card">
	
			<form action="AddProductServlet" method="post"  enctype="multipart/form-data">
			
				<div class="form-group row">
					<label for="productname" class="col-sm-2 col-form-label">Product Name</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="productname" placeholder="Enter Product Name">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="price" class="col-sm-2 col-form-label">Price</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="price" placeholder="Enter Price">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="category" class="col-sm-2 col-form-label">Category</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="category" placeholder="Enter Product Category">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="description" class="col-sm-2 col-form-label">Description</label>
					<div class="col-sm-7">
						<input type="text-area" class="form-control" name="description" placeholder=" Product Description">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="images" class="col-sm-2 col-form-label">Select File</label>
					<div class="col-sm-7">
						<input type="file" class="form-control" name="image" accept="image/*" placeholder="Select Image">
					</div>
				</div>
				
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-danger">Reset</button>
			</form>
			
			
			</div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>