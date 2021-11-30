package com.kh.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MethodServlet
 */
@WebServlet( "/method.do" )
public class MethodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MethodServlet() {

    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 보낸 정보(데이터)들은 request 객체 안에 키(name 속성의 값), 값(value 속성의 값)형태로 담겨있다.
		//해당 name 속성을 가지는 요소의 value값을 문자열로 읽어온다.
		
		String userName = request.getParameter("userName");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String height = request.getParameter("height");

		//해당 name 속성을 가지는 요소들의 value값을 문자열의 배열로 읽어온다.
		String[] foods = request.getParameterValues("food");

		
		System.out.println(userName);
		System.out.println(age);
		System.out.println(gender);
		System.out.println(height);
		
		Arrays.stream(foods).forEach((food)->System.out.println(food));
		
		//응답화면 에 대한 설정
		//응답화면이 문서 형태의 html이고 문자 셋은 utf-8이다.
		response.setContentType("text/html;charset=UTF-8"); //이거안쓰면 한글깨짐
		
		//사용자에게 응답 화면을 출력하기 위한 스트림생성 (문자 기반 출력 스트림)
		PrintWriter out = response.getWriter();
		
		//자바 코드로 응답 화면을 작성하고 있는 과정
		
		out.write("<html>");
		out.write("<body>");
		out.write("<h1>개인 정보 출력 화면</h1>");
		out.printf("%s 님은 %s 세 이고 키가 %s cm인 %s입니다. 좋아하는 음식은 ",userName,age,height,gender);
		Arrays.stream(foods).forEach((food) -> out.write(food+" "));
		out.write("입니다.");
		out.write("</body>");
		out.write("</html>");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8"); 
		this.doGet (request,response);
	}

}
