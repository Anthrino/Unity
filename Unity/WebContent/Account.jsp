<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:useBean id="user" class="com.anthrino.unity.dto.UserDto"
	scope="session" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Account Settings | Unity</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css">
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
    <style>
        .navbar-brand{
            width:120px;
        }
        .bg 
        {
            background: url('<%=request.getContextPath()%>/Resources/Images/Wallpapers/W.jpeg');
            position: fixed;
            width: 100%;
            height: 100%;
            top:0;
            background-position: center;
            z-index: -1;
            background-size: contain;
            filter: blur(0px);
        }
        .control-label
        {
            padding-left: 0px;
            padding-right: 0px;
        }
        #signupform
        {
            padding-top: 10px;    
            padding-left: 350px;
            align-content:center;
        }
        #signuptitle
        {
            color: chartreuse;
            padding-left: 85px;
            padding-top: 30px;
        }
        label{
            color:chartreuse;  
            font-size: 15px;
        }
    </style>
</head>
<body>
    <!--TOP NAV BAR-->
   	<jsp:include page="NavBar.jsp"></jsp:include>
    <div class="bg"></div>
    <div class="col-sm-12" style="height:100%;">
        <h1 id="signuptitle" style="padding-left:450px;">
        Update Profile 
        </h1>
        <br>
        <c:if test="${ not empty updatestatus }">
			<h4 style="color:red;padding-left:450px;margin-top:-15px;">&prop; Account Updation ${ updatestatus } </h4>
		</c:if>
		<br>
        <form class="form-horizontal" role="form" id="signupform" action="account" method="post" onsubmit="return validateForm()" name="form">
            <div class="form-group" >
                <label class="control-label col-sm-2" for="fname">First Name : </label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="fname" id="fname" value="${user.f_name}" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="lname">Last Name : </label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" name="lname" id="lname" value="${user.l_name}" required>
                </div>
            </div>
            <div class="form-group" >
                <label class="control-label col-sm-2" for="email">Email-Id : </label>
                <div class="col-sm-4">
                    <input type="email" class="form-control" name="email "id="email" value="${user.email}" required>
                </div>
            </div>
           <div class="form-group">
                <label class="control-label col-sm-2" for="mob">Mobile No : </label>
                <div class="col-sm-4"> 
                    <input type="tel" class="form-control" name="mob" id="mob" value="${user.m_no}" required>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="pwd" id="lpasswd">Password : </label>
                <div class="col-sm-4"> 
                    <input type="password" class="form-control" name="passwd" id="pwd" value="${user.password}" required>
                </div>
            </div>
            <br>
            <div class="form-group"> 
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Update</button>
                </div>
            </div>
        </form>
    </div><hr>
</body>
</html>