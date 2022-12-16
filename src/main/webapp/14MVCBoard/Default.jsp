<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
</head>
<body>
	<!-- 모델2 방식은 JSP를 직접 실행하는 것이 아니라
	요청명을 수동으로 입력해야 하므로 바로가기 링크가 있는 것이 편리  -->
	<h2>파일 첨부형 게시판</h2>
	<a href="../mvcboard/list.do">게시판 목록 바로가기</a>
</body>
</html>

<!-- 실수 
1. 우선 mxl에 삽입된 코드와 list의 50번째 줄의 integer부분의 오타
2. Sql에서 더미데이터 commit 안 됨
3. list.jsp 제목 검색란의 td의 a 링크와 코드 빠트림 -->