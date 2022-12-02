<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--ctrl +shift + /  -->
<!--HTML주석
보통의 경우 인클루드되는 JSP파일은 HTMP태그 없이
순수한 JSP코드만 작성하는 것이 좋다. 포함되었을 때 
HTML태그가 중복될 수 있기 때문이다.  -->
<%-- JSP주석
포함되는 페이지를 만들 때에도 반드시 page지시어는 있어야 한다.
page 지시어가 없는 JSP파일은 오류가 발생한다.
 --%>

<%
LocalDate today = LocalDate.now();
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);
%>
