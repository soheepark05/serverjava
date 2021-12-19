<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSTL Functions Library</h2>
	
	<c:set var="str" value="java oracle HTML CSS jQuery Servlet JSP AJAX"/>
	
	str : ${str }
	<ul>
		<li>문자열의 길이: ${fn:length(str) }</li>
		<li>모두 대문자로: ${fn:toUpperCase(str) }</li>
		<li>모두 소문자로: java oracle html css jquery servlet jsp ajax
		<li>CSS의 시작위치는:${fn:indexOf(str ,'CSS') }  </li>
		<li>java를 javascript로 바꿈: ${ fn:replace(str,'java','javascript')}</li>
		<li>ss</li>
	

	</ul>
	
		str : ${ str }
</body>
</html>

 