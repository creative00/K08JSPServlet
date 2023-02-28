
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
<html>
<head>
<title>Cookie - 아이디 저장하기</title>
<style>
        *{font-family: Verdana, font-size: 20px; margin: 10px auto;}
        form{margin-top: 200px;}
        input, select, button {border: 1px solid #afafaf;}
        input.userInput{padding:3px 2px;}
        select.userSelect{padding:2px 0;}
        .c_imp{color: red;}
        .userTable{border: none; border-collapse: collapse; width: 670px;}
        .userTable td{padding:10px; border: 1px solid #b9babb;}
        .userTable td.userTit{background-color: #E4E6E9; font-weight: bold;}
        .btn_search{background-color: #3d3d3d; color: #4cef7d; width: 70px; height: 23px; padding:1px 0 2px;}
        .btn_search:hover{background-color: #6d6d6d;}        
        .btn_submit{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #E70E16;color:white;font-size: 14px;}
        .btn_cancel{width:120px;height:28px;font-weight:bold;cursor:pointer;background-color: #464646;color:white;font-size: 14px;}
        .w20{width:20px;} .w30{width:30px;} .w40{width:40px;} .w50{width:50px;} .w100{width:100px;} 
        .w300{width:300px;} .w510{width:510px;} .w410{width:410px;} 
        #id_loading{position:absolute;top:530px;z-index:10;width:100%;text-align:center;display:block;}
    </style>

</head>
<body>
	<!-- 폼에서 포커스 이동 위해 TAB 버튼을 누르는 경우
	작성된 태그순으로 포커스가 이동하게 된다.
	이를 변경할 때 tabindex 속성을 사용한다.
	  -->
	<form action="IdSaveProcess.jsp" method="post">
	<!--
	쿠키를 통해 읽어온 값이 있는 경우 text상자에는 value속성을
	통해 저장된 아이디를 추가하고, checkbox에는 checked 속성을 부여
	-->
	 &nbsp;ID : <input type="text" name="user_id" 
		value="<%= loginId %>"  tabindex="1"/>
		<input type="checkbox" name="save_check" value="Y"
		<%= cookieCheck %> tabindex="3"/>
		ID 저장하기
	<br />
	 &nbsp;PASSWORD : <input type="text" name="user_pw"  tabindex="2"/>
	<br />
	&nbsp;&nbsp;<input type="submit" value="로그인하기" />
	</form>
</body>
</html>