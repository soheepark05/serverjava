<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP스크립트요소(Elements)</title>
</head>
<body>
	<h2>JSP스크립트요소(Elements)</h2>
	<!-- HTML -->
	<%-- JSP --%>
	<%-- 두 주석의 차이점 --%>
	<%-- 페이지의 소스 보기 혹은 개발자 도구에 HTML주석은 확인 가능하고 JSP주석은 확인이 불가능하다. --%>
	
	<%!
		//선언부(필드, 메소드를 선언한다.)
		private String name = "아무개";
	
	
	%>
	
	<%
	// 자바 코드를 기술
	int total = 0; // 지역변수
	
	for(int i = 1; i <= 10; i++) {
		total += i;
	}
	
	System.out.println(total);
	%>
	
	저의 이름은 <%= name %>입니다.
	<br>
	expression 출력:
	1 부터 10까지의 합은  <%=total %>입니다. <br>
	
	scriptlet 출력:
	1 부터 10까지의 합은 <% out.print(total); %>입니다. 
	
	
</body>
</html>