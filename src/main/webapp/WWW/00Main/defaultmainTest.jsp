<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page layouts</title>
	<style>
	.header {
		 background-color:lightgrey;
		 height:120px;
	}
	#nav {
		 background-color:#393939;
		 color: white;
		 height:50px;
		 /* float: left; */
	}
	#section {
		width: 1000px;
		height: 1000px;
		text-align: left;
		float: right;
		background-color:yellow;
		padding: 10px;
	} 
	#footer {
		background-color:lightgrey;
		height:120px;
		clear:both;
	}
	#header,#nav, #section,#footer { text-align:center; }
	#header, #footer { line-height : 100px; }
	#nav, #section {line-height : 240px;}}
	}
	</style>
</head>
<body>
	<h1></h1>
	<div id="header">네가 나를 모르는데</div>
		
	<div id="nav">난들 너를 알겠느냐</div>
	
	<div id="section">오늘도 화이팅</div>
	
	<div id="footer">내 판권</div>
	

</body>
</html>