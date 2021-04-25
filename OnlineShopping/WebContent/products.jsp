<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<c:if test="${role!=null}">
	<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3307/shopping"
					   user="root"
					   password="root"
					   var="con"/> 
		
					   
	<c:if test="${param.productname!=null}">
		<sql:query var="rs" dataSource="${con}">
			select * from products where productname like '%' ? '%'
			<sql:param>${param.productname}</sql:param>
		</sql:query>					   
	</c:if>
	
	
	<c:if test="${param.productname==null}">
		<sql:query var="rs" dataSource="${con}">
			select * from products
		</sql:query>
	</c:if>	
	
	<div class="container">
		<div class="row">
			
			<c:forEach items="${rs.rows}" var="row">
				<div class="col-lg-3 col-md-4 col-sm-6 col-xs-12 text-center" style="border:1px solid black;">
					<a href="product.jsp?pid=${row.productid}&pn=${row.productname}&pr=${row.price}&ct=${row.category}&ds=${row.description}">
						<img src="ImageServlet?productid=${row.productid}" height="200px" class="col-lg-12"/>
					</a>
					<h5>${row.productname}</h5>
					<p>${row.price}</p>
					
					<p>
						<c:if test="${row.price>0}">
						<!--  	<a href="" class="btn btn-primary">Buy</a>-->
						</c:if>
					</p>		
					
					<p>
					<c:if test="${role=='admin'}">
					<!--  	<a href="edit.jsp?pid=${row.productid}&pn=${row.productname}&pr=${row.price}&ct=${row.category}&ds=${row.description}" class="btn btn-primary">Edit</a> <a class="btn btn-danger" href="DeleteServlet?productid=${row.productid}">Delete</a></ --> 
					</c:if>
					</p>
				</div>	
			</c:forEach>
			
		</div>
		
	</div>	
	</c:if>
	<jsp:include page="footer.jsp"></jsp:include>
				   
</body>
</html>