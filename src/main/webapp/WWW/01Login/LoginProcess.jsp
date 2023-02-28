<%@page import="membership.WWWDAO"%>
<%@page import="membership.WWWDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//로그인 폼에서 입력한 아이디, 패스워드를 받는다.
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pass");

//web.xml에 입력한 컨텍스트 초기화 파라미터를 읽어온다.
//해당 정보는 오라클에 접속하기 위한 값으로  구성되어있다.
String mysqlDriver = application.getInitParameter("MySQLDriver1");
String mysqlURL = application.getInitParameter("MySQLURL1");
String mysqlId = application.getInitParameter("MySQLId1");
String mysqlPwd = application.getInitParameter("MySQLPwd1");

//위 정보를 통해 DAO객체를 생성하고 이때 오라클에 연결된다.
WWWDAO dao = new WWWDAO(mysqlDriver, mysqlURL, mysqlId, mysqlPwd);
/*폼값으로 받은 아이디, 패스워드를 인수로 전달해 
로그인 처리를 위한 쿼리를 실행한다.*/
WWWDTO WWWDTO = dao.getWWWDTO(userId, userPwd);
//자원해제
dao.close();

if (WWWDTO.getUser_id() != null) {
	//로그인에 성공한 경우라면..
	//세션영역에 회원아이디와 이름을 저장한다.
	session.setAttribute("UserId", WWWDTO.getUser_id());
	session.setAttribute("UserName", WWWDTO.getName());
	//그리고 로그인 페이지로 '이동'한다.
	response.sendRedirect("LoginSuccess.jsp");
}
else {
	//로그인에 실패한 경우라면..
	//리퀘스트 영역에 에러메세지를 저장한다.
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	//그리고 로그인 페이지로 '포워드'한다.
	request.getRequestDispatcher("LoginMain.jsp").forward(request, response);
}
%>
<html>
<head><title>Insert title here</title></head>
<body>

</body>
</html>