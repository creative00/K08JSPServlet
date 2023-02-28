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
		<%@ include file="../00Main/inc/top.jsp" %>
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
			            
						<%
						
						if (session.getAttribute("UserId") == null) {
							//로그인 상태 확인 //로그아웃 상태
						%>
						<script>
						function validateForm(form){
							/*<form>태그 하위의 각 input 태그에 입력값이 있는지
							확인하여 만약 빈값이라면 경고창, 포커스 이동, 폼값전송취소
							처리를 한다.*/
							if(!form.user_id.value){
								alert("아이디를 입력하세요.");
								form.user_id.focus();
								return false;
							}
							
							if(form.user_pass.value == ""){
								alert("패스워드를 입력하세요.");
								form.user_pass.focus();
								return false;
							}
						}
						</script>
						
						
						<!--로그인페이지 오류 -->
				        <form method="post" action="LoginProcess.jsp" name="loginFrm" onsubmit="return validateForm(this);">
				            <h3>로그인 <span style="color: red; font-size: 0.8em;">
							<%= request.getAttribute("LoginErrMsg") == null ?
									"" : request.getAttribute("LoginErrMsg") %>
							</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				            
				            <div class="login_id">
				                <input type="text" class="input" style="ime-mode:disabled;" placeholder="아이디" name="user_id" value="<%= loginId %>" title="이메일을 입력해주세요" maxlength="20">
				            	&nbsp;&nbsp;
				            	<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3"/>
							ID 저장하기
							<br />
				            </div>
				            <!--비번  -->
				            <div class="user_pw">
				                <input type="password" class="input" placeholder="비밀번호를 잊으셨습니까?" name="user_pass" title="비밀번호" maxlength="20">
				            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            </div><br />		
							<button class="btn-join" type="submit"  value="로그인"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;로그인
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
				            <!-- <input type="submit" class="bt_join;" value="로그인"> -->
				        </form>
				        <%
						} else { //로그인된 상태
						%>
						<!--session영역에 저장된 속성값이 있다면 로그인 된 상태이므로
						회원 정보 및 로그아웃 버튼을 화면에 출력  -->
							<h2><%= session.getAttribute("UserName") %> 회원님,<br/><br/><br/><br/>환영합니다.</h2><br/>
							<a href="Logout.jsp">[로그아웃]</a>
						<%
						}
						%>
	    			</div>
				</td>
				<td>
					<div class="join_container">
				        <form method="post" action="RegisterationMain.jsp" >
				            <h3>등록&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
				            <div class="information" >
				                 <br/>Vert의 회원으로 가입하시면 빠르고 편리하게 이용하실 수 있습니다.<br/><br />아직 회원이 아니시라면 이메일로 간편 가입하실 수 있습니다.<br/>
				            </div>
				            <br/><br/><br/>
				           		
							<button class="btn-join" style="background-color:#4cef7d;" onclick="location.href='02Register/RegisterationMain.jsp'" type="submit" value="회원가입" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
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