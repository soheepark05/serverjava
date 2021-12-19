<%@page import="java.util.ArrayList" %>
<%@page import="com.kh.el.model.vo.Person"%>
<%@page import="java.util.List" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 태그라이브러리 적어놓은거임 위에꺼 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSTL Core Library</h2>
	
	<h3>1. 변수</h3>
	
	<h4>1)변수 선언(c:set)</h4>
	<p>
	변수를 선언하고 초기값을 대입하는 기능을 가진 태그이다.<br>
	변수 선언 시 scope를 지정할 수 있다.(지정하지 않으면 기본적으로 pageScope에 저장된다.)<br>
	사용 방법<br>
	- 변수 타입은 별도로 선언하지 않는다.<br>
	- 초기값은 반드시 지정해야한다.<br>
	- c:set 태그로 선어한 변수는 EL안에서 사용이 가능하고 스크립트릿 요소에서는 직접 사용할 수 없다.
	
	</p>
	<%--
	pageContext.setAttibute("num1","10");
	--%>
	<c:set var="num1" value="10" />
	<c:set var="num2" value="20" scope="request"/>
	<c:set var="result" value="${num1 + num2 }" scope="session"/>
	<c:set var="array" scope="request">
		red, blue, yellow, pink, green
	</c:set>
	
	
	num1변수값: ${num1} 또는 ${pageScope.num1 } <br>
	num1변수값(표현식): <%= pageContext.getAttribute("num1") %>
	num2 변수값 : ${num2 } 또는 ${requestScope.num2 }<br>
	result 변수값 : ${ result} 또는 ${ sessionScope.result }<br>
	array 배열 값 : ${ array } <br>
	
	<h4>2)변수 삭제(c:remove)</h4>
	<p>
		지정한 변수를 모든 scope에서 검색해서 삭제한다.(scope 속성을 지정해서 특정 scope의 변수만 삭제 가능)
	</p>
	<c:set var="result" value="99999" scope="request"/>\
	
	삭제 전 : ${ result } <br><br>
	
	<h5>* 특정 scope에서 삭제</h5>
	<c:remove var="result" scope="request"/>
	
	삭제 후 : ${ result } <br><br>
	
	<h5>* 모든 scope에서 삭제</h5>
	<c:remove var = "result"/>
	
	삭제 후 : ${result } <br><br>
	
	<h4>3) 변수 출력 (C:OUT)</h4>
	<p>
		데이터를 출력할 때 사용하는 태그이다.
	</p>
	
	태그를 문자열로 출력: <c:out value="<b>태그로 출력하기</b>" />
	
	<br>
	
	태그로 해석하여 출력: <c:out value="<b>태그로 출력하기</b>" escapeXml="false"/> <!--  -->
	<br>
	기본 값 출력:<c:out value= "${result}" default = "값이 없음.."/>
	
	<h3>2.조건문</h3>
	<h4>1) IF(c:if)</h4>
	<p>
		java의 if문과 비슷한 역할을 하는 태그이다.<br>
		태그 사용시 조건은 test속성에 지정해야 한다. <br>
		이 때 조건식은 EL형식으로 기술 해야 한다.
	</p>
	
	<c:if test="${num1>num2 }">
		num1이 num2 보다 크다. <br>
	</c:if>
	
	<c:if test = "${num<num2 }">
		num1이 num2보다 작다. <br>
	</c:if>
	<h4>2) choose (c:choose, c:when, c:otherwise)</h4>
	<p>
		java의 if else if 문 또는 switch문과 비슷한 역할을 하는 태그이다. <br>
		각 조건들은 c:choose 문의 하위요소로 c:when 을 통해서 작성한다. (default값으로 는 c:otherwise)
		
	</p>
	<c:set var= "count" value="0"/>
	<c:choose>
		<c:when test="${count eq 0}"> <!--when=case같은 -->
		처음뵙겠습니다. <br>
		</c:when>
		<c:when test="${ count eq 1}">
		반갑습니다. 또 만났군요^^<br>
		</c:when>
		
		<c:otherwise>
			안녕하세요..<br>
		</c:otherwise>
	</c:choose>
	<h3>3.반복문</h3>
	<h4>1)forEach (c:forEach)</h4>
	<p>
	Java의 for,for-in문에 해당하는 기능을 제공하는 태그이다.
	</p>
	<h5>* 기본 사용법</h5>
	<c:forEach var="i" begin="1" end="10">
		반복 확인 : ${i } <br>
	</c:forEach >
	<c:forEach var="i" begin="1" end="6" >
		<!-- 태그에도 적용 가능 -->
		<h${i}>EL로 반복문 사용</h${i}>
	</c:forEach>
	
	<c:forEach var="color" items="${array}">
		<font color = "${color }"> 반복 확인 : ${color }</font>
	</c:forEach>
	
	<%
		List<Person> list = new ArrayList<>();
		
		list.add(new Person("아무개",20,'남'));
		list.add(new Person("홍길수",23,'남'));
		list.add(new Person("성춘향",17,'여'));
		list.add(new Person("김구글",19,'남'));
	
		pageContext.setAttribute("list",list);	
	%>
	<table border="1">
		<tr>
			<th>인덱스</th>
			<th>순번</th>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
			<th>isFirst</th>
			<th>isLast</th>
			
		</tr>
		<c:forEach var="person" items="${list }" varStatus="status">
		 <tr>
		 	<td>${status.index }</td>
		 	<td>${staus.count }</td>
		 	<td>${person.name }</td>
		 	<td>${person.age}</td>
		 	<td>${person.gender}</td>
		 	<td>${status.first}</td>
		 	<td>${status.last}</td>
		 </tr>
		</c:forEach>
	</table>
	
	<h4>2)forTokens(c:forTockens)</h4>
	<p>
		문자열에 포함된 구분자를 통해 토큰을 분리해서 반복 처리하는 태그이다.<br>
		java의 string.split()또는 StringTokenizer와 비슷한 기능을 한다.
	</p>
	
	<c:set var = "device">
		컴퓨터 , 노트북, 핸드폰, tv/에어컨, 냉장고, 세탁기
	</c:set>
	
	<ul>
	<c:forTokens  var="d" items="${device}" delims=",./">
		<li>${ d }</li>
		</c:forTokens>
	</ul>
	
	<!-- 색상지정  -->
	<ul>
		<c:forTokens var="color" items="pink aqua tomato yellow lime blue" delims=" ">
		<li style="background-color: ${color}">${color }</li>
		</c:forTokens>
	</ul>
	<h3>4. URL(c:url)</h3>
	<p>
		URL 경로를 생성하고, 해당 URL의 param 속성을 선언하여 쿼리 스트링을 정의할 수 있는 태그이다. <br>
		해당 태그를 통해 URL 경로와 관련된 쿼리 스트링 값을 미리 결정하여 이를 제어할 수 있다.
	</p>
	
	<c:url var="url" value="urlPage.jsp">
		<c:param name="pName" value="아이폰 12 미니"></c:param>
		<c:param name="pCount" value="1"></c:param>
		<c:param name="option" value="화이트"></c:param>
		<c:param name="option" value="64기가"></c:param>
	</c:url>
	
	<a href="${ url }">이동</a>
	
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	
</body>
</html>