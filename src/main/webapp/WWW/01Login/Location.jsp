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
	<div id="nav">
		<!-- Grey with black text -->
	<nav class="navbar navbar-expand-sm bg-white navbar-light">
		<div class="container-fluid">
		    <ul class="navbar-nav">
		    	<li class="nav-item1">
		    	</li>
		    	<li class="nav-item3">
					<a class="nav-link" onclick="location.href='AboutBi.jsp';" style="font-size: 35px;" href="#">About</a>
				</li>
				<li class="nav-item2">
					<a class="nav-link active" style="font-size: 35px;" href="#">Location</a>
				</li>
				<li class="nav-item4">
				 	<a class="nav-link" onclick="location.href='Notice.jsp';"style="font-size: 35px;" href="#">Notice</a>
		    </ul>
	  	</div>
	</nav>
	<iframe src= "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3464.328365306549!2d-95.466655384541!3d29.739208539881275!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8640c16eeef3bdd1%3A0x7e03fa20d63c5caf!2z642UIOqwpOufrOumrOyVhA!5e0!3m2!1sko!2skr!4v1671785258052!5m2!1sko!2skr" width="1000" height="800" style="border:0;" allowfullscreen="" loading="lazy">
	</iframe>
	
	<table border="0" >
			
		<div id="section">
			
		</div>
	</table>	
		<div class="row mt-3 mx-1"> <!-- mt-3 mx-1 -->
                <!-- 하단 아이콘 바 -->
                <table class="table table-bordered table-hover table-striped">
            		<br /><br />
               	<div class="text-center">
                   <!-- 각종 버튼 부분 -->
                   	<button type="button" onclick="location.href='https://instagram.com/le_rayon_vert_';" class="btn"><i class="bi bi-instagram"></i> IG</button>
                    <button type="button" class="btn" onclick="location.href='https://www.youtube.com/watch?v=_44OIAW-qRQ';"><i class="bi bi-youtube"></i> YOUTUBE</button>
                    <button type="button" class="btn"><i class="bi bi-shop"></i> NAVER </button>
                    <button type="button" class="btn" onclick="location.href='http://localhost:8585/K09MySQLBoard/WWW/00Main/Location.jsp'"><i class="bi bi-geo-alt-fill"></i> LOCATION</button>
 					<button type="button" class="btn" onclick="location.href='http://localhost:8585/K09MySQLBoard/WWW/00Main/CommunityMain.jsp';"><i class="bi bi-person-lines-fill"></i> COMMUNITY</button>
                    <button type="button" class="btn"><i class="bi bi-envelope"></i> CONTACT</button>
                    <br/><br/><br/>
               	</div>
                </table>
        </div>
	
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <div id="footer" >
    	<br/>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vert Ltd. |&nbsp;Business registration number: 130-88-16875 |&nbsp;CEO: Soo-ryun Kim |&nbsp;Vert_official@vert.com &nbsp;&nbsp;<br/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tel : +1 080-8932-3042 |&nbsp;Address : 5085 Westheimer Rd, Houston, The Galleria TX 77056 &nbsp;
      		<br/> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&copy; 2022 Vert Ltd. All right reserved.
    </div>
</body>

</html>


