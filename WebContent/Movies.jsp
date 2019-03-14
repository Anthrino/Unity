<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Movies | Unity</title>
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
	background: radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.25),
		rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.75));
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
#maintitle {
	padding-top:40px;
	font-size: 1000%;
	color: chartreuse;
	position: relative;
	transition: 0.5s ease-in-out;
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
	height: 270px;
	width: 180px;
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
}

.navbar-brand {
	width: 120px;
}

.ft {
	background-color: black;
	color: white;
	border: 0;
}

.img-responsive {
	border: 0;
	height: 270px;
	width: 180px;
}

.img-responsive:hover {
	opacity: 0.4;
}

#search {
	background-image: url('search.png');
	background-repeat: no-repeat;
	background-size: 30px;
	width: 50%;
	color: black;
	text-transform: capitalize;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 2px solid white;
	border-radius: 5px;
	margin-bottom: 12px;
}

.text {
	position: absolute;
	top: 0px;
	opacity: 0.9;
	width: 180px;
	height: 270px;
	font-size: 15px;
}

.head {
	padding-top: 20px;
	color: chartreuse;
	margin-left: -700px;
}

.flip {
	height: 270px;
	width: 180px;
	position: absolute;
	top: 0px;
}

.flip img {
	width: 180px;
	height: 270px;
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
	color: whitesmoke;
}

a:link {
	text-decoration: none;
}

a:hover {
	color: whitesmoke;
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
	});</script>
