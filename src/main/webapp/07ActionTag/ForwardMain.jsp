<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("pAttr", "김유신");
request.setAttribute("rAttr", "계백");
%>
<html>
<head>
<title>액션 태그 - forward</title></head>
<body>
	<h3>sendRedirect 통한 페이지 이동</h3>
	<!--페이지 이동의 경우 새 페이지에 대한 요청이 발생되므로
	완전히 서로 다른 페이지를 의미한다. 따라서 page영역, 
	request영역 모두 공유되지 않는다.  -->
	<%
		//response.sendRedirect("ForwardSub.jsp");
	%>
	<!--포워드 된 페이지에서는 request영역이 공유된다.
	주소 표시줄에는 최초 요청한 페이지의 경로가 보이지만,
	사용자는 포워드 된 페이지의 내용을 보게 된다.
	즉, 하나의 요청을 2개의 페이지가 공유하는 개념이다.  -->
	<h2>액션 태그를 이용한 포워딩</h2>
	<!--html주석 안에 넣으면 jsp코드라 실행됨. 꼭 jsp주석 사용해야 함  --> 
	<jsp:forward page="/07ActionTag/ForwardSub.jsp" />
	<%
	/*액션태그 사용 시 JSP코드보다 훨씬 간결한 코드 표현 가능  */
	request.getRequestDispatcher("ForwardSub.jsp")
		.forward(request, response);
	%>
</body>
</html>