<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AnnoMapping.jsp</title>
</head>
<body>
	<h2>애너테이션으로 매핑하기</h2>
	<p>
		<strong>${ message }</strong>
		<br />
		<!--
		request 내장 객체를 이용 
		현 프로젝트의 컨텍스트루트 경로를 얻어온 후 링크에 적용
		이런 경우 절대 경로로 링크를 설정하게 된다.
		 -->
		<a href="<%= request.getContextPath()%>/13Servlet/AnnoMapping.do">
			바로가기</a>
	</p>
</body>
</html>