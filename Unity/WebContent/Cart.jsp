<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="product" class="com.anthrino.unity.dto.CartDto" scope="request" />
<title>Cart | Unity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico" />
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/jquery.flip.min.js"></script>
<style>
@import 'https://fonts.googleapis.com/css?family=PT+Sans';

html, body {
	color: whitesmoke;
	height: auto;
	font-family: 'PT Sans', sans-serif;
	background: radial-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.75),
		rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 1));
	overflow-x: hidden;
}

.navbar-brand {
	width: 160px;
}

.parallax-window {
	max-height: inherit;
	height: 100%;
}

.container {
	padding-left: 0px;
	padding-top: 20px;
}

.ft {
	background-color: black;
	color: white;
	border: 0;
}

.img-responsive {
	border: 0;
	height: 150px;
	width: 100px;
}

.text {
	position: absolute;
	top: 0px;
	opacity: 0.9;
	width: 200px;
	height: 250px;
	font-size: 15px;
}

a {
	color: white;
}

a:link {
	text-decoration: none;
}

a:hover {
	color: white;
}

.name {
	font-size: 20px;
	color: chartreuse;
	cursor: pointer;
}

.info {
	padding-left: 20px;
	font-size: 17px;
	color: white;
}

.price {
	font-size: 20px;
	color: white;
}

.head {
	padding-left: 100px;
	font-size: 300%;
	color: chartreuse;
}
</style>
<script type="text/javascript">
function getProduct(title, category) {
		var form = document.createElement('form');
		var input = document.createElement('input');
		form.action = "productpage";
		form.method = "GET";
		
		var hiddenField1 = document.createElement("input");
		hiddenField1.setAttribute("type", "hidden");
		hiddenField1.setAttribute("name", "category");
		hiddenField1.setAttribute("value", category);
		
		var hiddenField2 = document.createElement("input");
		hiddenField2.setAttribute("type", "hidden");
		hiddenField2.setAttribute("name", "title");
		hiddenField2.setAttribute("value", title);
		
		form.appendChild(hiddenField1);
		form.appendChild(hiddenField2);
		form.submit();
		
	}
	
	function removeProduct(title, id)
	{
		confirm('Remove Product : '+ title + '?');
		var form = document.createElement('form');
	    var input = document.createElement('input');
	    form.method = "GET";
	    var hiddenField1 = document.createElement("input");
	    hiddenField1.setAttribute("type", "hidden");
	    hiddenField1.setAttribute("name", "title");
	    hiddenField1.setAttribute("value", title);
	    var hiddenField2 = document.createElement("input");
	    hiddenField2.setAttribute("type", "hidden");
	    hiddenField2.setAttribute("name", "id");
	    hiddenField2.setAttribute("value", id);
	    form.appendChild(hiddenField1); 
	    form.appendChild(hiddenField2); 
	    form.action = "deleteproduct";
	    form.submit();

	}
</script>
</head>
<body>
	<!-- TOP NAV BAR -->
	<jsp:include page="NavBar.jsp"></jsp:include>

	<br>
	<br>
	<div class="parallax-window" data-parallax="scroll" 
		data-image-src="<%=request.getContextPath()%>/Resources/Images/Wallpapers/cart.jpg">
		<h2 class="head">Cart</h2>
		<hr>
		<br>
		<div class="container">
		  <table class="table">
			<thead>
		      <tr>
		        <th>Product</th>
		        <th>Quantity</th>
		        <th>Price</th>
		        <th></th>
		      </tr>
		    </thead>
			<tbody>
			<c:forEach items="${product_list}" var="product">
				<c:if test="${ not empty product.title }">
					<tr>
						<td class="name"><a onclick="getProduct('${ product.title }','${ product.category }')" >${ product.title }</a><br> Category: ${ product.category }</td> 
						<td> Quantity : 1 DVD </td>
						<td class="price">&#8360;.&nbsp;${ product.price }</td>
						<td>
							<div class="col-md-12">
                        	<button type="button" onclick="removeProduct('${ product.title }','${ product.product_id }')" class="btn btn-primary pull-right" id="btnContactUs"
                        	 style="background-color:black;color:chartreuse;">
                            	Remove
                            </button>
                			</div>
                		</td>
					</tr>
					
				</c:if>
				
				<c:if test="${ empty product.title && not empty product.price }">
					<td>
			   		</td>
					<td></td>
					<td style='font-family: Arial;font-size:20px;float:right;color:chartreuse;'>
						Total Price : &nbsp;&nbsp;&nbsp; &#8360;.&nbsp; ${ product.price }
					</td>
					
				</c:if>
			</c:forEach>
			</tbody>
			</table>
			<br><br>
			<a href="<%=request.getContextPath()%>/Unity.jsp"> <button type="button" style="background-color: black; font-size:120%;
			color: chartreuse;width:20em;height:5em;margin-bottom:10px;float:right;"
			   			class="btn btn-default ">Checkout</button></a>
		</div>
	</div>
	</body>
</html>

