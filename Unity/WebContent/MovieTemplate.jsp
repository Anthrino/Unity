<%@page import="com.anthrino.unity.dto.GameDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="movie" class="com.anthrino.unity.dto.MovieDto" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="movie" />
<head>
<title><jsp:getProperty property="title" name="movie" /> | Unity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css">
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
<style>
@import 'https://fonts.googleapis.com/css?family=PT+Sans';

html, body {
	color: whitesmoke;
	height: auto;
	font-family: 'PT Sans', sans-serif;
		background: radial-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85),
		rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 1));
	overflow-x: hidden;
}

.container {
	width: 100%;
}

.carousel-inner img {
	width: 100%;
	max-height: 480px;
	margin: auto;
}

h2 {
	padding: 0px;
}

.carousel {
	width: 60%;
	margin: 0 auto; /* center your carousel if other than 100% */
}

#arrow {
	position: absolute;
	top: 45%;
}

.navbar-brand {
	width: 120px;
}
.bg {
	background: url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/m.jpg');
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	background-position: center;
	z-index: -1;
	background-size: contain;
	filter: blur(0px);
}
.panel-body {
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 20px;
}

.image {
	width: 400px;
	height: 460px;
}

.row {
	width: 800px;
	max-height: 1000px;
	margin-left: 35px;
}

#ptext {
	max-width: 1000px;
	max-height: 1000px;
}

.carousel-control {
	height: 0px;
	width: 0px;
	margin-right: 30px;
	margin-left: 10px;
	top: 40%;
}

.col-md-6 {
	padding: 0px;
}

.col-md-12 {
	padding: 0px;
}

.main {
	z-index: 15;
	top: 25%;
	left: 25%;
	margin-left: 20px;
	margin-top: -150px;
	margin-right: 20px;
	padding-top: 150px;
}

.car {
	margin-bottom: 20px;
}

#menu1 {
	color: black;
	font-size: 14px;
}

footer {
	margin-top: -20px;
	background: radial-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.45),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 1));
}
</style>
<script>
	function platform() {
		$(function() {

			$(".dropdown-menu li a").click(function() {

				$("#menu1").text($(this).text() + " \u25BC");
				$("#menu1").val($(this).text());

			});
		});
	}
	$(document).ready(function() {
		$("#tncdata").hide();
		$("#tnc").click(function() {
			$("#tncdata").slideToggle();
		})
	})
	function addtocart(type)
{
	 	var form = document.createElement('form');
	    form.method = "GET";
	    form.action = "addtoCart";

	    var f1 = document.createElement("input");
	    var f2 = document.createElement("input");
	    var f3 = document.createElement("input");
	    var f4 = document.createElement("input");
	    var f5 = document.createElement("input");
	    var f6 = document.createElement("input");

	    f1.setAttribute("type", "hidden");
	    f1.setAttribute("name", "title");
	    f1.setAttribute("value", '${movie.title}');
	    
	    f2.setAttribute("type", "hidden");
	    f2.setAttribute("name", "id");
	    f2.setAttribute("value", '${movie.movie_id}');
	    
	    f3.setAttribute("type", "hidden");
	    f3.setAttribute("name", "price");
	    f3.setAttribute("value", '${movie.price}');
	    
	    f4.setAttribute("type", "hidden");
	    f4.setAttribute("name", "rent");
	    f4.setAttribute("value", '${movie.rent}');
	    
	    f5.setAttribute("type", "hidden");
	    f5.setAttribute("name", "type");
	    f5.setAttribute("value", type);
	    
	    f6.setAttribute("type", "hidden");
	    f6.setAttribute("name", "category");
	    f6.setAttribute("value", '${movie.category}');
	    
	    form.appendChild(f1); 
	    form.appendChild(f2); 
	    form.appendChild(f3); 
	    form.appendChild(f4); 
	    form.appendChild(f5); 
	    form.appendChild(f6); 

	    form.submit();
}
</script>
</head>
<body>
	<!-- TOP NAV BAR -->
	<jsp:include page="NavBar.jsp"></jsp:include>
	<br>
	<hr/>
	
	<div class="bg"></div>
		<div class="container main ">
			<div class="row">
				<div class="col-md-6 image">
					<div class="panel-body">
						<img id="pic" src="${movie.poster_link}" style="width: 80%"
							alt="IMAGE" />
					</div>
					
				</div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-md-12">
							<h1 style="padding-left: 35px; color: chartreuse;"><jsp:getProperty
									property="title" name="movie" /></h1>
						</div>
						<div class="row">
							<div class="col-md-12">
								<h4>
									Genre : <jsp:getProperty property="genre" name="movie" /> 
									&nbsp;&nbsp; | &nbsp;&nbsp; Year : <jsp:getProperty property="release_year" name="movie" />
								</h4>
								 <h5>
									IMDb Rating : <jsp:getProperty property="rating" name="movie" />  
								</h5>| <span
									style="color: gold"> &#8360;. </span><span id="price"
									style="color: gold; font-size: 25px;"><jsp:getProperty
											property="price" name="movie" /></span><br> <br>
								<div class="btn-group btn-group-justified" role="group"
									aria-label="Justified button group">
									<div class="btn-group" role="group">
										<button type="button" onclick="addtocart('buy')"  
											style="background-color: black; color: chartreuse; color: chartreuse;"
											class="btn btn-default "
											onmouseover="document.getElementById('price').innerHTML = ${movie.price}">Buy</button>
									</div>
									<div class="btn-group" role="group">
										<button type="button" onclick="addtocart('rent')"  
											style="background-color: black; color: chartreuse;"
											class="btn btn-default"
											onmouseover="document.getElementById('price').innerHTML = ${movie.rent}"
											onmouseout="document.getElementById('price').innerHTML = ${movie.price}">Rent</button>
									</div>
								</div>
								<br>
								<p style="color: gold;" id="tnc">
									Terms and Conditions <span class="caret" style="color: red"></span>
								</p>
								<p style="color: gold;" id="tncdata">
									The order quantity for this product is limited to 1 unit per
									customer. Please note that orders which exceed the quantity limit
									will be auto-canceled.<br> This item is not for sale to
									people under the age of 18. By placing an order for this product,
									you declare that you are 18 years of age or older. This item must
									be used responsibly and appropriately.
								</p>
								<hr />
								<p style="font-size: 17px;">
									<jsp:getProperty property="plot" name="movie" /><br><br>
									Cast : <jsp:getProperty property="cast" name="movie" /><br>
									Director : <jsp:getProperty property="director" name="movie" /><br><br>
								</p>
								<p style="font-size: 17px;">
									Runtime : <jsp:getProperty property="runtime" name="movie" /><br>
									Languages : <jsp:getProperty property="language" name="movie" /><br><br>
								</p>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr />
		<br>
		<hr style="color: chartreuse">
		<!-- FOOTER -->
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
</body>
</html>