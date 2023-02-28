<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<script type="text/javascript">
/* 패스워드 검증을 통해 수정페이지로 진입하므로 해당 페이지에서는
 추가로 패스워드를 입력하지 않는다.
 */

	function validateForm(form) {
		if (form.nam.value == "") {
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>  
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
	</body>
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
				 	<a class="nav-link active" onclick="location.href='./www.noticeboard/list.do';"style="font-size: 35px;" href="#">Notice</a>
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

<!--  -->
<!-- action="../www.noticeboard/edit.do"  -->
	<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
	<!-- 글쓰기 페이지를 그대로 사용하되 action 부분만 수정한다.
	수정 시에도 파일 첨부가 있으므로 entype속성은 추가되어야 한다.  -->
	<form name="writeFrm" method="post" enctype ="multipart/form-data"
	action="./edit.do" onsubmit="return validateForm(this);" >
	<!--게시물 수정 위한 일련번호  -->
	<input type="hid-den" name="idx" value="${ dto.idx }"/>
	<!-- 기존의 원본파일명 -->
	<input type="hid-den" name="prevOfile" value="${ dto.ofile }"/>
	<!-- 기존의 서버에 저장된 파일명-->
	<input type="hid-den" name="prevSfile" value="${ dto.sfile }"/>
	<!-- 해당 hidden값은 게시물 수정 시 첨부파일이 없는 경우 사용될 것이다.  -->
	
	
	<table border="1" style="border-bottom: solid 1px rgba(165, 165, 165, 165);" width="50%" height="200px" align="center" padding="100px" margin="100px">
		<tr>
			<td>작성자</td>
			<td>
				<input type="text" name="name" style="width: 150px;"
						value="${ dto.name }"/>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				<input type="text" name="title" style="width: 90%;"
						value="${ dto.title }"/>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 90%; height: 400px;">${ dto.content }</textarea>
			</td>
		</tr>
		<tr>
			<td>첨부 파일</td>
			<td>
				<input type="file" name="ofile" />
			</td>
		</tr>
		<!-- 패스워드 부분은 삭제한다.  -->
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='./www.noticeboard/list.do';">
					목록 바로가기
				</button>
			</td>
		</tr>
	</table>
	</form>


    <div id="nav">
		<%@ include file="../00Main/inc/link.jsp" %>
	</div>
   	
    <div id="footer">
		<%@ include file="../00Main/inc/footer.jsp" %>
		
	</div>
</body>

</html>
