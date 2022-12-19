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

<h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
<!-- 글쓰기 페이지를 복사해 해당 페이지를 만들 때 비밀번호 검증 시에는
첨부 파일이 필요 없으므로 enctype은 제거해야한다. 만약 제거하지 않으면 
request내장 객체로 폼값을 받을 수 없으므로 주의해야 함  -->
<form name="writeFrm" method="post" action="../mvcboard/pass.do"
	onsubmit="return validateForm(this);">
<!--
해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은 후 
request영역에 저장하여 View에서 확인할 수 있지만, 
EL을 이용하면 해당 과정 없이 param내장 객체로 즉시 값을 받아올 수 있다.

※hidden밧스를 사용하는 경우 웹브라우져에서는 숨김처리 되기때문에
값이 제대로 입력되었는지 화면으로 확인할 수 없다. 
따라서 개발자 모드를 사용하거나 type을 디버깅용으로 잠깐 수정 후 
값이 제대로 입력되었는지 반드시 확인해야 한다.
-->
<input type="hidden" name="idx" value="${ param.idx }" />
<input type="hidden" name="mode" value="${ param.mode }" />


<table border="1" width="90%">
    <tr>
        <td>비밀 번호</td>
        <td>
            <input type="password" name="pass" style="width:100px;" />
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="submit">검증하기</button>
            <button type="reset">RESET</button>
            <button type="button" onclick="location.href='../mvcboard/list.do';">
                목록 바로 보기</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>

