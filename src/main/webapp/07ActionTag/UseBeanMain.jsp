<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<title>액션 태그 - UseBean</title></head>
<body>
<%--
useBean액션 태그를 JSP로 표현하면 다음과 같다.
	import ="common.Person";
	Person person = new Person();
	request.setAttibute("person", person);
	
	따라서 코드가 매우 번잡한데 액션태그로 쓰면 매우 심플
 --%>
	<h2>useBean 액션 태그</h2>
	<h3>자바빈즈 생성하기</h3>
	<!-- id="빈의이름(참조변수명)" 
		 class="패키지.클래스명" 
		 scope="저장할 영역명"  -->
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<!--DTO객체의 setter()메서드 이용해 값을 설정한다.  -->
	<!--
		JSP로 표현하면
			person.setName("임꺽정");
			person.setAge(41); 를 통해 값을 설정한다.
	  -->
	<jsp:setProperty name="person"  property="name" value="임꺽정"/>
	<jsp:setProperty name="person"  property="name" value="홍길동"/>
	<jsp:setProperty name="person"  property="age" value="41"/>
	
	<h3>getProperty 액션 태그로 자바빈즈 속성 읽기</h3>
	<!--DTO객체의 getter()메서드 이용해 값을 설정한다.  -->
	<!-- 
		person.getName();
		person.getAge(); 를 통해 값이 출력한다.
	 -->
	<ul>
		<li>이름 : <jsp:getProperty name="person"  property="name" /></li>
		<li>나이 : <jsp:getProperty name="person"  property="age" /></li>
		
	</ul>
</body>
</html>