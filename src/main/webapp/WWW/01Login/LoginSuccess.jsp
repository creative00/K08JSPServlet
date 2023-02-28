<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
//페이지 실행 시 loginId라는 쿠키를 읽어온다.
String loginId = CookieManager.readCookies(request, "loginId");
//아이디 저장 체크박스에 체크 위한 변수 생성
String cookieCheck = "";
//앞에서 읽은 쿠키값이 있다면 체크박스에 checked 속성을
//부여하기 위해 값을 설정한다.
if(!loginId.equals("")) {
	cookieCheck = "checked";
}
%>
    
<!DOCTYPE html>
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

<html lang="ko">

<head>
	<style>
		@charset "UTF-8";

/* 기본 설정: 페이지 전체 */
		
		<style>
		#header {
			/*  background-color:lightgrey; */
			 height:170px;
			 width:1920px;
		}
		#nav {
			/*  background-color:#393939; */
			 color: red;
			 height:50px;
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
		}
		* {	
			font-family: Verdana;
		    margin: 100;  
		    
		}
		.join_blank {
			display: block;
		   /*  padding: 100px; */
		    width: 500px;
		    height: 600px;
		   	/* background-color:yellow; */
		    text-align: left;
		}
		.join_container {
		    display: block;
		    /* margin: 200px auto; */
		    text-align: left;
		    
		    width:550px;
		}
		
		
		.join_container h3 {
			color: deep-grey;
		    font-size: 30px;
		    text-align: left;
		}
		
		.login_id,
		.user_pw,
		.joinName,
		.joinDate,
		.joinGender {
		    margin-top: 20px;
		    margin-bottom: 30px;
		}
		.input {
		    padding: 5px;
		    width: 220px;
		    line-height: 30px;
		    font-size: 15px;
		    border: none;
		    border-bottom: solid 1px rgba(0, 0, 0, 1);
		}
		
		.btn-join {
		 	class:d-grid gap-2 col-6 mx-auto;
		    font-size: 15px;
		    padding: 9px;
		    color: rgb(240, 240, 240);
		    background-color: rgb(60, 60, 60, 1);
		    border: none;
		    border: solid 1px rgba(0, 0, 0, 0);
		    cursor: pointer;
		    text-align: center;
		}
		.information {
			padding: 5px;
		    width: 380px;
		    font-size: 15px;
		    border: none;
		    text-align: left;
		}
	</style>


    <title>로그인 기능</title>
</head>

<body>

	<div id="header">
		<%@ include file="../00Main/inc/toplogout.jsp" %>
	</div>
	<div id="nav"> </div>
	<table border="0" >
		<div id="section">
			<tr>
				<td>
					<div class="join_blank"/>
				</td>
				<td>
					<div class="join_container">
					<!--로그인페이지 오류 -->
			            
						
				        <form method="post" action="" name="loginFrm" >
				            <h3>로그인에 성공하셨습니다. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				            <div>
				            <h2><%= session.getAttribute("UserName") %> 회원님, 환영합니다.</h2><br/>
							
				            <div class="login_id">
				            
				            </div>
						<button class="btn-join" style="background-color:#4cef7d; color:#666666"type="submit" value="로그아웃" action="Logout.jsp" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Logout.jsp">로그아웃</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;</button>
				            </div>
				        </form>
	    			</div>
				</td>
				
			</tr>
		</div>
	</table>
	<div id=link>
	
	</div>

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