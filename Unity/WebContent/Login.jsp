<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login &#8226; Sign-Up - Unity</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico" />
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
<script
	src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
<style
	src="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css"></style>
<style>
@import 'https://fonts.googleapis.com/css?family=PT+Sans';

html, body {
	height: 100%;
	font-family: 'PT Sans', sans-serif;
	color: chartreuse;
}

.bg {
	background:
		url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpeg');
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	background-position: center;
	z-index: -1;
	background-size: contain;
	filter: blur(0px);
}
.navbar-brand {
	width: 160px;
}
.navbar-brand {
	width: 120px;
}
.control-label {
	padding-left: 0px;
	padding-right: 0px;
}

#loginform {
	padding-top: 80px;
	align-content: flex-start;
}

#logintitle {
	color: chartreuse;
	padding-left: 130px;
	padding-top: 50px;
}

#signupform {
	padding-top: 10px;
	padding-left: 120px;
	align-content: flex-start;
}

#signuptitle {
	color: chartreuse;
	padding-left: 85px;
	padding-top: 50px;
}
</style>
</head>
<body>
	<!--TOP NAV BAR-->
	<jsp:include page="NavBar.jsp"></jsp:include>
	<div class="bg"></div>
	<c:if test="${ not empty message }">
			<h4 style="color:red;padding-left:460px;padding-top:20px;">&prop; ${message}</h4>
		</c:if>
	<div class="col-sm-6" style="height: 100%;">
		<h1 id="signuptitle">Sign Up</h1>
		<br>
		<c:if test="${ not empty signupstatus }">
			<h4 style="color:red;padding-left:86px;margin-top:-20px;">&prop; Sign up Failed.  Email-Id already registered.<br>
			 Please login or use a different Email-Id.</h4>
		</c:if>
		<form class="form-horizontal" role="form" id="signupform"
			action="signup" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="fname">First Name
					: </label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="fname" id="fname"
						placeholder="Enter first name" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="lname">Last Name
					: </label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="lname" id="lname"
						placeholder="Enter last name" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email-Id :
				</label>
				<div class="col-sm-7">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="Enter email" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="mob">Mobile No :
				</label>
				<div class="col-sm-7">
					<input type="tel" class="form-control" name="mob" id="mob"
						placeholder="Enter mobile number" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="pwd">Password : </label>
				<div class="col-sm-7">
					<input type="password" class="form-control" name="passwd" id="pwd"
						placeholder="Enter password" required>
				</div>
			</div>
			<!-- <div class="form-group">
				<div class="col-sm-9" style="padding-left: 108px;">
					<input type="password" class="form-control" name="rpaswd"
						id="repwd" placeholder="ReEnter password" required>
				</div>
			</div>
			<div class="form-group">
					<label class="control-label col-sm-2" for="prime">Prime User : </label>
					<div class="col-sm-5" style="margin-left: -80px;">
					<input type="checkbox" class="form-control" name="prime"
						id="prime" > 
				</div>
			</div> -->
			<br>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Submit</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-sm-6" style="height: 100%;">
		<h1 id="logintitle">Login</h1>
		<c:if test="${ not empty status }">
			<h4 style="color:red;padding-left:133px;padding-top:20px;margin-bottom:-50px;">&prop; Login Failed. Please verify your credentials.</h4>
		</c:if>
		<form class="form-horizontal" role="form" id="loginform"
			action="login" method="post">
			<div class="form-group">
				<label class="control-label col-sm-4" for="email">Email : </label>
				<div class="col-sm-6">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="Enter email" required>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-4" for="pwd">Password : </label>
				<div class="col-sm-6    ">
					<input type="password" class="form-control" name="passwd" id="pwd"
						placeholder="Enter password" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10"
					style="padding-left: 130px; padding-top: 20px;">
					<button type="submit" class="btn btn-default">Login</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>