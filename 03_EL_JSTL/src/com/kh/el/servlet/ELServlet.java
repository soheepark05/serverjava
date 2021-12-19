package com.kh.el.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.el.model.vo.Person;

/**
 * Servlet implementation class ELServlet
 */
@WebServlet("/el.do") /* el.do 처리를 누가 처리하고있냐,,,->404에러가 안난다.*/
public class ELServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ELServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	여기 밑에 애가 처리하고있다..,.
	 */
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서블릿에서 request,session ,application 객체를 가져와서 데이터를 setattribute()에 담아서 el.jsp에 전달
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext(); //alt_shift_l
		
		//Request Scope에 데이터를 저장 
		request.setAttribute("classRoom", "R 강의장");
		//person 기본생성자 없다--> 
		request.setAttribute("student", new Person("홍길동",20,'남'));
		request.setAttribute("scope", "request 영역");
		
		//Session Scope에 데이터 저장
		session.setAttribute("academy", "KH 정보교육원");
		session.setAttribute("teacher",new Person("아무개",20,'남'));
		session.setAttribute("scope","Session 영역");
		//applicaion 영역 에 데이터를 저장함.
		application.setAttribute("scope","Application영역");
		
		request.getRequestDispatcher("views/el/el.jsp").forward(request, response);
	}

}
