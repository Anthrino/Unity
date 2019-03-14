<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Contact Us | Unity</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Resources/Style Sheets/Bootstrap.css">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/Resources/Images/Icons/title.ico"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Resources/Style Sheets/Css.css">
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/GoogleApis.js"></script>
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/Bootstrap1.js"></script>
    <script src="<%=request.getContextPath()%>/Resources/JS Sheets/customjs.js"></script>
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
	#contactsec
	{
		width:100%;
	}
	
  </style>
</head>
<body>
<!--TOP NAV BAR-->
<jsp:include page="NavBar.jsp"></jsp:include>
    <hr>
    <div class="bg"></div>

    <div class="col-sm-12 col-lg-12" style="height:20vh;">
        <h1 class="h1" style="font-size:500%;"> Contact us </h1> 
    </div>
    <hr>
    
<div class="container" id="contactsec">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name" value="${user.f_name}" required/>
                        </div>
                        <div class="form-group">
                            <label for="email">
                                Email Address</label>
                            <div class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span>
                                </span>
                                <input type="email" class="form-control" id="email" placeholder="Enter email" value="${user.email}" required /></div>
                        </div>
                        <div class="form-group">
                            <label for="subject">
                                Subject</label>
                            <select id="subject" name="subject" class="form-control" required="required">
                                <option value="na" >Choose One:</option>
                                <option value="service">General Customer Service</option>
                                <option value="suggestions">Suggestions</option>
                                <option value="product">Product Support</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Message</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required"
                                placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary pull-right" id="btnContactUs" style="background-color:black;color:chartreuse;">
                            Send Message</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
        <img
			src="<%=request.getContextPath()%>/Resources/Images/Icons/social-light.png"
			style="float: right; height: 30px; margin-top: -120px;"></img>
            <form>
            <h2 style="color:white">Our Office</h2><hr>
            <address style="font-size:15px; color:white">
                <strong>Unity, Inc.</strong><br>
                795 Folsom Ave, Suite 600<br>
                San Francisco, CA 94107<br>
                <p title="Phone">
                    Phone : (123) 456-7890</p>
               Email : <a href="mailto:#">contactus@unity.com</a>
            </address>
            </form>
        </div>
    </div>
</div>
<br><br><hr>
<div>
	<img src="<%=request.getContextPath()%>/Resources/Images/Icons/unity51.png" height="100px" align />	
	<div class="col-sm-5" style="height:20vh;float:right;">
        <h1 class="h1" style="font-size:200%;float:right;">Designed by  7&Xi;&Gamma;'&Iota; &Pi; &bull; 7&Theta;&Eta;&Pi;&trade; </h1> 
    </div>

</div>
</body>
</html>