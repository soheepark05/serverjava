package com.kh.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.mvc.member.model.service.MemberService;
import com.kh.mvc.member.model.vo.Member;

@WebServlet(name="login", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService service = new MemberService();
	
    public LoginServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = null;
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println(userId + ", " + userPwd);
		
		Member loginMember = service.login(userId, userPwd);
		
		System.out.println(loginMember);
		
		// loginMember가 null이면 로그인 실패
		// loginMember가 null이 아니면 로그인 성공
		if(loginMember != null) {
			// loginMember 객체를 session 객체에 보관한다.
			session = request.getSession();
			
			session.setAttribute("loginMember", loginMember);
		}
		
		response.sendRedirect(request.getContextPath() + "/");
	}
}
