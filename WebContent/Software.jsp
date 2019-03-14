<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Software | Unity</title>
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
html, body {
	color: whitesmoke;
	min-height: 100%;
	height: auto;
	max-width: 100%;
	font-family: 'PT Sans', sans-serif;
	text-align: center;
	align-content: center;
	background: radial-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.25),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.85));
}

@import 'https://fonts.googleapis.com/css?family=PT+Sans';

video {
	position: fixed;
	top: 50%;
	left: 50%;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -100;
	transform: translateX(-50%) translateY(-50%);
	background-size: cover;
	transition: 1s opacity;
}

.searchlist {
	background: radial-gradient(rgba(0, 0, 0, 1), rgba(0, 0, 0, 0.5),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 1));
	margin-left: 315px;
	color: chartreuse;
	font-family: 'PT Sans', sans-serif;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	width: 50%;
	border: 2px solid white;
	border-radius: 5px;
	transition: 1s ease-in-out;
	margin-bottom: 12px;
	cursor: pointer;
}

#search {
	background-image:
		url('<%=request.getContextPath()%>/Resources/Images/Icons/search.png');
	background-repeat: no-repeat;
	background-size: 30px;
	width: 60%;
	color: black;
	text-transform: capitalize;
	font-size: 16px;
	padding: 12px 20px 12px 20px;
	border: 2px solid white;
	border-radius: 5px;
	margin-bottom: 12px;
}

.background {
	background-repeat: no-repeat;
	background-position: 50% 50%;
}

.fullscreen {
	overflow: hidden;
	width: 100%;
}

.navbar-brand {
	width: 160px;
}

.panel-height {
	height: 230px;
	width: 200px;
	border: 0;
	padding-bottom: 0px;
	padding-left: 0px;
	padding-right: 0px;
	padding-top: 0px;
}

.container {
	padding-left: 230px;
	width: 1595px;
}

.panel {
	border: 0;
	background: transparent;
	cursor: pointer;
}

.navbar-brand {
	width: 120px;
}

.ft {
	background-color: black;
	color: white;
	border: 0;
	font-size: 15px;
}

.img-responsive {
	border: 0;
	height: 230px;
	width: 200px;
}

.img-responsive:hover {
	opacity: 0.4;
}

#maintitle {
	font-size: 1000%;
	padding: 40px;
	color: chartreuse;
	position: relative;
	transition: 0.5s ease-in-out;
}

.head {
	padding-top: 20px;
	color: chartreuse;
	margin-left: -700px;
}

.text {
	position: absolute;
	top: 0px;
	opacity: 0.9;
	width: 200px;
	height: 230px;
	font-size: 15px;
}

.flip {
	height: 230px;
	width: 200px;
	position: absolute;
	top: 0px;
}

.flip img {
	width: 200px;
	height: 230px;
}

.flip .back {
	color: #fff;
	opacity: 1;
	text-align: center;
}

#scroll-down {
	margin-bottom: -200px;
	transition: 0.2s ease-in-out;
}

#scroll-down:hover {
	transform: scale(1.2);
}

a {
	color: chartreuse;
}

a:link {
	text-decoration: none;
}

