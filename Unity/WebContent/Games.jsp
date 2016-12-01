<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Games | Unity</title>
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
	padding: 12px 20px 12px 40px;
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
<script type="text/javascript">
	function getGame(title) {
		var form = document.createElement('form');
		var input = document.createElement('input');
		form.method = "GET";
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "title");
		hiddenField.setAttribute("value", title);
		form.appendChild(hiddenField);
		form.action = "gamepage";
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
		$.get("gamesearch?search=" + search,
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
											function(index, game) { // Iterate over the JSON array.
												$(
														"<li class='searchlist' onclick='getGame($(this).text())'>") // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
												.appendTo($list).text(
														game.title) // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
											});
						}
					});
}
</script>
</head>
<body>
	<jsp:include page="NavBar.jsp"></jsp:include>
	<br>
	<br>
	<div class="fullscreen" style="height: 100vh;" data-img-width="1600"
		data-img-height="1064" data-diff="100" id="section1">
		<h1 id="maintitle">Games</h1>
		<video
			poster="<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpg"
			id="bgvid" loop playsinline autoplay muted>
			<source
				src="<%=request.getContextPath()%>/Resources/Images/Wallpapers/gamesmontage.mp4"
				type="video/mp4">
		</video>
		<div>
			<input class="dropdown-toggle" type="text" id="search"
				onkeyup="getList(this.value)" placeholder="Search for Games.."
				data-toggle="dropdown">
			<ul id="dropmenu" role="menu" aria-labelledby="menu1">
			</ul>
		</div>
		<br> <a href="#section2"><img
			src="<%=request.getContextPath()%>/Resources/Images/Icons/scroll-down2.png"
			onclick="" id="scroll-down" height="50px" align /></a>
	</div>
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
									<a onclick="getGame('Watch Dogs 2')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/wd2.jpg"
										class="img-responsive img" alt="Image"></img></a>
								</div>
							</div>
							<div onclick="getGame('Watch Dogs 2')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/wd2.jpg"
									class="img-responsive img"></img>
								<div class="panel-footer ft text">
									<span class="title">Watch Dogs 2</span>
									<div style="padding-top: 3px">
										November 2016<br>Action, Adventure, Third-person shooter<br>Ubisoft<br>
										<span style='font-family: Arial'> &#8360;.</span>3499<br>
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
									<a onclick="getGame('Mafia 3')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/mafia3.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Mafia 3')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/mafia3.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Mafia III</span>
									<div style="padding-top: 3px">
										October 2016<br>Action, Adventure<br>2K Games<br>
										<span style='font-family: Arial'> &#8360;.</span>3499
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
									<a onclick="getGame('Uncharted 4')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/uncharted.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Uncharted 4')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/uncharted.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Uncharted 4</span>
									<div style="padding-top: 3px">
										May 2016<br>Action, Adventure<br>Sony Interactive
										Entertainment<br> <span style='font-family: Arial'> &#8360;.</span>3999
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
									<a onclick="getGame('FIFA 17')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/fifa17.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('FIFA 17')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/fifa17.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">FIFA 17</span>
									<div style="padding-top: 3px">
										September 2016<br>EA Sports<br>Team-Based,
										Simulation, Soccer, Sports<br> <span
											style='font-family: Arial'> &#8360;.</span>3499
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
		<h2 class="head">POPULAR</h2>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getGame('Need For Speed : Rivals')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/nfs.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Need For Speed : Rivals')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/nfs.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Need For Speed: Rivals</span>
									<div style="padding-top: 3px">
										November 2013<br>Electronic Arts<br>Driving/Racing,
										Simulation<br> <span style='font-family: Arial'> &#8360;.</span>2499
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
									<a onclick="getGame('Assassins Creed IV Black Flag')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/ac4.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Assassins Creed IV Black Flag')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/ac4.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Assassin's Creed IV : Black Flag</span>
									<div style="padding-top: 3px">
										October 2013<br>Ubisoft<br>Adventure, Action<br>
										<span style='font-family: Arial'> &#8360;.</span>3999
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
									<a onclick="getGame('FIFA 16')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/fifa16.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('FIFA 16')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/fifa16.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">FIFA 16</span>
									<div style="padding-top: 3px">
										September 2015<br>EA Sports<br>Team-Based,
										Simulation, Soccer, Sports<br> <span
											style='font-family: Arial'> &#8360;.</span>1999
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
									<a onclick="getGame('Watch Dogs')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/wd.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Watch Dogs')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/wd.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Watch Dogs</span>
									<div style="padding-top: 3px">
										May 2014<br>Ubisoft<br>Adventure, Action,
										Third-person shooter<br> <span style='font-family: Arial'> &#8360;.</span>1499
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
									<a onclick="getGame('Bioshock')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/bs.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Bioshock')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/bs.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Bioshock : The Collection</span>
									<div style="padding-top: 3px">
										September 2016<br>2K Games<br>3D, Action,
										First-Person Shooter<br> <span style='font-family: Arial'> &#8360;.</span>2499
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
									<a onclick="getGame('Assassins Creed : Syndicate')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/AcS.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Assassins Creed : Syndicate')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/AcS.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Assassin's Creed: Syndicate</span><br>October
									2015<br>Ubisoft<br>Action, Adventure<br>
									<div style="padding-top: 3px" style='font-family:Arial'>
										<span> &#8360;.</span>1499
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
									<a onclick="getGame('Call Of Duty: Advanced Warfare')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/codaw.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Call Of Duty: Advanced Warfare')"
								class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/codaw.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Call Of Duty: Advanced Warfare</span><br>November
									2014<br>Activision<br>Tactical, First-Person, Action,
									Shooter, 3D<br>
									<div style="padding-top: 3px">
										<span style='font-family: Arial'> &#8360;.</span>1499
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
									<a onclick="getGame('Grand Theft Auto V')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/gtav.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getGame('Grand Theft Auto V')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Games/gtav.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Grand Theft Auto: V</span><br>September
									2013<br>Rockstar Games<br>3D, First-Person,
									Third-Person, Action, Open-World, Adventure<br>
									<div style="padding-top: 3px">
										<span style='font-family: Arial'> &#8360;.</span>3499
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
	<!-- -->
</body>
</html>

