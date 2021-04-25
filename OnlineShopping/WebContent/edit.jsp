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
		<form action="UpdateServlet" method="post" class="col-lg-6 col-md-6 col-sm-12 col-xs-12" enctype="multipart/form-data"  >
		
	 	<div class="form-group row">
				<label for="productid" class="col-sm-2 col-form-label">Enter Product Id</label>
				<div class="col-sm-7">
					<input type="text" name="productid" value="${param.pid}" placeholder="Enter Product Id" class="form-control"/>
				</div>
			</div>   
			
			<div class="form-group row">
				<label for="productname" class="col-sm-2 col-form-label">Enter Product Name</label>
				<div class="col-sm-7">
					<input type="text" name="productname" value="${param.pn}" placeholder="Enter Product Name" class="form-control"/>
				</div>
			</div>

			<div class="form-group row">
				<label for="price" class="col-sm-2 col-form-label">Enter Price</label>
				<div class="col-sm-7">
					<input type="text" name="price" value="${param.pr}" placeholder="Enter Product Id" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="category" class="col-sm-2 col-form-label">Enter Category</label>
				<div class="col-sm-7">
					<input type="text" name="category" value="${param.ct}" placeholder="Enter Category" class="form-control"/>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="description" class="col-sm-2 col-form-label">Product Description</label>
				<div class="col-sm-7">
					<input type="text" name="description" value="${param.ds}" placeholder="Product Description" class="form-control"/>
				</div>
			</div>
			
 			<div class="form-group row">
					<label for="images" class="col-sm-2 col-form-label">Select File</label>
					<div class="col-sm-7">
						<input type="file" class="form-control" name="image" accept="image/*" placeholder="Select Image">
					</div>
				</div>     
			
			<div class="form-group row">
				<input type="submit" value="Update Product" class="btn btn-primary btn-block"/>
				<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>