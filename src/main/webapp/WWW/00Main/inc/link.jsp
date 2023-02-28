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
		
		* {	
			font-family: Verdana;
		    margin: 100;
		    padding: 1000;
		    
		}
	</style>


    <title>로그인 기능</title>
</head>
<body>
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
</body>

</html>