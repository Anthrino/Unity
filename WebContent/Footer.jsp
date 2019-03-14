<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- FOOTER -->
	<footer class="container-fluid text-center" style="height:10vh;">
	<div style="padding-top: 20px; font-size: 20px; margin-left: 10px; margin-top:10px; vertical-align:middle;">
		<a href="<%=request.getContextPath()%>/Games.jsp">Games</a> &emsp; &curren; &emsp; 
		<a href="<%=request.getContextPath()%>/Movies.jsp">Movies</a> &emsp; &curren; &emsp;
		<a href="<%=request.getContextPath()%>/Software.jsp">Software</a> &emsp; &curren; &emsp; 
		<a href="<%=request.getContextPath()%>/Contact.jsp">Contact Us</a> <img
			src="<%=request.getContextPath()%>/Resources/Images/Icons/social-light.png"
			style="float: right; height: 30px; margin-left: -220px;"></img>
	
	</div>
	<img src="<%=request.getContextPath()%>/Resources/Images/Icons/unity5.png" height="50px" style="float:left; 
		margin-left: -30px; margin-top: -50px;" align />
			
	</footer>
</body>
</html>