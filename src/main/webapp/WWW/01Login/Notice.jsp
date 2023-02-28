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
    
    <title>Registration</title>
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
		
		#footer {
			/* background-color: green; */
			height:120px;
			clear:both;
		}
		#header,#nav, #footer  { text-align:center; }
		
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
					<a class="nav-link" onclick="location.href='AboutBi.jsp';" style="font-size: 35px;" href="#">About</a>
				</li>
				<li class="nav-item2">
					<a class="nav-link" style="font-size: 35px;" onclick="location.href='Location.jsp';"  href="#">Location</a>
				</li>
				<li class="nav-item4">
				 	<a class="nav-link active" onclick="location.href='Notice.jsp';"style="font-size: 35px;" href="#">Notice</a>
		    </ul>
	  	</div>
	</nav>

<body>
	<table class="userTable">
	    <div id="selection">
	   
	   	<colgroup> 
	        <col width="130px" />
	        <col width="540px" />
	    </colgroup>
	    <tr>
	    	<div class="title" style="font-size: 50px; color:grey; text-align: center; margin:80px;">공지사항
	    	</div>
	    </tr>
	</table>
	    <br />
    <table border="0" align="center" width="70%" style="border-bottom: solid 1px rgba(165, 165, 165, 165);">
     <br />
    	<!--각 칼럼의 이름  -->
        <tr>
            <th width="10%">번호</th>
            <th width="27%">제목</th>
            <th width="8%">작성자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
            <th width="10%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수</th>
            <th width="22%">작성일</th>
            <!-- <th width="8%">첨부</th> -->
        </tr>
       	<table border="0" align="center" width="70%" style="border-bottom: solid 1px rgba(165, 165, 165, 165);">
		<c:choose>
			<c:when test="${ empty boardLists }">
		<!-- 게시물을 저장하고 있는 boardlists 컬렉션에 내용이 없다면 아래 부분을 출력한다. -->
				<tr >
					<td style="border-bottom: solid 1px rgba(165, 165, 165, 165);">
					</td>
					<td colspan="6" align="center" style="border-top: rgba(165, 165, 165, 165); ">
						<br /><br />
						등록된 게시물이 없습니다. *^^*
						<br /><br /><br />
					</td>
					<td style="border-bottom: solid 1px rgba(165, 165, 165, 165);">
					</td>
				</tr>
			</c:when>
			<c:otherwise>
			<!-- 게시물이 있을 때 컬렉션에 저장된 목록의 갯수만큼 반복한다.  -->
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					<!--
					가상번호 계산하기
					=> 전체 게시물 갯수 - (((페이지번호 -1) * 페이지 당 게시물 수) + 해당 루프의 index)
					참고로 varStatus 속성의 index는 0부터 시작한다.
						
						전체 게시물의 갯수가 5개이고 페이지 당 2개씩만 출력한다면..
						1페이지의 첫번째 게시물 번호 : 5 - (((1-1)*2) + 0) = 5
						2페이지의 첫번째 게시물 번호 : 5 - (((2-1)*2) + 0) = 3
					-->
					<tr align="center">
		        	<!-- 게시물의 가상 번호  -->
			            <td>
			            	${ map.totalCount - (((map.pageNum-1) * map.pageSize)
			            		+ loop.index)}
						</td>  
			            <!-- 제목  -->
			            <td align="left"> 
			            <!-- 제목을 클릭할 경우 내용보기 페이지로 이동 -->
				            <a href="../www.noticeboard/view.do?idx=${ row.idx }">${ row.title }</a>
				       
			            </td>
			            <td>${ row.name }</td>
			            <td>${ row.visitcount }</td>
			            <td>${ row.postdate }</td>
			          	<td>
			          	<!-- 첨부파일의 경우 필수사항 아니라 테이블 생성 시 not null조건이 적영되어 있지않다.
			          	따라서 첨부파일이 있을 때만 다운로드 링크를 출력한다. -->
			          	<c:if test="${ not empty row.ofile }">
			          	<a href="../www.noticeboard/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
			          	</c:if>
			          	</td>
		        	</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
    </table>
	    <!--목록 하단의 [글쓰기] 버튼 -->
	    <table border="0" width="70%" align="center">
	        <tr align="center">
	            <td>
	            	<!-- 컨트롤러(서블릿)에서 클래스 호출을 통해 
	            	이미 페이지 번호가 문자열로 만들어져 있는 상태이므로
	            	뷰(JSP)에서는 출력만 해주면 된다.  -->
	                ${ map.pagingImg }
	            </td>
	            <td width="100"><button type="button"
	                onclick="location.href='../www.noticeboard/write.do';">글쓰기</button>
	            </td>
	        </tr>
	    </table>
	    <form method="get">  
	    <table width="70%" align="center">
	    <tr>
	        <td align="center">
	        <br /> <br /> <br /> <br />
	            <select name="searchField"> 
	                <option value="title">제목</option> 
	                <option value="content">내용</option>
	                <option value="idx">번호</option>
	            </select>
	            <input type="text" name="searchWord" />
	            <input type="submit" value="검색하기" />
	        </td>
	    </tr>   
	    </table>
	    </form>
        
        <div id="nav">
        </div>      
    
    
<!-- 하단 아이콘 바 -->    
<body>
	<div id="link">
		<%@ include file="../00Main/inc/link.jsp" %>
	</div>
    <div id="footer">
		<%@ include file="../00Main/inc/footer.jsp" %>
		
	</div>
    
</body>

</html>
