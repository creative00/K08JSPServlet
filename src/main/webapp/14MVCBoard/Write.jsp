<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
	function validateForm(form) {  // 폼 내용 검증
	    if (form.name.value == "") {
	        alert("작성자를 입력하세요.");
	        form.name.focus();
	        return false;
	    }
	
	    if (form.title.value == "") {
	        alert("제목을 입력하세요.");
	        form.title.focus();
	        return false;
	    }
	    if (form.content.value == "") {
	        alert("내용을 입력하세요.");
	        form.content.focus();
	        return false;
	    }
	    
	    if (form.pass.value == "") {
	        alert("비밀번호를 입력하세요.");
	        form.content.focus();
	        return false;
	    }
	}
</script>
</head>
<body>
<!-- 
 파일 첨부를 위한 작성폼은 아래 2가지 조건이 지켜져야 한다.
 1.전송방식(method)sms post여야 한다.
 2. 인코딩 방식(enctype)은 multipart/form-data로 지정해야 한다.
 이와 같이 <form>태그를 구성 후 전송(submit)하면 request객체로는 폼값을 받을 수 없다. 
 cos.jar 확장라이브러리가 제공하는 MultipartRequest객체를 사용해 폼값을 받아야한다.
 -->

<h2>파일 첨부형 게시판 - 글쓰기(Write)</h2>

<!--
파일첨부를 위한 작성폼은 아래 2가지가 만족되어야 한다.
1. method 
-->
<form name="writeFrm" method="post" enctype="multipart/form-data" 
	action="../mvcboard/write.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td>
                <input type="text" name="name" style="width: 150px;" />
            </td>
        </tr>
        
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td>첨부 파일</td>
            <td>
                <input type="file" name="ofile" />
            </td>
        </tr>
        <tr>
            <td>비밀 번호</td>
            <td>
                <input type="password" name="pass" style="width:100px;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../mvcboard/List.do';">
                    목록 바로 보기</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>

