<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - url</title>
</head>
<body>
<!--
url 태그
: url 생성 시 사용. 절대 경로 사용 시 컨텍스트루트 경로는 제외
 var속성 지정하지 않은 경우 해당 위치에 생성된 URL이 출력됨.
 param태그로 지정한 값은 쿼리스트링으로 URL뒤에 연결된다.
 -->
	<h4>태그로 링크 걸기</h4>
	<!-- HOST(도메인부분)을 제외한 나머지 경로를 반환한다.
		var속성이 지정되었으므로 해당 위치에는 출력되지 않는다.-->
	<c:url value="/11JSTL/inc/OtherPage.jsp" var="url">
		<c:param name="user_param1" value="Must" />
		<c:param name="user_param2">Have</c:param>
	</c:url>
	<!-- 앞에서 생성된 URL은 a태그에 포함된다.  -->
	<a href="${url }">OtherPage.jsp 바로가기</a>
</body>
</html>