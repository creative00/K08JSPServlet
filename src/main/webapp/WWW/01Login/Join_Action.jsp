<%@page import="java.io.PrintWriter"%>
<%@page import="www.join.WwwjoinBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//사용자가 보낸 데이터를 한글을 사용할 수 있는 형식으로 변환
	request.setCharacterEncoding("UTF-8");
	String user_id = null;
	String user_pass = null;
	String pass2 = null;
	String name = null;
	String email_id = null;
	String email_domain = null;
	String gender = null;
	String mobile1 = null;
	String mobile2 = null;
	String mobile3 = null;
	
	

	
	if (request.getParameter("email_id") != null) {
		email_id = (String) request.getParameter("email_id");
	}
	if (request.getParameter("email_domain") != null) {
		email_domain = (String) request.getParameter("email_domain");
	}
	
	
	if (request.getParameter("user_id") != null) {
		user_id = (String) request.getParameter("user_id");
	}

	if (request.getParameter("user_pass") != null) {
		user_pass = (String) request.getParameter("user_pass");
	}
	if (request.getParameter("pass2") != null) {
		pass2 = (String) request.getParameter("pass2");
	}
	
	if (request.getParameter("name") != null) {
		name = (String) request.getParameter("name");
	}
	if (request.getParameter("gender") != null) {
		gender = (String) request.getParameter("gender");
	}
	if (request.getParameter("mobile1") != null) {
		mobile1 = (String) request.getParameter("mobile1");
	}
	
	if (request.getParameter("mobile2") != null) {
		mobile2 = (String) request.getParameter("mobile2");
	}
	if (request.getParameter("mobile3") != null) {
		mobile3 = (String) request.getParameter("mobile3");
	}
	
	//PrintWriter script = response.getWriter();

	/* 제대로 입력된 폼값이 나오는지 검증해보는 프린트문
	이 때 아래 스크립트란 안의 프린트문은 잠시 주석 처리해야 오류 안 남
	//script.println("alert('입력이 안 된 사항이 있습니다.')");
	//script.println("location.href='RegisterationMain.jsp';");
	
	*/
	/* script.println("user_id="+user_id);
	script.println("user_pass="+user_pass);
	script.println("name="+name);
	script.println("gender="+gender);
	script.println("mobile1="+mobile1);
	script.println("mobile2="+mobile2);
	script.println("mobile3="+mobile3);
	script.println("email_id="+email_id);
	script.println("email_domain="+email_domain);
	script.println("pass2="+pass2); */
	
	
	if (user_id == null || user_pass == null || pass2 == null || name == null || gender == null || mobile1 == null || mobile2 == null || mobile3 == null || email_id == null || email_domain == null ) {
		
		
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("location.href='RegisterationMain.jsp';");
		script.println("</script>");
		script.close();
		return;
	}

	WwwjoinBoardDAO userDAO = new WwwjoinBoardDAO();
	int result = userDAO.join(email_id,email_domain,user_id,user_pass, pass2, name, gender, mobile1, mobile2, mobile3);
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.')");
		script.println("location.href='LoginMain.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
%>