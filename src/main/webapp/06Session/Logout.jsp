<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("UserId");
session.removeAttribute("UserName"); //원하는 정보만 지우기

session.invalidate(); //세션영역의 모든 정보 다 지우기

response.sendRedirect("LoginForm.jsp");
%>
<html>

<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>