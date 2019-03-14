<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<title>Unity</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
<script src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
<style src="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css"></style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
<script src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
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
</script>
<style>
html, body {
	height: 100%;
	font-family: 'PT Sans', sans-serif;
}

body {
	font-size: 40px;
	line-height: 100px;
	color: #ffffff;
	text-align: center;
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

.background {
	background-repeat: no-repeat;
	background-position: 50% 50%;
}

.fullscreen {
	width: 100%;
	height: 100%;
	overflow: hidden;
	background: radial-gradient(rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.45),
		rgba(0, 0, 0, 0.85), rgba(0, 0, 0, 1));
}

.set-b {
	float: left;
	margin-left: 130px;
	transform: skewX(-20deg);
	pointer-events: auto;
	background: url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/game.jpg') no-repeat;
	background-size: cover;
}

.set-c {
	height: 100%;
	position: absolute;
	pointer-events: auto;
	transition: width 1s ease-in-out;
	/*    background:url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/movie.jpg');*/
	background-size: cover;
}

.set-d {
	float: right;
	margin-right: 130px;
	transform: skewX(20deg);
	pointer-events: auto;
	background: url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/software.jpg') no-repeat
		fixed;
	background-size: cover;
}

#text {
	color: chartreuse;
	position: relative;
	opacity: 1.0;
}

#scroll-down {
	transition: 0.2s ease-in-out;
}

#scroll-down:hover {
	transform: scale(1.2);
}

.slider-1 {
	width: 40%;
	height: 100%;
	margin-right: 50px;
	margin-left: -130px;
	overflow: hidden;
	display: inline-block;
	float: left;
	transform: skewX(20deg);
	transition: width 1s ease-in-out;
	border-right: 10px solid rgba(255, 255, 255, 0);
	pointer-events: none;
}

.slider-2 {
	height: 100%;
	width: 40%;
	margin-left: 50px;
	margin-right: -130px;
	overflow: hidden;
	display: inline-block;
	float: right;
	transform: skewX(-20deg);
	transition: width 1s ease-in-out;
	border-left: 10px solid rgba(255, 255, 255, 0);
	pointer-events: none;
}

.slider-1:hover {
	width: 65%;
	color: chartreuse;
}

.slider-2:hover {
	width: 65%;
	color: chartreuse;
}

.set-c:hover+.slider-1, .set-c:hover ~.slider-2 {
	width: 30%;
}

.set-c:hover {
	color: chartreuse;
}

.button {
	text-shadow: 5px 5px 20px black;
	width: 100%;
	height: 100%;
	border-radius: .5em;
	vertical-align: middle;
	padding-top: 325px;
}

.button a {
	left: 0;
	top: 0;
	position: absolute;
	display: block;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
	<div class="fullscreen background parallax set-a" data-img-width="1600"
		data-img-height="1064" data-diff="100" id="section1">
		<video poster="<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpg" id="bgvid" loop
			playsinline autoplay muted>
			<source src="<%=request.getContextPath()%>/Resources/Images/Wallpapers/Unity.mp4"
				type="video/mp4">
		</video>
		<br /> <img src="<%=request.getContextPath()%>/Resources/Images/Icons/logo.png" height="250px"
			align /> <br />
		<section style="height: 0%; position: absolute;"></section>
		<div id="text">Games &emsp; &curren; &emsp; Movies &emsp;
			&curren; &emsp; Software</div>
		<br /> <a href="#section2"><img
			src="<%=request.getContextPath()%>/Resources/Images/Icons/scroll-down2.png" onclick=""
			id="scroll-down" height="50px" align /></a>
	</div>
	<div class="fullscreen" id="section2">
		<div class="button set-c">
			Movies <a href="<%=request.getContextPath()%>/Movies.jsp"></a>
		</div>
		<div class="slider-1">
			<div class="button set-b">
				Games <a href="<%=request.getContextPath()%>/Games.jsp"></a>
			</div>
		</div>
		<div class="slider-2">
			<div class="button set-d">
				Software <a href="<%=request.getContextPath()%>/Software.jsp" />
			</div>
		</div>
	</div>
</body>
</html>

