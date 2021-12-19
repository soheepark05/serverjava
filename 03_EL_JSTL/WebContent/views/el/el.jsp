<%@page import="com.kh.el.model.vo.Person"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% /* 
//request 객체에 저장된 속성(Attribute)을 가져온다.
	String classRoom = (String)request.getAttribute("classRoom");
	Person student = (Person)request.getAttribute("student");

	//session 객체에 저장된 속성(Attribute)을 가져온다.
	String academy = (String)session.getAttribute("academy");
	Person teacher = (Person)session.getAttribute("teacher");
	
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL(Expression Language)</h2>
	
	<h3>1.기존 scriptlet을 이용하는 방식으로 request, session객체에 담겨있는 데이터를 출력</h3>
	
<%--
	학원명 : <%= academy %> <br>
	강의장 : <%= classRoom %> <br>
	강사 : <%=teacher.getName() %>, <%=teacher.getAge() %>,<%=teacher.getGender() %><br>
	수강생 : <%=student.getName() %>, <%=student.getAge() %>,<%=student.getGender() %><br><br>
	 --%>
	 
	<h3>2. EL을 이용하는 방식으로 request, session 객체가 담겨있는 데이터를 출력한다.</h3>
	<!--
		1. EL은 request, session 등 jsp영역 객체를 구분하지 않아도 자동으로 입력된 속성명(키값)을 검색해서 존재하는 경우 값을 가져온다.
		 - page -> request -> session -> application 순서대로 영역을 찾고 찾는..값을 가져온다.,
	  	2. EL은 scriptlet과 다르게 getter사용하지 않고 필드명으로 직접 접근하는 것같지만
	  	내부적으로 해당 객체의 getter를 자동으로 할당하여 저장된 값을 읽어온다.
	  
	  -->
	  
	  
	
	학원명 : ${ academy }<br>
	강의장 : ${ classroom } <br>
	강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <br>
	수강생 : ${ student.name }, ${ student.age }, ${ student.gender } <br>
	<!-- 필드에 직접 접근하는것 같다. -->
	
	<h3>3. EL 사용시 영역 객체에 저장된 속성명이 같은 경우</h3>
	scope : ${ scope } <br>
	
	<% // Page Scope 에 데이터를 저장
	 pageContext.setAttribute("scope", "Page 영역");
	%>
	
	<!--  여러 스코프에 동일한 속성을 저장했다면, 명시적으로 스코프를 지정해서
	원하는 영역의 속성값을 읽어올 수 있다. -->
	pageScope.scope 영역  : ${ scope } 또는 &{ pageScope.scope } <br>
	requestScope 영역 : ${ requestScope.scope } <br>
	sessionScope 영역 : ${ sessionScope.scope } <br>
	applicationScope.scope : ${applicationScope.scope } <br>
	
	<h3>4. ContextPath를 가져오기</h3>
	<h4>Scriptlet을 이용하는 방식 </h4>
	ContextPath : <%= request.getContextPath() %>
	
	<h4>EL을 이용하는 방식</h4>
	ContextPath : ${ pageContext.request.contextPath }
	
	<h3>5. 헤더에 접근하기.. 2가지 방법</h3>
	<h4>5-1) Scriptlet을 이용하는 방식 </h4>
	Host: <%= request.getHeader("host") %><br> <%//localhost:8088 찍힌다 %>
	User-Agent:<%= request.getHeader("User-Agent") %>
	
	
	<h4>5-2)EL을 이용하는 방식</h4>
	Host: ${ header.host } <br>
	User-Agent : ${ header['User-Agent']} <br>
	
	
	
</body>
</html>