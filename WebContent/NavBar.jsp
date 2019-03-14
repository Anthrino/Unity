<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="user" class="com.anthrino.unity.dto.UserDto"
	scope="session" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.dropdown-content 
{
   	display: none;
   	position: absolute;
   	background-color: transparent;
   	min-width: 300px;
   	box-shadow: 2px 2px 15px 2px;
   	padding: 12px 16px;
}
.dropdown-content a {
    font-size: 15px;
    color: chartreuse;
    text-shadow: 4px 4px 2px #000000;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
ul 
{
    list-style-type: none;
    color: aqua;
    padding: 14px 16px;
    cursor: pointer;
    margin: 10;
    overflow: visible;
    
}
</style>
<script>
$(document).ready(function() 
		{
	$("#accountmenu").hide();
	$("#loginb").click(function() {
		$("#accountmenu").slideToggle();
	})
	$("#loginb").onMouseLeave(function() {
		$("#accountmenu").slideToggle();
	})
})
function pageTrack()
{
	
	var prevtrack = document.URL;
	alert(prevtrack);
	session.setAttribute("prevtrack",prevtrack);
	alert('session.setAttribute("prevtrack")');
}
</script>
</head>
<body>
	<!-- TOP NAV BAR -->
	<nav class="navbar navbar-inverse" id="navb" style=" margin-top:-10px;">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar"></button>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/Unity.jsp"
				style=" margin-left:-30px;padding-right:10px;"><img
				src="<%=request.getContextPath()%>/Resources/Images/Icons/logoc.png"
				height="45px"
				onmouseover="this.src='<%=request.getContextPath()%>/Resources/Images/Icons/logo.png'"
				onmouseout="this.src='<%=request.getContextPath()%>/Resources/Images/Icons/logoc.png'"></img></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav" style="font: status-bar; font-size: 16px">
				<li id="hover"><a
					href="<%=request.getContextPath()%>/Games.jsp">Games</a></li>
				<li id="hover"><a
					href="<%=request.getContextPath()%>/Movies.jsp">Movies</a></li>
				<li id="hover"><a
					href="<%=request.getContextPath()%>/Software.jsp">Software</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right"
				style="font: status-bar; font-size: 16px">
				<c:choose>
					<c:when test="${not empty user.f_name }">
						<li id="hover" style="margin-right:10px;padding-top:13px;"><div class="dropdown">
							<a class="dropbtn" id="loginb"> Hello, <jsp:getProperty
									property="f_name" name="user"/><span class="caret"
								style="color: chartreuse;"></span></a>
							<div style="position: absolute;" class="dropdown-content" id="accountmenu">
								<a href="<%=request.getContextPath()%>/Account.jsp"> Account&nbsp;Settings </a>
								<a type="submit" href="<%=request.getContextPath()%>/logout">Logout </a>
							</div>
						</div></li>
						<li id="hover"><a href="cart">Cart</a></li>
					</c:when>
					<c:otherwise>
						<li id="hover" style="padding-right:150px;"><a
							href="<%=request.getContextPath()%>/Login.jsp" onclick="pageTrack()">Login&nbsp;&forall;&nbsp;SignUp</a></li>
					</c:otherwise>
				</c:choose>
				<li id="hover" style="width:100px;padding-right:50px;"><a
					href="<%=request.getContextPath()%>/Contact.jsp">Contact&nbsp;Us</a></li>				
			</ul>
		</div>
	</div>
	</nav>
</body>
</html>