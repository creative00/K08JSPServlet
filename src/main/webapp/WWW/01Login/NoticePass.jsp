<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>공지게시판 notice pass파트</title>
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
	
	<script type="text/javascript">
		function validateForm(form) {  // 폼 내용 검증 
		    if (form.pass.value == "") {
		        alert("비밀번호를 입력하세요.");
		        form.content.focus();
		        return false;
		    }
		}
	</script>
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
					<a class="nav-link" onclick="location.href='AboutBi.jsp';" style="font-size: 35px;" href="#">About</a>
				</li>
				<li class="nav-item2">
					<a class="nav-link" style="font-size: 35px;" onclick="location.href='Location.jsp';"  href="#">Location</a>
				</li>
				<li class="nav-item4">
				 	<a class="nav-link active" onclick="location.href='../www.noticeboard/list.do';"style="font-size: 35px;" href="#">Notice</a>
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
</body>


<!-- 
 파일 첨부를 위한 작성폼은 아래 2가지 조건이 지켜져야 한다.
 1.전송방식(method)sms post여야 한다.
 2. 인코딩 방식(enctype)은 multipart/form-data로 지정해야 한다.
 이와 같이 <form>태그를 구성 후 전송(submit)하면 request객체로는 폼값을 받을 수 없다. 
 cos.jar 확장라이브러리가 제공하는 MultipartRequest객체를 사용해 폼값을 받아야한다.
 -->

<!-- <h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2> -->
<!-- 글쓰기 페이지를 복사해 해당 페이지를 만들 때 비밀번호 검증 시에는
첨부 파일이 필요 없으므로 enctype은 제거해야한다. 만약 제거하지 않으면 
request내장 객체로 폼값을 받을 수 없으므로 주의해야 함  -->
<form name="writeFrm" method="post" action="../www.noticeboard/pass.do"
	onsubmit="return validateForm(this);">
<!--
해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은 후 
request영역에 저장하여 View에서 확인할 수 있지만, 
EL을 이용하면 해당 과정 없이 param내장 객체로 즉시 값을 받아올 수 있다.

※hidden밧스를 사용하는 경우 웹브라우져에서는 숨김처리 되기때문에
값이 제대로 입력되었는지 화면으로 확인할 수 없다. 
따라서 개발자 모드를 사용하거나 type을 디버깅용으로 잠깐 수정 후 
값이 제대로 입력되었는지 반드시 확인해야 한다.
-->
<input type="hidden" name="idx" value="${ param.idx }" />
<input type="hidden" name="mode" value="${ param.mode }" />


<table border="3" align="center" width="30%"  style="font-size:23px">
    <tr>
        <td>
        <div type="text" style="background-color:lightgrey;font:white;padding:8px" />&nbsp;&nbsp;비밀 번호</div>
        <td>
            <input type="password"  name="pass" style="width:180px;" />
            <button style="background-color:#4cef7d; border:0;font-size:18px; padding:8px" type="submit" >검증하기</button>
        </td>
        
    </tr>
    <tr>
        <td colspan="2" align="center">
        	<br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset" style="background-color:#4cef7d;border:0;font-size:18px;padding:10px">&nbsp;&nbsp;RESET&nbsp;&nbsp;</button>
            <button type="button" style="background-color:#4cef7d;border:0;font-size:18px;padding:10px" onclick="location.href='../www.noticeboard/list.do';">
             &nbsp;&nbsp;목록 바로 보기&nbsp;</button>
        </td>
    </tr>
</table>
</form>
</body>
<!-- 하단 아이콘 바 -->    
<body>
<br /><br /><br />
	<div id="link">
		<%@ include file="../00Main/inc/link.jsp" %>
	</div>
    <div id="footer">
		<%@ include file="../00Main/inc/footer.jsp" %>
	</div>
</body>
</html>
