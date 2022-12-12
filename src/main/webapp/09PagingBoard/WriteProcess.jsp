<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가 있으므로
글쓰기 처리 페이지에서도 반드시 로그인을 확인해야된다.  -->
<%@ include file="./IsLoggedIn.jsp" %>
<%
//클라이언트가 작성한 폼값을 받는다.
String title = request.getParameter("title");
String content = request.getParameter("content");

//폼값을 DTO객체에 저장한다.
BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
/* 특히 아이디의 경우 로그인 후 작성페이지에 진입할 수 있으므로
세션 영역에 저장된 회원아이디를 가져와 DTO에 저장한다. */
dto.setId(session.getAttribute("UserId").toString());

//DB 연결을 위해 DAO객체를 생성한다.
BoardDAO dao = new BoardDAO(application);
//입력값이 저장된 DTO객체를 인수로 전달해 insert쿼리문을 실행한다.


//기존 코드
int iResult = dao.insertWrite(dto);

//더미 데이터를 삽입하기 위한 코드
/* int iResult = 0;
for (int i =1; i <=100; i++) {
	dto.setTitle(title + "-" + i);
	iResult = dao.insertWrite(dto);
} */
dao.close();
//자원해제


if (iResult == 1){
	//입력에 성공한 경우 리스트로 이동해 새롭게 등록된 게시물을 확인
	response.sendRedirect("List.jsp");
} else {
	//실패했다면 재입력 위해 글쓰기 페이지로 다시 돌아간다.
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>