.searchlist:hover, a:hover {
	color: white;
}
</style>
<script>
	function getSoftware(title) {
		var form = document.createElement('form');
		var input = document.createElement('input');
		form.method = "GET";
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "title");
		hiddenField.setAttribute("value", title);
		form.appendChild(hiddenField);
		form.action = "softwarepage";
		form.submit();
		var x = document.getElementById("dropmenu");
	}
	function getList(search) {
		// 	var xmlhttp = new XMLHttpRequest();
		// 	xmlhttp.onreadystatechange=function()
		//     {
		//     if (xmlhttp.readyState==4 && xmlhttp.status==200)
		//       {
		//     	var data = JSON.parse(xmlhttp.responseText);
		//     	document.getElementById("maintitle").innerHTML = data[0].title;
		//       }
		//     }
		//     xmlhttp.open("GET","gamesearch?search="+search,true);
		//     xmlhttp.send();
		document.getElementById("dropmenu").innerHTML = "";
		document.getElementById("maintitle").style.marginTop = "-20px";
		document.getElementById("maintitle").style.padding = "0px";
		document.getElementById("search").style.paddingTop = "10px";
		document.getElementById("scroll-down").style.marginTop = "0px";
		$
				.get(
						"softwaresearch?search=" + search,
						function(responseJson) { // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
							var $list = $("<ul>").appendTo($("#dropmenu")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
							if (responseJson.length == 0 && search.length != 0)
								$(
										"<li style='color:chartreuse;font-size:150%;padding-top:20px;'>") // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
								.appendTo($list).text("No results found")
							else {
								$
										.each(
												responseJson,
												function(index, software) { // Iterate over the JSON array.
													$(
															"<li class='searchlist' onclick='getSoftware($(this).text())'>") // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
													.appendTo($list).text(
															software.title) // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
												});
							}
						});
	}
</script>
<script>
	$(function() {
		$('a[href*="#"]:not([href="#"])').click(
				function() {
					if (location.pathname.replace(/^\//, '') == this.pathname
							.replace(/^\//, '')
							&& location.hostname == this.hostname) {
						var target = $(this.hash);
						target = target.length ? target : $('[name='
								+ this.hash.slice(1) + ']');
						if (target.length) {
							$('html, body').animate({
								scrollTop : target.offset().top
							}, 1000);
							return false;
						}
					}
				});
	});
	$(function() {
		$(".flip").flip({
			trigger : 'hover'
		});
	});
</script>
</head>
<body>
	<!-- TOP NAV BAR -->
	<jsp:include page="NavBar.jsp"></jsp:include>
	<br>
	<br>
	<div class="fullscreen" style="height: 100vh;margin-top:-20px;" data-img-width="1600"
		data-img-height="1064" data-diff="100" id="section1">
		<h1 id="maintitle">Software</h1>
		<video
			poster="<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpg"
			id="bgvid" loop playsinline autoplay muted>
			<source
				src="<%=request.getContextPath()%>/Resources/Images/Wallpapers/software.mp4"
				type="video/mp4">
		</video>
		<div>
			<input class="dropdown-toggle" type="text" id="search" style="margin-bottom:-80px;"
				onkeyup="getList(this.value)" placeholder="Search for Software"
				data-toggle="dropdown">
			<ul id="dropmenu" role="menu" aria-labelledby="menu1">
			</ul>
		</div>
		<br> <a href="#section2" ><img
			src="<%=request.getContextPath()%>/Resources/Images/Icons/scroll-down2.png"
			onclick="" id="scroll-down" height="50px" align /></a>
	</div>
	<br>
	<div class="fullscreen background" style="height: 100%;" id="section2">

		<!-- PRE-ORDERS -->
		<h2 class="head">NEW RELEASES</h2>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a
										onclick="getSoftware('Microsoft Office : Home And Student 2016 Windows')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/8.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div
								onclick="getSoftware('Microsoft Office : Home And Student 2016 Windows')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/8.jpg"
									class="img-responsive img" alt="Image" />
								<div class="panel-footer ft text">
									<span class="title">Microsoft Office Home & Student 2016</span>
									<div style="padding-top: 3px">
										Microsoft<br>Edition: Home<br>Platform: Windows<br>
										<span style='font-family: Arial'> &#8360;.</span>4999<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="flip">
						<div class="front">
							<div class="panel-body panel-height">
								<a onclick="getSoftware('Windows 10 Home')"><img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/12.png"
									class="img-responsive img" alt="Image"></a>
							</div>
						</div>
						<div onclick="getSoftware('Windows 10 Home')" class="back">
							<img
								src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/12.png"
								class="img-responsive img" alt="Image">
							<div class="panel-footer ft text">
								<span class="title">Windows 10 Home</span>
								<div style="padding-top: 3px">
									Microsoft<br>Edition: Home<br>Platform: Windows<br>
									<span style='font-family: Arial'> &#8360;.</span>6399<br>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a
										onclick="getSoftware('Microsoft Office : Home And Student 2016 MAC')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/7.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div
								onclick="getSoftware('Microsoft Office : Home And Student 2016 MAC')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/7.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Microsoft Office Home & Student 2016</span>
									<div style="padding-top: 3px">
										Microsoft<br>Edition: Home<br>Platform: Mac<br>
										<span style='font-family: Arial'> &#8360;.</span>4999<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Windows 10 Home')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/12.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Windows 10 Home')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/12.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Windows 10 Pro</span>
									<div style="padding-top: 3px">
										Microsoft<br>Edition: Professional<br>Platform:
										Windows<br> <span style='font-family: Arial'> &#8360;.</span>6399<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<!-- -->
		<!-- OFFERS -->
		<h2 class="head">
			POPULAR</font>
		</h2>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Microsoft Office 365')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/9.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Microsoft Office 365')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/9.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Office 365</span>
									<div style="padding-top: 3px">
										Microsoft<br>Edition: Home<br>Platform:
										Microsoft/Mac<br> <span style='font-family: Arial'> &#8360;.</span>3299<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Kaspersky Anti-Virus 2016')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/3.png"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Kaspersky Anti-Virus 2016')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/3.png"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<a href="AC4.html"><span class="title">Kaspersky
											Antivirus 2016</span></a>
									<div style="padding-top: 3px">
										Kaspersky<br>Edition: Home<br>PLatform: Windows<br>
										<span style='font-family: Arial'> &#8360;.</span>599
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('AVG Internet Security 2016')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/5.png"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('AVG Internet Security 2016')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/5.png"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">AVG Internet Security 2016</span>
									<div style="padding-top: 3px">
										AVG<br>Edition: Home<br>Platform: Windows<br> <span
											style='font-family: Arial'> &#8360;.</span>799
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Adobe Photoshop CS6')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/10.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Adobe Photoshop CS6')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/10.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Adobe Photoshop CS6</span>
									<div style="padding-top: 3px">
										Adobe<br>Edition: Extended<br>Platform: Windows<br>
										<span style='font-family: Arial'> &#8360;.</span>10799
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<!-- -->
		<!-- NEW ARRIVALS -->
		<h2 class="head">OFFERS</h2>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a
										onclick="getSoftware('CorelDRAW Graphics Suite X7 Academic')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/1.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div
								onclick="getSoftware('CorelDRAW Graphics Suite X7 Academic')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/1.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">CorelDRAW Graphics Suite X7 Academic</span>
									<div style="padding-top: 3px">
										Corel<br>Edition: Professional<br>Platform: Windows<br>
										<span style='font-family: Arial'> &#8360;.</span>15331
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Autocad LT 2016')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/4.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Autocad LT 2016')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/4.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">AutoCAD LT 2016</span><br>Autodesk<br>Edition:
									Enterprise<br>Platform: Windows/Mac<br>
									<div style="padding-top: 3px">
										<span style='font-family: Arial'> &#8360;.</span>13499
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('McAfee Total Protection 2015')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/6.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('McAfee Total Protection 2015')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/6.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">McAfee Total Protection 2015</span><br>McAfee<br>Edition:
									Home<br>Platform: Windows<br>
									<div style="padding-top: 3px">
										<span style='font-family: Arial'> &#8360;.</span>1259
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getSoftware('Windows 8.1 Pro')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/11.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getSoftware('Windows 8.1 Pro')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Software/11.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Windows 8.1 Pro</span><br>Microsoft<br>Edition:
									Professional<br>Platform: Windows<br>
									<div style="padding-top: 3px">
										<span style='font-family: Arial'> &#8360;.</span>5999
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> <br>
		<hr>
		<br>
	</div>
	<!-- -->
	<!-- FOOTER -->
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>

