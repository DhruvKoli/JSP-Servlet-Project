<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="products.css" rel="stylesheet"/>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">						
						<div class="preview-pic tab-content">
						<c:if test="${role!=null}">
						  <div class="tab-pane active" id="pic-1"><img src="ImageServlet?productid=${param.pid}" /></div>
						</div>
					</div>
					
					<div class="details col-md-6">
						<h3 class="product-title">${param.pn}</h3>
						<p class="product-description">${param.ct}</p>
						<p class="product-description">${param.ds}</p>
						<fmt:parseNumber var="price" value="${param.pr}" type="number"/>
						<h5 class="price">current price: <span>Rs. ${price}</span></h5>
						<div class="action">
							<p>
								<c:if test="${price > 0}">
									<a href=""  class="btn btn-primary btn-block ">Buy</a>
								</c:if>
							
								
							</p>
							
							<p>
								<c:if test="${role=='admin'}">
									<a class="btn btn-primary" href="edit.jsp?pid=${param.pid}&pn=${param.pn}&pr=${param.pr}&ct=${param.ct}&ds=${param.ds}">Edit</a> <a class="btn btn-danger " href="DeleteServlet?productid=${param.pid}">Delete</a></
								</c:if>
							</p>
						</div>
					</div>
						</c:if>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>