<script type="text/javascript">
function request()
{
	confirm('Please ensure complete title of movie is entered.');
    var x = document.getElementById("search").value;
	getMovie(x);	
}
function getMovie(title)
{
    var form = document.createElement('form');
    var input = document.createElement('input');
    form.method = "GET";
    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "title");
    hiddenField.setAttribute("value", title);
    form.appendChild(hiddenField); 
    form.action = "moviepage";
    form.submit();
	var x = document.getElementById("dropmenu");

}
function getList(search)
{			
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
	document.getElementById("dropmenu").innerHTML="";
	document.getElementById("maintitle").style.marginTop="-20px";
	document.getElementById("maintitle").style.padding="0px";
	document.getElementById("search").style.paddingTop="10px";
	document.getElementById("scroll-down").style.marginTop="0px";
    $.get("moviesearch?search="+search, function(responseJson) {     // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
        var $list = $("<ul>").appendTo($("#dropmenu")); // Create HTML <table> element and append it to HTML DOM element with ID "somediv".
        if(responseJson.length == 0 && search.length != 0)
        	$("<li style='color:chartreuse;font-size:150%;padding-top:20px;'>")                  // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
            .appendTo($list).text("No results found")        
        else
        {
	        $.each(responseJson, function(index, movie) {    // Iterate over the JSON array.
	            $("<li class='searchlist' onclick='getMovie($(this).text())'>")                  // Create HTML <tr> element, set its text content with currently iterated item and append it to the <table>.
	            .appendTo($list).text(movie.title)        // Create HTML <td> element, set its text content with id of currently iterated product and append it to the <tr>.
	       	});
        }
    });
}
</script>
</head>
<body>
	<!-- TOP NAV BAR -->
	<jsp:include page="NavBar.jsp"></jsp:include>
	<br>
	<br>
	<div class="fullscreen" style="height: 100vh;" data-img-width="1600"
		data-img-height="1064" data-diff="100" id="section1">
		<h1	id="maintitle">
			Movies</h1>
		<video
			poster="<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpg"
			id="bgvid" loop playsinline autoplay muted>
			<source
				src="<%=request.getContextPath()%>/Resources/Images/Wallpapers/Movies16.mp4"
				type="video/mp4">
		</video>
		<div>
			<input class="dropdown-toggle" type="text" id="search" 
				onkeyup="getList(this.value)" placeholder="Search for Movies & T.V. Series.."
				data-toggle="dropdown">
				<button class="btn btn-default" type="button" style="margin-left:20px;margin-right:-50px;background-color: black; color: chartreuse;"
										id="request" onclick="request()">
										Request Movie </button>
			<ul id="dropmenu" role="menu" aria-labelledby="menu1">
			</ul>
		</div>
		
		<br> <a href="#section2"><img
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
									<a onclick="getMovie('Captain America: Civil War')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/cw.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Captain America: Civil War')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/cw.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Captain America: Civil War</span>
									<div style="padding-top: 3px">
										Action, Adventure, Sci-Fi<br>May 2016<br>Director:
										Anthony Russo, Joe Russo<br>IMDb: 8.1/10<br> <span
											style='font-family: Arial'> &#8360;.</span>499
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
								<a onclick="getMovie('X-MEN: Apocalypse')"><img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/xmenapo.jpg"
									class="img-responsive img" alt="Image"></a>
							</div>
						</div>
						<div onclick="getMovie('X-MEN: Apocalypse')" class="back">
							<img
								src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/xmenapo.jpg"
								class="img-responsive img" alt="Image">
							<div class="panel-footer ft text">
								<span class="title">X-MEN: Apocalypse</span>
								<div style="padding-top: 3px">
									Action, Adventure, Sci-Fi<br>May 2016<br>Director:
									Bryan Singer<br>IMDb: 7.2/10<br> <span
										style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('Deadpool')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/deadpool.JPG"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Deadpool')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/deadpool.JPG"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Deadpool</span>
									<div style="padding-top: 3px">
										Action, Adventure, Comedy<br>February 2016<br>Director:
										Tim Miller<br>IMDb: 8.1/10<br> <span
											style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('Sully')" ><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/sully.JPG"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Sully')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/sully.JPG"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Sully</span>
									<div style="padding-top: 3px">
										Biography, Drama<br>September 2016<br>Director:
										Clint Eastwood<br>IMDb: 7.9/10<br>
										style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('The Conjuring 2')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/con2.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('The Conjuring 2')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/con2.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">The Conjuring 2</span>
									<div style="padding-top: 3px">
										Horror, Mystery, Thriller<br>June 2016<br>Director:
										James Wan<br>IMDb: 7.6/10<br> <span
											style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('Batman v Superman: Dawn of Justice')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/bvs.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Batman v Superman: Dawn of Justice')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/bvs.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Batman v Superman: Dawn of Justice</span>
									<div style="padding-top: 3px">
										Action, Adventure, Sci-Fi<br>March 2016<br>Director:
										Zack Synder<br>IMdb: 6.8/10<br> <span
											style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('Suicide Squad')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/susq.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Suicide Squad')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/susq.jpg"
									class="img-responsive img" alt="Image">
									<div class="panel-footer ft text">
										<span class="title">Suicide Squad</span><br> Action,
										Adventure, Fantasy<br>August 2016<br>Director: David
										Ayer<br>IMDb: 6.7/10
										<div style="padding-top: 3px">
											<span style='font-family: Arial'> &#8360;.</span> 499
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
									<a onclick="getMovie('Star Wars: The Force Awakens')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/starw.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Star Wars: The Force Awakens')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/starw.jpg"
									class="img-responsive img" alt="Image"/>
									<div class="panel-footer ft text">
										<span class="title">Star Wars: The Force Awakens</span>
										<div style="padding-top: 3px">
											Action, Adventure, Fantasy <br>December 2015<br>Director:
											J. J. Abrams<br>IMDb: 8.2/10<br> <span
												style='font-family: Arial'> &#8360;.</span> 299
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
									<a onclick="getMovie('Jurassic World')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/Jw.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Jurassic World')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/Jw.jpg"
									class="img-responsive img" alt="Image">
									<div class="panel-footer ft text">
										<span class="title">Jurassic World</span>
										<div style="padding-top: 3px">
											Action, Adventure, Sci-Fi<br>June 2015<br>Director:
											Colin Trevorrow<br>IMDb: 7.0/10<br> <span
												style='font-family: Arial'> &#8360;.</span>299
										</div>
									</div></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getMovie('Avengers: Age Of Ultron')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/aou.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Avengers: Age Of Ultron')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/aou.jpg"
									class="img-responsive img" alt="Image">
									<div class="panel-footer ft text">
										<span class="title">Avengers: Age Of Ultron</span>
										<div style="padding-top: 3px">
											May 2015<br> Action, Adventure, Sci-Fi<br>Director:
											Joss Whedon<br>IMDb: 7.5/10<br> <span
												style='font-family: Arial'> &#8360;.</span>299
										</div>
									</div></a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="panel panel-primary">
						<div class="flip">
							<div class="front">
								<div class="panel-body panel-height">
									<a onclick="getMovie('Furious 7')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/f7.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Furious 7')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/f7.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Furious 7</span>
									<div style="padding-top: 3px">
										Action, Crime, Thriller<br>March 2015<br>Director:
										James Wan<br>IMDb: 7.2/10<br> <span
											style='font-family: Arial'> &#8360;.</span>299
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
									<a onclick="getMovie('Mission: Impossible - Rogue Nation')"><img
										src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/mi.jpg"
										class="img-responsive img" alt="Image"></a>
								</div>
							</div>
							<div onclick="getMovie('Mission: Impossible - Rogue Nation')" class="back">
								<img
									src="<%=request.getContextPath()%>/Resources/Images/Covers/Movies/mi.jpg"
									class="img-responsive img" alt="Image">
								<div class="panel-footer ft text">
									<span class="title">Mission: Impossible - Rogue Nation</span>
									<div style="padding-top: 3px">
										Action, Adventure, Thriller<br>July 2015<br>IMDb:
										7.4/10<br>Director: Christopher McQuarrie<br> <span
											style='font-family: Arial'> &#8360;.</span>299
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<hr>
	<br>
	<!-- -->
	<!-- FOOTER -->
	<jsp:include page="Footer.jsp"></jsp:include>
	</body>
</html>

