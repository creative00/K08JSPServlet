<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
<body>
	<style>
	
		* {	
			font-family: Verdana;
		    margin: 100;
		    padding: 1000;
		    
		}
		#header {
			/*  background-color:lightgrey; */
			 height:170px;
			 width:1920px;
		}
		#nav {
			 
			 height:100px;
			 /* float: left; */
		}
		#section {
			height:600;
			text-align: left;
			float: right;
			background-color:red;
			
		}
		#footer {
			/* background-color: green; */
			height:120px;
			clear:both;
		}
		#header,#nav, #footer, #section { text-align:center; }
		#section {line-height : 240px;}
		.nav-item1 {
			width: 200px;
		}
		.nav-item2 {
			width: 270px;
		}
		.nav-item3 {
			width: 220px;
		}
		.nav-item4 {
			width: 220px;
		}
	</style>
</head>

<body>

	<div id="header">
		<%@ include file="../00Main/inc/top.jsp" %>
		
	</div>
	<nav class="navbar navbar-expand-sm bg-white navbar-light">
		<div class="container-fluid">
		    <ul class="navbar-nav">
		    	<li class="nav-item1">
		    	</li>
		    	<li class="nav-item3">
					<a class="nav-link active" onclick="location.href='AboutBi.jsp';" style="font-size: 35px;" href="#">About</a>
				</li>
				<li class="nav-item2">
					<a class="nav-link" style="font-size: 35px;" onclick="location.href='Location.jsp';"  href="#">Location</a>
				</li>
				<li class="nav-item4">
				 	<a class="nav-link" onclick="location.href='Notice.jsp';"style="font-size: 35px;" href="#">Notice</a>
		    </ul>
	  	</div>
	</nav>
	<div id="nav">
	</div>
	<table border="0" >
		
		</a>
		<div id="section">
			
		</div>
	</table>	
		
    <div id="nav">
		<%@ include file="../00Main/inc/link.jsp" %>
	</div>
   	
    <div id="footer">
		<%@ include file="../00Main/inc/footer.jsp" %>
		
	</div>
</body>

</html>
